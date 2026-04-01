#!/usr/bin/env python3
"""
summarize_regressions.py  --  Print a table of regressed (and optionally
                               failure-mode-changed) problems from a
                               compare_bucket_runs.py comparison directory.

Usage:
    # Auto-picks the most recent comparison directory:
    python x86_arm_translation_qemu_humaneval/summarize_regressions.py

    # Point at a specific comparison directory:
    python x86_arm_translation_qemu_humaneval/summarize_regressions.py \\
        x86_arm_translation_qemu_humaneval/results/comparisons/20260315_065437_exp01_vs_exp02.1

    # Also include problems whose failure mode changed but never became "passed":
    python x86_arm_translation_qemu_humaneval/summarize_regressions.py --include-changed

    # Write a regressions_summary.csv into the comparison directory:
    python x86_arm_translation_qemu_humaneval/summarize_regressions.py --csv

    # Combine flags:
    python x86_arm_translation_qemu_humaneval/summarize_regressions.py \\
        --include-changed --csv \\
        x86_arm_translation_qemu_humaneval/results/comparisons/20260315_065437_exp01_vs_exp02.1
"""

from __future__ import annotations

import argparse
import csv
import shutil
import sys
from collections import defaultdict
from pathlib import Path


COMPARISONS_ROOT = Path(__file__).parent / "results" / "comparisons"


def find_latest_comparison_dir() -> Path:
    dirs = [d for d in COMPARISONS_ROOT.iterdir() if d.is_dir()]
    if not dirs:
        sys.exit(f"No comparison directories found under {COMPARISONS_ROOT}")
    return max(dirs, key=lambda d: d.name)


def load_rows(comparison_dir: Path, include_changed: bool) -> list[dict]:
    csv_path = comparison_dir / "problem_transitions.csv"
    if not csv_path.exists():
        sys.exit(f"problem_transitions.csv not found in: {comparison_dir}")

    rows = []
    with csv_path.open(newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            outcome = row["outcome"]
            if outcome == "regressed" or (include_changed and outcome == "failure_mode_changed"):
                rows.append(row)

    rows.sort(key=lambda r: int(r["problem"].replace("problem", "")))
    return rows


# ── pretty-print helpers ──────────────────────────────────────────────────────


def print_table(rows: list[dict], comparison_dir: Path, include_changed: bool) -> None:
    TW = shutil.get_terminal_size((100, 24)).columns
    sep = "─" * TW
    regressed_count = sum(1 for row in rows if row["outcome"] == "regressed")
    changed_count = sum(1 for row in rows if row["outcome"] == "failure_mode_changed")

    label = comparison_dir.name
    print(f"\nRegressions summary  ─  {label}")
    print(f"Regressed problems: {regressed_count}")
    if include_changed:
        print("(includes failure-mode-changed problems)")
        print(f"Failure-mode-changed problems: {changed_count}")
    print(sep)

    bucket_summary: dict[str, list[str]] = defaultdict(list)

    for i, row in enumerate(rows, 1):
        problem = row["problem"]
        old_s = row["old_status"]
        new_s = row["new_status"]
        outcome_tag = " ⚑" if row["outcome"] == "failure_mode_changed" else ""

        new_buckets = row.get("new_buckets", "").strip()
        bucket_parts = [b.strip() for b in new_buckets.split("|")] if new_buckets else []

        # Row 1: index + problem + transition
        print(f"{i:>3}.  {problem:<11}  {old_s} → {new_s}{outcome_tag}")
        # Row 2 onward: indented reason buckets (one per line)
        if bucket_parts:
            for bp in bucket_parts:
                print(f"       {'':11}  ↳ {bp}")
        else:
            print(f"       {'':11}  (no bucket recorded)")

        for bucket in bucket_parts:
            bucket_summary[bucket].append(problem)

    print(sep)
    print(f"Total: {len(rows)} problem(s)\n")

    # ── grouped by error bucket ───────────────────────────────────────────────
    if bucket_summary:
        print("Grouped by error bucket:")
        print(sep)
        for bucket, problems in sorted(bucket_summary.items(), key=lambda kv: -len(kv[1])):
            print(f"  [{len(problems):>2}]  {bucket}")
            # wrap long problem lists to terminal width
            line, pfx = "", "        "
            for p in problems:
                candidate = (line + ", " + p) if line else p
                if len(pfx + candidate) > TW and line:
                    print(f"{pfx}{line},")
                    line = p
                else:
                    line = candidate
            if line:
                print(f"{pfx}{line}")
        print(sep)
    print()
    print()


# ── CSV output ────────────────────────────────────────────────────────────────

def write_csv(rows: list[dict], comparison_dir: Path) -> None:
    out_path = comparison_dir / "regressions_summary.csv"
    fields = ["problem", "outcome", "status_transition", "old_status", "new_status",
              "old_buckets", "new_buckets", "added_buckets", "removed_buckets"]
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    print(f"Written: {out_path}")


# ── main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Summarize regressed problems from a compare_bucket_runs comparison directory.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    parser.add_argument(
        "comparison_dir",
        nargs="?",
        type=Path,
        help="Comparison directory (default: most recent under results/comparisons/)",
    )
    parser.add_argument(
        "--include-changed",
        action="store_true",
        help="Also show problems whose failure mode changed but did not become passed",
    )
    parser.add_argument(
        "--csv",
        action="store_true",
        help="Write regressions_summary.csv into the comparison directory",
    )
    args = parser.parse_args()

    comparison_dir: Path = args.comparison_dir or find_latest_comparison_dir()
    comparison_dir = Path(comparison_dir).resolve()
    if not comparison_dir.exists():
        sys.exit(f"Directory not found: {comparison_dir}")

    rows = load_rows(comparison_dir, include_changed=args.include_changed)

    if not rows:
        print("No regressed problems found.")
        return

    if args.csv:
        write_csv(rows, comparison_dir)
    else:
        print_table(rows, comparison_dir, include_changed=args.include_changed)


if __name__ == "__main__":
    main()
