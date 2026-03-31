
"""
Modular Assembly Translation and Evaluation Pipeline

This script orchestrates an asynchronous translation pipeline using the Gemini API 
to translate assembly code from one architecture to another. Depending on the 
provided JSON configuration, it can either stop after generating the translated 
assembly files or proceed to compile, link, and evaluate the translated code 
using QEMU and a test harness.

USAGE:
    python run_pipeline.py --config <path_to_config.json>

ARGUMENTS:
    --config    (Required) Path to the JSON configuration file dictating the 
                parameters of the run.

CONFIGURATION (JSON) EXPECTATIONS:
    The script is entirely driven by its JSON config. Key fields include:
    - benchmark:        (str) Name of the benchmark (e.g., "HumanEval"). Used to route to the correct evaluator.
    - action:           (str) "compile_and_run" to translate and evaluate, or "translate_only" to skip evaluation.
    - model_name:       (str) The Gemini model to use (e.g., "gemini-3.1-pro").
    - max_workers:      (int) Number of concurrent async translation workers to run.
    - source_arch:      (str) The source architecture (e.g., "Armv8").
    - target_arch:      (str) The target architecture (e.g., "x86_64", "RISCV", "Armv8.4a").
    - test_root:        (str) Path to the directory containing test harnesses (required if compiling).
    - clang / qemu:     (str) Executable commands for the compiler and emulator.
    - compile_flags:    (list) Flags passed to Clang when building the object files.
    - link_flags:       (list) Flags passed to Clang when linking the final executable.
    - prompt_template:  (str) The prompt template sent to the model for translation.
    - hf_token:         (str) Optional Hugging Face token for dataset access. Can also be set via HF_TOKEN env var.

WORKFLOW:
    1. Configuration: Loads the JSON config and resolves absolute directory paths.
    2. Preflight: Prints the resolved paths and prompts the user for confirmation. Halts if paths are missing.
    3. Translation: Asynchronously translates all `.s` files in the source directory using Gemini.
    4. Evaluation: If `action` is "compile_and_run", invokes the registered evaluator to compile and run the code.
    5. Reporting: Writes timestamped brief and verbose text reports to a newly generated results directory.

REQUIREMENTS:
    - The `google-generativeai` package must be installed.
    - The `GOOGLE_API_KEY` environment variable must be set.
"""

import argparse
import asyncio
import json
import os
import random
import re
import shlex
import subprocess
import sys
import time
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Callable, Dict, List, Tuple

try:
    from google import genai
    HAS_GENAI = True
except ImportError:
    HAS_GENAI = False

try:
    from datasets import load_dataset
    HAS_DATASETS = True
except ImportError:
    HAS_DATASETS = False


# ==========================================
# Data Structures & Helpers
# ==========================================

@dataclass
class CommandResult:
    command: list[str]
    returncode: int
    stdout: str
    stderr: str

@dataclass
class ProblemRunResult:
    problem_name: str
    status: str
    summary: str
    asm_file: Path | None = None
    output_dir: Path | None = None
    test_file: Path | None = None
    executable_path: Path | None = None
    command_results: list[CommandResult] = field(default_factory=list)
    stdout: str = ""
    stderr: str = ""

def _log(msg: str) -> None:
    now = time.strftime("%H:%M:%S")
    print(f"[{now}] {msg}")

def clean_model_output(text: str | None) -> str:
    """Remove markdown fences if the model wraps assembly in code blocks."""
    if text is None: return ""
    for token in ["```asm", "```assembly", "```"]:
        text = text.replace(token, "")
    return text.strip()

class QuotaExhaustedError(RuntimeError):
    pass

# ==========================================
# Dataset Fetching
# ==========================================

def fetch_huggingface_data(cfg: dict) -> List[Tuple[str, str]]:
    """Fetches the O2 split from HF and returns a list of (task_name, aarch64_linux_asm)."""
    if not HAS_DATASETS:
        raise ImportError("The 'datasets' library is required. Install with: pip install datasets")

    hf_token = (
        cfg.get("hf_token")
        or os.environ.get("HF_TOKEN")
        or os.environ.get("HUGGINGFACE_HUB_TOKEN")
    )
    if hf_token and not os.environ.get("HF_TOKEN"):
        # Keep HF client behavior consistent by exporting the standard env var.
        os.environ["HF_TOKEN"] = hf_token
    if hf_token:
        _log("Using authenticated Hugging Face access (HF token detected).")
    else:
        _log("HF token not found. Set HF_TOKEN (or cfg['hf_token']) to avoid unauthenticated rate limits.")
    
    _log("Fetching Hugging Face dataset: murodbek/humaneval_asm (split: O2)")
    # Load the dataset
    ds = load_dataset("murodbek/humaneval_asm", "default", split="O2", token=hf_token)
    
    problems = []
    for row in ds:
        task_name = row["task_name"]  # e.g., "problem0"
        source_asm = row["aarch64_linux"] # specifically grabbing aarch64_linux
        problems.append((task_name, source_asm))
        
    _log(f"Successfully fetched {len(problems)} problems from Hugging Face.")
    return problems

# ==========================================
# Evaluator Registry (Modularity)
# ==========================================

EVALUATORS: Dict[str, Callable] = {}

def register_evaluator(benchmark_name: str):
    """Decorator to easily register new evaluation routines."""
    def decorator(func):
        EVALUATORS[benchmark_name] = func
        return func
    return decorator

@register_evaluator("HumanEval")
def evaluate_humaneval(cfg: dict, asm_dir: Path, output_root: Path) -> list[ProblemRunResult]:
    """Compiles and runs translated HumanEval assembly files[cite: 7]."""
    results = []
    test_root = Path(cfg.get("test_root", "HumanEval_source")).resolve()
    clang_exe = cfg.get("clang", "clang-17")
    qemu_exe = cfg.get("qemu", "qemu-riscv64")
    compile_flags = cfg.get("compile_flags", [])
    link_flags = cfg.get("link_flags", [])
    timeout = cfg.get("timeout_seconds", 30)

    for asm_file in sorted(asm_dir.glob("*.s")):
        problem_name = asm_file.stem
        output_dir = output_root / problem_name
        output_dir.mkdir(parents=True, exist_ok=True)
        test_file = test_root / problem_name / "test.c"

        if not test_file.exists():
            results.append(ProblemRunResult(problem_name, "missing_test", f"No test at {test_file}"))
            continue

        asm_object = output_dir / f"{problem_name}.o"
        test_object = output_dir / "test.o"
        executable_path = output_dir / f"{problem_name}_exe"

        result = ProblemRunResult(problem_name, "pending", "", asm_file, output_dir, test_file, executable_path)

        build_commands = [
            [clang_exe, "-c", str(asm_file), "-o", str(asm_object)] + compile_flags,
            [clang_exe, "-c", str(test_file), "-o", str(test_object), "-O2"] + compile_flags,
            [clang_exe, str(asm_object), str(test_object), "-o", str(executable_path)] + link_flags,
        ]

        try:
            for cmd in build_commands:
                proc = subprocess.run(cmd, cwd=output_dir, capture_output=True, text=True, timeout=timeout)
                result.command_results.append(CommandResult(cmd, proc.returncode, proc.stdout, proc.stderr))
                if proc.returncode != 0:
                    result.status, result.summary = "build_error", "Compilation/Link failed"
                    break
            
            if result.status == "pending":
                proc = subprocess.run([qemu_exe, str(executable_path)], cwd=output_dir, capture_output=True, text=True, timeout=timeout)
                result.command_results.append(CommandResult([qemu_exe, str(executable_path)], proc.returncode, proc.stdout, proc.stderr))
                result.stdout, result.stderr = proc.stdout, proc.stderr
                result.status = "passed" if proc.returncode == 0 else "runtime_error"
                result.summary = f"Exited with code {proc.returncode}"
                
        except subprocess.TimeoutExpired as e:
            result.status, result.summary = "timeout", "Execution timed out"
        except Exception as e:
            result.status, result.summary = "execution_error", str(e)
            
        results.append(result)
        _log(f"Eval [{result.status}] {problem_name}: {result.summary}")

    return results

# ==========================================
# Async Translation Pipeline
# ==========================================

async def call_gemini(aclient, prompt: str, model: str, retries: int, backoff: float) -> str:
    """Execute model request with retry/backoff[cite: 7]."""
    for attempt in range(1, retries + 1):
        try:
            resp = await aclient.models.generate_content(model=model, contents=prompt)
            return resp.text if resp.text else ""
        except Exception as e:
            if "RESOURCE_EXHAUSTED" in str(e): raise QuotaExhaustedError(str(e))
            if attempt == retries: raise
            await asyncio.sleep(backoff * (2 ** (attempt - 1)) + random.uniform(0, 0.25))
    return ""

async def translate_worker(queue: asyncio.Queue, cfg: dict, dirs: dict, aclient, counters: dict, lock: asyncio.Lock):
    while True:
        try:
            # Pull the tuple from the queue instead of just a filename
            problem_name, source_text = queue.get_nowait()
        except asyncio.QueueEmpty:
            break
            
        filename = f"{problem_name}.s"
        asm_out = dirs['translated_asm'] / filename
        
        if asm_out.exists():
            async with lock:
                counters["skip"] += 1
                counters["done"] += 1
                done = counters["done"]
                total = counters["total"]
            _log(f"Skipped existing: {filename} ({done}/{total})")
            queue.task_done()
            continue

        try:
            prompt = cfg["prompt_template"].format(source_arch=cfg["source_arch"], target_arch=cfg["target_arch"], source_code=source_text)
            
            await asyncio.to_thread(lambda: (dirs['prompts'] / f"{problem_name}.txt").write_text(prompt))
            
            raw_output = await call_gemini(aclient, prompt, cfg["model_name"], cfg["max_retries"], cfg["retry_base_seconds"])
            # Save the raw output before cleaning it
            await asyncio.to_thread(lambda: (dirs['raw_model_output'] / f"{problem_name}.txt").write_text(raw_output))
            
            cleaned_asm = clean_model_output(raw_output)
            
            await asyncio.to_thread(lambda: asm_out.write_text(cleaned_asm))
            
            async with lock:
                counters["ok"] += 1
                counters["done"] += 1
                done = counters["done"]
                total = counters["total"]
            _log(f"Translated: {filename} ({done}/{total})")
        except Exception as e:
            async with lock:
                counters["fail"] += 1
                counters["done"] += 1
                done = counters["done"]
                total = counters["total"]
            _log(f"Failed {filename}: {e} ({done}/{total})")
        finally:
            queue.task_done()

async def run_translation(cfg: dict, dirs: dict, problems: List[Tuple[str, str]]):
    if not HAS_GENAI: raise ImportError("Install google-generativeai")
    
    queue = asyncio.Queue()
    for p in problems: 
        queue.put_nowait(p)

    counters = {"ok": 0, "fail": 0, "skip": 0, "done": 0, "total": len(problems)}
    lock = asyncio.Lock()
    
    async with genai.Client().aio as aclient:
        tasks = [asyncio.create_task(translate_worker(queue, cfg, dirs, aclient, counters, lock)) 
                 for _ in range(cfg.get("max_workers", 1))]
        await asyncio.gather(*tasks, return_exceptions=True)

    _log(
        "Translation summary: "
        f"{counters['done']}/{counters['total']} done | "
        f"ok: {counters['ok']} | fail: {counters['fail']} | skip: {counters['skip']}"
    )

# ==========================================
# Reporting & Main Execution
# ==========================================

def write_reports(report_dir: Path, eval_results: list[ProblemRunResult], cfg: dict):
    """Write timestamped brief and verbose text reports[cite: 7]."""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    brief_lines = [f"Model: {cfg['model_name']}", f"Target: {cfg['target_arch']}", f"Action: {cfg['action']}", ""]
    verbose_lines = list(brief_lines)
    
    if eval_results:
        counts = {}
        for r in eval_results: counts[r.status] = counts.get(r.status, 0) + 1
        brief_lines.append("--- Eval Status Counts ---")
        for st, ct in counts.items(): brief_lines.append(f"{st}: {ct}")
        
        verbose_lines.append("--- Per Problem Details ---")
        for r in eval_results:
            verbose_lines.extend([f"\nProblem: {r.problem_name}", f"Status: {r.status}", f"Summary: {r.summary}"])
            if r.command_results:
                for c in r.command_results:
                    verbose_lines.extend([f"CMD: {shlex.join(c.command)}", f"Code: {c.returncode}"])
                    if c.stderr: verbose_lines.append(f"Stderr: {c.stderr.strip()}")

    (report_dir / f"{timestamp}_brief.txt").write_text("\n".join(brief_lines))
    (report_dir / f"{timestamp}_verbose.txt").write_text("\n".join(verbose_lines))
    _log(f"Reports written to {report_dir}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", type=Path, required=True, help="Path to config.json")
    args = parser.parse_args()

    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    
    # ---------------------------------------------------------
    # Directory Resolution & Validation
    # ---------------------------------------------------------
    test_root = Path(cfg.get("test_root", "")).resolve()
    cfg["test_root"] = str(test_root)
    
    date_str = datetime.now().strftime("%Y%m%d")
    model_safe = re.sub(r"[^A-Za-z0-9._-]+", "_", cfg.get("model_name", "model"))
    
    # Clean up the target architecture string so it's safe for folder names
    target_safe = re.sub(r"[^A-Za-z0-9._-]+", "_", cfg.get("target_arch", "target")).strip("_")
    
    # Nest under a master 'results' folder
    base_results_dir = Path("results").resolve()
    res_dir = base_results_dir / f"{cfg.get('benchmark', 'bench')}_to_{target_safe}_{model_safe}_{date_str}"

    print("\n" + "="*60)
    print(" PIPELINE CONFIGURATION & DIRECTORY CHECK")
    print("="*60)
    print(f"Action:         {cfg.get('action')}")
    print(f"Model:          {cfg.get('model_name')}")
    print(f"Source Data:    Hugging Face (murodbek/humaneval_asm, O2, aarch64_linux)")
    print(f"Target Arch:    {cfg.get('target_arch')}")
    
    errors = []
        
    if cfg.get("action") == "compile_and_run":
        print(f"Test Root Dir:  {test_root}")
        if not test_root.exists() or not test_root.is_dir():
            errors.append(f"--> [ERROR] Test root directory not found: {test_root}")
            
    print(f"Output Dir:     {res_dir}")
    print("="*60 + "\n")
    
    if errors:
        for err in errors:
            print(err)
        print("\nTerminating due to missing required directories.")
        sys.exit(1)
        
    # Prompt for user confirmation
    confirm = input("Directories verified. Do you want to proceed with this run? [y/N]: ").strip().lower()
    if confirm not in ['y', 'yes']:
        print("Run cancelled by user. Exiting.")
        sys.exit(0)
        
        
    print("\nStarting execution...")
    # ---------------------------------------------------------
    # Setup output directories now that the user has confirmed
    dirs = {k: res_dir / k for k in ["prompts", "raw_model_output", "translated_asm", "HEproblems", "txts"]}
    for d in dirs.values(): d.mkdir(parents=True, exist_ok=True)

    _log(f"Starting pipeline for {cfg['target_arch']}")
    
    # Phase 1: Fetch and Translate
    problems = fetch_huggingface_data(cfg)
    asyncio.run(run_translation(cfg, dirs, problems))
    
    # Phase 2: Evaluate (If configured)
    eval_results = []
    if cfg.get("action") == "compile_and_run":
        benchmark = cfg.get("benchmark", "HumanEval")
        if benchmark in EVALUATORS:
            _log(f"Running evaluation for {benchmark}")
            eval_results = EVALUATORS[benchmark](cfg, dirs["translated_asm"], dirs["HEproblems"])
        else:
            _log(f"Warning: No evaluator registered for '{benchmark}'")

    # Phase 3: Report
    write_reports(dirs["txts"], eval_results, cfg)

if __name__ == "__main__":
    main()