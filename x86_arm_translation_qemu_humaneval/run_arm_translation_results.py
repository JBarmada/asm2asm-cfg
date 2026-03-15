from __future__ import annotations

import argparse
import shlex
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
import re


SCRIPT_DIR = Path(__file__).resolve().parent
WORKSPACE_ROOT = SCRIPT_DIR.parent
DEFAULT_TEST_ROOT = WORKSPACE_ROOT / "HumanEval_source"
PROBLEM_PATTERN = re.compile(r"^(problem\d+)(?:_.+)?\.s$")


@dataclass
class CommandResult:
    """Stores the outcome of one subprocess invocation."""

    command: list[str]
    returncode: int
    stdout: str
    stderr: str


@dataclass
class ProblemRunResult:
    """Captures the full build-and-run result for one translated problem."""

    asm_file: Path
    problem_name: str
    status: str
    summary: str
    output_dir: Path
    test_file: Path | None = None
    executable_path: Path | None = None
    command_results: list[CommandResult] = field(default_factory=list)
    stdout: str = ""
    stderr: str = ""


def parse_args() -> argparse.Namespace:
    """Parse command-line arguments for the batch runner."""

    parser = argparse.ArgumentParser(
        description=(
            "Compile translated ARM assembly with HumanEval test harnesses, "
            "link static executables, run them with QEMU, and write reports."
        )
    )
    parser.add_argument(
        "arm_dir",
        type=Path,
        help="Directory containing translated ARM .s files, such as results/exp01/arm_asm",
    )
    parser.add_argument(
        "--problems",
        nargs="+",
        help="Optional problem filters, for example: problem1 7 problem42",
    )
    parser.add_argument(
        "--test-root",
        type=Path,
        default=DEFAULT_TEST_ROOT,
        help="Root directory containing HumanEval problem folders",
    )
    parser.add_argument(
        "--clang",
        default="clang-17",
        help="Clang executable to use for cross-compiling to AArch64",
    )
    parser.add_argument(
        "--qemu",
        default="qemu-aarch64",
        help="QEMU executable to use for running AArch64 binaries",
    )
    parser.add_argument(
        "--sysroot",
        type=Path,
        help="Optional sysroot path to pass to clang when cross-compiling",
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=30,
        help="Timeout in seconds for each compiler and QEMU invocation",
    )
    parser.add_argument(
        "--no-link-math",
        action="store_true",
        help="Do not add -lm to the linker command",
    )
    return parser.parse_args()


def normalize_filters(filters: list[str] | None) -> set[str]:
    """Normalize problem filters into canonical names like problem100."""

    if not filters:
        return set()

    normalized = set()
    for item in filters:
        value = item.strip()
        if not value:
            continue
        if value.startswith("problem"):
            normalized.add(value)
        elif value.isdigit():
            normalized.add(f"problem{value}")
        else:
            normalized.add(value)
    return normalized


def resolve_executable(command: str) -> str | None:
    """Resolve a command name or path to an executable if it exists."""

    command_path = Path(command)
    if command_path.is_absolute() or command_path.parent != Path():
        return str(command_path) if command_path.exists() else None
    return shutil.which(command)


def build_clang_base_args(args: argparse.Namespace) -> list[str]:
    """Build the shared clang argument prefix, including an optional sysroot."""

    clang_args = [args.clang]
    if args.sysroot:
        clang_args.extend([f"--sysroot={args.sysroot}"])
    return clang_args


def infer_problem_name(asm_file: Path) -> str | None:
    """Extract the HumanEval problem name from a translated assembly filename."""

    match = PROBLEM_PATTERN.match(asm_file.name)
    if match is None:
        return None
    return match.group(1)


def run_command(command: list[str], timeout: int, cwd: Path) -> CommandResult:
    """Run one subprocess command and return captured stdout, stderr, and exit code."""

    completed = subprocess.run(
        command,
        cwd=cwd,
        capture_output=True,
        text=True,
        timeout=timeout,
        check=False,
    )
    return CommandResult(
        command=command,
        returncode=completed.returncode,
        stdout=completed.stdout,
        stderr=completed.stderr,
    )


def tool_failure_result(problem_name: str, asm_file: Path, output_dir: Path, message: str) -> ProblemRunResult:
    """Create a synthetic per-problem result when preflight setup fails."""

    return ProblemRunResult(
        asm_file=asm_file,
        problem_name=problem_name,
        status="setup_error",
        summary=message,
        output_dir=output_dir,
    )


def process_problem(
    asm_file: Path,
    args: argparse.Namespace,
    clang_base_args: list[str],
    qemu_executable: str,
    problem_output_root: Path,
) -> ProblemRunResult:
    """Compile, link, and execute one translated ARM assembly file against its test harness."""

    problem_name = infer_problem_name(asm_file)
    fallback_problem_name = asm_file.stem

    if problem_name is None:
        output_dir = problem_output_root / fallback_problem_name
        output_dir.mkdir(parents=True, exist_ok=True)
        return ProblemRunResult(
            asm_file=asm_file,
            problem_name=fallback_problem_name,
            status="invalid_name",
            summary="Filename does not match the expected pattern problemN_*.s",
            output_dir=output_dir,
        )

    output_dir = problem_output_root / problem_name
    output_dir.mkdir(parents=True, exist_ok=True)
    test_file = args.test_root / problem_name / "test.c"

    if not test_file.exists():
        return ProblemRunResult(
            asm_file=asm_file,
            problem_name=problem_name,
            status="missing_test",
            summary=f"Missing test harness at {test_file}",
            output_dir=output_dir,
            test_file=test_file,
        )

    asm_object = output_dir / f"{asm_file.stem}.o"
    test_object = output_dir / "test.o"
    executable_path = output_dir / f"{problem_name}_arm_exe"

    result = ProblemRunResult(
        asm_file=asm_file,
        problem_name=problem_name,
        status="pending",
        summary="",
        output_dir=output_dir,
        test_file=test_file,
        executable_path=executable_path,
    )

    link_command = clang_base_args + [
        str(asm_object),
        str(test_object),
        "-o",
        str(executable_path),
        "-target",
        "aarch64-linux-gnu",
        "-static",
        "-fuse-ld=lld",
    ]
    if not args.no_link_math:
        link_command.append("-lm")

    build_commands = [
        clang_base_args + ["-c", str(asm_file), "-o", str(asm_object), "-target", "aarch64-linux-gnu"],
        clang_base_args + ["-c", str(test_file), "-o", str(test_object), "-target", "aarch64-linux-gnu", "-O2"],
        link_command,
    ]

    try:
        for command in build_commands:
            command_result = run_command(command, timeout=args.timeout, cwd=output_dir)
            result.command_results.append(command_result)
            if command_result.returncode != 0:
                result.status = "build_error"
                result.summary = "Compilation or static link failed"
                return result

        command_result = run_command([qemu_executable, str(executable_path)], timeout=args.timeout, cwd=output_dir)
        result.command_results.append(command_result)
        result.stdout = command_result.stdout
        result.stderr = command_result.stderr

        if command_result.returncode == 0:
            result.status = "passed"
            result.summary = "Program exited successfully under QEMU"
        else:
            result.status = "runtime_error"
            result.summary = f"Program exited with code {command_result.returncode} under QEMU"
        return result
    except subprocess.TimeoutExpired as exc:
        timed_out_command = exc.cmd if isinstance(exc.cmd, list) else [str(exc.cmd)]
        result.command_results.append(
            CommandResult(
                command=timed_out_command,
                returncode=-1,
                stdout=exc.stdout or "",
                stderr=exc.stderr or "",
            )
        )
        result.status = "timeout"
        result.summary = f"Command timed out after {args.timeout} seconds"
        result.stdout = exc.stdout or ""
        result.stderr = exc.stderr or ""
        return result
    except OSError as exc:
        result.status = "execution_error"
        result.summary = str(exc)
        return result


def build_summary_lines(results: list[ProblemRunResult]) -> list[str]:
    """Summarize the number of results in each final status bucket."""

    counts: dict[str, int] = {}
    for result in results:
        counts[result.status] = counts.get(result.status, 0) + 1

    lines = ["Status counts:"]
    for status in sorted(counts):
        lines.append(f"- {status}: {counts[status]}")
    if not results:
        lines.append("- no problems were processed")
    return lines


def command_to_text(command: list[str]) -> str:
    """Render a subprocess command as a shell-friendly string for reports."""

    return shlex.join(command)


def write_reports(
    report_dir: Path,
    arm_dir: Path,
    test_root: Path,
    selected_problems: set[str],
    results: list[ProblemRunResult],
    started_at: datetime,
) -> tuple[Path, Path]:
    """Write timestamped brief and verbose text reports for the current run."""

    report_dir.mkdir(parents=True, exist_ok=True)
    finished_at = datetime.now()
    timestamp = finished_at.strftime("%Y%m%d_%H%M%S")
    brief_path = report_dir / f"{timestamp}_brief.txt"
    verbose_path = report_dir / f"{timestamp}_verbose.txt"

    summary_lines = [
        f"Run started: {started_at.isoformat(timespec='seconds')}",
        f"Run finished: {finished_at.isoformat(timespec='seconds')}",
        f"ARM input directory: {arm_dir}",
        f"Test root: {test_root}",
        f"Problem filter: {', '.join(sorted(selected_problems)) if selected_problems else 'all problems'}",
        f"Problems processed: {len(results)}",
    ]
    summary_lines.extend(build_summary_lines(results))

    failing_results = [result for result in results if result.status != "passed"]
    if failing_results:
        summary_lines.append("Failures:")
        for result in failing_results:
            summary_lines.append(f"- {result.problem_name}: {result.status} ({result.summary})")

    brief_path.write_text("\n".join(summary_lines) + "\n", encoding="utf-8")

    verbose_lines = list(summary_lines)
    verbose_lines.append("")
    verbose_lines.append("Per-problem details:")
    for result in results:
        verbose_lines.append("")
        verbose_lines.append(f"Problem: {result.problem_name}")
        verbose_lines.append(f"Assembly file: {result.asm_file}")
        verbose_lines.append(f"Status: {result.status}")
        verbose_lines.append(f"Summary: {result.summary}")
        verbose_lines.append(f"Output directory: {result.output_dir}")
        if result.test_file is not None:
            verbose_lines.append(f"Test file: {result.test_file}")
        if result.executable_path is not None:
            verbose_lines.append(f"Executable: {result.executable_path}")
        if result.command_results:
            verbose_lines.append("Commands:")
            for command_result in result.command_results:
                verbose_lines.append(f"  $ {command_to_text(command_result.command)}")
                verbose_lines.append(f"    return code: {command_result.returncode}")
                if command_result.stdout.strip():
                    verbose_lines.append("    stdout:")
                    for line in command_result.stdout.rstrip().splitlines():
                        verbose_lines.append(f"      {line}")
                if command_result.stderr.strip():
                    verbose_lines.append("    stderr:")
                    for line in command_result.stderr.rstrip().splitlines():
                        verbose_lines.append(f"      {line}")
        else:
            verbose_lines.append("Commands: none")
        if result.stdout.strip():
            verbose_lines.append("Program stdout:")
            for line in result.stdout.rstrip().splitlines():
                verbose_lines.append(f"  {line}")
        if result.stderr.strip():
            verbose_lines.append("Program stderr:")
            for line in result.stderr.rstrip().splitlines():
                verbose_lines.append(f"  {line}")

    verbose_path.write_text("\n".join(verbose_lines) + "\n", encoding="utf-8")
    return brief_path, verbose_path


def main() -> int:
    """Coordinate argument parsing, preflight checks, per-problem execution, and reporting."""

    args = parse_args()
    arm_dir = args.arm_dir.resolve()
    test_root = args.test_root.resolve()
    selected_problems = normalize_filters(args.problems)

    if not arm_dir.exists() or not arm_dir.is_dir():
        print(f"ARM input directory does not exist: {arm_dir}", file=sys.stderr)
        return 2

    experiment_root = arm_dir.parent
    problem_output_root = experiment_root / "HEproblems"
    report_dir = experiment_root / "txts"
    problem_output_root.mkdir(parents=True, exist_ok=True)
    report_dir.mkdir(parents=True, exist_ok=True)

    started_at = datetime.now()
    start_time = time.monotonic()
    asm_files = sorted(arm_dir.glob("*.s"))
    if selected_problems:
        asm_files = [
            asm_file
            for asm_file in asm_files
            if infer_problem_name(asm_file) in selected_problems or asm_file.stem in selected_problems
        ]

    if not asm_files:
        empty_result: list[ProblemRunResult] = []
        brief_path, verbose_path = write_reports(
            report_dir=report_dir,
            arm_dir=arm_dir,
            test_root=test_root,
            selected_problems=selected_problems,
            results=empty_result,
            started_at=started_at,
        )
        print(f"No assembly files matched. Brief report: {brief_path}")
        print(f"Verbose report: {verbose_path}")
        return 1

    preflight_errors = []
    if not test_root.exists() or not test_root.is_dir():
        preflight_errors.append(f"Test root does not exist: {test_root}")
    if resolve_executable(args.clang) is None:
        preflight_errors.append(f"Clang executable not found: {args.clang}")
    qemu_executable = resolve_executable(args.qemu)
    if qemu_executable is None:
        preflight_errors.append(f"QEMU executable not found: {args.qemu}")

    results: list[ProblemRunResult] = []
    if preflight_errors:
        for asm_file in asm_files:
            problem_name = infer_problem_name(asm_file) or asm_file.stem
            output_dir = problem_output_root / problem_name
            output_dir.mkdir(parents=True, exist_ok=True)
            results.append(
                tool_failure_result(
                    problem_name=problem_name,
                    asm_file=asm_file,
                    output_dir=output_dir,
                    message="; ".join(preflight_errors),
                )
            )
        brief_path, verbose_path = write_reports(
            report_dir=report_dir,
            arm_dir=arm_dir,
            test_root=test_root,
            selected_problems=selected_problems,
            results=results,
            started_at=started_at,
        )
        print(f"Preflight failed. Brief report: {brief_path}")
        print(f"Verbose report: {verbose_path}")
        return 2

    clang_base_args = build_clang_base_args(args)
    total_files = len(asm_files)
    for index, asm_file in enumerate(asm_files, start=1):
        problem_name = infer_problem_name(asm_file) or asm_file.stem
        elapsed = time.monotonic() - start_time
        print(f"[{index}/{total_files}] {problem_name} | elapsed: {elapsed:.1f}s")
        result = process_problem(
            asm_file=asm_file,
            args=args,
            clang_base_args=clang_base_args,
            qemu_executable=qemu_executable,
            problem_output_root=problem_output_root,
        )
        results.append(result)
        print(f"[{result.status}] {result.problem_name}: {result.summary}")

    brief_path, verbose_path = write_reports(
        report_dir=report_dir,
        arm_dir=arm_dir,
        test_root=test_root,
        selected_problems=selected_problems,
        results=results,
        started_at=started_at,
    )

    print(f"Brief report: {brief_path}")
    print(f"Verbose report: {verbose_path}")

    return 0 if all(result.status == "passed" for result in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())