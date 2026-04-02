from __future__ import annotations

import json
import shutil
import subprocess
import sys
from pathlib import Path

try:
    from datasets import load_dataset

    HAS_DATASETS = True
except ImportError:
    HAS_DATASETS = False

from ..utils import (
    ComposerRuntimePaths,
    ProblemSpec,
    ValidationFeedback,
    _is_readable_dir,
    _is_readable_file,
    _write_text,
    extract_errored_entries,
)
from .base import BaseEvaluator


class HumanEvalEvaluator(BaseEvaluator):
    def __init__(
        self,
        paths: ComposerRuntimePaths,
        config_path: Path,
        validator_script: Path,
        cfg_data: dict[str, str] | None = None,
        dfg_data: dict[str, str] | None = None,
    ) -> None:
        self.paths = paths
        self.config_path = config_path.resolve()
        self.validator_script = validator_script.resolve()
        self.cfg_data = cfg_data or {}
        self.dfg_data = dfg_data or {}

    def get_problem_specs(self, prompt_config: str) -> list[ProblemSpec]:
        issues: list[str] = []
        require_cfg = prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
        require_dfg = prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}

        if not _is_readable_file(self.paths.error_json_path):
            issues.append(f"Cannot read error JSON: {self.paths.error_json_path}")
        if not _is_readable_file(self.validator_script):
            issues.append(f"Validator script is missing/unreadable: {self.validator_script}")

        payload = json.loads(self.paths.error_json_path.read_text(encoding="utf-8"))
        self._materialize_json_input_asm(payload)
        errored = extract_errored_entries(payload)

        specs: list[ProblemSpec] = []
        for entry in errored:
            problem_name = str(entry.get("name") or entry.get("file") or "").strip()
            if not problem_name:
                issues.append("Found an errored entry without 'name' or 'file'.")
                continue

            source_asm = self._resolve_source_asm(problem_name)
            if source_asm is None:
                issues.append(f"Source asm not found for {problem_name} in {self.paths.benchmark_asm_input_dir}")
                continue

            cfg_text = self.cfg_data.get(problem_name, "")
            dfg_text = self.dfg_data.get(problem_name, "")
            if require_cfg and not cfg_text:
                issues.append(f"Missing CFG for {problem_name}")
            if require_dfg and not dfg_text:
                issues.append(f"Missing DFG for {problem_name}")

            specs.append(
                ProblemSpec(
                    name=problem_name,
                    summary=str(entry.get("summary") or entry.get("run_output") or ""),
                    stderr=str(entry.get("stderr") or entry.get("run_output") or ""),
                    source_asm_path=source_asm,
                    source_asm_name=source_asm.name,
                    cfg_text=cfg_text,
                    dfg_text=dfg_text,
                )
            )

        if issues:
            detail = "\n".join(f"- {item}" for item in issues)
            raise RuntimeError(f"Preflight validation failed.\n{detail}")

        return specs

    def validate(self, problem_name: str, candidate_asm: str, attempt: int, source_asm_name: str) -> ValidationFeedback:
        fixed_asm_path = self.paths.fixed_asm_dir / source_asm_name
        _write_text(fixed_asm_path, candidate_asm)

        asm_filter_name = Path(source_asm_name).stem
        validation_json_path = self.paths.validation_json_dir / f"{problem_name}_attempt{attempt}.json"
        probe_log_path = self.paths.compile_probe_dir / f"{problem_name}_attempt{attempt}.log"

        command = [
            sys.executable,
            str(self.validator_script),
            str(self.paths.fixed_asm_dir),
            "--config",
            str(self.config_path),
            "--problems",
            problem_name,
            asm_filter_name,
            "--output",
            str(validation_json_path),
        ]
        try:
            completed = subprocess.run(command, capture_output=True, text=True, check=False, timeout=120)
        except subprocess.TimeoutExpired as exc:
            err_msg = f"Validation script timed out after 120 seconds. Likely an infinite loop.\n{exc}"
            _write_text(probe_log_path, f"command: {' '.join(command)}\nERROR: {err_msg}")
            return ValidationFeedback(
                passed=False,
                status="timeout",
                summary="Execution timed out (infinite loop)",
                stderr=err_msg,
                errors_count=1,
                problems_processed=1,
                validator_returncode=-1,
            )

        _write_text(
            probe_log_path,
            "\n".join(
                [
                    f"command: {' '.join(command)}",
                    f"returncode: {completed.returncode}",
                    "stdout:\n" + completed.stdout,
                    "stderr:\n" + completed.stderr,
                ]
            ),
        )

        if not validation_json_path.exists():
            return ValidationFeedback(
                passed=False,
                status="validation_missing",
                summary=f"Validation JSON was not generated (rc={completed.returncode})",
                stderr=completed.stderr.strip(),
                errors_count=1,
                problems_processed=0,
                validator_returncode=completed.returncode,
            )

        payload = json.loads(validation_json_path.read_text(encoding="utf-8"))
        errored_count = int(payload.get("errored_count", 0))
        processed = int(payload.get("problems_processed", 0))

        if errored_count == 0 and processed > 0:
            return ValidationFeedback(
                passed=True,
                status="passed",
                summary="Validation passed",
                stderr="",
                errors_count=0,
                problems_processed=processed,
                validator_returncode=completed.returncode,
            )

        if processed == 0:
            return ValidationFeedback(
                passed=False,
                status="inconclusive",
                summary="Validation processed 0 files",
                stderr=completed.stderr.strip(),
                errors_count=errored_count,
                problems_processed=processed,
                validator_returncode=completed.returncode,
            )

        errored_problems = payload.get("errored_problems", [])
        if errored_problems:
            first = errored_problems[0]
            status = str(first.get("status", "error"))
            summary = str(first.get("summary", "")).strip()
            stderr_text = str(first.get("stderr", "")).strip()
            return ValidationFeedback(
                passed=False,
                status=status,
                summary=summary or "Validation failed",
                stderr=stderr_text,
                errors_count=errored_count,
                problems_processed=processed,
                validator_returncode=completed.returncode,
            )

        return ValidationFeedback(
            passed=False,
            status="inconclusive",
            summary=f"Validation inconclusive: processed={processed}, errors={errored_count}",
            stderr=completed.stderr.strip(),
            errors_count=errored_count,
            problems_processed=processed,
            validator_returncode=completed.returncode,
        )

    def validate_all_outputs(self) -> tuple[Path, int, int]:
        self.paths.full_validation_input_dir.mkdir(parents=True, exist_ok=True)
        for stale in self.paths.full_validation_input_dir.glob("*.s"):
            stale.unlink()

        if _is_readable_dir(self.paths.benchmark_asm_input_dir):
            for src in self.paths.benchmark_asm_input_dir.glob("*.s"):
                shutil.copy2(src, self.paths.full_validation_input_dir / src.name)

        if _is_readable_dir(self.paths.fixed_asm_dir):
            for fixed in self.paths.fixed_asm_dir.glob("*.s"):
                shutil.copy2(fixed, self.paths.full_validation_input_dir / fixed.name)

        total_inputs = len(list(self.paths.full_validation_input_dir.glob("*.s")))
        final_json_path = self.paths.validation_json_dir / "final_error_problems.json"

        command = [
            sys.executable,
            str(self.validator_script),
            str(self.paths.full_validation_input_dir),
            "--config",
            str(self.config_path),
            "--output",
            str(final_json_path),
        ]
        subprocess.run(command, capture_output=True, text=True, check=False)

        if not final_json_path.exists():
            raise RuntimeError(f"Final validation JSON was not generated: {final_json_path}")

        payload = json.loads(final_json_path.read_text(encoding="utf-8"))
        return final_json_path, int(payload.get("errored_count", 0)), total_inputs

    def _resolve_source_asm(self, problem_name: str) -> Path | None:
        if not _is_readable_dir(self.paths.benchmark_asm_input_dir):
            return None

        exact = self.paths.benchmark_asm_input_dir / f"{problem_name}.s"
        if exact.exists():
            return exact

        matches = sorted(self.paths.benchmark_asm_input_dir.glob(f"{problem_name}_*.s"))
        if matches:
            return matches[0]

        return None

    def _materialize_json_input_asm(self, payload: object) -> None:
        if self.paths.error_json_path.suffix.lower() != ".json":
            return

        if _is_readable_dir(self.paths.benchmark_asm_input_dir):
            existing = list(self.paths.benchmark_asm_input_dir.glob("*.s"))
            if existing:
                return

        entries = extract_errored_entries(payload)
        if not entries and isinstance(payload, list):
            entries = [entry for entry in payload if isinstance(entry, dict)]

        self.paths.benchmark_asm_input_dir.mkdir(parents=True, exist_ok=True)
        for entry in entries:
            name = str(entry.get("name") or entry.get("file") or "").strip()
            pred = str(entry.get("pred") or "")
            if name and pred:
                _write_text(self.paths.benchmark_asm_input_dir / f"{name}.s", pred)


def load_graph_data(cfg: dict[str, object], column: str, graph_kind: str) -> dict[str, str]:
    source = str(cfg.get("graph_source", "hf")).lower()
    if source in {"none", "off", "disabled"}:
        return {}
    if source != "hf":
        raise RuntimeError(f"Unsupported graph_source: {source}")

    if not HAS_DATASETS:
        raise RuntimeError(
            "CFG/DFG loading requires datasets package. Install with: pip install datasets"
        )

    dataset_key = "cfg_dataset_id" if graph_kind == "cfg" else "dfg_dataset_id"
    default_id = "ryaasabsar/humaneval_asm_cfg" if graph_kind == "cfg" else "ryaasabsar/humaneval_asm_dfg"
    dataset_id = str(cfg.get(dataset_key, default_id))
    hf_token = cfg.get("hf_token")
    if hf_token is None:
        import os

        hf_token = os.environ.get("HF_TOKEN") or os.environ.get("HUGGINGFACE_HUB_TOKEN")

    ds = load_dataset(dataset_id, split="O2", token=hf_token)
    graph_map: dict[str, str] = {}
    for row in ds:
        task_name = row.get("task_name")
        if not task_name:
            continue
        if column not in row:
            continue
        graph_map[str(task_name)] = str(row[column])
    return graph_map
