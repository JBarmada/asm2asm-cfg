from __future__ import annotations

import json
import os
import re
import time
from dataclasses import asdict, dataclass
from datetime import datetime
from pathlib import Path

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


@dataclass(frozen=True)
class ComposerRuntimePaths:
    benchmark_asm_input_dir: Path
    input_experiment_dir: Path
    error_json_path: Path
    run_output_dir: Path
    full_validation_input_dir: Path
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
    source_language: str
    cfg_language: str
    dfg_language: str


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
    passed: bool
    status: str
    summary: str
    stderr: str
    errors_count: int
    problems_processed: int
    validator_returncode: int


@dataclass
class ProblemResult:
    name: str
    source_asm_path: Path
    fixed_asm_path: Path
    succeeded: bool
    attempts_used: int
    final_note: str
    attempts: list[dict[str, object]]


def _log(message: str) -> None:
    now = time.strftime("%H:%M:%S")
    print(f"[{now}] {message}")


def _read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def _write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def _append_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("a", encoding="utf-8") as handle:
        handle.write(content)


def _read_config(config_path: Path) -> dict[str, object]:
    try:
        return json.loads(config_path.read_text(encoding="utf-8"))
    except Exception as exc:
        raise RuntimeError(f"Failed to read config JSON: {config_path}") from exc


def read_config(config_path: Path) -> dict[str, object]:
    return _read_config(config_path)


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


def _entry_indicates_error(entry: dict[str, object]) -> bool:
    error_stage = entry.get("error_stage")
    if error_stage is not None:
        return str(error_stage).strip().lower() not in {"", "none", "null"}

    if "success" in entry:
        try:
            return not bool(entry["success"])
        except Exception:
            return True

    status = str(entry.get("status", "")).strip().lower()
    if status:
        return status in {"error", "failed", "fail", "assembly", "execution", "build_error", "runtime_error"}

    return True


def extract_errored_entries(payload: object) -> list[dict[str, object]]:
    if isinstance(payload, list):
        return [entry for entry in payload if isinstance(entry, dict) and _entry_indicates_error(entry)]

    if isinstance(payload, dict):
        errored = payload.get("errored_problems")
        if isinstance(errored, list):
            return [entry for entry in errored if isinstance(entry, dict)]

        problems = payload.get("problems")
        if isinstance(problems, list):
            return [entry for entry in problems if isinstance(entry, dict) and _entry_indicates_error(entry)]

    return []


def _normalize_arch(arch_text: str) -> str:
    value = arch_text.strip().lower()
    if "arm" in value or "aarch64" in value:
        return "arm"
    if "x86" in value:
        return "x86"
    if "riscv" in value:
        return "riscv"
    return value or "arm"


def resolve_runtime_paths(args, cfg: dict[str, object]) -> ComposerRuntimePaths:
    input_path = Path(args.input_path).resolve()
    is_json_input = input_path.is_file() and input_path.suffix.lower() == ".json"

    if is_json_input:
        input_experiment_dir = input_path.parent
    else:
        input_experiment_dir = input_path

    if not input_path.exists():
        raise FileNotFoundError(f"Input path does not exist: {input_path}")
    if not is_json_input and not input_experiment_dir.is_dir():
        raise FileNotFoundError(f"Input directory does not exist: {input_experiment_dir}")

    source_language = _normalize_arch(str(cfg.get("target_arch", cfg.get("source_language", "arm"))))
    cfg_language = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))
    dfg_language = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))

    config_base_name = Path(args.config).stem
    if config_base_name.startswith("config_"):
        config_base_name = config_base_name[7:]

    base_results_dir = Path("results/composer").resolve()
    run_label = args.run_label or (input_path.stem if is_json_input else input_experiment_dir.name)
    # run_output_root = base_results_dir / run_label / config_base_name
    prompt_config_dir = str(getattr(args, "prompt_config", "") or "base")
    run_output_dir = base_results_dir / run_label / prompt_config_dir

    if is_json_input:
        benchmark_asm_input_dir = run_output_dir / "json_input_asm"
        error_json_path = input_path
    else:
        benchmark_asm_input_dir = input_experiment_dir / "translated_asm"
        if not benchmark_asm_input_dir.exists() or not benchmark_asm_input_dir.is_dir():
            benchmark_asm_input_dir = input_experiment_dir / f"{source_language}_asm"

        if args.error_json is not None and Path(args.error_json).exists():
            error_json_path = Path(args.error_json).resolve()
        else:
            cfg_error_json = cfg.get("error_json")
            if cfg_error_json:
                candidate = Path(str(cfg_error_json))
                if not candidate.is_absolute():
                    candidate = (Path(args.config).resolve().parent / candidate).resolve()
                error_json_path = candidate
            else:
                json_dir = input_experiment_dir / "jsons"
                candidates = sorted(
                    json_dir.glob("*_error_problems.json"),
                    key=lambda p: p.stat().st_mtime,
                ) if json_dir.exists() else []
                if not candidates:
                    raise FileNotFoundError(
                        f"Could not locate *_error_problems.json under {json_dir}. "
                        "Provide --error-json explicitly."
                    )
                error_json_path = candidates[-1].resolve()

    return ComposerRuntimePaths(
        benchmark_asm_input_dir=benchmark_asm_input_dir,
        input_experiment_dir=input_experiment_dir,
        error_json_path=error_json_path,
        run_output_dir=run_output_dir,
        full_validation_input_dir=run_output_dir / "full_validation_input_asm",
        prompts_dir=run_output_dir / "prompts",
        raw_output_dir=run_output_dir / "raw_model_output",
        original_error_asm_dir=run_output_dir / f"original_error_{source_language}_asm",
        fixed_asm_dir=run_output_dir / f"fixed_{source_language}_asm",
        logs_dir=run_output_dir / "logs",
        reports_dir=run_output_dir / "txts",
        cleaned_output_dir=run_output_dir / "cleaned_model_output",
        clean_diagnostics_dir=run_output_dir / "clean_diagnostics",
        compile_probe_dir=run_output_dir / "compile_probe",
        validation_json_dir=run_output_dir / "validation_json",
        source_language=source_language,
        cfg_language=cfg_language,
        dfg_language=dfg_language,
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


def save_checkpoint(path: Path, payload: dict[str, object]) -> None:
    payload = dict(payload)
    payload["updated_at"] = datetime.now().isoformat(timespec="seconds")
    _write_text(path, json.dumps(payload, indent=2) + "\n")


def load_checkpoint(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def problem_result_to_dict(result: ProblemResult) -> dict[str, object]:
    data = asdict(result)
    data["source_asm_path"] = str(result.source_asm_path)
    data["fixed_asm_path"] = str(result.fixed_asm_path)
    return data


def problem_result_from_dict(payload: dict[str, object]) -> ProblemResult:
    return ProblemResult(
        name=str(payload.get("name", "")),
        source_asm_path=Path(str(payload.get("source_asm_path", ""))),
        fixed_asm_path=Path(str(payload.get("fixed_asm_path", ""))),
        succeeded=bool(payload.get("succeeded", False)),
        attempts_used=int(payload.get("attempts_used", 0)),
        final_note=str(payload.get("final_note", "")),
        attempts=list(payload.get("attempts", [])),
    )


def resolve_env_api_key(env_candidates: tuple[str, ...]) -> tuple[str, str]:
    smart_quotes = "\u2018\u2019\u201c\u201d"

    for env_name in env_candidates:
        raw = os.environ.get(env_name)
        if raw is None:
            continue

        value = raw.strip().strip("\"'").strip(smart_quotes)
        if not value:
            continue
        if any(ch in value for ch in smart_quotes):
            raise RuntimeError(
                f"Environment variable {env_name} contains smart quotes; use plain ASCII quotes only."
            )
        try:
            value.encode("ascii")
        except UnicodeEncodeError as exc:
            raise RuntimeError(
                f"Environment variable {env_name} contains non-ASCII characters."
            ) from exc
        return env_name, value

    joined = ", ".join(env_candidates)
    raise RuntimeError(f"API key not found. Set one of: {joined}")
