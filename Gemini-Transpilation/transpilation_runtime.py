from __future__ import annotations

import json
import os
import platform
import re
import shlex
import shutil
import signal
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import asdict, dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Callable

try:
    from datasets import load_dataset

    HAS_DATASETS = True
except ImportError:
    HAS_DATASETS = False

BENCHMARK_ALIASES = {
    "humaneval": "humaneval",
    "humaneval-c": "humaneval",
    "human_eval": "humaneval",
    "bringup": "bringup",
    "bringup-bench": "bringup",
    "bringupbench": "bringup",
    "mceval": "mceval",
    "mceval-c": "mceval",
}

BENCHMARK_DISPLAY_NAMES = {
    "humaneval": "HumanEval",
    "bringup": "BringUpBench",
    "mceval": "McEval",
}

BENCHMARK_DIRECTORY_NAMES = {
    "humaneval": "humaneval-c",
    "bringup": "bringup-bench",
    "mceval": "mceval-c",
}

DEFAULT_DATASET_IDS = {
    "humaneval": "murodbek/humaneval_asm",
    "bringup": "murodbek/bringup_asm",
    "mceval": "murodbek/mceval_asm",
}

ISA_ALIASES = {
    "x86": "x86",
    "x86_64": "x86",
    "x86-64": "x86",
    "amd64": "x86",
    "arm": "armv8-linux",
    "arm64": "armv8-linux",
    "armv8": "armv8-linux",
    "arm_linux": "armv8-linux",
    "arm-linux": "armv8-linux",
    "armv8-linux": "armv8-linux",
    "aarch64": "armv8-linux",
    "aarch64_linux": "armv8-linux",
    "aarch64-linux": "armv8-linux",
    "arm_apple": "armv8.4a-apple",
    "arm-apple": "armv8.4a-apple",
    "armv8.4a": "armv8.4a-apple",
    "armv8.4a-apple": "armv8.4a-apple",
    "armv8mac": "armv8.4a-apple",
    "mac-armv8": "armv8.4a-apple",
    "aarch64_apple": "armv8.4a-apple",
    "aarch64-apple": "armv8.4a-apple",
    "riscv": "riscv",
    "riscv64": "riscv",
}

ISA_DISPLAY_NAMES = {
    "x86": "x86-64",
    "armv8-linux": "ARMv8 Linux",
    "armv8.4a-apple": "ARMv8.4-A Apple",
    "riscv": "RISC-V RV64",
}

ISA_DATASET_COLUMNS = {
    "x86": "x86_64",
    "armv8-linux": "aarch64_linux",
    "armv8.4a-apple": "aarch64_apple",
    "riscv": "riscv64",
}

DEFAULT_TOOLCHAINS = {
    "x86": {
        "clang": "clang-17",
        "compile_flags": ["-target", "x86_64-unknown-linux-gnu", "-masm=intel"],
        "link_flags": ["-target", "x86_64-unknown-linux-gnu", "-masm=intel", "-lm"],
        "qemu": "",
        "use_qemu": False,
    },
    "armv8-linux": {
        "clang": "clang-17",
        "compile_flags": ["-target", "aarch64-linux-gnu"],
        "link_flags": ["-target", "aarch64-linux-gnu", "-static", "-fuse-ld=lld", "-lm"],
        "qemu": "qemu-aarch64 -R 4G -L /usr/aarch64-linux-gnu",
        "use_qemu": True,
    },
    "armv8.4a-apple": {
        "clang": "clang-17",
        "compile_flags": ["-target", "arm64-apple-darwin"],
        "link_flags": ["-target", "arm64-apple-darwin", "-lm"],
        "qemu": "",
        "use_qemu": False,
    },
    "riscv": {
        "clang": "clang-17",
        "compile_flags": ["-target", "riscv64-linux-gnu", "-march=rv64gc", "-mabi=lp64d"],
        "link_flags": [
            "-target",
            "riscv64-linux-gnu",
            "-march=rv64gc",
            "-mabi=lp64d",
            "-static",
            "--ld-path=riscv64-linux-gnu-ld",
            "-lm",
        ],
        "qemu": "qemu-riscv64 -R 4G -L /usr/riscv64-linux-gnu",
        "use_qemu": True,
    },
}


@dataclass
class CommandResult:
    command: list[str]
    returncode: int
    stdout: str
    stderr: str


@dataclass
class EvalResult:
    problem_name: str
    status: str
    summary: str
    succeeded: bool
    error_stage: str | None
    runtime_seconds: float
    asm_path: Path | None = None
    output_dir: Path | None = None
    command_results: list[CommandResult] = field(default_factory=list)
    stdout: str = ""
    stderr: str = ""


@dataclass
class ProviderUsageSummary:
    provider_name: str
    successful_requests: int = 0
    prompt_token_count: int = 0
    response_token_count: int = 0
    total_token_count: int = 0
    usage_metadata_requests: int = 0


def _log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {message}")


def _write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def _write_json(path: Path, payload: object) -> Path:
    _write_text(path, json.dumps(payload, indent=2) + "\n")
    return path


def command_result_to_dict(command_result: CommandResult) -> dict[str, object]:
    return {
        "command": shlex.join(command_result.command),
        "returncode": command_result.returncode,
        "stdout": command_result.stdout,
        "stderr": command_result.stderr,
    }


def provider_usage_summary_to_dict(summary: ProviderUsageSummary | None) -> dict[str, object] | None:
    return asdict(summary) if summary is not None else None


def provider_usage_summary_from_dict(payload: dict[str, object] | None) -> ProviderUsageSummary | None:
    if not payload:
        return None
    return ProviderUsageSummary(
        provider_name=str(payload.get("provider_name", "")),
        successful_requests=int(payload.get("successful_requests", 0)),
        prompt_token_count=int(payload.get("prompt_token_count", 0)),
        response_token_count=int(payload.get("response_token_count", 0)),
        total_token_count=int(payload.get("total_token_count", 0)),
        usage_metadata_requests=int(payload.get("usage_metadata_requests", 0)),
    )


def normalize_benchmark_id(value: str) -> str:
    normalized = BENCHMARK_ALIASES.get(value.strip().lower().replace("_", "-"))
    if normalized is None:
        raise RuntimeError("Unsupported benchmark. Expected humaneval, bringup, or mceval.")
    return normalized


def benchmark_display_name(value: str) -> str:
    return BENCHMARK_DISPLAY_NAMES[normalize_benchmark_id(value)]


def normalize_isa(value: str) -> str:
    normalized = ISA_ALIASES.get(value.strip().lower().replace("_", "-"))
    if normalized is None:
        raise RuntimeError("Unsupported ISA. Expected x86, armv8-linux, armv8.4a-apple, or riscv.")
    return normalized


def isa_display_name(value: str) -> str:
    return ISA_DISPLAY_NAMES[normalize_isa(value)]


def isa_dataset_column(value: str) -> str:
    return ISA_DATASET_COLUMNS[normalize_isa(value)]


def workspace_root() -> Path:
    return Path(__file__).resolve().parent


def benchmark_root_for(benchmark_id: str, override: str | Path | None = None) -> Path:
    if override:
        return Path(override).resolve()
    benchmark_name = BENCHMARK_DIRECTORY_NAMES[normalize_benchmark_id(benchmark_id)]
    candidates = (
        workspace_root() / "cpu-transpiler-inference" / "benchmarks" / benchmark_name,
        workspace_root().parent / "cpu-transpiler-inference" / "benchmarks" / benchmark_name,
    )
    for candidate in candidates:
        if candidate.exists():
            return candidate.resolve()
    return candidates[-1].resolve()


def default_dataset_id_for(benchmark_id: str) -> str:
    return DEFAULT_DATASET_IDS[normalize_benchmark_id(benchmark_id)]


def resolve_toolchain(cfg: dict[str, Any], target_isa: str) -> dict[str, Any]:
    canonical = normalize_isa(target_isa)
    defaults = DEFAULT_TOOLCHAINS[canonical]
    return {
        "clang": str(cfg.get("clang") or defaults["clang"]),
        "compile_flags": [str(item) for item in cfg.get("compile_flags", defaults["compile_flags"])],
        "link_flags": [str(item) for item in cfg.get("link_flags", defaults["link_flags"])],
        "qemu": str(cfg.get("qemu", defaults["qemu"])),
        "use_qemu": bool(cfg.get("use_qemu", defaults["use_qemu"])),
        "timeout_seconds": int(cfg.get("timeout_seconds", 30)),
        "bringup_timeout_seconds": int(cfg.get("bringup_timeout_seconds", 120)),
        "make_target": str(cfg.get("make_target", "host")),
        "opt_level": str(cfg.get("opt_level", "O2")),
    }


def detect_unsupported_target(target_isa: str) -> str | None:
    canonical = normalize_isa(target_isa)
    if canonical == "armv8.4a-apple" and platform.system() != "Darwin":
        return "Mach-O arm64 target requires a macOS host for execution"
    return None


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
    if re.match(r"^[a-z]{2,12}(\.[A-Za-z0-9_]+)?\b", stripped):
        return True
    return False


def clean_model_output(text: str | None) -> tuple[str, dict[str, object]]:
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
        "changed_from_raw": cleaned != raw.strip(),
    }
    return cleaned, diagnostics


def ensure_dir(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    return path


def build_output_dirs(base_dir: Path) -> dict[str, Path]:
    names = [
        "prompts",
        "raw_model_output",
        "cleaned_model_output",
        "clean_diagnostics",
        "translated_asm",
        "validation_json",
        "eval_temp",
        "txts",
        "jsons",
        "logs",
    ]
    return {name: ensure_dir(base_dir / name) for name in names}


def save_checkpoint(path: Path, payload: dict[str, object]) -> None:
    materialized = dict(payload)
    materialized["updated_at"] = datetime.now().isoformat(timespec="seconds")
    _write_json(path, materialized)


def load_checkpoint(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def resolve_concurrency_settings(
    *,
    cfg: dict[str, Any],
    benchmark_id: str,
    prompt_override: int | None = None,
    validation_override: int | None = None,
    max_workers_override: int | None = None,
) -> tuple[int, int]:
    cfg_has_prompt = cfg.get("prompt_concurrency") is not None
    cfg_has_validation = cfg.get("validation_concurrency") is not None

    fallback = max_workers_override if max_workers_override is not None else int(cfg.get("max_workers", 4))
    prompt_concurrency = int(
        prompt_override
        if prompt_override is not None
        else (cfg.get("prompt_concurrency") if cfg_has_prompt else fallback)
    )
    validation_seed = (
        validation_override
        if validation_override is not None
        else (cfg.get("validation_concurrency") if cfg_has_validation else prompt_concurrency)
    )
    validation_concurrency = int(validation_seed)
    prompt_concurrency = max(1, prompt_concurrency)
    validation_concurrency = max(1, validation_concurrency)

    if normalize_benchmark_id(benchmark_id) == "bringup":
        validation_concurrency = min(validation_concurrency, 16)

    validation_concurrency = min(validation_concurrency, prompt_concurrency)
    return prompt_concurrency, validation_concurrency


def load_hf_records(
    *,
    benchmark_id: str,
    source_isa: str,
    split: str,
    dataset_id: str | None = None,
    hf_token: str | None = None,
) -> list[dict[str, str]]:
    if not HAS_DATASETS:
        raise RuntimeError("datasets is not installed. Install with: pip install datasets")

    benchmark_id = normalize_benchmark_id(benchmark_id)
    dataset_id = dataset_id or default_dataset_id_for(benchmark_id)
    source_column = isa_dataset_column(source_isa)
    token = hf_token or ""

    ds = load_dataset(dataset_id, "default", split=split, token=token or None)
    records: list[dict[str, str]] = []
    for row in ds:
        task_name = str(row["task_name"])
        source_asm = str(row[source_column])
        records.append({"task_name": task_name, "source_asm": source_asm})
    return records


def write_eval_results_json(path: Path, payload: list[dict[str, Any]]) -> Path:
    return _write_json(path, payload)


def get_failing_command(result: EvalResult) -> str:
    for command_result in result.command_results:
        if command_result.returncode != 0:
            return shlex.join(command_result.command)
    return ""


def extract_stderr(result: EvalResult) -> str:
    chunks: list[str] = []
    if result.stderr.strip():
        chunks.append(result.stderr.strip())
    for command_result in result.command_results:
        if command_result.stderr.strip():
            chunks.append(command_result.stderr.strip())
    deduped: list[str] = []
    seen: set[str] = set()
    for chunk in chunks:
        if chunk not in seen:
            seen.add(chunk)
            deduped.append(chunk)
    return "\n\n".join(deduped)


def extract_stdout(result: EvalResult) -> str:
    chunks: list[str] = []
    if result.stdout.strip():
        chunks.append(result.stdout.strip())
    for command_result in result.command_results:
        if command_result.stdout.strip():
            chunks.append(command_result.stdout.strip())
    deduped: list[str] = []
    seen: set[str] = set()
    for chunk in chunks:
        if chunk not in seen:
            seen.add(chunk)
            deduped.append(chunk)
    return "\n\n".join(deduped)


def validation_payload(problem_name: str, pred: str, result: EvalResult) -> dict[str, Any]:
    return {
        "file": problem_name,
        "pred": pred,
        "success": 1 if result.succeeded else 0,
        "success_bool": result.succeeded,
        "runtime_seconds": round(result.runtime_seconds, 4),
        "run_output": result.summary if result.succeeded and not result.stdout else (result.stdout or result.summary),
        "error_stage": result.error_stage,
        "status": result.status,
        "summary": result.summary,
        "stdout": extract_stdout(result),
        "stderr": extract_stderr(result),
        "failing_command": get_failing_command(result),
        "asm_path": str(result.asm_path) if result.asm_path else "",
        "output_dir": str(result.output_dir) if result.output_dir else "",
        "commands": [command_result_to_dict(command_result) for command_result in result.command_results],
    }


def write_validation_json(path: Path, payload: dict[str, Any]) -> Path:
    return _write_json(path, payload)


def eval_record_payload(problem_name: str, pred: str, result: EvalResult) -> dict[str, Any]:
    return validation_payload(problem_name, pred, result)


def write_error_json(
    path: Path,
    *,
    benchmark_id: str,
    benchmark_root: Path,
    asm_input_dir: Path,
    results: list[EvalResult],
    started_at: datetime | None = None,
    finished_at: datetime | None = None,
    usage_summary: ProviderUsageSummary | None = None,
    run_status: str = "completed",
    counts: dict[str, int] | None = None,
) -> Path:
    errored = [result for result in results if not result.succeeded]
    payload: dict[str, object] = {
        "run_started": (started_at or datetime.now()).isoformat(timespec="seconds"),
        "run_finished": (finished_at or datetime.now()).isoformat(timespec="seconds"),
        "run_status": run_status,
        "asm_input_dir": str(asm_input_dir.resolve()),
        "benchmark_root": str(benchmark_root.resolve()),
        "benchmark": normalize_benchmark_id(benchmark_id),
        "problems_processed": len(results),
        "errored_count": len(errored),
        "errored_problems": [
            {
                "name": result.problem_name,
                "status": result.status,
                "summary": result.summary,
                "stderr": extract_stderr(result),
                "error_stage": result.error_stage,
                "failing_command": get_failing_command(result),
                "asm_path": str(result.asm_path) if result.asm_path else "",
                "commands": [command_result_to_dict(command_result) for command_result in result.command_results],
            }
            for result in errored
        ],
    }
    if counts:
        payload["counts"] = dict(counts)
    usage_payload = provider_usage_summary_to_dict(usage_summary)
    if usage_payload is not None:
        payload["provider_usage"] = usage_payload
    return _write_json(path, payload)


def write_run_summary_json(path: Path, payload: dict[str, object]) -> Path:
    return _write_json(path, payload)


def write_report(
    path: Path,
    *,
    benchmark_id: str,
    source_isa: str,
    target_isa: str,
    model_name: str,
    results: list[EvalResult],
    started_at: datetime,
    finished_at: datetime | None = None,
    run_status: str = "completed",
    counts: dict[str, int] | None = None,
    usage_summary: ProviderUsageSummary | None = None,
    prompt_concurrency: int | None = None,
    validation_concurrency: int | None = None,
) -> Path:
    finished = finished_at or datetime.now()
    status_counts: dict[str, int] = {}
    for result in results:
        status_counts[result.status] = status_counts.get(result.status, 0) + 1
    total = len(results)
    succeeded = sum(1 for result in results if result.succeeded)
    lines = [
        f"Run started: {started_at.isoformat(timespec='seconds')}",
        f"Run finished: {finished.isoformat(timespec='seconds')}",
        f"Run status: {run_status}",
        f"Benchmark: {benchmark_display_name(benchmark_id)}",
        f"Source ISA: {isa_display_name(source_isa)}",
        f"Target ISA: {isa_display_name(target_isa)}",
        f"Model: {model_name}",
        f"Total evaluated problems: {total}",
        f"Succeeded: {succeeded}",
        f"Failed: {total - succeeded}",
        f"Success rate: {succeeded}/{total} ({(succeeded / total * 100.0) if total else 0.0:.1f}%)",
    ]
    if prompt_concurrency is not None:
        lines.append(f"Prompt concurrency: {prompt_concurrency}")
    if validation_concurrency is not None:
        lines.append(f"Validation concurrency: {validation_concurrency}")
    if counts:
        lines.extend(["", "Run counters:"])
        for key in sorted(counts):
            lines.append(f"- {key}: {counts[key]}")
    usage_payload = provider_usage_summary_to_dict(usage_summary)
    if usage_payload:
        lines.extend(
            [
                "",
                "Provider usage:",
                f"- successful_requests: {usage_payload['successful_requests']}",
                f"- prompt_token_count: {usage_payload['prompt_token_count']}",
                f"- response_token_count: {usage_payload['response_token_count']}",
                f"- total_token_count: {usage_payload['total_token_count']}",
                f"- usage_metadata_requests: {usage_payload['usage_metadata_requests']}",
            ]
        )
    lines.extend(["", "Status counts:"])
    for status in sorted(status_counts):
        lines.append(f"- {status}: {status_counts[status]}")
    lines.extend(["", "Per Problem Details:"])
    for result in results:
        lines.extend(
            [
                "",
                f"Problem: {result.problem_name}",
                f"Status: {result.status}",
                f"Error stage: {result.error_stage or '(none)'}",
                f"Failing command: {get_failing_command(result) or '(none)'}",
                f"Summary: {result.summary}",
            ]
        )
        for command_result in result.command_results:
            lines.append(f"CMD: {shlex.join(command_result.command)}")
            lines.append(f"Code: {command_result.returncode}")
            if command_result.stdout.strip():
                lines.append(f"Stdout: {command_result.stdout.strip()}")
            if command_result.stderr.strip():
                lines.append(f"Stderr: {command_result.stderr.strip()}")
    _write_text(path, "\n".join(lines) + "\n")
    return path


def run_command(command: str, *, cwd: Path, timeout: int) -> tuple[CommandResult, float]:
    start = time.perf_counter()
    proc = subprocess.Popen(
        command,
        shell=True,
        cwd=str(cwd),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        preexec_fn=os.setsid if hasattr(os, "setsid") else None,
    )
    try:
        stdout, stderr = proc.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        if hasattr(os, "killpg") and hasattr(os, "getpgid"):
            os.killpg(os.getpgid(proc.pid), signal.SIGKILL)
        else:
            proc.kill()
        proc.wait()
        return CommandResult(["sh", "-lc", command], 124, "", f"Timeout expired ({timeout}s)"), time.perf_counter() - start
    return CommandResult(["sh", "-lc", command], proc.returncode, stdout, stderr), time.perf_counter() - start


def _prepare_standard_workspace(task_dir: Path, work_dir: Path) -> None:
    if work_dir.exists():
        shutil.rmtree(work_dir)
    work_dir.mkdir(parents=True, exist_ok=True)


def _evaluate_standard_task(
    *,
    benchmark_id: str,
    benchmark_root: Path,
    task_name: str,
    predicted_asm: str,
    toolchain: dict[str, Any],
    work_dir: Path,
) -> EvalResult:
    task_dir = benchmark_root / task_name
    if not task_dir.exists():
        return EvalResult(task_name, "missing_test", f"Task directory not found: {task_dir}", False, "setup", 0.0)

    test_file = task_dir / "test.c"
    if not test_file.exists():
        return EvalResult(task_name, "missing_test", f"Missing test harness at {test_file}", False, "setup", 0.0)

    _prepare_standard_workspace(task_dir, work_dir)
    pred_s = work_dir / "pred.s"
    pred_o = work_dir / "pred.o"
    test_o = work_dir / "test.o"
    exe_path = work_dir / "test_bin"
    pred_s.write_text(predicted_asm, encoding="utf-8")

    compile_flags = " ".join(shlex.quote(flag) for flag in toolchain["compile_flags"])
    link_flags = " ".join(shlex.quote(flag) for flag in toolchain["link_flags"])
    clang = shlex.quote(toolchain["clang"])
    timeout = int(toolchain["timeout_seconds"])

    commands = [
        (f"{clang} -{toolchain['opt_level']} -c {shlex.quote(pred_s.name)} -o {shlex.quote(pred_o.name)} {compile_flags}".strip(), "assembly"),
        (
            f"{clang} -{toolchain['opt_level']} -c {shlex.quote(str(test_file))} -o {shlex.quote(str(test_o))} {compile_flags}".strip(),
            "compilation",
        ),
        (
            f"{clang} -{toolchain['opt_level']} {shlex.quote(str(pred_o))} {shlex.quote(str(test_o))} -o {shlex.quote(str(exe_path))} {link_flags}".strip(),
            "linking",
        ),
    ]

    result = EvalResult(task_name, "pending", "", False, None, 0.0, asm_path=pred_s, output_dir=work_dir)
    total_runtime = 0.0
    for shell_command, stage in commands:
        command_result, runtime = run_command(shell_command, cwd=work_dir, timeout=timeout)
        total_runtime += runtime
        result.command_results.append(command_result)
        if command_result.returncode != 0:
            result.status = "build_error"
            result.summary = (command_result.stderr or command_result.stdout).strip() or f"{stage} failed"
            result.error_stage = stage
            result.stdout = command_result.stdout
            result.stderr = command_result.stderr or command_result.stdout
            result.runtime_seconds = total_runtime
            return result

    run_command_text = shlex.quote(str(exe_path))
    qemu = str(toolchain["qemu"]).strip()
    if toolchain["use_qemu"] and qemu:
        run_command_text = f"{qemu} {run_command_text}"

    command_result, runtime = run_command(run_command_text, cwd=work_dir, timeout=timeout)
    total_runtime += runtime
    result.command_results.append(command_result)
    result.runtime_seconds = total_runtime
    result.stdout = command_result.stdout
    result.stderr = command_result.stderr
    result.succeeded = command_result.returncode == 0
    result.status = "passed" if result.succeeded else "runtime_error"
    result.summary = "PASS" if result.succeeded else ((command_result.stderr or command_result.stdout).strip() or "runtime failed")
    result.error_stage = None if result.succeeded else "execution"
    return result


def _copytree(src: Path, dst: Path) -> None:
    if src.exists():
        shutil.copytree(src, dst, dirs_exist_ok=True)


def _evaluate_bringup_task(
    *,
    benchmark_root: Path,
    task_name: str,
    predicted_asm: str,
    toolchain: dict[str, Any],
    work_dir: Path,
) -> EvalResult:
    task_src_dir = benchmark_root / task_name
    if not task_src_dir.exists():
        return EvalResult(task_name, "missing_test", f"Task directory not found: {task_src_dir}", False, "setup", 0.0)

    if work_dir.exists():
        shutil.rmtree(work_dir)
    work_dir.mkdir(parents=True, exist_ok=True)
    for name in ("Makefile", "common", "target"):
        src = benchmark_root / name
        dst = work_dir / name
        if src.is_dir():
            _copytree(src, dst)
        elif src.exists():
            shutil.copy2(src, dst)
    _copytree(task_src_dir, work_dir / task_name)

    task_work_dir = work_dir / task_name
    asm_path = task_work_dir / f"{task_name}.s"
    asm_path.write_text(predicted_asm, encoding="utf-8")

    clang = shlex.quote(toolchain["clang"])
    compile_flags = [flag for flag in toolchain["compile_flags"] if not flag.startswith("-O")]
    compiler_cmd = " ".join([clang, *[shlex.quote(flag) for flag in compile_flags]]).strip()
    target_libs = " ".join(shlex.quote(flag) for flag in toolchain["link_flags"])
    qemu = str(toolchain["qemu"]).strip()
    cflags = f"-Wall -{toolchain['opt_level']} -Wno-strict-aliasing -DTARGET_HOST -I../common -I../target"
    assignments = [
        f"TARGET={toolchain['make_target']}",
        f'TARGET_CC="{compiler_cmd}"',
        f'CC="{compiler_cmd}"',
        f'TARGET_SIM="{qemu}"',
        f'TARGET_LIBS="{target_libs}"',
        f'CFLAGS="{cflags}"',
    ]
    commands = [
        (" ".join(["make", *assignments, "clean"]), "clean"),
        (" ".join(["make", "-B", *assignments, "build"]), "build"),
        (" ".join(["make", *assignments, "test"]), "runtime"),
    ]

    result = EvalResult(task_name, "pending", "", False, None, 0.0, asm_path=asm_path, output_dir=task_work_dir)
    timeout = int(toolchain["bringup_timeout_seconds"])
    total_runtime = 0.0
    for shell_command, stage in commands:
        command_result, runtime = run_command(shell_command, cwd=task_work_dir, timeout=timeout)
        total_runtime += runtime
        result.command_results.append(command_result)
        if command_result.returncode != 0:
            result.status = "build_error" if stage == "build" else "runtime_error"
            result.summary = (command_result.stderr or command_result.stdout).strip() or f"{stage} failed"
            result.error_stage = stage
            result.stdout = command_result.stdout
            result.stderr = command_result.stderr or command_result.stdout
            result.runtime_seconds = total_runtime
            return result

    result.runtime_seconds = total_runtime
    result.succeeded = True
    result.status = "passed"
    result.summary = "PASS"
    result.error_stage = None
    return result


def evaluate_prediction(
    *,
    benchmark_id: str,
    benchmark_root: Path,
    task_name: str,
    predicted_asm: str,
    cfg: dict[str, Any],
    target_isa: str,
    work_root: Path,
) -> EvalResult:
    toolchain = resolve_toolchain(cfg, target_isa)
    canonical_benchmark = normalize_benchmark_id(benchmark_id)
    if canonical_benchmark == "bringup":
        return _evaluate_bringup_task(
            benchmark_root=benchmark_root,
            task_name=task_name,
            predicted_asm=predicted_asm,
            toolchain=toolchain,
            work_dir=work_root / task_name,
        )
    return _evaluate_standard_task(
        benchmark_id=canonical_benchmark,
        benchmark_root=benchmark_root,
        task_name=task_name,
        predicted_asm=predicted_asm,
        toolchain=toolchain,
        work_dir=work_root / task_name,
    )


def evaluate_records(
    *,
    benchmark_id: str,
    benchmark_root: Path,
    records: list[dict[str, str]],
    cfg: dict[str, Any],
    target_isa: str,
    work_root: Path,
    num_workers: int,
    on_result: Callable[[dict[str, str], EvalResult], None] | None = None,
) -> list[tuple[dict[str, str], EvalResult]]:
    canonical_benchmark = normalize_benchmark_id(benchmark_id)
    if canonical_benchmark == "bringup":
        num_workers = min(max(1, num_workers), 16)

    def _one(record: dict[str, str]) -> tuple[dict[str, str], EvalResult]:
        task_name = str(record["task_name"])
        pred = str(record["pred"])
        result = evaluate_prediction(
            benchmark_id=canonical_benchmark,
            benchmark_root=benchmark_root,
            task_name=task_name,
            predicted_asm=pred,
            cfg=cfg,
            target_isa=target_isa,
            work_root=work_root,
        )
        return record, result

    results: list[tuple[dict[str, str], EvalResult]] = []
    with ThreadPoolExecutor(max_workers=max(1, num_workers)) as executor:
        futures = [executor.submit(_one, record) for record in records]
        for future in as_completed(futures):
            record, result = future.result()
            results.append((record, result))
            if on_result is not None:
                on_result(record, result)
    results.sort(key=lambda item: item[0]["task_name"])
    return results


def load_asm_records_from_dir(asm_dir: Path) -> list[dict[str, str]]:
    records: list[dict[str, str]] = []
    for asm_file in sorted(asm_dir.glob("*.s")):
        records.append({"task_name": asm_file.stem.split("_", 1)[0], "pred": asm_file.read_text(encoding="utf-8")})
    return records
