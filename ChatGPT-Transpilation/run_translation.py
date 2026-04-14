from __future__ import annotations

import argparse
import json
from datetime import datetime
from pathlib import Path

from transpilation_runtime import (
    benchmark_root_for,
    detect_unsupported_target,
    evaluate_records,
    load_asm_records_from_dir,
    normalize_benchmark_id,
    normalize_isa,
    write_report,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Evaluate translated asm and write a text report.")
    parser.add_argument("--config", type=Path, required=True, help="Path to config JSON.")
    parser.add_argument("--asm-dir", type=Path, required=True, help="Path to translated asm directory.")
    parser.add_argument("--benchmark", required=True, choices=["humaneval", "bringup", "mceval"], help="Benchmark id.")
    parser.add_argument("--target-isa", required=True, help="Canonical or legacy target ISA.")
    parser.add_argument("--source-isa", default="x86", help="Canonical or legacy source ISA.")
    parser.add_argument("--benchmark-root", type=Path, help="Benchmark root override.")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    benchmark_id = normalize_benchmark_id(args.benchmark)
    source_isa = normalize_isa(args.source_isa)
    target_isa = normalize_isa(args.target_isa)
    benchmark_root = benchmark_root_for(benchmark_id, args.benchmark_root)
    unsupported_reason = detect_unsupported_target(target_isa)
    if unsupported_reason:
        print(f"Skipped: {unsupported_reason}")
        return 0

    asm_dir = args.asm_dir.resolve()
    records = load_asm_records_from_dir(asm_dir)
    started = datetime.now()
    evaluated = evaluate_records(
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        records=records,
        cfg=cfg,
        target_isa=target_isa,
        work_root=asm_dir.parent / "eval_temp",
        num_workers=int(cfg.get("max_workers", 4)),
    )
    results = [result for _, result in evaluated]
    report_path = write_report(
        asm_dir.parent / "txts" / f"{datetime.now().strftime('%Y%m%d_%H%M%S')}_report.txt",
        benchmark_id=benchmark_id,
        source_isa=source_isa,
        target_isa=target_isa,
        model_name=str(cfg.get("model_name", "unknown")),
        results=results,
        started_at=started,
    )
    print(f"Report written: {report_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
