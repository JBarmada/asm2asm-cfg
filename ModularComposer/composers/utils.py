from __future__ import annotations

import json
import os
import re
import shutil
import time
from dataclasses import asdict, dataclass, field
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

ISA_DATASET_COLUMNS = {
    "x86": "x86_64",
    "armv8-linux": "aarch64_linux",
    "armv8.4a-apple": "aarch64_apple",
    "riscv": "riscv64",
}

ISA_DISPLAY_NAMES = {
    "x86": "x86-64",
    "armv8-linux": "ARMv8 Linux (AArch64)",
    "armv8.4a-apple": "ARMv8.4-A Apple (AArch64)",
    "riscv": "RISC-V RV64",
}

ISA_ALIASES = {
    "x86": "x86",
    "x86_64": "x86",
    "x86-64": "x86",
    "amd64": "x86",
    "arm": "armv8-linux",
    "arm linux": "armv8-linux",
    "arm_linux": "armv8-linux",
    "arm-linux": "armv8-linux",
    "arm64": "armv8-linux",
    "aarch64": "armv8-linux",
    "aarch64_linux": "armv8-linux",
    "aarch64-linux": "armv8-linux",
    "armv8": "armv8-linux",
    "armv8-linux": "armv8-linux",
    "arm apple": "armv8.4a-apple",
    "arm_apple": "armv8.4a-apple",
    "arm-apple": "armv8.4a-apple",
    "aarch64_apple": "armv8.4a-apple",
    "aarch64-apple": "armv8.4a-apple",
    "armv8mac": "armv8.4a-apple",
    "armv8.4a": "armv8.4a-apple",
    "armv8.4a-apple": "armv8.4a-apple",
    "mac-armv8": "armv8.4a-apple",
    "riscv": "riscv",
    "riscv64": "riscv",
}

BENCHMARK_ALIASES = {
    "humaneval": "humaneval",
    "humaneval-c": "humaneval",
    "human_eval": "humaneval",
    "mceval": "mceval",
    "mceval-c": "mceval",
    "bringup": "bringup",
    "bringup-bench": "bringup",
    "bringupbench": "bringup",
}

BENCHMARK_DIRECTORY_NAMES = {
    "humaneval": "humaneval-c",
    "mceval": "mceval-c",
    "bringup": "bringup-bench",
}

BENCHMARK_DISPLAY_NAMES = {
    "humaneval": "HumanEval",
    "mceval": "McEval",
    "bringup": "BringUpBench",
}

DEFAULT_GRAPH_DATASET_IDS = {
    "humaneval": {
        "cfg": "ryaasabsar/humaneval_asm_cfg",
        "dfg": "ryaasabsar/humaneval_asm_dfg",
    }
}


@dataclass(frozen=True)
class ComposerRuntimePaths:
    benchmark_id: str
    benchmark_root: Path
    input_mode: str
    input_path: Path
    input_experiment_dir: Path
    asm_input_dir: Path
    error_json_path: Path
    error_json_will_be_bootstrapped: bool
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
    target_isa: str
    target_isa_display: str
    source_isa: str
    source_isa_display: str
    cfg_language: str
    dfg_language: str
    graph_split: str


@dataclass
class ProblemSpec:
    name: str
    benchmark_id: str
    artifact_kind: str
    summary: str
    stderr: str
    source_asm_path: Path
    source_asm_name: str
    benchmark_task_path: Path
    expected_symbols: tuple[str, ...]
    prompt_constraints: tuple[str, ...]
    cfg_text: str
    dfg_text: str
    cfg_available: bool
    dfg_available: bool
    metadata: dict[str, str] = field(default_factory=dict)


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


def _write_json(path: Path, payload: object) -> None:
    _write_text(path, json.dumps(payload, indent=2) + "\n")


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


def _remove_path(path: Path) -> None:
    if not path.exists():
        return
    if path.is_dir():
        shutil.rmtree(path)
    else:
        path.unlink()


def normalize_benchmark_id(benchmark_text: str) -> str:
    value = benchmark_text.strip().lower().replace("_", "-")
    normalized = BENCHMARK_ALIASES.get(value)
    if normalized is None:
        raise RuntimeError(
            "Unsupported benchmark. Expected one of: humaneval, mceval, bringup"
        )
    return normalized


def benchmark_display_name(benchmark_id: str) -> str:
    return BENCHMARK_DISPLAY_NAMES[normalize_benchmark_id(benchmark_id)]


def normalize_isa(isa_text: str) -> str:
    value = isa_text.strip().lower().replace("_", "-")
    value = value.replace("darwin", "apple")
    normalized = ISA_ALIASES.get(value)
    if normalized is None:
        raise RuntimeError(
            "Unsupported ISA. Expected one of: x86, armv8-linux, armv8.4a-apple, riscv"
        )
    return normalized


def isa_display_name(isa_id: str) -> str:
    return ISA_DISPLAY_NAMES[normalize_isa(isa_id)]


def isa_dataset_column(isa_id: str) -> str:
    return ISA_DATASET_COLUMNS[normalize_isa(isa_id)]


def default_graph_dataset_id(benchmark_id: str, graph_kind: str) -> str | None:
    benchmark_id = normalize_benchmark_id(benchmark_id)
    ids = DEFAULT_GRAPH_DATASET_IDS.get(benchmark_id, {})
    return ids.get(graph_kind)


def workspace_root() -> Path:
    return Path(__file__).resolve().parents[1]


def _candidate_repo_roots() -> tuple[Path, ...]:
    root = workspace_root().resolve()
    candidates = [root]
    parent = root.parent
    if parent != root:
        candidates.append(parent)
    return tuple(candidates)


def _resolve_path_from_bases(path_value: str | Path, bases: tuple[Path, ...]) -> Path:
    raw_path = Path(str(path_value))
    if raw_path.is_absolute():
        return raw_path.resolve()

    for base in bases:
        candidate = (base / raw_path).resolve()
        if candidate.exists():
            return candidate

    return (bases[0] / raw_path).resolve()


def default_benchmark_root(benchmark_id: str) -> Path:
    benchmark_id = normalize_benchmark_id(benchmark_id)
    relative = Path("cpu-transpiler-inference") / "benchmarks" / BENCHMARK_DIRECTORY_NAMES[benchmark_id]
    return _resolve_path_from_bases(relative, _candidate_repo_roots())


def normalize_problem_name(value: str) -> str:
    text = value.strip().replace("\\", "/").rstrip("/")
    if not text:
        return ""

    parts = [part for part in text.split("/") if part]
    candidate = parts[-1]
    stem = Path(candidate).stem
    if stem in {"code", "test", "pred"} and len(parts) >= 2:
        return parts[-2]
    return stem


def problem_name_from_entry(entry: dict[str, object]) -> str:
    raw = str(entry.get("name") or entry.get("file") or "").strip()
    return normalize_problem_name(raw)


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
        return status in {
            "error",
            "failed",
            "fail",
            "assembly",
            "execution",
            "build_error",
            "runtime_error",
            "missing_test",
            "timeout",
            "execution_error",
            "linking",
            "compilation",
            "build",
            "runtime",
        }

    return False


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


def _candidate_asm_dir_names(target_isa: str) -> list[str]:
    canonical = normalize_isa(target_isa)
    ordered = {
        "x86": ["x86_asm"],
        "armv8-linux": ["armv8-linux_asm", "armv8_asm", "arm_linux_asm", "arm_asm"],
        "armv8.4a-apple": ["armv8.4a-apple_asm", "armv8.4a_asm", "arm_apple_asm", "mac-armv8_asm", "arm_asm"],
        "riscv": ["riscv_asm", "riscv64_asm"],
    }
    return ordered[canonical]


def _resolve_asm_input_dir(input_dir: Path, target_isa: str) -> Path:
    translated = input_dir / "translated_asm"
    if translated.exists() and translated.is_dir():
        return translated.resolve()

    for candidate in _candidate_asm_dir_names(target_isa):
        path = input_dir / candidate
        if path.exists() and path.is_dir():
            return path.resolve()

    asm_dirs = sorted(
        [path for path in input_dir.iterdir() if path.is_dir() and path.name.endswith("_asm")],
        key=lambda path: path.name,
    )
    if len(asm_dirs) == 1:
        return asm_dirs[0].resolve()

    raise FileNotFoundError(
        f"Could not locate translated asm directory under {input_dir}. "
        "Expected translated_asm/ or a target-specific *_asm directory."
    )


def _resolve_error_json_path(args, cfg: dict[str, object], input_experiment_dir: Path, run_output_dir: Path) -> tuple[Path, bool]:
    if getattr(args, "error_json", None) is not None:
        candidate = Path(args.error_json).resolve()
        if not candidate.exists():
            raise FileNotFoundError(f"Explicit error JSON does not exist: {candidate}")
        return candidate, False

    cfg_error_json = cfg.get("error_json")
    if cfg_error_json:
        candidate = Path(str(cfg_error_json))
        if not candidate.is_absolute():
            candidate = (Path(args.config).resolve().parent / candidate).resolve()
        if candidate.exists():
            return candidate, False

    json_dir = input_experiment_dir / "jsons"
    patterns = [
        "*_error_problems.json",
        "*errored*.json",
        "errors.json",
    ]
    for pattern in patterns:
        candidates = sorted(json_dir.glob(pattern), key=lambda path: path.stat().st_mtime) if json_dir.exists() else []
        if candidates:
            return candidates[-1].resolve(), False

    bootstrap_arg = getattr(args, "bootstrap_errors", None)
    if bootstrap_arg is None:
        bootstrap_enabled = bool(cfg.get("bootstrap_errors", True))
    else:
        bootstrap_enabled = bool(bootstrap_arg)

    if not bootstrap_enabled:
        raise FileNotFoundError(
            f"Could not locate an error JSON under {json_dir}. "
            "Enable bootstrap_errors or pass --error-json explicitly."
        )

    return (run_output_dir / "validation_json" / "bootstrap_error_problems.json").resolve(), True


def resolve_runtime_paths(args, cfg: dict[str, object]) -> ComposerRuntimePaths:
    input_path = Path(args.input_path).resolve()
    if not input_path.exists():
        raise FileNotFoundError(f"Input path does not exist: {input_path}")

    benchmark_id = normalize_benchmark_id(str(getattr(args, "benchmark", None) or cfg.get("benchmark", "humaneval")))

    benchmark_root_value = getattr(args, "benchmark_root", None) or cfg.get("benchmark_root")
    if benchmark_root_value:
        benchmark_root = _resolve_path_from_bases(
            benchmark_root_value,
            (
                *_candidate_repo_roots(),
                Path(args.config).resolve().parent,
            ),
        )
    elif benchmark_id == "humaneval" and cfg.get("test_root"):
        benchmark_root = _resolve_path_from_bases(
            str(cfg.get("test_root")),
            (
                *_candidate_repo_roots(),
                Path(args.config).resolve().parent,
            ),
        )
    else:
        benchmark_root = default_benchmark_root(benchmark_id).resolve()

    target_isa_value = (
        getattr(args, "target_isa", None)
        or cfg.get("target_isa")
        or cfg.get("target_arch")
        or cfg.get("source_language")
        or "armv8-linux"
    )
    target_isa = normalize_isa(str(target_isa_value))

    source_isa_value = (
        cfg.get("source_isa")
        or cfg.get("source_arch")
        or cfg.get("source_language")
        or cfg.get("source_dataset_column")
        or "x86"
    )
    try:
        source_isa = normalize_isa(str(source_isa_value))
    except RuntimeError:
        source_isa = target_isa

    cfg_language = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", isa_dataset_column(source_isa))))
    dfg_language = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", isa_dataset_column(source_isa))))
    graph_split = str(cfg.get("graph_split", cfg.get("opt_level", "O2")))

    prompt_config_dir = str(getattr(args, "prompt_config", "") or "base")
    run_label = args.run_label or (input_path.stem if input_path.is_file() else input_path.name)
    run_output_dir = (Path("results/composer").resolve() / run_label / prompt_config_dir)

    input_mode_override = getattr(args, "input_mode", None)
    input_mode = ""
    input_experiment_dir: Path
    asm_input_dir: Path
    error_json_path: Path
    error_json_will_be_bootstrapped = False

    if input_path.is_file() and input_path.suffix.lower() == ".json":
        input_mode = "evaluated_json"
        input_experiment_dir = input_path.parent
        asm_input_dir = run_output_dir / "json_input_asm"
        error_json_path = input_path
    elif input_path.is_dir():
        input_mode = "asm_dir"
        if any(input_path.glob("*.s")) and input_path.name.endswith("_asm"):
            asm_input_dir = input_path
            input_experiment_dir = input_path.parent
        elif any(input_path.glob("*.s")) and input_mode_override == "asm_dir":
            asm_input_dir = input_path
            input_experiment_dir = input_path.parent
        else:
            input_experiment_dir = input_path
            asm_input_dir = _resolve_asm_input_dir(input_experiment_dir, target_isa)

        error_json_path, error_json_will_be_bootstrapped = _resolve_error_json_path(
            args,
            cfg,
            input_experiment_dir,
            run_output_dir,
        )
    else:
        raise RuntimeError(f"Unsupported input path type: {input_path}")

    if input_mode_override and input_mode_override != "auto" and input_mode_override != input_mode:
        raise RuntimeError(f"Input path resolved to mode '{input_mode}', but --input-mode requested '{input_mode_override}'.")

    return ComposerRuntimePaths(
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        input_mode=input_mode,
        input_path=input_path,
        input_experiment_dir=input_experiment_dir,
        asm_input_dir=asm_input_dir,
        error_json_path=error_json_path,
        error_json_will_be_bootstrapped=error_json_will_be_bootstrapped,
        run_output_dir=run_output_dir,
        full_validation_input_dir=run_output_dir / "full_validation_input_asm",
        prompts_dir=run_output_dir / "prompts",
        raw_output_dir=run_output_dir / "raw_model_output",
        original_error_asm_dir=run_output_dir / f"original_error_{target_isa}_asm",
        fixed_asm_dir=run_output_dir / f"fixed_{target_isa}_asm",
        logs_dir=run_output_dir / "logs",
        reports_dir=run_output_dir / "txts",
        cleaned_output_dir=run_output_dir / "cleaned_model_output",
        clean_diagnostics_dir=run_output_dir / "clean_diagnostics",
        compile_probe_dir=run_output_dir / "compile_probe",
        validation_json_dir=run_output_dir / "validation_json",
        target_isa=target_isa,
        target_isa_display=isa_display_name(target_isa),
        source_isa=source_isa,
        source_isa_display=isa_display_name(source_isa),
        cfg_language=cfg_language,
        dfg_language=dfg_language,
        graph_split=graph_split,
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
