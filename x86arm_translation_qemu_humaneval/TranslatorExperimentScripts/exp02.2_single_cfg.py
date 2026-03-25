from google import genai
import asyncio
import os
import random
import re
import time
from shared_config import CFG_DIR, INPUT_S_DIR, INPUT_TEST_DIR, experiment_output_dir

"""
parallelized exp02
experiment 02: single prompt, CFG, gemini on clang15 o2 optimized x86 humaneval asm code

This version preserves the original per-problem translation logic but runs many
problems concurrently with a bounded number of in-flight model requests.
"""

# --- Configuration ---
input_s_dir = INPUT_S_DIR
input_test_dir = INPUT_TEST_DIR
cfg_dir = CFG_DIR

output_dir = experiment_output_dir("exp02.2")

prompt_dir = output_dir / "prompts"
raw_output_dir = output_dir / "raw_model_output"
arm_output_dir = output_dir / "arm_asm"
log_file = output_dir / "failures.log"

prompt_template = """Translate the following O2 optimized x86 assembly code to ARMv8 AArch64 assembly code.

The input assembly code represents a compiled function that solves a programming problem.
The provided CFG describes the function control flow and should be used to improve translation correctness.

Requirements:
- Preserve the function behavior exactly
- Output only ARMv8 assembly
- Do not include explanations or comments outside the assembly
- Keep the function structure equivalent

x86 Assembly:
{asm}

CFG:
{cfg}
"""

MODEL_NAME="gemini-3.1-pro-preview"
# Controls how many model calls can happen simultaneously.
MAX_CONCURRENCY = 1
# Total attempts for transient failures (initial try + retries).
MAX_RETRIES = 3
# Base retry delay for exponential backoff.
RETRY_BASE_SECONDS = 3.0

# -----------------------------
# Directory setup
# -----------------------------

prompt_dir.mkdir(parents=True, exist_ok=True)
raw_output_dir.mkdir(parents=True, exist_ok=True)
arm_output_dir.mkdir(parents=True, exist_ok=True)

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


def _append_failure_log(problem, error):
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


async def log_failure(log_lock, problem, error):
    """Serialize concurrent log writes so lines do not interleave."""
    async with log_lock:
        await asyncio.to_thread(_append_failure_log, problem, error)


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
        await log_failure(log_lock, problem_name, str(e))

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
            )
        except QuotaExhaustedError as e:
            stop_event.set()
            await log_failure(log_lock, "GLOBAL", str(e))
            _log(f"worker-{worker_id}: quota exhausted, stopping all workers")
            raise
        finally:
            filenames.task_done()

async def process_problems_async():
    """
    Orchestrate concurrent processing for all discovered .s files.

    The async client context manager guarantees proper release of underlying
    network resources when all tasks complete.
    """

    s_files = sorted([f for f in os.listdir(input_s_dir) if f.endswith(".s")])
    total_files = len(s_files)
    start_time = time.time()

    _log("Starting experiment run")
    _log(f"Model: {MODEL_NAME}")
    _log(f"Max concurrency: {MAX_CONCURRENCY}")
    _log(f"Max retries: {MAX_RETRIES}")
    _log(f"Input asm dir: {input_s_dir}")
    _log(f"Input cfg dir: {cfg_dir}")
    _log(f"Output dir: {output_dir}")
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
    asyncio.run(process_problems_async())