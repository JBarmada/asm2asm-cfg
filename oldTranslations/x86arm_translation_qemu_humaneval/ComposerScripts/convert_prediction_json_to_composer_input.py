"""
Convert a prediction JSON into a GeminiComposer-compatible experiment folder.

Input JSON format expected (root list):
- file: problem identifier (for example: problem17)
- pred: assembly text
- success: 1/0, true/false, or equivalent
- error_stage: optional (assembly/execution/etc.)
- run_output: optional stderr/log text

Output structure:
<output_experiment_dir>/
  <source_language>_asm/
    problem17_O2.s
    ...
  jsons/
    <timestamp>_error_problems.json

The generated *_error_problems.json matches the shape expected by GeminiComposer.py
(via errored_problems entries containing name/summary/stderr).
"""

from __future__ import annotations

import argparse
import json
import re
from datetime import datetime
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert prediction JSON into composer-ready asm/json files."
    )
    parser.add_argument(
        "input_json",
        type=Path,
        help="Path to input JSON containing prediction rows",
    )
    parser.add_argument(
        "output_experiment_dir",
        type=Path,
        help="Output experiment dir (for example: results/exp01_import)",
    )
    parser.add_argument(
        "--source-language",
        default="arm",
        choices=("arm", "x86", "riscv"),
        help="Source ISA/language used by composer directory naming",
    )
    parser.add_argument(
        "--asm-tag",
        default="O2",
        help="Asm filename tag used as <problem>_<tag>.s (default: O2)",
    )
    parser.add_argument(
        "--overwrite",
        action="store_true",
        help="Allow overwriting existing asm/json files",
    )
    return parser.parse_args()


def _to_bool(value: Any) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return bool(value)
    if isinstance(value, str):
        return value.strip().lower() in {"1", "true", "yes", "y", "ok", "pass", "passed"}
    return False


def normalize_problem_name(raw: Any) -> str:
    text = str(raw or "").strip()
    if not text:
        return ""

    stem = Path(text).stem
    stem = stem.strip()

    if re.fullmatch(r"problem\d+", stem):
        return stem
    if re.fullmatch(r"\d+", stem):
        return f"problem{stem}"

    match = re.search(r"problem\d+", stem)
    if match:
        return match.group(0)

    return stem


def build_summary(entry: dict[str, Any]) -> str:
    error_stage = str(entry.get("error_stage") or "").strip()
    run_output = str(entry.get("run_output") or "").strip()
    status = _to_bool(entry.get("success"))

    first_line = run_output.splitlines()[0].strip() if run_output else ""

    if error_stage and first_line:
        return f"{error_stage}_error: {first_line}"
    if error_stage:
        return f"{error_stage}_error"
    if first_line:
        return first_line
    return "passed" if status else "failed"


def load_rows(path: Path) -> list[dict[str, Any]]:
    payload = json.loads(path.read_text(encoding="utf-8"))

    if isinstance(payload, list):
        rows = payload
    elif isinstance(payload, dict):
        # Accept a few common wrappers.
        for key in ("results", "rows", "items", "data"):
            value = payload.get(key)
            if isinstance(value, list):
                rows = value
                break
        else:
            raise ValueError("Unsupported JSON object format. Expected a list or a dict containing list under results/rows/items/data.")
    else:
        raise ValueError("Unsupported JSON format. Expected list or object wrapper.")

    normalized: list[dict[str, Any]] = []
    for row in rows:
        if isinstance(row, dict):
            normalized.append(row)
    return normalized


def main() -> int:
    args = parse_args()

    input_json = args.input_json.resolve()
    output_experiment_dir = args.output_experiment_dir.resolve()

    if not input_json.exists() or not input_json.is_file():
        raise FileNotFoundError(f"Input JSON not found: {input_json}")

    rows = load_rows(input_json)

    asm_dir = output_experiment_dir / f"{args.source_language}_asm"
    jsons_dir = output_experiment_dir / "jsons"
    asm_dir.mkdir(parents=True, exist_ok=True)
    jsons_dir.mkdir(parents=True, exist_ok=True)

    errored_entries: list[dict[str, Any]] = []
    written_asm = 0
    skipped = 0

    for row in rows:
        problem_name = normalize_problem_name(row.get("file"))
        pred = row.get("pred")

        if not problem_name or not isinstance(pred, str) or not pred.strip():
            skipped += 1
            continue

        asm_file_name = f"{problem_name}_{args.asm_tag}.s" if args.asm_tag else f"{problem_name}.s"
        asm_path = asm_dir / asm_file_name

        if asm_path.exists() and not args.overwrite:
            raise FileExistsError(
                f"Refusing to overwrite existing file without --overwrite: {asm_path}"
            )

        asm_text = pred if pred.endswith("\n") else pred + "\n"
        asm_path.write_text(asm_text, encoding="utf-8")
        written_asm += 1

        is_success = _to_bool(row.get("success"))
        error_stage = row.get("error_stage")
        is_failed = (not is_success) or (error_stage is not None and str(error_stage).strip() != "")

        if is_failed:
            stage = str(error_stage).strip() if error_stage is not None else ""
            status = f"{stage}_error" if stage else "failed"
            errored_entries.append(
                {
                    "name": problem_name,
                    "status": status,
                    "summary": build_summary(row),
                    "commands": [],
                    "stderr": str(row.get("run_output") or ""),
                }
            )

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    error_json_path = jsons_dir / f"{timestamp}_error_problems.json"
    if error_json_path.exists() and not args.overwrite:
        raise FileExistsError(
            f"Refusing to overwrite existing file without --overwrite: {error_json_path}"
        )

    now_iso = datetime.now().isoformat(timespec="seconds")
    error_payload = {
        "run_started": now_iso,
        "run_finished": now_iso,
        "arm_input_dir": str(asm_dir),
        "test_root": "",
        "problem_filter": "all problems",
        "problems_processed": written_asm,
        "errored_count": len(errored_entries),
        "errored_problems": errored_entries,
        "source_json": str(input_json),
        "source_rows_total": len(rows),
        "rows_skipped": skipped,
    }
    error_json_path.write_text(json.dumps(error_payload, indent=2) + "\n", encoding="utf-8")

    print(f"Input JSON: {input_json}")
    print(f"Output experiment dir: {output_experiment_dir}")
    print(f"ASM written: {written_asm}")
    print(f"Rows skipped: {skipped}")
    print(f"Errored problems: {len(errored_entries)}")
    print(f"Error JSON: {error_json_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
