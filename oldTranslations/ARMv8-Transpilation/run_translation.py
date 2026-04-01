'''
python run_translation.py --config config_x86.json --asm-dir results/translated_asm --use-qemu
'''

import argparse
import json
import shlex
import subprocess
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import List

@dataclass
class EvalResult:
    problem_name: str
    asm_file: Path
    status: str
    summary: str
    succeeded: bool
    command_results: List = None
    stdout: str = ""
    stderr: str = ""
    
    def __post_init__(self):
        if self.command_results is None:
            self.command_results = []


@dataclass
class CommandResult:
    """Stores the outcome of one subprocess invocation."""
    command: List[str]
    returncode: int
    stdout: str
    stderr: str

def run_command(cmd: List[str], cwd: Path, timeout: int) -> CommandResult:
    result = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=timeout, check=False)
    return CommandResult(
        command=cmd,
        returncode=result.returncode,
        stdout=result.stdout,
        stderr=result.stderr
    )

def inject_intel_syntax(asm_file: Path) -> None:
    """Inject .intel_syntax noprefix directive at the top of assembly file if not already present."""
    content = asm_file.read_text(encoding="utf-8")
    if ".intel_syntax" not in content:
        content = ".intel_syntax noprefix\n" + content
        asm_file.write_text(content, encoding="utf-8")

def evaluate_problem(asm_file: Path, test_root: Path, output_root: Path, cfg: dict, inject_intel: bool = False, use_qemu: bool = True) -> EvalResult:
    problem_name = asm_file.stem
    output_dir = output_root / problem_name
    output_dir.mkdir(parents=True, exist_ok=True)
    
    test_file = test_root / problem_name / "test.c"
    if not test_file.exists():
        return EvalResult(problem_name, asm_file, "build_error", f"Missing test harness at {test_file}", False)
    
    # Inject Intel syntax directive before compilation if enabled
    if inject_intel:
        inject_intel_syntax(asm_file)

    clang_exe = cfg.get("clang", "clang-17")
    qemu_exe = cfg.get("qemu", "qemu-x86_64")
    use_qemu = cfg.get("use_qemu", True)
    compile_flags = cfg.get("compile_flags", [])
    link_flags = cfg.get("link_flags", [])
    timeout = cfg.get("timeout_seconds", 30)

    asm_obj = output_dir / f"{problem_name}.o"
    test_obj = output_dir / "test.o"
    exe_path = output_dir / f"{problem_name}_exe"

    build_commands = [
        [clang_exe, "-c", str(asm_file), "-o", str(asm_obj)] + compile_flags,
        [clang_exe, "-c", str(test_file), "-o", str(test_obj), "-O2"] + compile_flags,
        [clang_exe, str(asm_obj), str(test_obj), "-o", str(exe_path)] + link_flags,
    ]

    command_results = []
    try:
        # Compilation & Linking
        for cmd in build_commands:
            proc = run_command(cmd, output_dir, timeout)
            command_results.append(proc)
            if proc.returncode != 0:
                return EvalResult(problem_name, asm_file, "build_error", "Compilation or static link failed", False, command_results)

        # Execution
        if use_qemu and qemu_exe:
            run_cmd = [qemu_exe, str(exe_path)]
        else:
            # Run natively on the local machine
            run_cmd = [str(exe_path)]
        
        proc = run_command(run_cmd, output_dir, timeout)
        command_results.append(proc)
        if proc.returncode == 0:
            return EvalResult(problem_name, asm_file, "passed", "Passed validation", True, command_results, proc.stdout, proc.stderr)
        else:
            return EvalResult(problem_name, asm_file, "runtime_error", f"Program exited with code {proc.returncode}", False, command_results, proc.stdout, proc.stderr)

    except subprocess.TimeoutExpired:
        return EvalResult(problem_name, asm_file, "timeout", f"Command timed out after {timeout} seconds", False, command_results)
    except Exception as e:
        return EvalResult(problem_name, asm_file, "execution_error", str(e), False, command_results)

def command_to_text(command: List[str]) -> str:
    """Render a subprocess command as a shell-friendly string for reports."""
    return shlex.join(command)


def build_summary_lines(results: List[EvalResult]) -> List[str]:
    """Summarize the number of results in each final status bucket."""
    counts: dict = {}
    for result in results:
        counts[result.status] = counts.get(result.status, 0) + 1

    lines = ["Status counts:"]
    for status in sorted(counts):
        lines.append(f"- {status}: {counts[status]}")
    if not results:
        lines.append("- no problems were processed")
    return lines


def write_report(results: List[EvalResult], asm_dir: Path, cfg: dict, start_time: datetime, end_time: datetime):
    """Write evaluation report with detailed command output."""
    experiment_dir = asm_dir.parent.resolve()
    report_path = experiment_dir / "txts" / "eval_report.txt"
    report_path.parent.mkdir(parents=True, exist_ok=True)

    total_problems = len(results)
    succeeded = [r for r in results if r.succeeded]
    failed = [r for r in results if not r.succeeded]
    success_rate = (len(succeeded) / total_problems * 100) if total_problems > 0 else 0.0

    lines = [
        f"Run started: {start_time.isoformat(timespec='seconds')}",
        f"Run finished: {end_time.isoformat(timespec='seconds')}",
        f"Input experiment dir: {experiment_dir}",
        f"Run label: {experiment_dir.name}",
        f"Model: {cfg.get('model_name', 'unknown')}",
        f"Translator: Single-pass (no CFG/DFG iterative refinement)",
        f"Total problems: {total_problems}",
        f"Succeeded: {len(succeeded)}",
        f"Failed: {len(failed)}",
        f"Success rate: {len(succeeded)}/{total_problems} ({success_rate:.1f}%)",
    ]
    
    lines.extend([""] + build_summary_lines(results))
    
    if failed:
        lines.append("\nFailed problems:")
        for r in sorted(failed, key=lambda x: int(x.problem_name.replace("problem", "")) if "problem" in x.problem_name else 0):
            lines.append(f"- {r.problem_name}: {r.status}: {r.summary}")

    lines.append("\n" + "="*70)
    lines.append("Per-problem details:")
    
    sorted_results = sorted(results, key=lambda x: int(x.problem_name.replace("problem", "")) if "problem" in x.problem_name else 0)

    for r in sorted_results:
        lines.extend([
            "",
            f"Problem: {r.problem_name}",
            f"Assembly file: {r.asm_file}",
            f"Status: {r.status}",
            f"Summary: {r.summary}",
        ])
        if r.command_results:
            lines.append("Commands:")
            for cmd_result in r.command_results:
                lines.append(f"  $ {command_to_text(cmd_result.command)}")
                lines.append(f"    return code: {cmd_result.returncode}")
                if cmd_result.stdout.strip():
                    lines.append("    stdout:")
                    for line in cmd_result.stdout.rstrip().splitlines():
                        lines.append(f"      {line}")
                if cmd_result.stderr.strip():
                    lines.append("    stderr:")
                    for line in cmd_result.stderr.rstrip().splitlines():
                        lines.append(f"      {line}")
        if r.stdout.strip():
            lines.append("Program stdout:")
            for line in r.stdout.rstrip().splitlines():
                lines.append(f"  {line}")
        if r.stderr.strip():
            lines.append("Program stderr:")
            for line in r.stderr.rstrip().splitlines():
                lines.append(f"  {line}")

    report_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"\nEvaluation complete. Report generated at: {report_path}")

def main():
    parser = argparse.ArgumentParser(description="Evaluate translated assembly files and generate a Composer-style report.")
    parser.add_argument("--config", type=Path, required=True, help="Path to config.json")
    parser.add_argument("--asm-dir", type=Path, required=True, help="Path to the translated_asm directory")
    parser.add_argument("--inject-intel-syntax", action="store_true", help="Inject .intel_syntax noprefix directive into assembly files")
    parser.add_argument("--use-qemu", action="store_true", help="Run executables under QEMU (default: True unless --no-qemu is set)")
    parser.add_argument("--no-qemu", action="store_true", help="Run test executables natively instead of under QEMU")
    args = parser.parse_args()

    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    asm_dir = args.asm_dir.resolve()
    test_root = Path(cfg["test_root"]).resolve()
    output_root = (asm_dir.parent / "HEproblems").resolve()
    
    # Check config for the flag, CLI arg overrides config
    inject_intel = args.inject_intel_syntax or cfg.get("inject_intel_syntax", False)
    
    # Handle use_qemu: CLI args override, default to config value or True
    if args.no_qemu:
        use_qemu = False
    elif args.use_qemu:
        use_qemu = True
    else:
        use_qemu = cfg.get("use_qemu", True)

    if not asm_dir.exists() or not asm_dir.is_dir():
        print(f"Error: Translated assembly directory not found at {asm_dir}")
        return
    if not test_root.exists() or not test_root.is_dir():
        print(f"Error: Test root directory not found at {test_root}")
        return

    print(f"Evaluating translated files in {asm_dir}...")
    if inject_intel:
        print("Intel syntax injection: ENABLED")
    if not use_qemu:
        print("QEMU execution: DISABLED (running natively)")
    start_time = datetime.now()
    
    results = []
    total_files = len(list(asm_dir.glob("*.s")))
    start_time_mono = time.monotonic()
    
    for index, asm_file in enumerate(sorted(asm_dir.glob("*.s")), start=1):
        elapsed = time.monotonic() - start_time_mono
        problem_name = asm_file.stem
        print(f"[{index}/{total_files}] {problem_name} | elapsed: {elapsed:.1f}s")
        
        res = evaluate_problem(asm_file, test_root, output_root, cfg, inject_intel, use_qemu)
        results.append(res)
        status_label = "OK" if res.succeeded else "FAIL"
        print(f"[{status_label}] {res.problem_name}: {res.summary}")

    end_time = datetime.now()
    write_report(results, asm_dir, cfg, start_time, end_time)

if __name__ == "__main__":
    main()