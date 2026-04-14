from __future__ import annotations

import argparse
import json
from pathlib import Path

from transpilation_runtime import (
    benchmark_display_name,
    benchmark_root_for,
    detect_unsupported_target,
    eval_record_payload,
    evaluate_records,
    load_asm_records_from_dir,
    normalize_benchmark_id,
    normalize_isa,
    write_error_json,
    write_eval_results_json,
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Evaluate translated ASM and emit composer-friendly error JSON.")
    parser.add_argument("asm_dir", type=Path, help="Directory containing translated .s files.")
    parser.add_argument("--config", type=Path, required=True, help="Path to config JSON.")
    parser.add_argument("--benchmark", required=True, choices=["humaneval", "bringup", "mceval"], help="Benchmark id.")
    parser.add_argument("--target-isa", required=True, help="Canonical or legacy target ISA.")
    parser.add_argument("--benchmark-root", type=Path, help="Benchmark root override.")
    parser.add_argument("--output", type=Path, required=True, help="Output error JSON path.")
    parser.add_argument("--eval-json", type=Path, help="Optional output path for full eval results.")
    parser.add_argument("--workers", type=int, help="Optional override for evaluation workers.")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    cfg = json.loads(args.config.read_text(encoding="utf-8"))
    benchmark_id = normalize_benchmark_id(args.benchmark)
    target_isa = normalize_isa(args.target_isa)
    benchmark_root = benchmark_root_for(benchmark_id, args.benchmark_root)

    unsupported_reason = detect_unsupported_target(target_isa)
    print("Preflight summary:")
    print(f"ASM dir: {args.asm_dir.resolve()}")
    print(f"Config: {args.config.resolve()}")
    print(f"Benchmark: {benchmark_display_name(benchmark_id)}")
    print(f"Benchmark root: {benchmark_root.resolve()}")
    print(f"Target ISA: {target_isa}")
    if unsupported_reason:
        print(f"Skip reason: {unsupported_reason}")
        return 0

    records = load_asm_records_from_dir(args.asm_dir.resolve())
    evaluated = evaluate_records(
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        records=records,
        cfg={**cfg, **({"max_workers": args.workers} if args.workers is not None else {})},
        target_isa=target_isa,
        work_root=args.asm_dir.resolve().parent / "eval_temp",
        num_workers=int(args.workers or cfg.get("max_workers", 4)),
    )
    results = [result for _, result in evaluated]
    write_error_json(
        args.output.resolve(),
        benchmark_id=benchmark_id,
        benchmark_root=benchmark_root,
        asm_input_dir=args.asm_dir.resolve(),
        results=results,
    )
    if args.eval_json:
        payload = [eval_record_payload(record["task_name"], record["pred"], result) for record, result in evaluated]
        write_eval_results_json(args.eval_json.resolve(), payload)
    errored = sum(1 for result in results if not result.succeeded)
    print(f"Processed {len(results)} problems; errored={errored}")
    return 1 if errored else 0


if __name__ == "__main__":
    raise SystemExit(main())
