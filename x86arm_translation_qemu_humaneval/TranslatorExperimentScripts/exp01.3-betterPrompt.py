from google import genai
import asyncio
import os
import random
import time
from shared_config import INPUT_S_DIR, INPUT_TEST_DIR, experiment_output_dir

"""
parallelized exp01
experiment 01.1: parallelized single prompt, no CFG, gemini on clang15 o2 optimized x86 humaneval asm code

This version preserves the original per-problem translation logic but runs many
problems concurrently with a bounded number of in-flight model requests.
"""

# --- Configuration ---
input_s_dir = INPUT_S_DIR
input_test_dir = INPUT_TEST_DIR
# cfg_dir = CFG_DIR

output_dir = experiment_output_dir("exp01.3")

prompt_dir = output_dir / "prompts"
raw_output_dir = output_dir / "raw_model_output"
arm_output_dir = output_dir / "arm_asm"
log_file = output_dir / "failures.log"

prompt_template = """Translate the following O2 optimized x86-64 assembly function to Linux ARMv8 AArch64 assembly.

Goal:
Produce a single AArch64 function that is behaviorally equivalent to the input function and compiles with:
clang-17 -c <file>.s -target aarch64-linux-gnu

Hard requirements:
- Output only assembly text. No markdown fences. No prose.
- Do not emit any architecture marker tokens as standalone instructions (forbidden examples: arm, armv8, aarch64).
- Preserve exact semantics, including edge cases, signedness, overflow behavior, and return values.
- Keep the translated function self-contained and callable by C test harnesses.
- Use the same ABI contract as the source function.

AArch64 legality constraints (must satisfy all):
- Never emit illegal logical-immediate forms for and/eor/orr/tst.
  - If an immediate is not encodable as a logical immediate, materialize it in a register and use register-register form.
- Never emit large constants with a single mov when not encodable.
  - Use movz/movk (or a legal equivalent) to construct full constants.
- Ensure load/store indexed addressing scale matches access width.
  - Example: for ldr wN, valid scaled register offset is #0 or #2, not #3.
- Ensure every instruction mnemonic is valid AArch64 GNU/LLVM syntax for -target aarch64-linux-gnu.

Register and control-flow safety constraints:
- Do not clobber pointer/base argument registers before their last memory use.
- If x0 is used as an input pointer later, keep it as a stable base or copy it to a dedicated base register first.
- Keep accumulator/result registers separate from live pointer bases.
- Preserve loop structure and branch predicates so algorithmic behavior is unchanged.

Function/assembly hygiene:
- Emit one function named func0 with a proper symbol export (.globl func0).
- Include .text, alignment, and .type/.size directives in GNU-compatible style.
- Keep stack usage and callee-saved register handling ABI-correct.
- Do not call helper routines unless the source semantics requires those calls.

Pre-output self-check (perform internally before finalizing):
1) Assembler legality check for immediates, addressing modes, mnemonics, and directives.
2) ABI/register-liveness check that no live pointer base is overwritten by arithmetic/result temporaries.
3) Semantic check that each branch/loop and compare condition matches source intent.

Output format:
- Return only the final ARMv8 AArch64 assembly for func0.

x86 Assembly:
{asm}
"""

MODEL_NAME="gemini-3-flash-preview"
# Controls how many model calls can happen simultaneously.
MAX_CONCURRENCY = 80
# Total attempts for transient failures (initial try + retries).
MAX_RETRIES = 3
# Base retry delay for exponential backoff.
RETRY_BASE_SECONDS = 2.0

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


async def log_failure(log_lock, problem, error):
    """Serialize concurrent log writes so lines do not interleave."""
    async with log_lock:
        await asyncio.to_thread(_append_failure_log, problem, error)


async def call_gemini_with_retry(aclient, semaphore, prompt, problem_name):
    """
    Execute one model request with bounded concurrency and retry/backoff.

    The semaphore keeps request pressure within a configured limit. Retries with
    exponential backoff absorb temporary API/network failures.
    """

    last_error = None

    for attempt in range(1, MAX_RETRIES + 1):
        try:
            _log(f"{problem_name}: sending request (attempt {attempt}/{MAX_RETRIES})")
            async with semaphore:
                response = await aclient.models.generate_content(
                    model=MODEL_NAME,
                    contents=prompt
                )

            _log(f"{problem_name}: response received")
            return response.text if response.text else ""

        except Exception as e:
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
    index,
    total_files,
    filename,
    start_time,
    aclient,
    semaphore,
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
        # cfg_path = cfg_dir / f"{cfg_problem_name}_cfg.txt"
        _log(f"{problem_name}: loading asm")

        # Use to_thread for local blocking I/O so the event loop stays responsive.
        x86_asm = await asyncio.to_thread(_read_text, input_path)
        # cfg_text = await asyncio.to_thread(_read_text, cfg_path)

        # prompt = prompt_template.format(asm=x86_asm, cfg=cfg_text)
        prompt = prompt_template.format(asm=x86_asm)

        # Save prompt for reproducibility
        prompt_path = prompt_dir / f"{problem_name}.txt"
        await asyncio.to_thread(_write_text, prompt_path, prompt)
        _log(f"{problem_name}: prompt saved")

        raw_output = await call_gemini_with_retry(aclient, semaphore, prompt, problem_name)

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

    except Exception as e:
        # Persist failure details for later inspection.
        await log_failure(log_lock, problem_name, str(e))

        async with progress_lock:
            progress["failed"] += 1
            done = progress["completed"] + progress["failed"] + progress["skipped"]
            elapsed = time.time() - start_time
            print(f"[{done}/{total_files}] FAIL {filename}: {e} | elapsed: {elapsed:.1f}s")

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
    # _log(f"Input cfg dir: {cfg_dir}")
    _log(f"Output dir: {output_dir}")
    _log(f"Discovered .s files: {total_files}")

    if total_files == 0:
        print(f"No .s files found in {input_s_dir}")
        return

    # Shared synchronization primitives for the worker pool.
    semaphore = asyncio.Semaphore(MAX_CONCURRENCY)
    log_lock = asyncio.Lock()
    progress_lock = asyncio.Lock()
    progress = {"completed": 0, "failed": 0, "skipped": 0}

    # One shared async client for all tasks; cleaned up automatically on exit.
    _log("Opening async Gemini client")
    async with genai.Client().aio as aclient:
        _log("Scheduling worker tasks")
        tasks = [
            asyncio.create_task(
                process_one_problem(
                    index=index,
                    total_files=total_files,
                    filename=filename,
                    start_time=start_time,
                    aclient=aclient,
                    semaphore=semaphore,
                    log_lock=log_lock,
                    progress_lock=progress_lock,
                    progress=progress,
                )
            )
            for index, filename in enumerate(s_files, start=1)
        ]

        # Wait for all scheduled problem tasks to finish.
        _log(f"Awaiting completion of {len(tasks)} tasks")
        await asyncio.gather(*tasks)

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


# -----------------------------
# Run experiment
# -----------------------------

if __name__ == "__main__":
    asyncio.run(process_problems_async())