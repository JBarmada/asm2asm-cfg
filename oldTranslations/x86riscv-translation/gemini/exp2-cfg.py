from google import genai
import argparse
import asyncio
import json
import os
import random
import re
import time
from pathlib import Path

"""
# Process all problems, default output dir (results/exp02)
python exp2-cfg.py

# Custom output dir (results/my_run)
python exp2-cfg.py --output-dir my_run

# Single problem only
python exp2-cfg.py --problem problem42
python exp2-cfg.py --problem problem42.s   # both forms work

# Combine both
python exp2-cfg.py --output-dir test_run --problem problem1

parallelized exp02
experiment 02: single prompt, CFG, gemini on clang15 o2 optimized x86 humaneval asm code

This version preserves the original per-problem translation logic but runs many
problems concurrently with a bounded number of in-flight model requests.
"""

# --- Configuration ---
BASE_DIR = Path(__file__).resolve().parent
DEFAULT_CONFIG_FILENAME = "asm_translation_config.json"
DEFAULT_CONFIG = {
    "model_name": "gemini-3.1-pro-preview",
    "max_concurrency": 1,
    "max_retries": 3,
    "retry_base_seconds": 3.0,
    "input_s_dir": "Compiledown_HumanEval_O2/x86/asm",
    "input_test_dir": "HumanEval_source",
    "cfg_dir": "Compiledown_HumanEval_O2/x86/cfg",
    "results_dir": "x86riscv-translation/gemini/results",
}

MODEL_NAME = DEFAULT_CONFIG["model_name"]
MAX_CONCURRENCY = DEFAULT_CONFIG["max_concurrency"]
MAX_RETRIES = DEFAULT_CONFIG["max_retries"]
RETRY_BASE_SECONDS = DEFAULT_CONFIG["retry_base_seconds"]
input_s_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "asm"
input_test_dir = BASE_DIR.parent / "HumanEval_source"
cfg_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "cfg"
results_base_dir = BASE_DIR / "results"

prompt_template = """Translate the following O2 optimized x86 assembly code to RISC-V assembly code.

The input assembly code represents a compiled function that solves a programming problem.
The provided CFG describes the function control flow and should be used to improve translation correctness.

Requirements:
- Preserve the function behavior exactly
- Output only RISC-V assembly
- Do not include explanations or comments outside the assembly
- Keep the function structure equivalent

x86 Assembly:
{asm}

CFG:
{cfg}
"""

def _find_config_path(cli_config_path=None):
    """
    Resolve config file path in this order:
    1) --config argument
    2) ASM_TRANSLATION_CONFIG env var
    3) asm_translation_config.json in cwd or any parent
    4) asm_translation_config.json near this script or any parent
    """
    candidates = []

    if cli_config_path:
        candidates.append(Path(cli_config_path).expanduser())

    env_path = os.environ.get("ASM_TRANSLATION_CONFIG")
    if env_path:
        candidates.append(Path(env_path).expanduser())

    search_roots = [Path.cwd(), BASE_DIR]
    for root in search_roots:
        for parent in [root, *root.parents]:
            candidates.append(parent / DEFAULT_CONFIG_FILENAME)

    seen = set()
    for candidate in candidates:
        resolved = candidate.resolve(strict=False)
        key = str(resolved)
        if key in seen:
            continue
        seen.add(key)
        if resolved.exists() and resolved.is_file():
            return resolved

    return None


def _resolve_path(value, project_root):
    path = Path(value).expanduser()
    if path.is_absolute():
        return path
    return (project_root / path).resolve()


def load_runtime_config(cli_config_path=None):
    """Load runtime config and initialize global settings."""
    global MODEL_NAME, MAX_CONCURRENCY, MAX_RETRIES, RETRY_BASE_SECONDS
    global input_s_dir, input_test_dir, cfg_dir, results_base_dir

    config_path = _find_config_path(cli_config_path)
    config = dict(DEFAULT_CONFIG)
    project_root = BASE_DIR

    if config_path is not None:
        with open(config_path, "r", encoding="utf-8") as f:
            loaded = json.load(f)
        if not isinstance(loaded, dict):
            raise ValueError(f"Config must be a JSON object: {config_path}")
        config.update(loaded)
        project_root = config_path.parent

    MODEL_NAME = str(config["model_name"])
    MAX_CONCURRENCY = int(config["max_concurrency"])
    MAX_RETRIES = int(config["max_retries"])
    RETRY_BASE_SECONDS = float(config["retry_base_seconds"])

    input_s_dir = _resolve_path(config["input_s_dir"], project_root)
    input_test_dir = _resolve_path(config["input_test_dir"], project_root)
    cfg_dir = _resolve_path(config["cfg_dir"], project_root)
    results_base_dir = _resolve_path(config["results_dir"], project_root)

    return config_path


def _resolve_problem_filter(problem_filter, s_files):
    """Map user-friendly problem selectors to actual .s filenames."""
    query = problem_filter.strip()
    query_no_ext = query[:-2] if query.endswith(".s") else query

    candidates = {
        f"{query_no_ext}.s",
        f"{query_no_ext}_O2.s",
    }

    if query_no_ext.endswith("_O2"):
        candidates.add(f"{query_no_ext[:-3]}.s")

    if query_no_ext.isdigit():
        candidates.add(f"problem{query_no_ext}.s")
        candidates.add(f"problem{query_no_ext}_O2.s")

    matches = [name for name in s_files if name in candidates]
    if len(matches) == 1:
        return matches

    if len(matches) > 1:
        # Prefer optimized naming when both are present.
        preferred = [name for name in matches if name.endswith("_O2.s")]
        return preferred[:1] if preferred else matches[:1]

    return []

# -----------------------------
# Helpers
# -----------------------------

def clean_model_output(text):
    """
    Remove markdown fences if the model wraps assembly in code blocks.

    Downstream compilation expects plain assembly text.
    """
    if text is None:
        return ""

    text = text.replace("```asm", "")
    text = text.replace("```assembly", "")
    text = text.replace("```", "")

    return text.strip()


def _log(msg):
    """Print a timestamped log line for easier runtime monitoring."""
    now = time.strftime("%H:%M:%S")
    print(f"[{now}] {msg}")


def _read_text(path):
    """Read and return UTF-8 text file contents."""
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


def _write_text(path, content):
    """Write UTF-8 text to a file, replacing previous contents."""
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)


def _append_failure_log(problem, error, log_file):
    """Append one failure line to the shared log file."""
    with open(log_file, "a", encoding="utf-8") as f:
        f.write(f"{problem}: {error}\n")


class QuotaExhaustedError(RuntimeError):
    """Raised when the API reports a hard daily quota exhaustion."""

    def __init__(self, problem_name, retry_delay_seconds, raw_error):
        self.problem_name = problem_name
        self.retry_delay_seconds = retry_delay_seconds
        self.raw_error = raw_error

        if retry_delay_seconds is None:
            message = (
                f"Daily model quota exhausted while processing {problem_name}. "
                "Stopping run now; retry after quota reset."
            )
        else:
            hours = retry_delay_seconds // 3600
            minutes = (retry_delay_seconds % 3600) // 60
            seconds = retry_delay_seconds % 60
            message = (
                f"Daily model quota exhausted while processing {problem_name}. "
                f"Stopping run now; retry in about {hours}h{minutes}m{seconds}s."
            )

        super().__init__(message)


def _extract_retry_delay_seconds(error_text):
    """Extract retryDelay seconds from API error text if present."""
    match = re.search(r"retryDelay'\s*:\s*'(\d+)s'", error_text)
    if match:
        return int(match.group(1))
    return None


def _is_daily_quota_exhausted(error_text):
    """Detect hard daily request quota exhaustion for a model."""
    return (
        "RESOURCE_EXHAUSTED" in error_text
        and (
            "generate_requests_per_model_per_day" in error_text
            or "GenerateRequestsPerDayPerProjectPerModel" in error_text
        )
    )


async def log_failure(log_lock, problem, error, log_file):
    """Serialize concurrent log writes so lines do not interleave."""
    async with log_lock:
        await asyncio.to_thread(_append_failure_log, problem, error, log_file)


async def call_gemini_with_retry(aclient, prompt, problem_name):
    """
    Execute one model request with retry/backoff.

    Concurrency is controlled by the outer worker pool, so this function only
    handles retries and transient failures.
    """

    last_error = None

    for attempt in range(1, MAX_RETRIES + 1):
        try:
            _log(f"{problem_name}: sending request (attempt {attempt}/{MAX_RETRIES})")
            response = await aclient.models.generate_content(
                model=MODEL_NAME,
                contents=prompt
            )

            _log(f"{problem_name}: response received")
            return response.text if response.text else ""

        except Exception as e:
            error_text = str(e)
            if _is_daily_quota_exhausted(error_text):
                retry_delay_seconds = _extract_retry_delay_seconds(error_text)
                raise QuotaExhaustedError(
                    problem_name=problem_name,
                    retry_delay_seconds=retry_delay_seconds,
                    raw_error=error_text,
                ) from e

            last_error = e
            if attempt == MAX_RETRIES:
                break

            # Add jitter so many tasks do not retry again at exactly the same time.
            backoff = RETRY_BASE_SECONDS * (2 ** (attempt - 1)) + random.uniform(0.0, 0.25)
            print(
                f"Retrying {problem_name} after attempt {attempt}/{MAX_RETRIES} failed: {e} | "
                f"sleep {backoff:.2f}s"
            )
            await asyncio.sleep(backoff)

    raise last_error


async def process_one_problem(
    total_files,
    filename,
    start_time,
    aclient,
    log_lock,
    progress_lock,
    progress,
    arm_output_dir,
    prompt_dir,
    raw_output_dir,
    log_file,
):
    """
    Process a single problem end-to-end.

    Pipeline:
    1) skip if already translated (resume behavior)
    2) read x86 asm and CFG
    3) build and save prompt
    4) call Gemini
    5) save raw output and cleaned ARM assembly
    6) update shared progress counters
    """

    problem_name = filename.replace(".s", "")
    cfg_problem_name = problem_name
    _log(f"{problem_name}: worker started")

    arm_output_path = arm_output_dir / filename

    # Resume capability: do not reprocess existing translations.
    if arm_output_path.exists():
        async with progress_lock:
            progress["skipped"] += 1
            done = progress["completed"] + progress["failed"] + progress["skipped"]
            elapsed = time.time() - start_time
            print(f"[{done}/{total_files}] SKIP {filename} | elapsed: {elapsed:.1f}s")
        return

    try:
        input_path = input_s_dir / filename
        cfg_path = cfg_dir / f"{cfg_problem_name}_cfg.txt"
        _log(f"{problem_name}: loading asm/cfg")

        # Use to_thread for local blocking I/O so the event loop stays responsive.
        x86_asm = await asyncio.to_thread(_read_text, input_path)
        cfg_text = await asyncio.to_thread(_read_text, cfg_path)

        prompt = prompt_template.format(asm=x86_asm, cfg=cfg_text)

        # Save prompt for reproducibility
        prompt_path = prompt_dir / f"{problem_name}.txt"
        await asyncio.to_thread(_write_text, prompt_path, prompt)
        _log(f"{problem_name}: prompt saved")

        raw_output = await call_gemini_with_retry(aclient, prompt, problem_name)

        # Save raw model output
        raw_path = raw_output_dir / f"{problem_name}.txt"
        await asyncio.to_thread(_write_text, raw_path, raw_output if raw_output else "")
        _log(f"{problem_name}: raw output saved")

        arm_code = clean_model_output(raw_output)

        # Save cleaned ARM assembly
        await asyncio.to_thread(_write_text, arm_output_path, arm_code)
        _log(f"{problem_name}: arm assembly saved")

        async with progress_lock:
            progress["completed"] += 1
            done = progress["completed"] + progress["failed"] + progress["skipped"]
            elapsed = time.time() - start_time
            print(f"[{done}/{total_files}] OK   {filename} | elapsed: {elapsed:.1f}s")

    except QuotaExhaustedError:
        # Propagate so the orchestrator can stop the whole run immediately.
        raise

    except Exception as e:
        # Persist failure details for later inspection.
        await log_failure(log_lock, problem_name, str(e), log_file)

        async with progress_lock:
            progress["failed"] += 1
            done = progress["completed"] + progress["failed"] + progress["skipped"]
            elapsed = time.time() - start_time
            print(f"[{done}/{total_files}] FAIL {filename}: {e} | elapsed: {elapsed:.1f}s")


async def worker_loop(
    worker_id,
    total_files,
    filenames,
    start_time,
    aclient,
    stop_event,
    log_lock,
    progress_lock,
    progress,
    arm_output_dir,
    prompt_dir,
    raw_output_dir,
    log_file,
):
    """Consume filenames sequentially from a shared queue."""
    _log(f"worker-{worker_id}: started")
    while True:
        if stop_event.is_set():
            _log(f"worker-{worker_id}: stop requested")
            return

        try:
            filename = filenames.get_nowait()
        except asyncio.QueueEmpty:
            _log(f"worker-{worker_id}: no more files")
            return

        try:
            await process_one_problem(
                total_files=total_files,
                filename=filename,
                start_time=start_time,
                aclient=aclient,
                log_lock=log_lock,
                progress_lock=progress_lock,
                progress=progress,
                arm_output_dir=arm_output_dir,
                prompt_dir=prompt_dir,
                raw_output_dir=raw_output_dir,
                log_file=log_file,
            )
        except QuotaExhaustedError as e:
            stop_event.set()
            await log_failure(log_lock, "GLOBAL", str(e), log_file)
            _log(f"worker-{worker_id}: quota exhausted, stopping all workers")
            raise
        finally:
            filenames.task_done()

async def process_problems_async(output_dir_name="exp02", problem_filter=None):
    """
    Orchestrate concurrent processing for all discovered .s files.

    The async client context manager guarantees proper release of underlying
    network resources when all tasks complete.
    """

    output_dir = results_base_dir / output_dir_name
    prompt_dir = output_dir / "prompts"
    raw_output_dir = output_dir / "raw_model_output"
    arm_output_dir = output_dir / "riscv_asm"
    log_file = output_dir / "failures.log"

    prompt_dir.mkdir(parents=True, exist_ok=True)
    raw_output_dir.mkdir(parents=True, exist_ok=True)
    arm_output_dir.mkdir(parents=True, exist_ok=True)

    s_files = sorted([f for f in os.listdir(input_s_dir) if f.endswith(".s")])

    if problem_filter is not None:
        s_files = _resolve_problem_filter(problem_filter, s_files)
        if not s_files:
            print(
                f"Problem '{problem_filter}' not found in {input_s_dir}. "
                "Try problem42, problem42_O2, problem42.s, or problem42_O2.s"
            )
            return

    total_files = len(s_files)
    start_time = time.time()

    _log("Starting experiment run")
    _log(f"Model: {MODEL_NAME}")
    _log(f"Max concurrency: {MAX_CONCURRENCY}")
    _log(f"Max retries: {MAX_RETRIES}")
    _log(f"Input asm dir: {input_s_dir}")
    _log(f"Input cfg dir: {cfg_dir}")
    _log(f"Output dir: {output_dir}")
    _log(f"Problem filter: {problem_filter if problem_filter else 'all'}")
    _log(f"Discovered .s files: {total_files}")

    if total_files == 0:
        print(f"No .s files found in {input_s_dir}")
        return

    # Shared synchronization primitives for the worker pool.
    log_lock = asyncio.Lock()
    progress_lock = asyncio.Lock()
    progress = {"completed": 0, "failed": 0, "skipped": 0}
    worker_count = max(1, MAX_CONCURRENCY)
    stop_event = asyncio.Event()

    filenames = asyncio.Queue()
    for filename in s_files:
        filenames.put_nowait(filename)

    # One shared async client for all tasks; cleaned up automatically on exit.
    _log("Opening async Gemini client")
    async with genai.Client().aio as aclient:
        _log(f"Scheduling {worker_count} worker tasks")
        tasks = [
            asyncio.create_task(
                worker_loop(
                    worker_id=index,
                    total_files=total_files,
                    filenames=filenames,
                    start_time=start_time,
                    aclient=aclient,
                    stop_event=stop_event,
                    log_lock=log_lock,
                    progress_lock=progress_lock,
                    progress=progress,
                    arm_output_dir=arm_output_dir,
                    prompt_dir=prompt_dir,
                    raw_output_dir=raw_output_dir,
                    log_file=log_file,
                )
            )
            for index in range(1, worker_count + 1)
        ]

        # Wait for all scheduled problem tasks to finish.
        _log(f"Awaiting completion of {len(tasks)} tasks")
        quota_stop_error = None
        try:
            await asyncio.gather(*tasks)
        except QuotaExhaustedError as e:
            quota_stop_error = e
            stop_event.set()
            _log(str(e))
            for task in tasks:
                if not task.done():
                    task.cancel()
            await asyncio.gather(*tasks, return_exceptions=True)

    _log("Async Gemini client closed")

    elapsed = time.time() - start_time
    print(
        "Finished "
        f"completed={progress['completed']} "
        f"failed={progress['failed']} "
        f"skipped={progress['skipped']} "
        f"total={total_files} "
        f"elapsed={elapsed:.1f}s"
    )
    if quota_stop_error is not None:
        print(f"Stopped early: {quota_stop_error}")


# -----------------------------
# Run experiment
# -----------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Translate O2-optimized x86 assembly to RISC-V using Gemini."
    )
    parser.add_argument(
        "--config",
        default=None,
        metavar="PATH",
        help=(
            "Path to runtime JSON config. If omitted, the script looks for "
            "asm_translation_config.json in cwd/script parent directories or "
            "uses ASM_TRANSLATION_CONFIG."
        ),
    )
    parser.add_argument(
        "--output-dir",
        default="exp02",
        metavar="NAME",
        help="Output directory name under results/ (default: exp02)",
    )
    parser.add_argument(
        "--problem",
        default=None,
        metavar="NAME",
        help="Process a single problem, e.g. 'problem1' or 'problem1.s'. Omit to process all.",
    )
    args = parser.parse_args()
    cfg_path = load_runtime_config(args.config)
    if cfg_path is not None:
        _log(f"Loaded runtime config: {cfg_path}")
    else:
        _log("No runtime config found; using built-in defaults")
    asyncio.run(process_problems_async(output_dir_name=args.output_dir, problem_filter=args.problem))