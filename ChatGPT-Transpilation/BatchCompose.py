"""
OpenAI Batch Composer for repairing translated assembly that failed validation.
Language-agnostic via config.json.

Behavior:
- Runs 8 independent prompt strategies for each failing function.
- Executes all pending tracks for an iteration in one Batch API jsonl.
- Performs up to 3 attempts per (problem, strategy) track.
- After each batch, validates each track locally.
- Feeds validation stderr + prior candidate back into next attempt for that same track.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path

from openai import OpenAI

try:
    from datasets import load_dataset
    HAS_DATASETS = True
except ImportError:
    HAS_DATASETS = False


PROMPT_CONFIGS = [
    "base",
    "error_only",
    "cfg_only",
    "dfg_only",
    "error_cfg",
    "error_dfg",
    "cfg_dfg",
    "error_cfg_dfg",
]
MAX_ATTEMPTS = 3
RUN_ERROR_JSON_SCRIPT = Path("run_translation_error_json.py").resolve()


@dataclass(frozen=True)
class ComposerRuntimePaths:
    benchmark_asm_input_dir: Path
    input_experiment_dir: Path
    error_json_path: Path
    run_output_dir: Path
    prompts_dir: Path
    raw_output_dir: Path
    original_error_asm_dir: Path
    fixed_asm_dir: Path
    logs_dir: Path
    reports_dir: Path
    cleaned_output_dir: Path
    clean_diagnostics_dir: Path
    compile_probe_dir: Path
    validation_json_dir: Path
    batch_inputs_dir: Path
    track_fixed_root_dir: Path
    source_language: str


@dataclass
class ProblemSpec:
    name: str
    summary: str
    stderr: str
    source_asm_path: Path
    source_asm_name: str
    cfg_text: str
    dfg_text: str


@dataclass
class ValidationFeedback:
    status: str
    summary: str
    stderr: str
    errors_count: int
    problems_processed: int
    validator_returncode: int


@dataclass
class TrackState:
    solved: bool
    attempts_made: int
    last_validation_status: str
    last_validation_summary: str
    last_stderr: str
    last_code: str
    source_asm_name: str
    source_asm_stem: str
    final_note: str


def _log(message: str) -> None:
    now = time.strftime("%H:%M:%S")
    print(f"[{now}] {message}")


def _read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def _write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def _is_readable_file(path: Path) -> bool:
    if not path.exists() or not path.is_file():
        return False
    try:
        with path.open("r", encoding="utf-8"):
            return True
    except OSError:
        return False


def _is_readable_dir(path: Path) -> bool:
    if not path.exists() or not path.is_dir():
        return False
    try:
        next(path.iterdir(), None)
        return True
    except OSError:
        return False


def resolve_openai_api_key() -> tuple[str, str]:
    env_name = "OPENAI_API_KEY"
    value = os.environ.get(env_name)
    if not value:
        raise RuntimeError("OPENAI_API_KEY environment variable is missing.")
    return env_name, value.strip()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="OpenAI Batch Composer using JSON config")
    parser.add_argument("input_dir", type=Path, help="Input experiment directory")
    parser.add_argument("--config", type=Path, required=True, help="Path to config.json")
    parser.add_argument("--run-label", help="Optional label used in output naming")
    parser.add_argument("--error-json", type=Path, help="Optional explicit *_error_problems.json path")
    parser.add_argument("--completion-window", default="24h", help="Batch completion window (e.g., 24h)")
    return parser.parse_args()


def resolve_runtime_paths(args: argparse.Namespace) -> ComposerRuntimePaths:
    input_experiment_dir = args.input_dir.resolve()
    if not input_experiment_dir.exists() or not input_experiment_dir.is_dir():
        raise FileNotFoundError(f"Input directory does not exist: {input_experiment_dir}")

    benchmark_asm_input_dir = input_experiment_dir / "translated_asm"
    if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
        benchmark_asm_input_dir = input_experiment_dir / f"{args.source_language}_asm"
        if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
            benchmark_asm_input_dir = input_experiment_dir / "arm_asm"
            if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
                raise FileNotFoundError(f"Source asm directory not found in {input_experiment_dir}")

    if args.error_json is not None and args.error_json.exists():
        error_json_path = args.error_json.resolve()
    else:
        json_dir = input_experiment_dir / "jsons"
        candidates = sorted(json_dir.glob("*_error_problems.json"), key=lambda p: p.stat().st_mtime) if json_dir.exists() else []
        if not candidates:
            candidates = sorted(input_experiment_dir.glob("*_error_problems.json"), key=lambda p: p.stat().st_mtime)
            if not candidates:
                raise FileNotFoundError(f"No *_error_problems.json found in {input_experiment_dir}")
        error_json_path = candidates[-1].resolve()

    config_base_name = args.config.stem
    if config_base_name.startswith("config_"):
        config_base_name = config_base_name[7:]

    run_output_dir = Path("results/batch_composer").resolve() / config_base_name

    return ComposerRuntimePaths(
        benchmark_asm_input_dir=benchmark_asm_input_dir,
        input_experiment_dir=input_experiment_dir,
        error_json_path=error_json_path,
        run_output_dir=run_output_dir,
        prompts_dir=run_output_dir / "prompts",
        raw_output_dir=run_output_dir / "raw_model_output",
        original_error_asm_dir=run_output_dir / f"original_error_{args.source_language}_asm",
        fixed_asm_dir=run_output_dir / f"fixed_{args.source_language}_asm",
        logs_dir=run_output_dir / "logs",
        reports_dir=run_output_dir / "txts",
        cleaned_output_dir=run_output_dir / "cleaned_model_output",
        clean_diagnostics_dir=run_output_dir / "clean_diagnostics",
        compile_probe_dir=run_output_dir / "compile_probe",
        validation_json_dir=run_output_dir / "validation_json",
        batch_inputs_dir=run_output_dir / "batch_inputs",
        track_fixed_root_dir=run_output_dir / "track_fixed",
        source_language=args.source_language,
    )


def _is_asm_like_line(line: str) -> bool:
    stripped = line.strip()
    if not stripped:
        return True
    if stripped.startswith((".", "//", "/*", "*", "#")):
        return True
    if re.match(r"^[A-Za-z_.$][\w.$]*:\s*$", stripped):
        return True
    if re.match(r"^b(\.[A-Za-z0-9]+)?\b", stripped):
        return True
    if re.match(r"^[a-z]{2,8}(\.[A-Za-z0-9]+)?\b", stripped):
        return True
    return False


def clean_model_output(text: str) -> tuple[str, dict[str, object]]:
    raw = text or ""
    lines = raw.splitlines()
    without_fences = [line for line in lines if not line.strip().startswith("```")]

    first_idx = 0
    while first_idx < len(without_fences) and not _is_asm_like_line(without_fences[first_idx]):
        first_idx += 1

    last_idx = len(without_fences) - 1
    while last_idx >= first_idx and not _is_asm_like_line(without_fences[last_idx]):
        last_idx -= 1

    cleaned_lines = without_fences[first_idx:last_idx + 1] if first_idx <= last_idx else []
    cleaned = "\n".join(cleaned_lines).strip()

    diagnostics = {
        "raw_line_count": len(lines),
        "fence_lines_removed": len(lines) - len(without_fences),
        "leading_non_asm_lines_removed": first_idx,
        "trailing_non_asm_lines_removed": max(0, len(without_fences) - last_idx - 1) if without_fences else 0,
        "cleaned_line_count": len(cleaned_lines),
        "is_empty_after_clean": cleaned == "",
    }
    return cleaned, diagnostics


def fetch_hf_graph_data(dataset_id: str, column: str, hf_token: str | None) -> dict[str, str]:
    if not HAS_DATASETS:
        raise ImportError("The 'datasets' library is required. Install with: pip install datasets")

    _log(f"Fetching Hugging Face dataset: {dataset_id} (column: {column})")
    ds = load_dataset(dataset_id, split="O2", token=hf_token)

    graph_map: dict[str, str] = {}
    for row in ds:
        task_name = row["task_name"]
        if column not in row:
            raise KeyError(f"Column '{column}' not found in dataset {dataset_id}.")
        graph_map[task_name] = str(row[column])
    return graph_map


def load_problem_specs(
    paths: ComposerRuntimePaths,
    cfg_data: dict[str, str],
    dfg_data: dict[str, str],
) -> list[ProblemSpec]:
    issues: list[str] = []

    if not _is_readable_file(paths.error_json_path):
        issues.append(f"Cannot read error JSON: {paths.error_json_path}")
    if not _is_readable_dir(paths.benchmark_asm_input_dir):
        issues.append(f"source asm directory is not readable: {paths.benchmark_asm_input_dir}")
    if not _is_readable_file(RUN_ERROR_JSON_SCRIPT):
        issues.append(f"validation script is missing/unreadable: {RUN_ERROR_JSON_SCRIPT}")

    try:
        payload = json.loads(paths.error_json_path.read_text(encoding="utf-8"))
    except Exception as exc:
        raise RuntimeError(f"Failed to parse error JSON {paths.error_json_path}: {exc}") from exc

    errored = payload.get("errored_problems", [])
    specs: list[ProblemSpec] = []

    for entry in errored:
        problem_name = str(entry.get("name", "")).strip()
        if not problem_name:
            continue

        source_matches = sorted(paths.benchmark_asm_input_dir.glob(f"{problem_name}_*.s"))
        if not source_matches:
            issues.append(f"missing source asm for {problem_name} in {paths.benchmark_asm_input_dir}")
            continue

        source_asm = source_matches[0]
        cfg_text = cfg_data.get(problem_name, "")
        dfg_text = dfg_data.get(problem_name, "")

        if not cfg_text:
            issues.append(f"missing CFG in HF dataset for {problem_name}")
        if not dfg_text:
            issues.append(f"missing DFG in HF dataset for {problem_name}")

        specs.append(
            ProblemSpec(
                name=problem_name,
                summary=str(entry.get("summary", "")),
                stderr=str(entry.get("stderr", "")),
                source_asm_path=source_asm,
                source_asm_name=source_asm.name,
                cfg_text=cfg_text,
                dfg_text=dfg_text,
            )
        )

    if issues:
        detail = "\n".join(f"- {item}" for item in issues)
        raise RuntimeError(f"Preflight validation failed. Terminating before execution.\n{detail}")

    return specs


def build_prompt(
    problem: ProblemSpec,
    source_asm: str,
    prompt_config: str,
    source_language: str,
    cfg_language: str,
    dfg_language: str,
    retry_context: dict[str, str] | None = None,
) -> str:
    sections: list[str] = [
        f"Repair the following translated {source_language} assembly function.",
        "",
        "Goal:",
        f"Produce a corrected {source_language} assembly function that preserves behavior",
        "",
        "Hard requirements:",
        "- Output only assembly text. No markdown fences. No prose.",
        "- Keep function signature/name expectations used by the harness (func0 unless explicitly required otherwise).",
        "- Keep the same target ISA/language as input; do not translate to a different ISA.",
        "- Preserve exact semantics and edge cases.",
        "- If CFG/DFG are provided, treat them as semantic guidance only",
        "",
    ]

    if prompt_config in {"error_only", "error_cfg", "error_dfg", "error_cfg_dfg"}:
        sections.extend([
            "Known failure summary from prior validation:",
            problem.summary or "(no summary provided)",
            "",
            "Known stderr from prior validation:",
            problem.stderr or "(no stderr provided)",
            "",
        ])

    sections.extend([f"Input {source_language} Assembly:", source_asm, ""])

    if prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}:
        sections.extend([
            f"CFG ({cfg_language} semantic graph; target output remains {source_language} assembly):",
            problem.cfg_text or "(CFG data not found)",
            "",
        ])

    if prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}:
        sections.extend([
            f"DFG ({dfg_language} semantic graph; target output remains {source_language} assembly):",
            problem.dfg_text or "(DFG data not found)",
            "",
        ])

    if retry_context:
        sections.extend([
            "Previous failed attempt feedback (use this to fix the next output):",
            f"Attempt: {retry_context.get('attempt', '')}",
            f"Validation status: {retry_context.get('validation_status', '')}",
            "Validation summary:",
            retry_context.get("validation_summary", "(no summary provided)"),
            "",
            "Validation stderr:",
            retry_context.get("validation_stderr", "(no stderr provided)"),
            "",
            "Previous candidate assembly that failed:",
            retry_context.get("previous_code", ""),
            "",
            "Repair the previous candidate using the feedback above.",
            "",
        ])

    sections.append("Return only the final corrected assembly text.")
    return "\n".join(sections)


def validate_single_problem(
    paths: ComposerRuntimePaths,
    args: argparse.Namespace,
    problem_name: str,
    asm_filter_name: str,
    fixed_dir: Path,
    attempt: int,
    config_name: str,
) -> tuple[bool, str, ValidationFeedback]:
    validation_json_path = paths.validation_json_dir / f"{problem_name}_{config_name}_attempt{attempt}.json"
    probe_log_path = paths.compile_probe_dir / f"{problem_name}_{config_name}_attempt{attempt}.log"

    command = [
        sys.executable,
        str(RUN_ERROR_JSON_SCRIPT),
        str(fixed_dir),
        "--config",
        str(args.config.resolve()),
        "--problems",
        problem_name,
        asm_filter_name,
        "--output",
        str(validation_json_path),
    ]

    completed = subprocess.run(command, capture_output=True, text=True, check=False)
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
        note = f"Validation JSON was not generated (validator rc={completed.returncode})"
        return False, note, ValidationFeedback(
            status="validation_json_missing",
            summary=note,
            stderr=completed.stderr.strip(),
            errors_count=-1,
            problems_processed=0,
            validator_returncode=completed.returncode,
        )

    payload = json.loads(validation_json_path.read_text(encoding="utf-8"))
    errored_count = int(payload.get("errored_count", 0))
    problems_processed = int(payload.get("problems_processed", 0))

    if errored_count == 0 and problems_processed > 0:
        return True, "Passed validation", ValidationFeedback(
            status="passed",
            summary="Passed validation",
            stderr="",
            errors_count=0,
            problems_processed=problems_processed,
            validator_returncode=completed.returncode,
        )

    if problems_processed == 0:
        available = ", ".join(sorted(path.stem for path in fixed_dir.glob("*.s"))[:8])
        if not available:
            available = "(none)"
        note = (
            "Validation processed 0 files. "
            f"filters=[{problem_name}, {asm_filter_name}] "
            f"validator_rc={completed.returncode} "
            f"available_stems={available}"
        )
        return False, note, ValidationFeedback(
            status="no_files_processed",
            summary=note,
            stderr=completed.stderr.strip(),
            errors_count=errored_count,
            problems_processed=problems_processed,
            validator_returncode=completed.returncode,
        )

    errored_problems = payload.get("errored_problems", [])
    if errored_problems:
        first = errored_problems[0]
        status = str(first.get("status", "error"))
        summary = str(first.get("summary", "")).strip()
        stderr_full = str(first.get("stderr", "")).strip()
        stderr_short = stderr_full.splitlines()[0] if stderr_full else ""
        note = f"{status}: {summary}".strip()
        if stderr_short:
            note = f"{note} | stderr: {stderr_short}"
        return False, note, ValidationFeedback(
            status=status,
            summary=summary,
            stderr=stderr_full,
            errors_count=errored_count,
            problems_processed=problems_processed,
            validator_returncode=completed.returncode,
        )

    note = f"Validation inconclusive: processed={problems_processed}, errors={errored_count}, validator_rc={completed.returncode}"
    return False, note, ValidationFeedback(
        status="inconclusive",
        summary=note,
        stderr=completed.stderr.strip(),
        errors_count=errored_count,
        problems_processed=problems_processed,
        validator_returncode=completed.returncode,
    )


def _extract_chat_completion_text(record: dict) -> str:
    response = record.get("response", {}) or {}
    body = response.get("body", {}) or {}
    choices = body.get("choices", []) or []
    if not choices:
        return ""

    message = choices[0].get("message", {}) or {}
    content = message.get("content", "")
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        parts: list[str] = []
        for item in content:
            if isinstance(item, dict) and item.get("type") == "text":
                parts.append(str(item.get("text", "")))
            elif isinstance(item, str):
                parts.append(item)
        return "\n".join(part for part in parts if part)
    return ""


class IndependentTrackBatchController:
    def __init__(self, problems: list[ProblemSpec], paths: ComposerRuntimePaths, args: argparse.Namespace, client: OpenAI):
        self.problems = problems
        self.paths = paths
        self.args = args
        self.client = client
        self.problem_index = {p.name: p for p in problems}

        self.tracker: dict[tuple[str, str], TrackState] = {}
        for prob in problems:
            for config in PROMPT_CONFIGS:
                self.tracker[(prob.name, config)] = TrackState(
                    solved=False,
                    attempts_made=0,
                    last_validation_status="",
                    last_validation_summary="",
                    last_stderr="",
                    last_code="",
                    source_asm_name=prob.source_asm_name,
                    source_asm_stem=Path(prob.source_asm_name).stem,
                    final_note="pending",
                )

        self.history_records: list[dict[str, object]] = []

    def _track_fixed_dir(self, config: str) -> Path:
        path = self.paths.track_fixed_root_dir / config
        path.mkdir(parents=True, exist_ok=True)
        return path

    def prepare_batch_file(self, iteration: int) -> Path | None:
        batch_filename = self.paths.batch_inputs_dir / f"batch_iter_{iteration}.jsonl"
        pending_count = 0

        with batch_filename.open("w", encoding="utf-8") as handle:
            for (prob_name, config), state in self.tracker.items():
                if state.solved or state.attempts_made >= MAX_ATTEMPTS:
                    continue

                prob = self.problem_index[prob_name]
                source_asm = _read_text(prob.source_asm_path)
                retry_context = None
                if state.attempts_made > 0:
                    retry_context = {
                        "attempt": str(state.attempts_made),
                        "validation_status": state.last_validation_status,
                        "validation_summary": state.last_validation_summary,
                        "validation_stderr": state.last_stderr or "(no stderr provided)",
                        "previous_code": state.last_code,
                    }

                prompt = build_prompt(
                    problem=prob,
                    source_asm=source_asm,
                    prompt_config=config,
                    source_language=self.paths.source_language,
                    cfg_language=self.args.cfg_language,
                    dfg_language=self.args.dfg_language,
                    retry_context=retry_context,
                )

                prompt_path = self.paths.prompts_dir / f"{prob_name}_{config}_attempt{state.attempts_made + 1}.txt"
                _write_text(prompt_path, prompt)

                custom_id = f"{prob_name}---{config}---{iteration + 1}"
                body = {
                    "model": self.args.model,
                    "messages": [
                        {
                            "role": "system",
                            "content": "You are an expert assembly repair assistant. Output ONLY assembly text. No markdown. No prose.",
                        },
                        {"role": "user", "content": prompt},
                    ],
                    "max_tokens": self.args.max_tokens,
                }

                line = {
                    "custom_id": custom_id,
                    "method": "POST",
                    "url": "/v1/chat/completions",
                    "body": body,
                }
                handle.write(json.dumps(line) + "\n")
                pending_count += 1

        return batch_filename if pending_count > 0 else None

    def poll_batch(self, batch_id: str) -> str:
        while True:
            job = self.client.batches.retrieve(batch_id)
            if job.status == "completed":
                if not job.output_file_id:
                    raise RuntimeError(f"Batch {batch_id} completed without output_file_id")
                return self.client.files.content(job.output_file_id).text
            if job.status in {"failed", "cancelled", "expired"}:
                errors = getattr(job, "errors", None)
                raise RuntimeError(f"Batch {batch_id} ended with status={job.status}, errors={errors}")

            completed = getattr(job.request_counts, "completed", 0)
            total = getattr(job.request_counts, "total", 0)
            print(f"[{datetime.now().strftime('%H:%M')}] batch={batch_id} {completed}/{total} done...", end="\r")
            time.sleep(self.args.poll_seconds)

    def process_results(self, iteration: int, results_text: str) -> None:
        lines = [line for line in results_text.strip().split("\n") if line.strip()]

        for line in lines:
            data = json.loads(line)
            custom_id = data.get("custom_id", "")
            parts = custom_id.split("---")
            if len(parts) != 3:
                _write_text(
                    self.paths.logs_dir / f"bad_record_iter_{iteration + 1}.log",
                    (self.paths.logs_dir / f"bad_record_iter_{iteration + 1}.log").read_text(encoding="utf-8") + line + "\n"
                    if (self.paths.logs_dir / f"bad_record_iter_{iteration + 1}.log").exists() else line + "\n",
                )
                continue

            prob_name, config, _iter_idx = parts
            state = self.tracker.get((prob_name, config))
            if state is None:
                continue

            state.attempts_made += 1

            raw_content = _extract_chat_completion_text(data)
            raw_path = self.paths.raw_output_dir / f"{prob_name}_{config}_attempt{state.attempts_made}.txt"
            _write_text(raw_path, raw_content)

            cleaned_code, diagnostics = clean_model_output(raw_content)
            cleaned_path = self.paths.cleaned_output_dir / f"{prob_name}_{config}_attempt{state.attempts_made}.txt"
            diag_path = self.paths.clean_diagnostics_dir / f"{prob_name}_{config}_attempt{state.attempts_made}.json"
            _write_text(cleaned_path, cleaned_code)
            _write_text(diag_path, json.dumps(diagnostics, indent=2) + "\n")

            fixed_dir = self._track_fixed_dir(config)
            track_output = fixed_dir / state.source_asm_name
            _write_text(track_output, cleaned_code)

            passed, note, feedback = validate_single_problem(
                paths=self.paths,
                args=self.args,
                problem_name=prob_name,
                asm_filter_name=state.source_asm_stem,
                fixed_dir=fixed_dir,
                attempt=state.attempts_made,
                config_name=config,
            )

            state.last_code = cleaned_code
            state.last_stderr = feedback.stderr
            state.last_validation_status = feedback.status
            state.last_validation_summary = feedback.summary
            state.final_note = note
            if passed:
                state.solved = True

            self.history_records.append(
                {
                    "iteration": iteration + 1,
                    "problem": prob_name,
                    "config": config,
                    "attempt": state.attempts_made,
                    "passed": passed,
                    "note": note,
                    "validation_status": feedback.status,
                    "validation_summary": feedback.summary,
                    "validation_stderr": feedback.stderr,
                    "raw_output_path": str(raw_path),
                    "cleaned_output_path": str(cleaned_path),
                    "diagnostics_path": str(diag_path),
                    "track_output_path": str(track_output),
                }
            )

    def print_metrics(self, iteration: int) -> None:
        print("\n" + "=" * 70)
        print(f"ITERATION {iteration + 1} METRICS")
        print("=" * 70)
        total = len(self.problems)

        for config in PROMPT_CONFIGS:
            solved = sum(1 for (p, c), s in self.tracker.items() if c == config and s.solved)
            attempted = sum(1 for (p, c), s in self.tracker.items() if c == config and s.attempts_made > 0)
            print(f"{config:15} solved={solved}/{total} ({(solved / total * 100.0) if total else 0.0:.1f}%) attempted={attempted}/{total}")

        overall_tracks = len(self.tracker)
        solved_tracks = sum(1 for s in self.tracker.values() if s.solved)
        exhausted_tracks = sum(1 for s in self.tracker.values() if (not s.solved) and s.attempts_made >= MAX_ATTEMPTS)
        print("-" * 70)
        print(f"Overall tracks solved: {solved_tracks}/{overall_tracks}")
        print(f"Overall tracks exhausted: {exhausted_tracks}/{overall_tracks}")
        print("=" * 70 + "\n")

    def _copy_best_to_final_fixed(self) -> tuple[int, int]:
        copied = 0
        unresolved = 0

        for problem in self.problems:
            chosen_config = None
            for config in PROMPT_CONFIGS:
                state = self.tracker[(problem.name, config)]
                if state.solved:
                    chosen_config = config
                    break

            if chosen_config is None:
                unresolved += 1
                continue

            source_path = self._track_fixed_dir(chosen_config) / problem.source_asm_name
            target_path = self.paths.fixed_asm_dir / problem.source_asm_name
            if source_path.exists():
                shutil.copy2(source_path, target_path)
                copied += 1

        return copied, unresolved

    def write_reports(self, started_at: datetime, finished_at: datetime, final_validation_path: Path, final_validation_error_count: int) -> None:
        report_lines: list[str] = [
            f"Run started: {started_at.isoformat(timespec='seconds')}",
            f"Run finished: {finished_at.isoformat(timespec='seconds')}",
            f"Input experiment dir: {self.paths.input_experiment_dir.absolute()}",
            f"Run label: {self.args.run_label or self.paths.input_experiment_dir.name}",
            f"Source language: {self.paths.source_language}",
            f"Model: {self.args.model}",
            f"Prompt configs: {', '.join(PROMPT_CONFIGS)}",
            f"Max attempts per track: {MAX_ATTEMPTS}",
            f"Final validation JSON: {final_validation_path}",
            f"Final validation errored_count: {final_validation_error_count}",
            "",
            "Per-config success:",
        ]

        for config in PROMPT_CONFIGS:
            solved = sum(1 for (p, c), s in self.tracker.items() if c == config and s.solved)
            total = len(self.problems)
            report_lines.append(f"- {config}: {solved}/{total} ({(solved / total * 100.0) if total else 0.0:.1f}%)")

        report_lines.extend(["", "Per-problem track outcomes:"])
        for problem in sorted(self.problems, key=lambda p: p.name):
            report_lines.append(f"- {problem.name}")
            for config in PROMPT_CONFIGS:
                state = self.tracker[(problem.name, config)]
                report_lines.append(
                    f"    {config}: solved={state.solved} attempts={state.attempts_made} note={state.final_note}"
                )

        timestamp = finished_at.strftime("%Y%m%d_%H%M%S")
        summary_report = self.paths.reports_dir / f"{timestamp}_summary.txt"
        _write_text(summary_report, "\n".join(report_lines) + "\n")

        history_path = self.paths.reports_dir / f"{timestamp}_history.json"
        _write_text(history_path, json.dumps(self.history_records, indent=2) + "\n")

        _log(f"Summary report written to {summary_report}")
        _log(f"History report written to {history_path}")

    def run(self) -> tuple[int, int]:
        for iteration in range(MAX_ATTEMPTS):
            _log(f"Starting iteration {iteration + 1}/{MAX_ATTEMPTS}")
            batch_file = self.prepare_batch_file(iteration)
            if batch_file is None:
                _log("No pending tracks remain. Stopping iterations early.")
                break

            with batch_file.open("rb") as handle:
                uploaded = self.client.files.create(file=handle, purpose="batch")

            job = self.client.batches.create(
                input_file_id=uploaded.id,
                endpoint="/v1/chat/completions",
                completion_window=self.args.completion_window,
            )
            _log(f"Submitted batch job id={job.id} for iteration {iteration + 1}")

            results_text = self.poll_batch(job.id)
            self.process_results(iteration, results_text)
            self.print_metrics(iteration)

        copied, unresolved = self._copy_best_to_final_fixed()
        _log(f"Selected best solved tracks and copied {copied} outputs into {self.paths.fixed_asm_dir}")
        if unresolved > 0:
            _log(f"Problems with no solved track: {unresolved}")
        return copied, unresolved


def validate_all_fixed_outputs(paths: ComposerRuntimePaths, args: argparse.Namespace) -> tuple[Path, int]:
    final_json_path = paths.validation_json_dir / "final_error_problems.json"
    command = [
        sys.executable,
        str(RUN_ERROR_JSON_SCRIPT),
        str(paths.fixed_asm_dir),
        "--config",
        str(args.config.resolve()),
        "--output",
        str(final_json_path),
    ]

    subprocess.run(command, capture_output=True, text=True, check=False)
    if not final_json_path.exists():
        return final_json_path, -1

    payload = json.loads(final_json_path.read_text(encoding="utf-8"))
    return final_json_path, int(payload.get("errored_count", 0))


def main() -> int:
    args = parse_args()

    try:
        _api_key_source, api_key = resolve_openai_api_key()
        cfg = json.loads(args.config.read_text(encoding="utf-8"))

        args.source_language = cfg.get("target_arch", "Armv8")
        args.cfg_language = cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", "x86_64"))
        args.dfg_language = cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", "x86_64"))
        args.model = cfg.get("composer_model", cfg.get("model_name", "gpt-5-mini-2025-08-07"))
        args.max_tokens = int(cfg.get("max_tokens", 2000))
        args.poll_seconds = int(cfg.get("batch_poll_seconds", 60))

        paths = resolve_runtime_paths(args)

        hf_token = cfg.get("hf_token") or os.environ.get("HF_TOKEN") or os.environ.get("HUGGINGFACE_HUB_TOKEN")
        cfg_data = fetch_hf_graph_data("ryaasabsar/humaneval_asm_cfg", args.cfg_language, hf_token)
        dfg_data = fetch_hf_graph_data("ryaasabsar/humaneval_asm_dfg", args.dfg_language, hf_token)
        problems = load_problem_specs(paths, cfg_data, dfg_data)

    except Exception as exc:
        print(str(exc), file=sys.stderr)
        return 2

    print("\n" + "=" * 70)
    print(" BATCH COMPOSER PIPELINE CONFIGURATION")
    print("=" * 70)
    print(f"Benchmark ASM input: {paths.benchmark_asm_input_dir}")
    print(f"Config JSON: {args.config.absolute()}")
    print(f"Error JSON: {paths.error_json_path}")
    print(f"Validation Script: {RUN_ERROR_JSON_SCRIPT}")
    print(f"Run output dir: {paths.run_output_dir}")
    print(f"Model: {args.model}")
    print(f"Prompt configs: {', '.join(PROMPT_CONFIGS)}")
    print(f"Problems to repair: {len(problems)}")
    print(f"Max attempts per track: {MAX_ATTEMPTS}")
    print("=" * 70 + "\n")

    confirm = input("Directories and config verified. Do you want to proceed with this run? [y/N]: ").strip().lower()
    if confirm not in ["y", "yes"]:
        print("Run cancelled by user. Exiting.")
        return 0

    paths.prompts_dir.mkdir(parents=True, exist_ok=True)
    paths.raw_output_dir.mkdir(parents=True, exist_ok=True)
    paths.original_error_asm_dir.mkdir(parents=True, exist_ok=True)
    paths.fixed_asm_dir.mkdir(parents=True, exist_ok=True)
    paths.logs_dir.mkdir(parents=True, exist_ok=True)
    paths.reports_dir.mkdir(parents=True, exist_ok=True)
    paths.cleaned_output_dir.mkdir(parents=True, exist_ok=True)
    paths.clean_diagnostics_dir.mkdir(parents=True, exist_ok=True)
    paths.compile_probe_dir.mkdir(parents=True, exist_ok=True)
    paths.validation_json_dir.mkdir(parents=True, exist_ok=True)
    paths.batch_inputs_dir.mkdir(parents=True, exist_ok=True)
    paths.track_fixed_root_dir.mkdir(parents=True, exist_ok=True)

    for problem in problems:
        dst = paths.original_error_asm_dir / problem.source_asm_name
        if not dst.exists():
            shutil.copy2(problem.source_asm_path, dst)

    started_at = datetime.now()

    if not problems:
        finished_at = datetime.now()
        final_validation_path, final_validation_error_count = validate_all_fixed_outputs(paths, args)
        print("No errored problems found in input JSON.")
        print(f"Final validation JSON: {final_validation_path}")
        print(f"Final errored_count: {final_validation_error_count}")
        return 0

    client = OpenAI(api_key=api_key)
    controller = IndependentTrackBatchController(problems, paths, args, client)
    _copied, unresolved = controller.run()

    finished_at = datetime.now()
    final_validation_path, final_validation_error_count = validate_all_fixed_outputs(paths, args)
    controller.write_reports(started_at, finished_at, final_validation_path, final_validation_error_count)

    total_tracks = len(problems) * len(PROMPT_CONFIGS)
    solved_tracks = sum(1 for state in controller.tracker.values() if state.solved)
    print(
        "Batch Composer finished. "
        f"solved_tracks={solved_tracks}/{total_tracks} "
        f"unresolved_problems={unresolved} "
        f"final_errored_count={final_validation_error_count}"
    )

    return 0 if final_validation_error_count == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
