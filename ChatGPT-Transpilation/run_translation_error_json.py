"""
Language-Agnostic Assembly Validation Script.
Reads a config.json to dynamically compile, link, and evaluate assembly files.
Outputs a JSON report containing only errored problems for the Composer.
"""

import argparse
import json
import shlex
import subprocess
import sys
import time
from datetime import datetime
from pathlib import Path
from dataclasses import dataclass, field
from typing import List

@dataclass
class CommandResult:
    command: List[str]
    returncode: int
    stdout: str
    stderr: str

@dataclass
class ProblemRunResult:
    problem_name: str
    status: str
    summary: str
    command_results: List[CommandResult] = field(default_factory=list)
    stderr: str = ""

def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Agnostic Translation Validator")
    parser.add_argument("asm_dir", type=Path, help="Directory containing translated .s files")
    parser.add_argument("--config", type=Path, required=True, help="Path to config.json with build/run flags")
    parser.add_argument("--problems", nargs="+", help="Optional problem filters (e.g., problem1)")
    parser.add_argument("--output", type=Path, required=True, help="Output JSON path")
    return parser.parse_args()

def extract_stderr(result: ProblemRunResult) -> str:
    stderr_chunks = []
    if result.stderr.strip():
        stderr_chunks.append(result.stderr.strip())
    for command_result in result.command_results:
        if command_result.stderr and command_result.stderr.strip():
            stderr_chunks.append(command_result.stderr.strip())

    deduped = []
    seen = set()
    for chunk in stderr_chunks:
        if chunk not in seen:
            seen.add(chunk)
            deduped.append(chunk)
    return "\n\n".join(deduped)

def to_error_entry(result: ProblemRunResult) -> dict:
    return {
        "name": result.problem_name,
        "status": result.status,
        "summary": result.summary,
        "commands": [
            {
                "command": shlex.join(c.command),
                "returncode": c.returncode,
            }
            for c in result.command_results
        ],
        "stderr": extract_stderr(result),
    }

def _base_problem_name(stem: str) -> str:
    # Allows filters like "problem81" to match files like "problem81_O2.s".
    return stem.split("_", 1)[0]

def main() -> int:
    args = parse_args()
    asm_dir = args.asm_dir.resolve()
    print(f"[info] Starting validation run")
    print(f"[info] asm_dir={asm_dir}")
    print(f"[info] config={args.config}")
    print(f"[info] output={args.output}")
    
    if not asm_dir.exists() or not asm_dir.is_dir():
        print(f"Assembly directory does not exist: {asm_dir}", file=sys.stderr)
        return 2

    # Load Config
    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    test_root = Path(cfg.get("test_root", "../HumanEval_source")).resolve()
    clang_exe = cfg.get("clang", "clang-17")
    use_qemu = cfg.get("use_qemu", True)
    qemu_exe = cfg.get("qemu", "") if use_qemu else ""
    compile_flags = cfg.get("compile_flags", [])
    link_flags = cfg.get("link_flags", [])
    timeout = cfg.get("timeout_seconds", 30)

    print(
        f"[info] toolchain: clang={clang_exe}, qemu={'enabled' if use_qemu else 'disabled'}, timeout={timeout}s"
    )
    if use_qemu:
        print(f"[info] qemu executable={qemu_exe or '<empty>'}")
    print(f"[info] test_root={test_root}")

    started_at = datetime.now()
    
    asm_files = sorted(asm_dir.glob("*.s"))
    print(f"[info] discovered {len(asm_files)} assembly files before filtering")
    if args.problems:
        requested = {p.strip() for p in args.problems if p and p.strip()}
        asm_files = [
            f
            for f in asm_files
            if f.stem in requested or _base_problem_name(f.stem) in requested
        ]
        print(f"[info] applying filters: {sorted(requested)}")
        print(f"[info] {len(asm_files)} assembly files remain after filtering")
        if not asm_files:
            print(
                f"Warning: no assembly files matched filters {sorted(requested)} in {asm_dir}",
                file=sys.stderr,
            )

    results: List[ProblemRunResult] = []
    
    # Execution Loop
    total = len(asm_files)
    for idx, asm_file in enumerate(asm_files, start=1):
        asm_stem = asm_file.stem
        problem_name = _base_problem_name(asm_stem)
        print(f"\n[problem {idx}/{total}] {problem_name} (asm stem: {asm_stem})")
        output_dir = asm_dir.parent / "eval_temp" / asm_stem
        output_dir.mkdir(parents=True, exist_ok=True)
        print(f"[problem {idx}/{total}] output_dir={output_dir}")
        
        test_file = test_root / problem_name / "test.c"
        if not test_file.exists():
            print(f"[problem {idx}/{total}] missing test: {test_file}")
            results.append(ProblemRunResult(problem_name, "missing_test", f"No test at {test_file} (asm stem: {asm_stem})"))
            continue

        asm_object = output_dir / f"{asm_stem}.o"
        test_object = output_dir / "test.o"
        executable_path = output_dir / f"{asm_stem}_exe"

        result = ProblemRunResult(problem_name, "pending", "")

        build_commands = [
            [clang_exe, "-c", str(asm_file), "-o", str(asm_object)] + compile_flags,
            [clang_exe, "-c", str(test_file), "-o", str(test_object), "-O2"] + compile_flags,
            [clang_exe, str(asm_object), str(test_object), "-o", str(executable_path)] + link_flags,
        ]

        try:
            for cmd in build_commands:
                print(f"[problem {idx}/{total}] CMD: {shlex.join(cmd)}")
                proc = subprocess.run(cmd, cwd=output_dir, capture_output=True, text=True, timeout=timeout)
                result.command_results.append(CommandResult(cmd, proc.returncode, proc.stdout, proc.stderr))
                print(f"[problem {idx}/{total}] -> return code: {proc.returncode}")
                if proc.returncode != 0:
                    if proc.stderr and proc.stderr.strip():
                        print(f"[problem {idx}/{total}] stderr:\n{proc.stderr.strip()}")
                    result.status, result.summary = "build_error", "Compilation/Link failed"
                    break
            
            if result.status == "pending":
                run_cmd = [qemu_exe, str(executable_path)] if qemu_exe else [str(executable_path)]
                print(f"[problem {idx}/{total}] CMD: {shlex.join(run_cmd)}")
                proc = subprocess.run(run_cmd, cwd=output_dir, capture_output=True, text=True, timeout=timeout)
                result.command_results.append(CommandResult(run_cmd, proc.returncode, proc.stdout, proc.stderr))
                result.stderr = proc.stderr
                result.status = "passed" if proc.returncode == 0 else "runtime_error"
                result.summary = f"Exited with code {proc.returncode}"
                print(f"[problem {idx}/{total}] -> return code: {proc.returncode}")
                if proc.stderr and proc.stderr.strip():
                    print(f"[problem {idx}/{total}] stderr:\n{proc.stderr.strip()}")
                
        except subprocess.TimeoutExpired:
            result.status, result.summary = "timeout", "Execution timed out"
            print(f"[problem {idx}/{total}] timeout after {timeout}s")
        except Exception as e:
            result.status, result.summary = "execution_error", str(e)
            print(f"[problem {idx}/{total}] execution error: {e}")
        
        print(f"[problem {idx}/{total}] status={result.status} summary={result.summary}")
            
        results.append(result)

    # Build JSON Payload
    errored = [r for r in results if r.status != "passed"]
    payload = {
        "run_started": started_at.isoformat(timespec="seconds"),
        "run_finished": datetime.now().isoformat(timespec="seconds"),
        "asm_input_dir": str(asm_dir),
        "test_root": str(test_root),
        "problem_filter": args.problems if args.problems else "all problems",
        "problems_processed": len(results),
        "errored_count": len(errored),
        "errored_problems": [to_error_entry(r) for r in errored],
    }

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    print("\n[summary] Validation complete")
    print(f"[summary] problems_processed={len(results)}")
    print(f"[summary] errored_count={len(errored)}")
    print(f"[summary] output_json={args.output}")

    return 1 if len(errored) > 0 else 0

if __name__ == "__main__":
    raise SystemExit(main())