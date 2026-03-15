from __future__ import annotations

import argparse
import csv
import json
import re
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path

from bucketize_verbose_report import ORDERED_BUCKETS, parse_verbose_report


# Usage examples:
#   python x86_arm_translation_qemu_humaneval/compare_bucket_runs.py \
#       x86_arm_translation_qemu_humaneval/results/exp01/txts/20260315_005021_verbose.txt \
#       x86_arm_translation_qemu_humaneval/results/exp02.1/txts/20260315_055302_verbose.txt
#
#   python x86_arm_translation_qemu_humaneval/compare_bucket_runs.py \
#       old_buckets.json new_buckets.json --label-old exp01 --label-new exp02.1
#
# What this script saves:
# 1. A human-readable summary txt for notes and research writeups.
# 2. A per-problem CSV showing old/new status and bucket changes.
# 3. Aggregate CSVs for status transitions and bucket count deltas.
# 4. A JSON summary for any downstream analysis you want to automate later.


KNOWN_STATUSES = ["passed", "build_error", "runtime_error", "timeout", "missing_test", "invalid_name", "missing"]


@dataclass
class RunData:
    label: str
    source_path: Path
    status_counts: dict[str, int]
    problem_statuses: dict[str, str]
    bucket_to_problems: dict[str, set[str]]
    mixed_compile_problems: set[str]


def parse_args() -> argparse.Namespace:
    # The two positional inputs are ordered as baseline first, candidate second.
    parser = argparse.ArgumentParser(
        description="Compare two bucket/verbose run summaries and save organized research-friendly outputs."
    )
    parser.add_argument("old_run", type=Path, help="Baseline run: *_verbose.txt or bucket JSON")
    parser.add_argument("new_run", type=Path, help="Candidate run: *_verbose.txt or bucket JSON")
    parser.add_argument("--label-old", help="Optional display label for the baseline run")
    parser.add_argument("--label-new", help="Optional display label for the candidate run")
    parser.add_argument(
        "--out-root",
        type=Path,
        help="Optional output root directory. Default: x86_arm_translation_qemu_humaneval/results/comparisons",
    )
    parser.add_argument(
        "--name",
        help="Optional short comparison name appended to the output directory",
    )
    return parser.parse_args()


def sorted_problem_list(problems: set[str] | list[str]) -> list[str]:
    return sorted(set(problems), key=lambda p: int(p.replace("problem", "")))


def sanitize_name(text: str) -> str:
    lowered = text.strip().lower()
    return re.sub(r"[^a-z0-9._-]+", "-", lowered).strip("-") or "run"


def infer_label(path: Path) -> str:
    # Prefer experiment folder names like exp01 or exp02.1 when possible.
    parts = list(path.parts)
    if "results" in parts:
        results_index = parts.index("results")
        if results_index + 1 < len(parts):
            return parts[results_index + 1]
    return path.stem


def invert_bucket_map(bucket_to_problems: dict[str, set[str]]) -> dict[str, list[str]]:
    problem_to_buckets: dict[str, list[str]] = {}
    for bucket_name, problems in bucket_to_problems.items():
        for problem in problems:
            problem_to_buckets.setdefault(problem, []).append(bucket_name)
    for buckets in problem_to_buckets.values():
        buckets.sort(key=lambda name: ORDERED_BUCKETS.index(name) if name in ORDERED_BUCKETS else len(ORDERED_BUCKETS))
    return problem_to_buckets


def load_bucket_json(path: Path) -> RunData:
    raw = json.loads(path.read_text(encoding="utf-8"))
    problem_statuses = raw.get("problem_statuses")
    if not isinstance(problem_statuses, dict):
        raise ValueError(
            "JSON input is missing 'problem_statuses'. Recreate it with the updated "
            "bucketize_verbose_report.py or compare the original *_verbose.txt files directly."
        )

    bucket_to_problems = {
        bucket: set(problems)
        for bucket, problems in raw.get("buckets", {}).items()
    }
    for bucket in ORDERED_BUCKETS:
        bucket_to_problems.setdefault(bucket, set())

    mixed_compile_problems = set(raw.get("mixed_compile_problems", []))
    status_counts = {str(key): int(value) for key, value in raw.get("status_counts", {}).items()}

    return RunData(
        label=infer_label(path),
        source_path=path,
        status_counts=status_counts,
        problem_statuses={str(problem): str(status) for problem, status in problem_statuses.items()},
        bucket_to_problems=bucket_to_problems,
        mixed_compile_problems=mixed_compile_problems,
    )


def load_run(path: Path, label_override: str | None) -> RunData:
    resolved = path.resolve()
    if not resolved.exists() or not resolved.is_file():
        raise FileNotFoundError(f"Input file not found: {resolved}")

    if resolved.suffix.lower() == ".json":
        run = load_bucket_json(resolved)
    else:
        summary = parse_verbose_report(resolved)
        run = RunData(
            label=infer_label(resolved),
            source_path=resolved,
            status_counts=summary.status_counts,
            problem_statuses=summary.problem_statuses,
            bucket_to_problems=summary.bucket_to_problems,
            mixed_compile_problems=summary.mixed_compile_problems,
        )

    if label_override:
        run.label = label_override
    return run


def determine_outcome(old_status: str, new_status: str) -> str:
    old_failed = old_status != "passed"
    new_failed = new_status != "passed"
    if old_status == new_status:
        return "unchanged"
    if old_failed and new_status == "passed":
        return "fixed"
    if old_status == "passed" and new_failed:
        return "regressed"
    if old_failed and new_failed:
        return "failure_mode_changed"
    return "status_changed"


def render_status_counts_line(status_counts: dict[str, int]) -> str:
    ordered_keys = sorted(status_counts)
    return ", ".join(f"{key}={status_counts[key]}" for key in ordered_keys) if ordered_keys else "none"


def status_delta(old_counts: dict[str, int], new_counts: dict[str, int]) -> list[tuple[str, int, int, int]]:
    keys = sorted(set(old_counts) | set(new_counts) | set(KNOWN_STATUSES))
    return [
        (key, old_counts.get(key, 0), new_counts.get(key, 0), new_counts.get(key, 0) - old_counts.get(key, 0))
        for key in keys
        if old_counts.get(key, 0) or new_counts.get(key, 0)
    ]


def build_problem_rows(old_run: RunData, new_run: RunData) -> list[dict[str, str]]:
    old_problem_to_buckets = invert_bucket_map(old_run.bucket_to_problems)
    new_problem_to_buckets = invert_bucket_map(new_run.bucket_to_problems)
    all_problems = sorted_problem_list(set(old_run.problem_statuses) | set(new_run.problem_statuses))

    rows: list[dict[str, str]] = []
    for problem in all_problems:
        old_status = old_run.problem_statuses.get(problem, "missing")
        new_status = new_run.problem_statuses.get(problem, "missing")
        old_buckets = old_problem_to_buckets.get(problem, [])
        new_buckets = new_problem_to_buckets.get(problem, [])
        added_buckets = [bucket for bucket in new_buckets if bucket not in old_buckets]
        removed_buckets = [bucket for bucket in old_buckets if bucket not in new_buckets]
        rows.append(
            {
                "problem": problem,
                "old_status": old_status,
                "new_status": new_status,
                "status_transition": f"{old_status}->{new_status}",
                "outcome": determine_outcome(old_status, new_status),
                "old_buckets": " | ".join(old_buckets),
                "new_buckets": " | ".join(new_buckets),
                "added_buckets": " | ".join(added_buckets),
                "removed_buckets": " | ".join(removed_buckets),
            }
        )
    return rows


def build_transition_counts(rows: list[dict[str, str]]) -> list[tuple[str, str, int, list[str]]]:
    grouped: dict[tuple[str, str], list[str]] = {}
    for row in rows:
        key = (row["old_status"], row["new_status"])
        grouped.setdefault(key, []).append(row["problem"])

    ordered_items: list[tuple[str, str, int, list[str]]] = []
    for (old_status, new_status), problems in sorted(grouped.items(), key=lambda item: (item[0][0], item[0][1])):
        ordered_items.append((old_status, new_status, len(problems), sorted_problem_list(problems)))
    return ordered_items


def build_bucket_delta_rows(old_run: RunData, new_run: RunData) -> list[dict[str, str | int]]:
    rows: list[dict[str, str | int]] = []
    for bucket in ORDERED_BUCKETS:
        old_problems = set(old_run.bucket_to_problems.get(bucket, set()))
        new_problems = set(new_run.bucket_to_problems.get(bucket, set()))
        added = sorted_problem_list(new_problems - old_problems)
        removed = sorted_problem_list(old_problems - new_problems)
        rows.append(
            {
                "bucket": bucket,
                "old_count": len(old_problems),
                "new_count": len(new_problems),
                "delta": len(new_problems) - len(old_problems),
                "added_problems": " | ".join(added),
                "removed_problems": " | ".join(removed),
            }
        )
    return rows


def render_problem_list(problems: list[str]) -> str:
    return ", ".join(problems) if problems else "none"


def build_human_summary(
    old_run: RunData,
    new_run: RunData,
    problem_rows: list[dict[str, str]],
    transition_rows: list[tuple[str, str, int, list[str]]],
    bucket_rows: list[dict[str, str | int]],
) -> str:
    fixed = [row["problem"] for row in problem_rows if row["outcome"] == "fixed"]
    regressed = [row["problem"] for row in problem_rows if row["outcome"] == "regressed"]
    failure_mode_changed = [row for row in problem_rows if row["outcome"] == "failure_mode_changed"]

    lines: list[str] = []
    lines.append(f"Comparison: {old_run.label} -> {new_run.label}")
    lines.append(f"Baseline source: {old_run.source_path}")
    lines.append(f"Candidate source: {new_run.source_path}")
    lines.append("")
    lines.append("Status counts:")
    lines.append(f"- {old_run.label}: {render_status_counts_line(old_run.status_counts)}")
    lines.append(f"- {new_run.label}: {render_status_counts_line(new_run.status_counts)}")
    for status, old_value, new_value, delta in status_delta(old_run.status_counts, new_run.status_counts):
        lines.append(f"- delta {status}: {delta:+d} ({old_value} -> {new_value})")

    lines.append("")
    lines.append(f"Fixed problems ({len(fixed)}): {render_problem_list(sorted_problem_list(fixed))}")
    lines.append(f"Regressed problems ({len(regressed)}): {render_problem_list(sorted_problem_list(regressed))}")

    lines.append("")
    lines.append("Failure-mode transitions:")
    nontrivial_transitions = [row for row in transition_rows if row[0] != row[1] and row[2] > 0]
    if not nontrivial_transitions:
        lines.append("- none")
    else:
        for old_status, new_status, count, problems in nontrivial_transitions:
            lines.append(f"- {old_status} -> {new_status} ({count}): {render_problem_list(problems)}")

    lines.append("")
    lines.append("Bucket deltas:")
    for row in bucket_rows:
        lines.append(
            f"- {row['bucket']}: {row['delta']:+d} ({row['old_count']} -> {row['new_count']})"
        )
        if row["added_problems"]:
            lines.append(f"  added: {row['added_problems']}")
        if row["removed_problems"]:
            lines.append(f"  removed: {row['removed_problems']}")

    lines.append("")
    lines.append(f"Failure-mode changed without becoming passed ({len(failure_mode_changed)}):")
    if not failure_mode_changed:
        lines.append("- none")
    else:
        for row in failure_mode_changed:
            lines.append(
                f"- {row['problem']}: {row['status_transition']} | +[{row['added_buckets'] or 'none'}] -[{row['removed_buckets'] or 'none'}]"
            )

    return "\n".join(lines)


def write_csv(path: Path, fieldnames: list[str], rows: list[dict[str, object]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def default_output_root(script_path: Path) -> Path:
    return script_path.parent / "results" / "comparisons"


def build_output_dir(base_root: Path, old_run: RunData, new_run: RunData, comparison_name: str | None) -> Path:
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    directory_name = f"{timestamp}_{sanitize_name(old_run.label)}_vs_{sanitize_name(new_run.label)}"
    if comparison_name:
        directory_name += f"_{sanitize_name(comparison_name)}"
    return base_root / directory_name


def main() -> int:
    # Main flow:
    # 1. Load both runs from verbose txt or bucket JSON.
    # 2. Compare per-problem statuses and failure buckets.
    # 3. Save a dedicated output directory with txt/csv/json artifacts.
    args = parse_args()
    script_path = Path(__file__).resolve()

    try:
        old_run = load_run(args.old_run, args.label_old)
        new_run = load_run(args.new_run, args.label_new)
    except (FileNotFoundError, ValueError, json.JSONDecodeError) as exc:
        print(str(exc))
        return 2

    output_root = args.out_root.resolve() if args.out_root else default_output_root(script_path)
    output_dir = build_output_dir(output_root, old_run, new_run, args.name)
    output_dir.mkdir(parents=True, exist_ok=True)

    problem_rows = build_problem_rows(old_run, new_run)
    transition_rows = build_transition_counts(problem_rows)
    bucket_rows = build_bucket_delta_rows(old_run, new_run)
    summary_text = build_human_summary(old_run, new_run, problem_rows, transition_rows, bucket_rows)

    summary_txt_path = output_dir / "comparison_summary.txt"
    problem_csv_path = output_dir / "problem_transitions.csv"
    transition_csv_path = output_dir / "status_transition_counts.csv"
    bucket_csv_path = output_dir / "bucket_deltas.csv"
    summary_json_path = output_dir / "comparison_summary.json"

    summary_txt_path.write_text(summary_text + "\n", encoding="utf-8")
    write_csv(
        problem_csv_path,
        [
            "problem",
            "old_status",
            "new_status",
            "status_transition",
            "outcome",
            "old_buckets",
            "new_buckets",
            "added_buckets",
            "removed_buckets",
        ],
        problem_rows,
    )
    write_csv(
        transition_csv_path,
        ["old_status", "new_status", "count", "problems"],
        [
            {
                "old_status": old_status,
                "new_status": new_status,
                "count": count,
                "problems": " | ".join(problems),
            }
            for old_status, new_status, count, problems in transition_rows
        ],
    )
    write_csv(
        bucket_csv_path,
        ["bucket", "old_count", "new_count", "delta", "added_problems", "removed_problems"],
        bucket_rows,
    )
    summary_json_path.write_text(
        json.dumps(
            {
                "old_run": {
                    "label": old_run.label,
                    "source_path": str(old_run.source_path),
                    "status_counts": old_run.status_counts,
                },
                "new_run": {
                    "label": new_run.label,
                    "source_path": str(new_run.source_path),
                    "status_counts": new_run.status_counts,
                },
                "problem_rows": problem_rows,
                "status_transitions": [
                    {
                        "old_status": old_status,
                        "new_status": new_status,
                        "count": count,
                        "problems": problems,
                    }
                    for old_status, new_status, count, problems in transition_rows
                ],
                "bucket_deltas": bucket_rows,
            },
            indent=2,
        ),
        encoding="utf-8",
    )

    print(summary_text)
    print("")
    print(f"Saved comparison outputs to: {output_dir}")
    print(f"- {summary_txt_path.name}")
    print(f"- {problem_csv_path.name}")
    print(f"- {transition_csv_path.name}")
    print(f"- {bucket_csv_path.name}")
    print(f"- {summary_json_path.name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())