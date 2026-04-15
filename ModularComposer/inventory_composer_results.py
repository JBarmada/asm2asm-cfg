from __future__ import annotations

import argparse
import csv
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

KNOWN_BENCHMARK_PREFIXES = ("bringup", "humaneval", "mceval")
SRC_TARGET_SUFFIX_RE = re.compile(r"^(?P<model>.+)-(?P<src_target>(?:x86|armv8-linux|armv8\.4a-apple|riscv)-to-.+)$")


@dataclass(frozen=True)
class ResultRow:
    composer: str
    model: str
    benchmark: str
    src_target: str
    config: str
    overall_pass_fraction: str
    overall_pass_percent: str
    report_name: str
    run_started: str
    run_finished: str
    report_path: Path


def parse_args() -> argparse.Namespace:
    root = Path(__file__).resolve().parent / "results" / "composer"
    share_root = Path(__file__).resolve().parent.parent / "share"
    parser = argparse.ArgumentParser(description="Build a readable inventory of composer result reports.")
    parser.add_argument("--root", type=Path, default=root, help="Composer results root.")
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=share_root / "results_inventory.md",
        help="Markdown output path.",
    )
    parser.add_argument(
        "--csv-out",
        type=Path,
        default=share_root / "results_inventory.csv",
        help="CSV output path.",
    )
    return parser.parse_args()


def parse_report(report_path: Path, root: Path) -> ResultRow:
    relative = report_path.relative_to(root)
    parts = relative.parts
    report_text = report_path.read_text(encoding="utf-8", errors="replace")

    fields: dict[str, str] = {}
    for line in report_text.splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        fields[key.strip()] = value.strip()

    if len(parts) < 5 or "txts" not in parts:
        raise ValueError(f"Unexpected report layout: {report_path}")

    composer = parts[0]
    txts_index = parts.index("txts")
    config = parts[txts_index - 1]

    model, benchmark, src_target = parse_layout_parts(parts, txts_index, fields, report_text)

    return ResultRow(
        composer=composer,
        model=model,
        benchmark=benchmark,
        src_target=src_target,
        config=config,
        overall_pass_fraction=extract_overall_pass_fraction(fields),
        overall_pass_percent=extract_overall_pass_percent(fields, benchmark),
        report_name=report_path.name,
        run_started=fields.get("Run started", ""),
        run_finished=fields.get("Run finished", ""),
        report_path=report_path,
    )


def parse_layout_parts(parts: tuple[str, ...], txts_index: int, fields: dict[str, str], report_text: str) -> tuple[str, str, str]:
    inferred_benchmark = infer_benchmark(fields, report_text)

    if txts_index >= 5 and parts[2].startswith(KNOWN_BENCHMARK_PREFIXES):
        model = parts[1]
        benchmark = parts[2]
        src_target = parts[txts_index - 3] if parts[txts_index - 2] == "config" else parts[txts_index - 2]
        return model, benchmark, src_target

    if txts_index >= 5 and "-to-" in parts[3]:
        model = f"{parts[1]}-{parts[2]}"
        benchmark = inferred_benchmark
        src_target = parts[3]
        return model, benchmark, src_target

    if txts_index >= 4 and "-to-" in parts[2]:
        model = parts[1]
        benchmark = inferred_benchmark
        src_target = parts[2]
        return model, benchmark, src_target

    match = SRC_TARGET_SUFFIX_RE.match(parts[1])
    if match:
        return match.group("model"), inferred_benchmark, match.group("src_target")

    raise ValueError(f"Unsupported report layout: {'/'.join(parts)}")


def infer_benchmark(fields: dict[str, str], report_text: str) -> str:
    benchmark = fields.get("Benchmark", "").strip().lower()
    if benchmark:
        return benchmark

    hint_text = " ".join(
        [
            fields.get("Input experiment dir", ""),
            fields.get("Final validation JSON", ""),
            fields.get("Run label", ""),
        ]
    ).lower()
    if "humaneval" in hint_text:
        return "humaneval"
    if "bringup" in hint_text:
        return "bringup"
    if "mceval" in hint_text:
        return "mceval"
    if "humaneval_source" in report_text.lower():
        return "humaneval"
    return "unknown"


def extract_overall_pass_fraction(fields: dict[str, str]) -> str:
    overall = fields.get("Global Total Overall problems successfully passed", "")
    match = re.search(r"(\d+/\d+)", overall)
    return match.group(1) if match else ""


def extract_overall_pass_percent(fields: dict[str, str], benchmark: str) -> str:
    total_problems = parse_int_field(fields, "Total problems in experiment")
    errored = parse_int_field(fields, "Errored problems processed")
    succeeded = parse_int_field(fields, "Composer succeeded")

    denominator = 164 if benchmark == "humaneval" else total_problems
    if denominator and errored is not None and succeeded is not None:
        numerator = (denominator - errored) + succeeded if benchmark == "humaneval" else (total_problems - errored) + succeeded
        if denominator > 0:
            return f"{(numerator / denominator) * 100.0:.1f}%"

    overall = fields.get("Global Total Overall problems successfully passed", "")
    match = re.search(r"\(([\d.]+)%\)", overall)
    if match:
        return f"{float(match.group(1)):.1f}%"
    return ""


def parse_int_field(fields: dict[str, str], key: str) -> int | None:
    value = fields.get(key, "").strip()
    if not value:
        return None
    match = re.search(r"-?\d+", value)
    return int(match.group(0)) if match else None


def collect_rows(root: Path) -> list[ResultRow]:
    return sorted(
        (parse_report(path, root) for path in root.rglob("*_report.txt")),
        key=lambda row: (row.benchmark, row.model, row.src_target, row.config, row.run_started, row.report_name),
    )


def write_csv(rows: list[ResultRow], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(
            [
                "composer",
                "model",
                "benchmark",
                "src_target",
                "config",
                "overall_pass_fraction",
                "overall_pass_percent",
                "run_started",
                "run_finished",
                "report_name",
                "report_path",
            ]
        )
        for row in rows:
            writer.writerow(
                [
                    row.composer,
                    row.model,
                    row.benchmark,
                    row.src_target,
                    row.config,
                    row.overall_pass_fraction,
                    row.overall_pass_percent,
                    row.run_started,
                    row.run_finished,
                    row.report_name,
                    row.report_path.as_posix(),
                ]
            )


def write_markdown(rows: list[ResultRow], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    combo_counts = Counter((row.benchmark, row.model, row.src_target, row.config) for row in rows)

    lines: list[str] = []
    lines.append("# Composer Results Inventory")
    lines.append("")
    lines.append(f"Total report files: **{len(rows)}**")
    lines.append("")
    lines.append("## Summary by Combination")
    lines.append("")
    lines.append("| Benchmark | Model | Src->Target | Config | Runs |")
    lines.append("| --- | --- | --- | --- | ---: |")
    for benchmark, model, src_target, config in sorted(combo_counts):
        lines.append(
            f"| {benchmark} | {model} | {src_target} | {config} | {combo_counts[(benchmark, model, src_target, config)]} |"
        )

    lines.append("")
    lines.append("## All Reports")
    lines.append("")
    lines.append("| Benchmark | Model | Src->Target | Config | Overall (X/Y) | Overall % | Run Started | Report |")
    lines.append("| --- | --- | --- | --- | --- | --- | --- | --- |")
    for row in rows:
        lines.append(
            f"| {row.benchmark} | {row.model} | {row.src_target} | {row.config} | {row.overall_pass_fraction or '-'} | {row.overall_pass_percent or '-'} | {row.run_started or '-'} | {row.report_name} |"
        )

    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    root = args.root.resolve()
    if not root.exists() or not root.is_dir():
        print(f"Composer results root does not exist: {root}")
        return 2

    rows = collect_rows(root)
    write_markdown(rows, args.markdown_out)
    write_csv(rows, args.csv_out)

    print(f"Found {len(rows)} report files")
    print(f"Markdown written: {args.markdown_out}")
    print(f"CSV written: {args.csv_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
