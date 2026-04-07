from __future__ import annotations

import argparse
import re
from pathlib import Path


MODEL_SIZE_RE = re.compile(r"^(qwen\d+(?:\.\d+)?b)", re.IGNORECASE)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Summarize composer report txt files and compute the requested metric."
    )
    parser.add_argument(
        "root",
        nargs="?",
        type=Path,
        default=Path(__file__).resolve().parent / "results" / "composer",
        help="Root folder containing composer result subdirectories.",
    )
    parser.add_argument(
        "--csv-out",
        type=Path,
        help="Optional CSV output path.",
    )
    return parser.parse_args()


def extract_value(path: Path) -> tuple[int, int, float]:
    errored = None
    succeeded = None

    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        if line.startswith("Errored problems processed:"):
            errored = int(line.split(":", 1)[1].strip())
        elif line.startswith("Composer succeeded:"):
            succeeded = int(line.split(":", 1)[1].strip())

    if errored is None or succeeded is None:
        raise ValueError(f"Missing report fields in {path}")

    value = ((164 - errored) + succeeded) / 164.0 * 100.0
    return errored, succeeded, value


def extract_label(path: Path, root: Path) -> str:
    rel_parts = path.relative_to(root).parts
    if len(rel_parts) < 4:
        return path.stem

    model_dir = rel_parts[0]
    prompt_config = rel_parts[2] if len(rel_parts) > 2 and rel_parts[1] == "config" else rel_parts[1]

    model_match = MODEL_SIZE_RE.match(model_dir)
    model_size = model_match.group(1) if model_match else model_dir
    src_target = model_dir[len(model_size) :].lstrip("-") or model_dir

    return f"{model_size} | {src_target} | {prompt_config}"


def main() -> int:
    args = parse_args()
    root = args.root.resolve()

    if not root.exists() or not root.is_dir():
        print(f"Composer results root does not exist: {root}")
        return 2

    report_paths = sorted(root.rglob("*_report.txt"))
    rows: list[tuple[str, int, int, float, Path]] = []

    for report_path in report_paths:
        errored, succeeded, value = extract_value(report_path)
        label = extract_label(report_path, root)
        rows.append((label, errored, succeeded, value, report_path))

    print(f"Found {len(report_paths)} report txt files")
    for label, errored, succeeded, value, report_path in rows:
        print(
            f"{label} | errored={errored} | succeeded={succeeded} | value={value:.2f} | {report_path}"
        )

    if args.csv_out:
        args.csv_out.parent.mkdir(parents=True, exist_ok=True)
        csv_lines = ["label,errored,succeeded,value,report_path"]
        for label, errored, succeeded, value, report_path in rows:
            csv_lines.append(
                f'"{label}",{errored},{succeeded},{value:.4f},"{report_path.as_posix()}"'
            )
        args.csv_out.write_text("\n".join(csv_lines) + "\n", encoding="utf-8")
        print(f"CSV written: {args.csv_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())