from __future__ import annotations

import json
import os
import platform
import shlex
import shutil
import signal
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any

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


def _log(message: str) -> None:
    print(f"[{time.strftime('%H:%M:%S')}] {message}")


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


def clean_model_output(text: str | None) -> str:
    if text is None:
        return ""
    cleaned = text
    for token in ("```asm", "```assembly", "```x86asm", "```"):
        cleaned = cleaned.replace(token, "")
    return cleaned.strip()


def ensure_dir(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    return path


def build_output_dirs(base_dir: Path) -> dict[str, Path]:
    names = [
        "prompts",
        "raw_model_output",
        "translated_asm",
        "eval_temp",
        "txts",
        "jsons",
        "logs",
    ]
    return {name: ensure_dir(base_dir / name) for name in names}


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
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    return path


def write_error_json(
    path: Path,
    *,
    benchmark_id: str,
    benchmark_root: Path,
    asm_input_dir: Path,
    results: list[EvalResult],
) -> Path:
    errored = [result for result in results if not result.succeeded]
    payload = {
        "run_started": datetime.now().isoformat(timespec="seconds"),
        "run_finished": datetime.now().isoformat(timespec="seconds"),
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
                "commands": [
                    {
                        "command": shlex.join(command_result.command),
                        "returncode": command_result.returncode,
                    }
                    for command_result in result.command_results
                ],
            }
            for result in errored
        ],
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    return path


def write_report(
    path: Path,
    *,
    benchmark_id: str,
    source_isa: str,
    target_isa: str,
    model_name: str,
    results: list[EvalResult],
    started_at: datetime,
) -> Path:
    finished_at = datetime.now()
    counts: dict[str, int] = {}
    for result in results:
        counts[result.status] = counts.get(result.status, 0) + 1
    total = len(results)
    succeeded = sum(1 for result in results if result.succeeded)
    lines = [
        f"Run started: {started_at.isoformat(timespec='seconds')}",
        f"Run finished: {finished_at.isoformat(timespec='seconds')}",
        f"Benchmark: {benchmark_display_name(benchmark_id)}",
        f"Source ISA: {isa_display_name(source_isa)}",
        f"Target ISA: {isa_display_name(target_isa)}",
        f"Model: {model_name}",
        f"Total problems: {total}",
        f"Succeeded: {succeeded}",
        f"Failed: {total - succeeded}",
        f"Success rate: {succeeded}/{total} ({(succeeded / total * 100.0) if total else 0.0:.1f}%)",
        "",
        "Status counts:",
    ]
    for status in sorted(counts):
        lines.append(f"- {status}: {counts[status]}")
    lines.extend(["", "Per Problem Details:"])
    for result in results:
        lines.extend(
            [
                "",
                f"Problem: {result.problem_name}",
                f"Status: {result.status}",
                f"Summary: {result.summary}",
            ]
        )
        for command_result in result.command_results:
            lines.append(f"CMD: {shlex.join(command_result.command)}")
            lines.append(f"Code: {command_result.returncode}")
            if command_result.stderr.strip():
                lines.append(f"Stderr: {command_result.stderr.strip()}")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return path


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


def eval_record_payload(problem_name: str, pred: str, result: EvalResult) -> dict[str, Any]:
    return {
        "file": problem_name,
        "pred": pred,
        "success": 1 if result.succeeded else 0,
        "runtime_seconds": round(result.runtime_seconds, 4),
        "run_output": result.summary if result.succeeded and not result.stdout else (result.stdout or result.summary),
        "error_stage": result.error_stage,
        "status": result.status,
        "stderr": extract_stderr(result),
    }


def run_command(command: str, *, cwd: Path, timeout: int) -> tuple[bool, str, float]:
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
        return False, f"Timeout expired ({timeout}s)", time.perf_counter() - start
    return proc.returncode == 0, stdout + stderr, time.perf_counter() - start


def _command_result(shell_command: str, output: str, success: bool) -> CommandResult:
    return CommandResult(command=["sh", "-lc", shell_command], returncode=0 if success else 1, stdout=output, stderr="" if success else output)


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
        success, output, runtime = run_command(shell_command, cwd=work_dir, timeout=timeout)
        total_runtime += runtime
        result.command_results.append(_command_result(shell_command, output, success))
        if not success:
            result.status = "build_error"
            result.summary = output
            result.error_stage = stage
            result.stderr = output
            result.runtime_seconds = total_runtime
            return result

    run_command_text = shlex.quote(str(exe_path))
    qemu = str(toolchain["qemu"]).strip()
    if toolchain["use_qemu"] and qemu:
        run_command_text = f"{qemu} {run_command_text}"

    success, output, runtime = run_command(run_command_text, cwd=work_dir, timeout=timeout)
    total_runtime += runtime
    result.command_results.append(_command_result(run_command_text, output, success))
    result.runtime_seconds = total_runtime
    result.stdout = output
    result.stderr = output if not success else ""
    result.succeeded = success
    result.status = "passed" if success else "runtime_error"
    result.summary = "PASS" if success else output
    result.error_stage = None if success else "execution"
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
    (task_work_dir / f"{task_name}.s").write_text(predicted_asm, encoding="utf-8")

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

    result = EvalResult(task_name, "pending", "", False, None, 0.0, output_dir=task_work_dir)
    timeout = int(toolchain["bringup_timeout_seconds"])
    total_runtime = 0.0
    for shell_command, stage in commands:
        success, output, runtime = run_command(shell_command, cwd=task_work_dir, timeout=timeout)
        total_runtime += runtime
        result.command_results.append(_command_result(shell_command, output, success))
        if not success:
            result.status = "build_error" if stage == "build" else "runtime_error"
            result.summary = output
            result.error_stage = stage
            result.stderr = output
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
) -> list[tuple[dict[str, str], EvalResult]]:
    canonical_benchmark = normalize_benchmark_id(benchmark_id)
    if canonical_benchmark == "bringup":
        num_workers = 1

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
            results.append(future.result())
    results.sort(key=lambda item: item[0]["task_name"])
    return results


def load_asm_records_from_dir(asm_dir: Path) -> list[dict[str, str]]:
    records: list[dict[str, str]] = []
    for asm_file in sorted(asm_dir.glob("*.s")):
        records.append({"task_name": asm_file.stem.split("_", 1)[0], "pred": asm_file.read_text(encoding="utf-8")})
    return records
