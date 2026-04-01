import argparse
import json
import shlex
import subprocess
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import List


@dataclass
class CommandResult:
    command: List[str]
    returncode: int
    stdout: str
    stderr: str


@dataclass
class EvalResult:
    problem_name: str
    status: str
    summary: str
    succeeded: bool
    command_results: List[CommandResult] = field(default_factory=list)


def run_command(cmd: List[str], cwd: Path, timeout: int) -> CommandResult:
    proc = subprocess.run(
        cmd,
        cwd=cwd,
        capture_output=True,
        text=True,
        timeout=timeout,
        check=False,
    )
    return CommandResult(
        command=cmd,
        returncode=proc.returncode,
        stdout=proc.stdout,
        stderr=proc.stderr,
    )


def evaluate_problem(asm_file: Path, test_root: Path, output_root: Path, cfg: dict) -> EvalResult:
    problem_name = asm_file.stem
    out_dir = output_root / problem_name
    out_dir.mkdir(parents=True, exist_ok=True)

    test_file = test_root / problem_name / "test.c"
    if not test_file.exists():
        return EvalResult(
            problem_name=problem_name,
            status="build_error",
            summary=f"Missing test harness at {test_file}",
            succeeded=False,
        )

    clang_exe = cfg.get("clang", "clang-17")
    compile_flags = cfg.get("compile_flags", [])
    link_flags = cfg.get("link_flags", [])
    timeout = int(cfg.get("timeout_seconds", 30))

    asm_obj = out_dir / f"{problem_name}.o"
    test_obj = out_dir / "test.o"
    exe_path = out_dir / f"{problem_name}_exe"

    cmds = [
        [clang_exe, "-c", str(asm_file), "-o", str(asm_obj)] + compile_flags,
        [clang_exe, "-c", str(test_file), "-o", str(test_obj), "-O2"] + compile_flags,
        [clang_exe, str(asm_obj), str(test_obj), "-o", str(exe_path)] + link_flags,
    ]

    command_results: List[CommandResult] = []
    try:
        for cmd in cmds:
            result = run_command(cmd, out_dir, timeout)
            command_results.append(result)
            if result.returncode != 0:
                return EvalResult(
                    problem_name=problem_name,
                    status="build_error",
                    summary="Compilation/Link failed",
                    succeeded=False,
                    command_results=command_results,
                )
        return EvalResult(
            problem_name=problem_name,
            status="passed",
            summary="Compilation/Link succeeded",
            succeeded=True,
            command_results=command_results,
        )
    except subprocess.TimeoutExpired:
        return EvalResult(
            problem_name=problem_name,
            status="timeout",
            summary=f"Command timed out after {timeout} seconds",
            succeeded=False,
            command_results=command_results,
        )
    except Exception as exc:
        return EvalResult(
            problem_name=problem_name,
            status="execution_error",
            summary=str(exc),
            succeeded=False,
            command_results=command_results,
        )


def sort_key_problem(name: str) -> int:
    if name.startswith("problem"):
        suffix = name.replace("problem", "", 1)
        if suffix.isdigit():
            return int(suffix)
    return 10**9


def write_report(results: List[EvalResult], asm_dir: Path, cfg: dict, start: datetime, end: datetime) -> Path:
    experiment_dir = asm_dir.parent.resolve()
    report_dir = experiment_dir / "txts"
    report_dir.mkdir(parents=True, exist_ok=True)
    report_path = report_dir / f"{end.strftime('%Y%m%d_%H%M%S')}_report.txt"

    total = len(results)
    succeeded = sum(1 for r in results if r.succeeded)
    failed = total - succeeded
    success_rate = (succeeded / total * 100.0) if total > 0 else 0.0

    counts = {}
    for r in results:
        counts[r.status] = counts.get(r.status, 0) + 1

    lines: List[str] = [
        f"Run started: {start.strftime('%Y-%m-%dT%H:%M:%S')}",
        f"Run finished: {end.strftime('%Y-%m-%dT%H:%M:%S')}",
        f"Input experiment dir: {experiment_dir}",
        f"Run label: {experiment_dir.name}",
        f"Model: {cfg.get('model_name', 'unknown')}",
        "Translator: Single-pass (no CFG/DFG iterative refinement)",
        f"Total problems: {total}",
        f"Succeeded: {succeeded}",
        f"Failed: {failed}",
        f"Success rate: {succeeded}/{total} ({success_rate:.1f}%)",
        "",
        "Status counts:",
    ]

    for status in sorted(counts):
        lines.append(f"- {status}: {counts[status]}")

    lines.extend([
        "",
        "========================================",
        "--- Per Problem Details ---",
        "========================================",
    ])

    for result in sorted(results, key=lambda r: sort_key_problem(r.problem_name)):
        lines.extend([
            "",
            f"Problem: {result.problem_name}",
            f"Status: {result.status}",
            f"Summary: {result.summary}",
        ])

        for cmd_result in result.command_results:
            lines.append(f"CMD: {shlex.join(cmd_result.command)}")
            lines.append(f"Code: {cmd_result.returncode}")
            if cmd_result.stderr.strip():
                lines.append(f"Stderr: {cmd_result.stderr.strip()}")

    report_path.write_text("\n".join(lines), encoding="utf-8")
    return report_path


def main() -> None:
    parser = argparse.ArgumentParser(description="Compile+link translated assembly and write a report.")
    parser.add_argument("--config", type=Path, required=True, help="Path to config JSON.")
    parser.add_argument("--asm-dir", type=Path, required=True, help="Path to translated_asm directory.")
    args = parser.parse_args()

    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    asm_dir = args.asm_dir.resolve()
    test_root = Path(cfg.get("test_root", "../HumanEval_source")).resolve()
    output_root = (asm_dir.parent / "HEproblems").resolve()

    if not asm_dir.exists() or not asm_dir.is_dir():
        raise FileNotFoundError(f"Assembly directory not found: {asm_dir}")
    if not test_root.exists() or not test_root.is_dir():
        raise FileNotFoundError(f"Test root not found: {test_root}")

    asm_files = sorted(asm_dir.glob("*.s"), key=lambda p: sort_key_problem(p.stem))
    start = datetime.now()
    results: List[EvalResult] = []

    print(f"Compile+link evaluation started for {len(asm_files)} files")
    for idx, asm_file in enumerate(asm_files, start=1):
        res = evaluate_problem(asm_file, test_root, output_root, cfg)
        results.append(res)
        print(f"[{idx}/{len(asm_files)}] {res.problem_name}: {res.status}")

    end = datetime.now()
    report_path = write_report(results, asm_dir, cfg, start, end)
    print(f"Report written: {report_path}")


if __name__ == "__main__":
    main()
