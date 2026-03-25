#!/usr/bin/env python3
"""
no-analysis-summary.py

Simple status-transition summarizer for verbose run reports.
It reads two *_verbose.txt files directly and reports where each problem moved,
for example: passed -> build_error, build_error -> runtime_error, etc.

Usage:
	# Auto-pick the latest two verbose reports under x86riscv-translation/**/txts/
	python x86riscv-translation/no-analysis-summary.py

	# Compare two specific verbose reports
	python x86riscv-translation/no-analysis-summary.py OLD_VERBOSE NEW_VERBOSE

	# Show only changed problems (default) and write CSV
	python x86riscv-translation/no-analysis-summary.py --csv

	# Include unchanged transitions too
	python x86riscv-translation/no-analysis-summary.py --include-unchanged
"""

from __future__ import annotations

import argparse
import csv
import sys
from collections import Counter
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
import re


SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_SEARCH_ROOT = SCRIPT_DIR
PROBLEM_RE = re.compile(r"^Problem:\s*(problem\d+)\s*$")
STATUS_RE = re.compile(r"^Status:\s*([A-Za-z0-9_\-]+)\s*$")


@dataclass
class TransitionRow:
	problem: str
	old_status: str
	new_status: str
	changed: bool


def find_latest_two_verbose_files(search_root: Path) -> tuple[Path, Path]:
	"""Find the two most recently modified verbose reports."""
	verbose_files = [
		path
		for path in search_root.rglob("*_verbose.txt")
		if path.is_file()
	]

	if len(verbose_files) < 2:
		sys.exit(
			f"Need at least two *_verbose.txt files under {search_root}, found {len(verbose_files)}"
		)

	verbose_files.sort(key=lambda p: p.stat().st_mtime)
	return verbose_files[-2], verbose_files[-1]


def parse_problem_statuses(verbose_path: Path) -> dict[str, str]:
	"""Parse per-problem statuses from a verbose report."""
	statuses: dict[str, str] = {}
	current_problem: str | None = None

	with verbose_path.open("r", encoding="utf-8") as f:
		for raw_line in f:
			line = raw_line.strip()

			problem_match = PROBLEM_RE.match(line)
			if problem_match:
				current_problem = problem_match.group(1)
				continue

			status_match = STATUS_RE.match(line)
			if status_match and current_problem is not None:
				statuses[current_problem] = status_match.group(1)
				current_problem = None

	return statuses


def build_transition_rows(old_statuses: dict[str, str], new_statuses: dict[str, str]) -> list[TransitionRow]:
	"""Build transition rows for problems present in both reports."""
	common_problems = sorted(
		set(old_statuses).intersection(new_statuses),
		key=lambda p: int(p.replace("problem", "")),
	)

	rows = []
	for problem in common_problems:
		old_status = old_statuses[problem]
		new_status = new_statuses[problem]
		rows.append(
			TransitionRow(
				problem=problem,
				old_status=old_status,
				new_status=new_status,
				changed=(old_status != new_status),
			)
		)

	return rows


def write_csv(rows: list[TransitionRow], output_path: Path) -> None:
	fields = ["problem", "old_status", "new_status", "transition", "changed"]
	with output_path.open("w", newline="", encoding="utf-8") as f:
		writer = csv.DictWriter(f, fieldnames=fields)
		writer.writeheader()
		for row in rows:
			writer.writerow(
				{
					"problem": row.problem,
					"old_status": row.old_status,
					"new_status": row.new_status,
					"transition": f"{row.old_status} -> {row.new_status}",
					"changed": "yes" if row.changed else "no",
				}
			)


def print_summary(
	rows: list[TransitionRow],
	old_path: Path,
	new_path: Path,
	include_unchanged: bool,
) -> None:
	transition_counts = Counter(f"{row.old_status} -> {row.new_status}" for row in rows)
	changed_rows = [row for row in rows if row.changed]
	shown_rows = rows if include_unchanged else changed_rows
	grouped: dict[str, list[str]] = {}
	for row in shown_rows:
		transition = f"{row.old_status} -> {row.new_status}"
		grouped.setdefault(transition, []).append(row.problem)

	print("Simple transition summary")
	print(f"Old report: {old_path}")
	print(f"New report: {new_path}")
	print(f"Problems compared: {len(rows)}")
	print(f"Problems changed: {len(changed_rows)}")
	print("")

	print("Transition counts:")
	for transition, count in sorted(
		transition_counts.items(),
		key=lambda kv: (-kv[1], kv[0]),
	):
		print(f"- {transition}: {count}")

	print("")
	if not shown_rows:
		print("No problems to list.")
		return

	heading = "Transition buckets (all):" if include_unchanged else "Transition buckets (changed only):"
	print(heading)
	for transition in sorted(grouped.keys(), key=lambda t: (-len(grouped[t]), t)):
		problems = sorted(grouped[transition], key=lambda p: int(p.replace("problem", "")))
		print(f"- {transition}: {', '.join(problems)}")


def parse_args() -> argparse.Namespace:
	parser = argparse.ArgumentParser(
		description="Simple status-transition summary from two verbose reports.",
	)
	parser.add_argument("old_verbose", nargs="?", type=Path, help="Older *_verbose.txt report")
	parser.add_argument("new_verbose", nargs="?", type=Path, help="Newer *_verbose.txt report")
	parser.add_argument(
		"--search-root",
		type=Path,
		default=DEFAULT_SEARCH_ROOT,
		help="Root directory used when auto-finding the latest two verbose files",
	)
	parser.add_argument(
		"--include-unchanged",
		action="store_true",
		help="Include unchanged transitions in per-problem listing",
	)
	parser.add_argument(
		"--csv",
		action="store_true",
		help="Write CSV output next to the newer verbose report",
	)
	return parser.parse_args()


def main() -> None:
	args = parse_args()

	if bool(args.old_verbose) != bool(args.new_verbose):
		sys.exit("Provide both OLD_VERBOSE and NEW_VERBOSE, or neither.")

	if args.old_verbose and args.new_verbose:
		old_path = args.old_verbose.expanduser().resolve()
		new_path = args.new_verbose.expanduser().resolve()
	else:
		old_path, new_path = find_latest_two_verbose_files(args.search_root.expanduser().resolve())

	if not old_path.exists():
		sys.exit(f"Old report not found: {old_path}")
	if not new_path.exists():
		sys.exit(f"New report not found: {new_path}")

	old_statuses = parse_problem_statuses(old_path)
	new_statuses = parse_problem_statuses(new_path)

	if not old_statuses:
		sys.exit(f"No problem statuses parsed from old report: {old_path}")
	if not new_statuses:
		sys.exit(f"No problem statuses parsed from new report: {new_path}")

	rows = build_transition_rows(old_statuses, new_statuses)
	if not rows:
		sys.exit("No overlapping problems found between reports.")

	print_summary(
		rows=rows,
		old_path=old_path,
		new_path=new_path,
		include_unchanged=args.include_unchanged,
	)

	if args.csv:
		ts = datetime.now().strftime("%Y%m%d_%H%M%S")
		csv_path = new_path.parent / f"{ts}_simple_transitions.csv"
		write_csv(rows, csv_path)
		print("")
		print(f"Wrote CSV: {csv_path}")


if __name__ == "__main__":
	main()
