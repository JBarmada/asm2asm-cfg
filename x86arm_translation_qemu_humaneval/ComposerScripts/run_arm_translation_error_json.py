"""
Runs the same compile/link/QEMU flow as the existing runner, 
but writes JSON containing only errored problems.

What it outputs for each errored problem:

name
status
summary
commands (list of { command, returncode })
stderr (aggregated stderr, if available)
It also includes run metadata and an errored_problems list so composer can iterate one-at-a-time cleanly.

Default output location:

<experiment_root>/jsons/<timestamp>_error_problems.json
Example call:

python run_arm_translation_error_json.py ASMwork/x86arm_translation_qemu_humaneval/results/exp01.2/arm_asm

Useful flags:

--output <path> to control JSON path
--problems 122 123 to limit run scope
--print-json to also print payload to stdout
--strict-exit to return nonzero when any errors exist
"""


from __future__ import annotations

import argparse
import json
import shlex
import sys
import time
from datetime import datetime
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_DIR = SCRIPT_DIR.parent
if str(PROJECT_DIR) not in sys.path:
    sys.path.insert(0, str(PROJECT_DIR))

from run_arm_translation_results import (  # noqa: E402
    ProblemRunResult,
    build_clang_base_args,
    infer_problem_name,
    normalize_filters,
    process_problem,
    resolve_executable,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run translated ARM assembly tests and emit JSON for only errored problems "
            "(intended for composer workflows)."
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
        default=PROJECT_DIR / "HumanEval_source",
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
    parser.add_argument(
        "--output",
        type=Path,
        help=(
            "Optional output file path. Default: <experiment_root>/jsons/"
            "<timestamp>_error_problems.json"
        ),
    )
    parser.add_argument(
        "--print-json",
        action="store_true",
        help="Also print the final JSON payload to stdout",
    )
    parser.add_argument(
        "--strict-exit",
        action="store_true",
        help="Return exit code 1 when errored problems are found",
    )
    return parser.parse_args()


def command_to_text(command: list[str]) -> str:
    return shlex.join(command)


def extract_stderr(result: ProblemRunResult) -> str:
    stderr_chunks: list[str] = []
    if result.stderr.strip():
        stderr_chunks.append(result.stderr.strip())
    for command_result in result.command_results:
        if command_result.stderr and command_result.stderr.strip():
            stderr_chunks.append(command_result.stderr.strip())

    deduped: list[str] = []
    seen: set[str] = set()
    for chunk in stderr_chunks:
        if chunk not in seen:
            seen.add(chunk)
            deduped.append(chunk)
    return "\n\n".join(deduped)


def to_error_entry(result: ProblemRunResult) -> dict[str, object]:
    return {
        "name": result.problem_name,
        "status": result.status,
        "summary": result.summary,
        "commands": [
            {
                "command": command_to_text(command_result.command),
                "returncode": command_result.returncode,
            }
            for command_result in result.command_results
        ],
        "stderr": extract_stderr(result),
    }


def build_payload(
    arm_dir: Path,
    test_root: Path,
    selected_problems: set[str],
    results: list[ProblemRunResult],
    started_at: datetime,
) -> dict[str, object]:
    finished_at = datetime.now()
    errored = [result for result in results if result.status != "passed"]
    return {
        "run_started": started_at.isoformat(timespec="seconds"),
        "run_finished": finished_at.isoformat(timespec="seconds"),
        "arm_input_dir": str(arm_dir),
        "test_root": str(test_root),
        "problem_filter": sorted(selected_problems) if selected_problems else "all problems",
        "problems_processed": len(results),
        "errored_count": len(errored),
        "errored_problems": [to_error_entry(result) for result in errored],
    }


def main() -> int:
    args = parse_args()
    arm_dir = args.arm_dir.resolve()
    test_root = args.test_root.resolve()
    selected_problems = normalize_filters(args.problems)

    if not arm_dir.exists() or not arm_dir.is_dir():
        print(f"ARM input directory does not exist: {arm_dir}", file=sys.stderr)
        return 2

    experiment_root = arm_dir.parent
    problem_output_root = experiment_root / "HEproblems"
    json_dir = experiment_root / "jsons"
    problem_output_root.mkdir(parents=True, exist_ok=True)
    json_dir.mkdir(parents=True, exist_ok=True)

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
        payload = build_payload(
            arm_dir=arm_dir,
            test_root=test_root,
            selected_problems=selected_problems,
            results=[],
            started_at=started_at,
        )
        output_path = args.output or (json_dir / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_error_problems.json")
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
        print(f"No assembly files matched. JSON report: {output_path}")
        if args.print_json:
            print(json.dumps(payload, indent=2))
        return 1

    preflight_errors: list[str] = []
    if not test_root.exists() or not test_root.is_dir():
        preflight_errors.append(f"Test root does not exist: {test_root}")
    if resolve_executable(args.clang) is None:
        preflight_errors.append(f"Clang executable not found: {args.clang}")
    qemu_executable = resolve_executable(args.qemu)
    if qemu_executable is None:
        preflight_errors.append(f"QEMU executable not found: {args.qemu}")

    results: list[ProblemRunResult] = []
    if preflight_errors:
        setup_summary = "; ".join(preflight_errors)
        for asm_file in asm_files:
            problem_name = infer_problem_name(asm_file) or asm_file.stem
            output_dir = problem_output_root / problem_name
            output_dir.mkdir(parents=True, exist_ok=True)
            results.append(
                ProblemRunResult(
                    asm_file=asm_file,
                    problem_name=problem_name,
                    status="setup_error",
                    summary=setup_summary,
                    output_dir=output_dir,
                )
            )
        payload = build_payload(
            arm_dir=arm_dir,
            test_root=test_root,
            selected_problems=selected_problems,
            results=results,
            started_at=started_at,
        )
        output_path = args.output or (json_dir / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_error_problems.json")
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
        print(f"Preflight failed. JSON report: {output_path}")
        if args.print_json:
            print(json.dumps(payload, indent=2))
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

    payload = build_payload(
        arm_dir=arm_dir,
        test_root=test_root,
        selected_problems=selected_problems,
        results=results,
        started_at=started_at,
    )

    output_path = args.output or (json_dir / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_error_problems.json")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    print(f"JSON report: {output_path}")
    print(f"Errored problems: {payload['errored_count']}/{payload['problems_processed']}")
    if args.print_json:
        print(json.dumps(payload, indent=2))

    if args.strict_exit and payload["errored_count"] > 0:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
