from __future__ import annotations

import argparse
import asyncio
from datetime import datetime
from pathlib import Path

from .benchmarks import create_benchmark_adapter, load_graph_data
from .core import ComposerEngine
from .preflight import build_preflight_lines, prompt_auto_confirm
from .providers.base import ModelProvider
from .utils import (
    PROMPT_CONFIGS,
    apply_default_toolchain,
    benchmark_display_name,
    default_graph_dataset_id,
    isa_dataset_column,
    normalize_benchmark_id,
    normalize_isa,
    read_config,
    resolve_runtime_paths,
)


def parse_shared_args(description: str) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument("input_path", type=Path, help="Input eval JSON or experiment/asm directory")
    parser.add_argument("--config", type=Path, required=True, help="Path to shared config JSON")
    parser.add_argument("--benchmark", choices=["humaneval", "mceval", "bringup"], help="Benchmark override")
    parser.add_argument("--benchmark-root", type=Path, help="Benchmark root override")
    parser.add_argument(
        "--target-isa",
        choices=["x86", "armv8-linux", "armv8.4a-apple", "riscv", "arm_linux", "arm_apple", "armv8", "armv8.4a"],
        help="Target ISA override",
    )
    parser.add_argument(
        "--source-isa",
        choices=["x86", "armv8-linux", "armv8.4a-apple", "riscv", "arm_linux", "arm_apple", "armv8", "armv8.4a"],
        help="Source ISA override",
    )
    parser.add_argument("--input-mode", choices=["auto", "evaluated_json", "asm_dir"], default="auto", help="Input mode override")
    parser.add_argument(
        "--bootstrap-errors",
        action=argparse.BooleanOptionalAction,
        default=None,
        help="Bootstrap an error JSON when input is an asm directory and no error JSON is found",
    )
    parser.add_argument("--prompt-config", choices=PROMPT_CONFIGS, help="Prompt strategy override")
    parser.add_argument("--run-label", help="Run label override")
    parser.add_argument("--error-json", type=Path, help="Explicit error JSON path in directory mode")
    parser.add_argument("--model", help="Provider model override")
    parser.add_argument("--max-concurrency", type=int, help="Max concurrent workers")
    parser.add_argument("--max-retries", type=int, help="Max composition attempts per problem")
    parser.add_argument("--retry-base-seconds", type=float, help="Provider API retry base seconds")
    parser.add_argument("--retry-jitter-seconds", type=float, help="Extra random retry delay")
    parser.add_argument("--startup-jitter-seconds", type=float, help="Random initial worker delay")
    parser.add_argument("--resume-checkpoint", type=Path, help="Resume from checkpoint path")
    parser.add_argument("--yes", action="store_true", help="Skip interactive preflight confirmation")
    return parser.parse_args()


def get_cfg_or_default(cfg: dict[str, object], key: str, default):
    value = cfg.get(key)
    return default if value is None else value


def _resolve_graph_dataset_id(cfg: dict[str, object], benchmark_id: str, graph_kind: str) -> str:
    dataset_key = "cfg_dataset_id" if graph_kind == "cfg" else "dfg_dataset_id"
    explicit = cfg.get(dataset_key)
    if explicit is not None:
        return str(explicit)
    default_value = default_graph_dataset_id(benchmark_id, graph_kind)
    if default_value is None:
        raise RuntimeError(
            f"{benchmark_display_name(benchmark_id)} does not define a default {graph_kind.upper()} dataset. "
            f"Set '{dataset_key}' explicitly or use a non-graph prompt config."
        )
    return default_value


def execute_pipeline(
    args: argparse.Namespace,
    cfg: dict[str, object],
    provider: ModelProvider,
    model_name: str,
) -> int:
    prompt_config = args.prompt_config or str(cfg.get("composer_prompt_config", "base"))
    if prompt_config not in PROMPT_CONFIGS:
        raise RuntimeError(f"Unsupported prompt config: {prompt_config}")
    args.prompt_config = prompt_config

    if args.benchmark:
        cfg["benchmark"] = normalize_benchmark_id(args.benchmark)
    if args.target_isa:
        cfg["target_isa"] = normalize_isa(args.target_isa)
    if getattr(args, "source_isa", None):
        cfg["source_isa"] = normalize_isa(args.source_isa)

    paths = resolve_runtime_paths(args, cfg)
    cfg = apply_default_toolchain(cfg, paths.target_isa)

    max_concurrency = int(args.max_concurrency or get_cfg_or_default(cfg, "max_workers", 8))
    max_retries = int(args.max_retries or get_cfg_or_default(cfg, "max_retries", 3))
    startup_jitter_seconds = float(
        args.startup_jitter_seconds
        if args.startup_jitter_seconds is not None
        else get_cfg_or_default(cfg, "startup_jitter_seconds", 2.0)
    )

    require_cfg = prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
    require_dfg = prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}

    cfg_column = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", isa_dataset_column(paths.source_isa))))
    dfg_column = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", isa_dataset_column(paths.source_isa))))
    cfg_dataset_id = _resolve_graph_dataset_id(cfg, paths.benchmark_id, "cfg") if require_cfg else "(not used)"
    dfg_dataset_id = _resolve_graph_dataset_id(cfg, paths.benchmark_id, "dfg") if require_dfg else "(not used)"

    benchmark_for_limits = create_benchmark_adapter(
        paths.benchmark_id,
        paths=paths,
        cfg=cfg,
        cfg_data={},
        dfg_data={},
    )

    safe_limit = benchmark_for_limits.max_validation_concurrency()
    if safe_limit is not None and max_concurrency > safe_limit:
        print(
            f"Clamping max concurrency from {max_concurrency} to {safe_limit} for "
            f"{benchmark_display_name(paths.benchmark_id)} validation safety."
        )
        max_concurrency = safe_limit

    preflight_lines = build_preflight_lines(
        input_path=args.input_path,
        config_path=args.config,
        run_label=args.run_label or (args.input_path.stem if args.input_path.is_file() else args.input_path.name),
        prompt_config=prompt_config,
        model_name=model_name,
        benchmark_name=benchmark_display_name(paths.benchmark_id),
        benchmark_root=paths.benchmark_root,
        target_isa=paths.target_isa_display,
        input_mode=paths.input_mode,
        asm_input_dir=paths.asm_input_dir,
        error_json_path=paths.error_json_path,
        error_json_will_be_bootstrapped=paths.error_json_will_be_bootstrapped,
        graph_split=paths.graph_split,
        cfg_column=cfg_column,
        dfg_column=dfg_column,
        cfg_dataset_id=cfg_dataset_id,
        dfg_dataset_id=dfg_dataset_id,
        max_concurrency=max_concurrency,
        paths=paths,
    )

    if not prompt_auto_confirm(preflight_lines, auto_yes=bool(getattr(args, "yes", False))):
        print("Run cancelled by user.")
        return 1

    if require_cfg:
        print("Loading CFG data...")
        cfg_data = load_graph_data(
            cfg,
            benchmark_id=paths.benchmark_id,
            column=cfg_column,
            graph_kind="cfg",
            split=paths.graph_split,
        )
    else:
        print("CFG data not required for this prompt config.")
        cfg_data = {}

    if require_dfg:
        print("Loading DFG data...")
        dfg_data = load_graph_data(
            cfg,
            benchmark_id=paths.benchmark_id,
            column=dfg_column,
            graph_kind="dfg",
            split=paths.graph_split,
        )
    else:
        print("DFG data not required for this prompt config.")
        dfg_data = {}

    benchmark = create_benchmark_adapter(
        paths.benchmark_id,
        paths=paths,
        cfg=cfg,
        cfg_data=cfg_data,
        dfg_data=dfg_data,
    )

    if paths.error_json_will_be_bootstrapped:
        print(f"Bootstrapping error JSON from asm input dir: {paths.asm_input_dir}")
        benchmark.bootstrap_error_json(paths.asm_input_dir, paths.error_json_path)
        print(f"Bootstrapped error JSON written to: {paths.error_json_path}")

    engine = ComposerEngine(
        provider=provider,
        evaluator=benchmark,
        paths=paths,
        prompt_config=prompt_config,
        max_retries=max_retries,
        max_concurrency=max_concurrency,
        model_name=model_name,
        run_label=args.run_label or (args.input_path.stem if args.input_path.is_file() else args.input_path.name),
        checkpoint_path=paths.logs_dir / f"checkpoint_{prompt_config}.json",
        startup_jitter_seconds=startup_jitter_seconds,
    )

    print("Loading errored problem specs and resolving source assembly...")
    problems = benchmark.get_problem_specs(prompt_config)
    print(f"Loaded {len(problems)} errored problems.")
    print(
        "Starting composition engine "
        f"(resume checkpoint: {args.resume_checkpoint if args.resume_checkpoint else 'none'})..."
    )
    started_at = datetime.now()

    results, error = asyncio.run(engine.run(problems, resume_checkpoint=args.resume_checkpoint))
    if error is not None:
        raise error

    print("Composition phase complete. Running final validation over all outputs...")
    final_validation_path, final_error_count, total_problems = benchmark.validate_all_outputs()

    report_path = engine.write_reports(
        problems=problems,
        results=results,
        started_at=started_at,
        finished_at=datetime.now(),
        final_validation_path=final_validation_path,
        final_validation_error_count=final_error_count,
        total_problems=total_problems,
    )

    print(f"Report written: {report_path}")
    print(f"Final validation errors: {final_error_count}/{total_problems}")
    usage_getter = getattr(provider, "get_usage_summary", None)
    usage_summary = usage_getter() if callable(usage_getter) else None
    if usage_summary is not None:
        print(
            "Provider usage "
            f"({usage_summary.provider_name}): "
            f"requests={usage_summary.successful_requests}, "
            f"prompt_tokens={usage_summary.prompt_token_count}, "
            f"response_tokens={usage_summary.response_token_count}, "
            f"total_tokens={usage_summary.total_token_count}"
        )
    return 0


def load_run_config(config_path: Path) -> dict[str, object]:
    return read_config(config_path.resolve())
