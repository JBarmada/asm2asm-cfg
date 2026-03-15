from google import genai
import argparse
import json
import os
import time
from pathlib import Path

"""
Batch API version of exp02.2.

experiment 02: single prompt + CFG on clang15 O2 optimized x86 HumanEval asm.
This script uses Gemini Batch API (file input) rather than interactive calls.

Usage:
1) Submit a new batch job and wait for completion:
    python x86_arm_translation_qemu_humaneval/exp02.2_batch_single_cfg.py

2) Resume polling/collection for an existing cloud batch job:
    python x86_arm_translation_qemu_humaneval/exp02.2_batch_single_cfg.py \
      --resume-job batches/<job_id> \
      --metadata-path x86_arm_translation_qemu_humaneval/results/exp02.2/batch_jobs/metadata_<timestamp>.json
"""

# --- Configuration ---
BASE_DIR = Path(__file__).resolve().parent
input_s_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "asm"
cfg_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "cfg"

output_dir = BASE_DIR / "results" / "exp02.2"
prompt_dir = output_dir / "prompts"
raw_output_dir = output_dir / "raw_model_output"
arm_output_dir = output_dir / "arm_asm"
log_file = output_dir / "failures.log"
batch_dir = output_dir / "batch_jobs"

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

MODEL_NAME = "gemini-3.1-pro-preview"
POLL_SECONDS = 30

COMPLETED_BATCH_STATES = {
    "JOB_STATE_SUCCEEDED",
    "JOB_STATE_FAILED",
    "JOB_STATE_CANCELLED",
    "JOB_STATE_EXPIRED",
}


# -----------------------------
# Directory setup
# -----------------------------
prompt_dir.mkdir(parents=True, exist_ok=True)
raw_output_dir.mkdir(parents=True, exist_ok=True)
arm_output_dir.mkdir(parents=True, exist_ok=True)
batch_dir.mkdir(parents=True, exist_ok=True)


# -----------------------------
# Helpers
# -----------------------------
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


def clean_model_output(text):
    if text is None:
        return ""

    text = text.replace("```asm", "")
    text = text.replace("```assembly", "")
    text = text.replace("```", "")
    return text.strip()


def extract_text_from_response_obj(response_obj):
    """Extract text from a JSON response object in batch result lines."""
    if not response_obj:
        return ""

    texts = []
    for candidate in response_obj.get("candidates", []):
        content = candidate.get("content", {})
        for part in content.get("parts", []):
            part_text = part.get("text")
            if isinstance(part_text, str):
                texts.append(part_text)

    return "\n".join(texts).strip()


def build_batch_requests(pending_files):
    """Prepare JSONL lines and prompt files for all pending requests."""
    requests = []
    key_to_filename = {}

    for filename in pending_files:
        problem_name = filename.replace(".s", "")
        input_path = input_s_dir / filename
        cfg_path = cfg_dir / f"{problem_name}_cfg.txt"

        x86_asm = _read_text(input_path)
        cfg_text = _read_text(cfg_path)
        prompt = prompt_template.format(asm=x86_asm, cfg=cfg_text)

        # Save prompt for reproducibility.
        prompt_path = prompt_dir / f"{problem_name}.txt"
        _write_text(prompt_path, prompt)

        request_obj = {
            "key": problem_name,
            "request": {
                "contents": [
                    {
                        "role": "user",
                        "parts": [{"text": prompt}],
                    }
                ]
            },
        }

        requests.append(request_obj)
        key_to_filename[problem_name] = filename

    return requests, key_to_filename


def parse_args():
    parser = argparse.ArgumentParser(description="Run or resume Gemini Batch API translation job.")
    parser.add_argument(
        "--resume-job",
        default=None,
        help="Existing batch job name to resume (example: batches/123456789).",
    )
    parser.add_argument(
        "--metadata-path",
        default=None,
        help="Path to metadata JSON file written during submission.",
    )
    return parser.parse_args()


def read_metadata(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_key_to_filename_from_requests_jsonl(requests_jsonl_path):
    """Rebuild key->filename map from a previously submitted JSONL request file."""
    key_to_filename = {}
    with open(requests_jsonl_path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            row = json.loads(line)
            key = row.get("key")
            if isinstance(key, str) and key:
                key_to_filename[key] = f"{key}.s"
    return key_to_filename


def write_jsonl(path, rows):
    with open(path, "w", encoding="utf-8") as f:
        for row in rows:
            f.write(json.dumps(row, ensure_ascii=True) + "\n")


def create_batch_job(client, requests_jsonl_path):
    timestamp = time.strftime("%Y%m%d_%H%M%S")
    display_name = f"exp02.2-batch-single-cfg-{timestamp}"

    _log(f"Uploading batch input file: {requests_jsonl_path}")
    uploaded_file = client.files.upload(
        file=str(requests_jsonl_path),
        config={
            "display_name": requests_jsonl_path.stem,
            "mime_type": "jsonl",
        },
    )

    _log(f"Creating batch job with model {MODEL_NAME}")
    batch_job = client.batches.create(
        model=MODEL_NAME,
        src=uploaded_file.name,
        config={"display_name": display_name},
    )

    return uploaded_file, batch_job


def wait_for_batch_completion(client, batch_job_name):
    _log(f"Polling batch job status: {batch_job_name}")

    batch_job = client.batches.get(name=batch_job_name)
    while batch_job.state.name not in COMPLETED_BATCH_STATES:
        _log(f"Current state: {batch_job.state.name}; sleeping {POLL_SECONDS}s")
        time.sleep(POLL_SECONDS)
        batch_job = client.batches.get(name=batch_job_name)

    _log(f"Batch job finished with state: {batch_job.state.name}")
    return batch_job


def handle_batch_result_file(client, batch_job, key_to_filename):
    """Download and process JSONL output from a file-backed batch job."""
    if not (batch_job.dest and batch_job.dest.file_name):
        raise RuntimeError("Batch job succeeded but no result file was returned.")

    result_file_name = batch_job.dest.file_name
    _log(f"Downloading result file: {result_file_name}")
    file_content = client.files.download(file=result_file_name).decode("utf-8")

    completed = 0
    failed = 0

    for line in file_content.splitlines():
        if not line.strip():
            continue

        row = json.loads(line)
        key = row.get("key")

        if not key:
            failed += 1
            _append_failure_log("UNKNOWN", f"Missing key in result row: {row}")
            continue

        filename = key_to_filename.get(key, f"{key}.s")

        if row.get("error"):
            failed += 1
            _append_failure_log(key, str(row.get("error")))
            continue

        response_obj = row.get("response")
        raw_text = extract_text_from_response_obj(response_obj)

        raw_path = raw_output_dir / f"{key}.txt"
        _write_text(raw_path, raw_text)

        arm_code = clean_model_output(raw_text)
        arm_output_path = arm_output_dir / filename
        _write_text(arm_output_path, arm_code)

        completed += 1

    return completed, failed


def wait_and_collect_batch_results(client, batch_job_name, key_to_filename):
    """Poll an existing batch job and collect outputs once completed."""
    final_job = wait_for_batch_completion(client, batch_job_name)

    if final_job.state.name != "JOB_STATE_SUCCEEDED":
        error_text = str(final_job.error) if getattr(final_job, "error", None) else "No error details"
        _append_failure_log("GLOBAL", f"Batch failed with state {final_job.state.name}: {error_text}")
        print(f"Batch ended with state: {final_job.state.name}")
        return 0, 0, final_job.state.name

    completed, failed = handle_batch_result_file(client, final_job, key_to_filename)
    return completed, failed, final_job.state.name


def process_problems_batch():
    args = parse_args()

    s_files = sorted([f for f in os.listdir(input_s_dir) if f.endswith(".s")])
    total_files = len(s_files)

    _log("Starting batch experiment run")
    _log(f"Model: {MODEL_NAME}")
    _log(f"Input asm dir: {input_s_dir}")
    _log(f"Input cfg dir: {cfg_dir}")
    _log(f"Output dir: {output_dir}")
    _log(f"Discovered .s files: {total_files}")

    if total_files == 0:
        print(f"No .s files found in {input_s_dir}")
        return

    skipped = 0
    pending_files = []
    for filename in s_files:
        if (arm_output_dir / filename).exists():
            skipped += 1
        else:
            pending_files.append(filename)

    _log(f"Skipped existing outputs: {skipped}")
    _log(f"Pending for batch submission: {len(pending_files)}")

    if not pending_files and not args.resume_job:
        print(
            f"Finished completed=0 failed=0 skipped={skipped} total={total_files} elapsed=0.0s"
        )
        return

    start_time = time.time()
    client = genai.Client()

    if args.resume_job:
        key_to_filename = {}
        if args.metadata_path:
            metadata = read_metadata(args.metadata_path)
            requests_jsonl = metadata.get("requests_jsonl")
            if requests_jsonl:
                key_to_filename = load_key_to_filename_from_requests_jsonl(requests_jsonl)

        _log(f"Resuming existing batch job: {args.resume_job}")
        completed, failed, _ = wait_and_collect_batch_results(
            client=client,
            batch_job_name=args.resume_job,
            key_to_filename=key_to_filename,
        )

        elapsed = time.time() - start_time
        print(
            "Finished "
            f"completed={completed} failed={failed} skipped={skipped} "
            f"total={total_files} elapsed={elapsed:.1f}s"
        )
        return

    try:
        requests, key_to_filename = build_batch_requests(pending_files)

        timestamp = time.strftime("%Y%m%d_%H%M%S")
        requests_jsonl_path = batch_dir / f"requests_{timestamp}.jsonl"
        metadata_path = batch_dir / f"metadata_{timestamp}.json"

        write_jsonl(requests_jsonl_path, requests)

        _, created_batch_job = create_batch_job(client, requests_jsonl_path)
        _log(f"Created batch job: {created_batch_job.name}")

        _write_text(
            metadata_path,
            json.dumps(
                {
                    "model": MODEL_NAME,
                    "request_count": len(requests),
                    "requests_jsonl": str(requests_jsonl_path),
                    "batch_job_name": created_batch_job.name,
                    "created_at": timestamp,
                },
                indent=2,
            ),
        )
        _log(f"Saved metadata: {metadata_path}")

        completed, failed, final_state = wait_and_collect_batch_results(
            client=client,
            batch_job_name=created_batch_job.name,
            key_to_filename=key_to_filename,
        )

        elapsed = time.time() - start_time
        if final_state != "JOB_STATE_SUCCEEDED":
            print(
                "Finished "
                f"completed=0 failed={len(pending_files)} skipped={skipped} "
                f"total={total_files} elapsed={elapsed:.1f}s"
            )
            return

        print(
            "Finished "
            f"completed={completed} failed={failed} skipped={skipped} "
            f"total={total_files} elapsed={elapsed:.1f}s"
        )

    except Exception as e:
        _append_failure_log("GLOBAL", str(e))
        elapsed = time.time() - start_time
        print(f"Batch run failed early after {elapsed:.1f}s: {e}")


if __name__ == "__main__":
    process_problems_batch()
