from google import genai
import argparse
import json
import os
import time
from pathlib import Path

"""
Batch API translation runner.

This script uses Gemini Batch API (file input) and supports:
- no-CFG prompt mode (default)
- CFG prompt mode via --cfg / --use-cfg
- configurable output run directory via --output-dir
- runtime JSON config loading like exp1/exp2 scripts

Quick usage:
- Run all problems (default no-CFG, default run dir exp_batch):
    python x86riscv-translation/gemini/batch.py
- Run all problems with CFG prompts:
    python x86riscv-translation/gemini/batch.py --cfg
- Run all problems into results/my_run:
    python x86riscv-translation/gemini/batch.py --output-dir my_run
- Use explicit runtime config file:
    python x86riscv-translation/gemini/batch.py --config asm_translation_config.json
- Combine options:
    python x86riscv-translation/gemini/batch.py --cfg --output-dir my_run --config asm_translation_config.json

Usage:
1) Submit a new batch job and wait for completion:
    python x86riscv-translation/gemini/batch.py

2) Resume polling/collection for an existing cloud batch job:
    python x86riscv-translation/gemini/batch.py \
      --resume-job batches/<job_id> \
      --metadata-path x86riscv-translation/gemini/results/<run_name>/batch_jobs/metadata_<timestamp>.json

3) Cancel an existing cloud batch job:
        python x86riscv-translation/gemini/batch.py \
            --cancel-job batches/<job_id>
"""

# --- Configuration ---
BASE_DIR = Path(__file__).resolve().parent
DEFAULT_CONFIG_FILENAME = "asm_translation_config.json"
DEFAULT_CONFIG = {
    "model_name": "gemini-3.1-pro-preview",
    "poll_seconds": 30,
    "input_s_dir": "Compiledown_HumanEval_O2/x86/asm",
    "cfg_dir": "Compiledown_HumanEval_O2/x86/cfg",
    "results_dir": "x86riscv-translation/gemini/results",
}

MODEL_NAME = DEFAULT_CONFIG["model_name"]
POLL_SECONDS = DEFAULT_CONFIG["poll_seconds"]
input_s_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "asm"
cfg_dir = BASE_DIR.parent / "Compiledown_HumanEval_O2" / "x86" / "cfg"
results_base_dir = BASE_DIR / "results"

prompt_template_no_cfg = """Translate the following O2 optimized x86 assembly code to RISC-V assembly code.

The input assembly code represents a compiled function that solves a programming problem.

Requirements:
- Preserve the function behavior exactly
- Output only RISC-V assembly
- Do not include explanations or comments outside the assembly
- Keep the function structure equivalent

x86 Assembly:
{asm}

"""

prompt_template_cfg = """Translate the following O2 optimized x86 assembly code to RISC-V assembly code.

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

COMPLETED_BATCH_STATES = {
    "JOB_STATE_SUCCEEDED",
    "JOB_STATE_FAILED",
    "JOB_STATE_CANCELLED",
    "JOB_STATE_EXPIRED",
}


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
    global MODEL_NAME, POLL_SECONDS
    global input_s_dir, cfg_dir, results_base_dir

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
    POLL_SECONDS = int(config["poll_seconds"])
    input_s_dir = _resolve_path(config["input_s_dir"], project_root)
    cfg_dir = _resolve_path(config["cfg_dir"], project_root)
    results_base_dir = _resolve_path(config["results_dir"], project_root)

    return config_path


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


def _append_failure_log(problem, error, log_file):
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


def build_batch_requests(pending_files, prompt_dir, use_cfg):
    """Prepare JSONL lines and prompt files for all pending requests."""
    requests = []
    key_to_filename = {}

    for filename in pending_files:
        problem_name = filename.replace(".s", "")
        input_path = input_s_dir / filename

        x86_asm = _read_text(input_path)
        if use_cfg:
            cfg_path = cfg_dir / f"{problem_name}_cfg.txt"
            cfg_text = _read_text(cfg_path)
            prompt = prompt_template_cfg.format(asm=x86_asm, cfg=cfg_text)
        else:
            prompt = prompt_template_no_cfg.format(asm=x86_asm)

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
        default="exp_batch",
        metavar="NAME",
        help="Output directory name under results/ (default: exp_batch)",
    )
    parser.add_argument(
        "--cfg",
        "--use-cfg",
        action="store_true",
        dest="use_cfg",
        help="Include CFG text in prompts (default: no CFG).",
    )
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
    parser.add_argument(
        "--cancel-job",
        default=None,
        help="Existing batch job name to cancel (example: batches/123456789).",
    )
    parser.add_argument(
        "--yes",
        action="store_true",
        help="Skip interactive confirmation before submitting a new batch job.",
    )
    return parser.parse_args()


def confirm_batch_submission(
    *,
    output_dir,
    input_s_dir,
    cfg_dir,
    use_cfg,
    model_name,
    total_files,
    skipped,
    pending_files,
):
    """Prompt for user confirmation before submitting a new cloud batch job."""
    print("About to submit a Gemini batch job with these settings:")
    print(f"- model: {model_name}")
    print(f"- prompt mode: {'cfg' if use_cfg else 'no-cfg'}")
    print(f"- input asm dir: {input_s_dir}")
    if use_cfg:
        print(f"- input cfg dir: {cfg_dir}")
    print(f"- output dir: {output_dir}")
    print(f"- total discovered files: {total_files}")
    print(f"- skipped existing outputs: {skipped}")
    print(f"- pending submission count: {len(pending_files)}")

    preview = ", ".join(pending_files[:5])
    if preview:
        suffix = " ..." if len(pending_files) > 5 else ""
        print(f"- pending preview: {preview}{suffix}")

    answer = input("Proceed with batch submission? [y/N]: ").strip().lower()
    return answer in {"y", "yes"}


def read_metadata(path):
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def find_metadata_for_batch_job(results_base_dir, batch_job_name):
    """Search saved metadata files for a matching batch job name."""
    if not results_base_dir.exists():
        return None

    for metadata_path in sorted(results_base_dir.glob("*/batch_jobs/metadata_*.json"), reverse=True):
        try:
            metadata = read_metadata(metadata_path)
        except Exception:
            continue

        if metadata.get("batch_job_name") == batch_job_name:
            return metadata_path, metadata

    return None, None


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


def create_batch_job(client, requests_jsonl_path, use_cfg):
    timestamp = time.strftime("%Y%m%d_%H%M%S")
    mode = "cfg" if use_cfg else "no-cfg"
    display_name = f"riscv-batch-{mode}-{timestamp}"

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


def handle_batch_result_file(client, batch_job, key_to_filename, raw_output_dir, riscv_output_dir, log_file):
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
            _append_failure_log("UNKNOWN", f"Missing key in result row: {row}", log_file)
            continue

        filename = key_to_filename.get(key, f"{key}.s")

        if row.get("error"):
            failed += 1
            _append_failure_log(key, str(row.get("error")), log_file)
            continue

        response_obj = row.get("response")
        raw_text = extract_text_from_response_obj(response_obj)

        raw_path = raw_output_dir / f"{key}.txt"
        _write_text(raw_path, raw_text)

        riscv_code = clean_model_output(raw_text)
        riscv_output_path = riscv_output_dir / filename
        _write_text(riscv_output_path, riscv_code)

        completed += 1

    return completed, failed


def wait_and_collect_batch_results(client, batch_job_name, key_to_filename, raw_output_dir, riscv_output_dir, log_file):
    """Poll an existing batch job and collect outputs once completed."""
    final_job = wait_for_batch_completion(client, batch_job_name)

    if final_job.state.name != "JOB_STATE_SUCCEEDED":
        error_text = str(final_job.error) if getattr(final_job, "error", None) else "No error details"
        _append_failure_log("GLOBAL", f"Batch failed with state {final_job.state.name}: {error_text}", log_file)
        print(f"Batch ended with state: {final_job.state.name}")
        return 0, 0, final_job.state.name

    completed, failed = handle_batch_result_file(
        client,
        final_job,
        key_to_filename,
        raw_output_dir,
        riscv_output_dir,
        log_file,
    )
    return completed, failed, final_job.state.name


def cancel_batch_job(client, batch_job_name):
    """Cancel an existing cloud batch job."""
    _log(f"Cancelling batch job: {batch_job_name}")
    client.batches.cancel(name=batch_job_name)
    cancelled_job = client.batches.get(name=batch_job_name)
    _log(f"Batch job state after cancel request: {cancelled_job.state.name}")
    return cancelled_job


def process_problems_batch():
    args = parse_args()
    if args.resume_job and args.cancel_job:
        raise ValueError("Use either --resume-job or --cancel-job, not both.")

    cfg_path = load_runtime_config(args.config)
    if cfg_path is not None:
        _log(f"Loaded runtime config: {cfg_path}")
    else:
        _log("No runtime config found; using built-in defaults")

    metadata = None
    metadata_path = None
    effective_use_cfg = args.use_cfg

    if args.resume_job:
        if args.metadata_path:
            metadata_path = Path(args.metadata_path).expanduser().resolve()
            metadata = read_metadata(metadata_path)
        else:
            metadata_path, metadata = find_metadata_for_batch_job(results_base_dir, args.resume_job)

        if metadata is not None:
            saved_output_dir = metadata.get("output_dir")
            if saved_output_dir:
                output_dir = Path(saved_output_dir).expanduser().resolve()
            else:
                output_dir = results_base_dir / args.output_dir

            if "use_cfg" in metadata:
                effective_use_cfg = bool(metadata["use_cfg"])

            _log(f"Loaded batch metadata: {metadata_path}")
        else:
            output_dir = results_base_dir / args.output_dir
            _log("No saved metadata found for resume job; using CLI/default output settings")
    else:
        output_dir = results_base_dir / args.output_dir

    prompt_dir = output_dir / "prompts"
    raw_output_dir = output_dir / "raw_model_output"
    riscv_output_dir = output_dir / "riscv_asm"
    log_file = output_dir / "failures.log"
    batch_dir = output_dir / "batch_jobs"

    prompt_dir.mkdir(parents=True, exist_ok=True)
    raw_output_dir.mkdir(parents=True, exist_ok=True)
    riscv_output_dir.mkdir(parents=True, exist_ok=True)
    batch_dir.mkdir(parents=True, exist_ok=True)

    s_files = sorted([f for f in os.listdir(input_s_dir) if f.endswith(".s")])
    total_files = len(s_files)

    _log("Starting batch experiment run")
    _log(f"Model: {MODEL_NAME}")
    _log(f"Prompt mode: {'cfg' if effective_use_cfg else 'no-cfg'}")
    _log(f"Input asm dir: {input_s_dir}")
    if effective_use_cfg:
        _log(f"Input cfg dir: {cfg_dir}")
    _log(f"Output dir: {output_dir}")
    _log(f"Discovered .s files: {total_files}")

    if total_files == 0:
        print(f"No .s files found in {input_s_dir}")
        return

    skipped = 0
    pending_files = []
    for filename in s_files:
        if (riscv_output_dir / filename).exists():
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

    if args.cancel_job:
        cancelled_job = cancel_batch_job(client, args.cancel_job)
        elapsed = time.time() - start_time
        print(f"Cancelled job {args.cancel_job}; current state={cancelled_job.state.name}; elapsed={elapsed:.1f}s")
        return

    if args.resume_job:
        key_to_filename = {}
        if metadata is not None:
            requests_jsonl = metadata.get("requests_jsonl")
            if requests_jsonl:
                key_to_filename = load_key_to_filename_from_requests_jsonl(requests_jsonl)

        _log(f"Resuming existing batch job: {args.resume_job}")
        completed, failed, _ = wait_and_collect_batch_results(
            client=client,
            batch_job_name=args.resume_job,
            key_to_filename=key_to_filename,
            raw_output_dir=raw_output_dir,
            riscv_output_dir=riscv_output_dir,
            log_file=log_file,
        )

        elapsed = time.time() - start_time
        print(
            "Finished "
            f"completed={completed} failed={failed} skipped={skipped} "
            f"total={total_files} elapsed={elapsed:.1f}s"
        )
        return

    try:
        requests, key_to_filename = build_batch_requests(
            pending_files=pending_files,
            prompt_dir=prompt_dir,
            use_cfg=effective_use_cfg,
        )

        if not args.yes:
            confirmed = confirm_batch_submission(
                output_dir=output_dir,
                input_s_dir=input_s_dir,
                cfg_dir=cfg_dir,
                use_cfg=effective_use_cfg,
                model_name=MODEL_NAME,
                total_files=total_files,
                skipped=skipped,
                pending_files=pending_files,
            )
            if not confirmed:
                print("Cancelled by user before batch submission.")
                return

        timestamp = time.strftime("%Y%m%d_%H%M%S")
        requests_jsonl_path = batch_dir / f"requests_{timestamp}.jsonl"
        metadata_path = batch_dir / f"metadata_{timestamp}.json"

        write_jsonl(requests_jsonl_path, requests)

        _, created_batch_job = create_batch_job(client, requests_jsonl_path, effective_use_cfg)
        _log(f"Created batch job: {created_batch_job.name}")

        _write_text(
            metadata_path,
            json.dumps(
                {
                    "model": MODEL_NAME,
                    "use_cfg": effective_use_cfg,
                    "output_dir": str(output_dir),
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
            raw_output_dir=raw_output_dir,
            riscv_output_dir=riscv_output_dir,
            log_file=log_file,
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
        _append_failure_log("GLOBAL", str(e), log_file)
        elapsed = time.time() - start_time
        print(f"Batch run failed early after {elapsed:.1f}s: {e}")


if __name__ == "__main__":
    process_problems_batch()
