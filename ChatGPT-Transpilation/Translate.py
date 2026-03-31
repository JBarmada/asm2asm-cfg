"""
Modular Assembly Translation and Evaluation Pipeline (OpenAI Responses API)

This script orchestrates an asynchronous translation pipeline using the OpenAI API 
to translate assembly code from one architecture to another. Depending on the 
provided JSON configuration, it can either stop after generating the translated 
assembly files or proceed to compile, link, and evaluate the translated code 
using QEMU (or natively) and a test harness.

USAGE:
    python parallel_translate_openai.py --config <path_to_config.json>

REQUIREMENTS:
    - The `openai` package must be installed (pip install openai).
    - The `OPENAI_API_KEY` environment variable must be set.
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
    import openai
    from openai import AsyncOpenAI
    HAS_OPENAI = True
except ImportError:
    HAS_OPENAI = False

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
    for token in ["```asm", "```assembly", "```x86asm", "```"]:
        text = text.replace(token, "")
    return text.strip()

# ==========================================
# Dataset Fetching
# ==========================================

def fetch_huggingface_data(cfg: dict) -> List[Tuple[str, str]]:
    """Fetches the O2 split from HF and returns a list of (task_name, source_asm)."""
    if not HAS_DATASETS:
        raise ImportError("The 'datasets' library is required. Install with: pip install datasets")

    hf_token = (
        cfg.get("hf_token")
        or os.environ.get("HF_TOKEN")
        or os.environ.get("HUGGINGFACE_HUB_TOKEN")
    )
    if hf_token and not os.environ.get("HF_TOKEN"):
        os.environ["HF_TOKEN"] = hf_token
    if hf_token:
        _log("Using authenticated Hugging Face access (HF token detected).")
    else:
        _log("HF token not found. Set HF_TOKEN (or cfg['hf_token']) to avoid unauthenticated rate limits.")
    
    _log("Fetching Hugging Face dataset: murodbek/humaneval_asm (split: O2)")
    ds = load_dataset("murodbek/humaneval_asm", "default", split="O2", token=hf_token)
    
    # Allow the config to specify which column to use as the source assembly
    # e.g., "aarch64_linux", "x86_64_linux", "riscv64_linux"
    source_col = cfg.get("source_dataset_column", "aarch64_linux")
    _log(f"Extracting source assembly from dataset column: '{source_col}'")
    
    problems = []
    for row in ds:
        task_name = row["task_name"]
        if source_col not in row:
            raise KeyError(f"Column '{source_col}' not found in dataset. Available columns: {list(row.keys())}")
        source_asm = row[source_col]
        problems.append((task_name, source_asm))
        
    _log(f"Successfully fetched {len(problems)} problems from Hugging Face.")
    return problems

# ==========================================
# Evaluator Registry (Modularity)
# ==========================================

EVALUATORS: Dict[str, Callable] = {}

def register_evaluator(benchmark_name: str):
    def decorator(func):
        EVALUATORS[benchmark_name] = func
        return func
    return decorator

@register_evaluator("HumanEval")
def evaluate_humaneval(cfg: dict, asm_dir: Path, output_root: Path) -> list[ProblemRunResult]:
    """Compiles and runs translated HumanEval assembly files."""
    results = []
    test_root = Path(cfg.get("test_root", "HumanEval_source")).resolve()
    clang_exe = cfg.get("clang", "clang-17")
    qemu_exe = cfg.get("qemu", "")
    use_qemu = cfg.get("use_qemu", True)  # Feature flag for native vs emulated runs
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
                # Handle execution natively or via emulator based on config
                if use_qemu and qemu_exe:
                    run_cmd = [qemu_exe, str(executable_path)]
                else:
                    run_cmd = [str(executable_path)]
                
                proc = subprocess.run(run_cmd, cwd=output_dir, capture_output=True, text=True, timeout=timeout)
                result.command_results.append(CommandResult(run_cmd, proc.returncode, proc.stdout, proc.stderr))
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
# Async Translation Pipeline (OpenAI Responses)
# ==========================================

async def call_openai(aclient: AsyncOpenAI, prompt: str, model: str, retries: int, backoff: float) -> str:
    """Execute OpenAI request using the Responses API with retry/backoff."""
    for attempt in range(1, retries + 1):
        try:
            resp = await aclient.responses.create(
                model=model,
                instructions="You are an expert assembly translator.\n- Output ONLY assembly\n- No comments\n- Preserve semantics exactly\n",
                input=prompt
            )
            # Utilizing the new output_text helper property from the Responses API SDK
            return resp.output_text or ""
        except openai.RateLimitError as e:
            # Check if this is a hard quota exhaustion rather than a temporary rate limit
            if e.code == "insufficient_quota":
                _log("CRITICAL: OpenAI API Quota Exhausted. Aborting entire run.")
                os._exit(1) # Forcefully kill the entire script immediately
                
            if attempt == retries: raise
            _log(f"Rate limit hit, backing off... (Attempt {attempt}/{retries})")
            await asyncio.sleep(backoff * (2 ** (attempt - 1)) + random.uniform(0, 0.5))
        except Exception as e:
            if attempt == retries: raise
            _log(f"API Error [{type(e).__name__}]: {str(e)}. Retrying in {backoff}s... (Attempt {attempt}/{retries})")
            await asyncio.sleep(backoff)
    return ""

async def translate_worker(queue: asyncio.Queue, cfg: dict, dirs: dict, aclient: AsyncOpenAI, counters: dict, lock: asyncio.Lock):
    while True:
        try:
            problem_name, source_text = queue.get_nowait()
        except asyncio.QueueEmpty:
            break
            
        filename = f"{problem_name}.s"
        asm_out = dirs['translated_asm'] / filename
        
        if asm_out.exists():
            async with lock:
                counters["skip"] += 1
                counters["done"] += 1
                done, total = counters["done"], counters["total"]
            _log(f"Skipped existing: {filename} ({done}/{total})")
            queue.task_done()
            continue

        try:
            prompt = cfg["prompt_template"].format(
                source_arch=cfg["source_arch"], 
                target_arch=cfg["target_arch"], 
                source_code=source_text
            )
            
            await asyncio.to_thread(lambda: (dirs['prompts'] / f"{problem_name}.txt").write_text(prompt))
            
            raw_output = await call_openai(aclient, prompt, cfg["model_name"], cfg["max_retries"], cfg["retry_base_seconds"])
            await asyncio.to_thread(lambda: (dirs['raw_model_output'] / f"{problem_name}.txt").write_text(raw_output))
            
            cleaned_asm = clean_model_output(raw_output)
            await asyncio.to_thread(lambda: asm_out.write_text(cleaned_asm))
            
            async with lock:
                counters["ok"] += 1
                counters["done"] += 1
                done, total = counters["done"], counters["total"]
            _log(f"Translated: {filename} ({done}/{total})")
        except Exception as e:
            async with lock:
                counters["fail"] += 1
                counters["done"] += 1
                done, total = counters["done"], counters["total"]
            _log(f"Failed {filename}: {e} ({done}/{total})")
        finally:
            queue.task_done()

async def run_translation(cfg: dict, dirs: dict, problems: List[Tuple[str, str]]):
    if not HAS_OPENAI: raise ImportError("Install openai package: pip install openai")
    if not os.environ.get("OPENAI_API_KEY"): raise ValueError("OPENAI_API_KEY environment variable is missing.")
    
    queue = asyncio.Queue()
    for p in problems: queue.put_nowait(p)

    counters = {"ok": 0, "fail": 0, "skip": 0, "done": 0, "total": len(problems)}
    lock = asyncio.Lock()
    
    aclient = AsyncOpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
    
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

def write_reports(report_dir: Path, eval_results: list[ProblemRunResult], cfg: dict, res_dir: Path, start_time: datetime):
    """Write a single comprehensive report with summary stats at the top."""
    end_time = datetime.now()
    
    total = len(eval_results)
    counts = {}
    for r in eval_results:
        counts[r.status] = counts.get(r.status, 0) + 1
        
    succeeded = counts.get("passed", 0)
    failed = total - succeeded
    
    if total > 0:
        success_rate = f"{succeeded}/{total} ({(succeeded / total) * 100:.1f}%)"
    else:
        success_rate = "0/0 (0.0%)"

    lines = [
        f"Run started: {start_time.strftime('%Y-%m-%dT%H:%M:%S')}",
        f"Run finished: {end_time.strftime('%Y-%m-%dT%H:%M:%S')}",
        f"Input experiment dir: {res_dir.absolute()}",
        f"Run label: {res_dir.name}",
        f"Model: {cfg.get('model_name', 'Unknown')}",
        f"Translator: Single-pass (no CFG/DFG iterative refinement)",
        f"Total problems: {total}",
        f"Succeeded: {succeeded}",
        f"Failed: {failed}",
        f"Success rate: {success_rate}",
        "",
        "Status counts:"
    ]
    
    if counts:
        for st, ct in sorted(counts.items()):
            lines.append(f"- {st}: {ct}")
    else:
        lines.append("- No evaluation performed (translate_only mode)")

    # Append verbose per-problem details below the summary
    if eval_results:
        lines.extend([
            "", 
            "========================================",
            "--- Per Problem Details ---",
            "========================================",
        ])
        for r in eval_results:
            lines.extend([f"\nProblem: {r.problem_name}", f"Status: {r.status}", f"Summary: {r.summary}"])
            if r.command_results:
                for c in r.command_results:
                    lines.extend([f"CMD: {shlex.join(c.command)}", f"Code: {c.returncode}"])
                    if c.stderr: 
                        lines.append(f"Stderr: {c.stderr.strip()}")

    # Write to a single file
    timestamp = end_time.strftime("%Y%m%d_%H%M%S")
    report_path = report_dir / f"{timestamp}_report.txt"
    report_path.write_text("\n".join(lines))
    _log(f"Report written to {report_path}")
    _log(f"Reports written to {report_dir}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--config", type=Path, required=True, help="Path to config.json")
    args = parser.parse_args()

    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    
    test_root = Path(cfg.get("test_root", "")).resolve()
    cfg["test_root"] = str(test_root)
    
    date_str = datetime.now().strftime("%Y%m%d")
    model_safe = re.sub(r"[^A-Za-z0-9._-]+", "_", cfg.get("model_name", "model"))
    target_safe = re.sub(r"[^A-Za-z0-9._-]+", "_", cfg.get("target_arch", "target")).strip("_")
    source_safe = re.sub(r"[^A-Za-z0-9._-]+", "_", cfg.get("source_arch", "source")).strip("_")
    
    base_results_dir = Path("results").resolve()
    res_dir = base_results_dir / f"{cfg.get('benchmark', 'bench')}_{source_safe}_to_{target_safe}_{model_safe}_{date_str}"

    print("\n" + "="*60)
    print(" PIPELINE CONFIGURATION & DIRECTORY CHECK")
    print("="*60)
    print(f"Action:         {cfg.get('action')}")
    print(f"API:            OpenAI (Responses API)")
    print(f"Model:          {cfg.get('model_name')}")
    print(f"Source Data:    HF Dataset Column -> {cfg.get('source_dataset_column', 'aarch64_linux')}")
    print(f"Source Arch:    {cfg.get('source_arch')}")
    print(f"Target Arch:    {cfg.get('target_arch')}")
    print(f"Use QEMU:       {cfg.get('use_qemu', True)}")
    
    errors = []
        
    if cfg.get("action") == "compile_and_run":
        print(f"Test Root Dir:  {test_root}")
        if not test_root.exists() or not test_root.is_dir():
            errors.append(f"--> [ERROR] Test root directory not found: {test_root}")
            
    print(f"Output Dir:     {res_dir}")
    print("="*60 + "\n")
    
    if errors:
        for err in errors: print(err)
        print("\nTerminating due to missing required directories.")
        sys.exit(1)
        
    confirm = input("Directories verified. Do you want to proceed with this run? [y/N]: ").strip().lower()
    if confirm not in ['y', 'yes']:
        print("Run cancelled by user. Exiting.")
        sys.exit(0)
        
    print("\nStarting execution...")
    start_time = datetime.now()
    dirs = {k: res_dir / k for k in ["prompts", "raw_model_output", "translated_asm", "HEproblems", "txts"]}
    for d in dirs.values(): d.mkdir(parents=True, exist_ok=True)

    _log(f"Starting pipeline for {cfg['target_arch']}")
    
    problems = fetch_huggingface_data(cfg)
    asyncio.run(run_translation(cfg, dirs, problems))
    
    eval_results = []
    if cfg.get("action") == "compile_and_run":
        benchmark = cfg.get("benchmark", "HumanEval")
        if benchmark in EVALUATORS:
            _log(f"Running evaluation for {benchmark}")
            eval_results = EVALUATORS[benchmark](cfg, dirs["translated_asm"], dirs["HEproblems"])
        else:
            _log(f"Warning: No evaluator registered for '{benchmark}'")

    write_reports(dirs["txts"], eval_results, cfg, res_dir, start_time)

if __name__ == "__main__":
    main()