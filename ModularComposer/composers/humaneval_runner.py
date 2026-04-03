from __future__ import annotations

import argparse
import asyncio
from datetime import datetime
from pathlib import Path

from .core import ComposerEngine
from .evaluators import HumanEvalEvaluator, load_graph_data
from .preflight import build_preflight_lines, prompt_auto_confirm
from .providers.base import ModelProvider
from .utils import PROMPT_CONFIGS, read_config, resolve_runtime_paths


def parse_shared_args(description: str) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument("input_path", type=Path, help="Input experiment directory or JSON path")
    parser.add_argument("--config", type=Path, required=True, help="Path to shared config JSON")
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
    parser.add_argument("--validator-script", type=Path, default=None, help="Path to validator script")
    return parser.parse_args()


def get_cfg_or_default(cfg: dict[str, object], key: str, default):
    value = cfg.get(key)
    return default if value is None else value


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

    paths = resolve_runtime_paths(args, cfg)

    max_concurrency = int(args.max_concurrency or get_cfg_or_default(cfg, "max_workers", 8))
    max_retries = int(args.max_retries or get_cfg_or_default(cfg, "max_retries", 3))
    startup_jitter_seconds = float(
        args.startup_jitter_seconds
        if args.startup_jitter_seconds is not None
        else get_cfg_or_default(cfg, "startup_jitter_seconds", 2.0)
    )

    require_cfg = prompt_config in {"cfg_only", "error_cfg", "cfg_dfg", "error_cfg_dfg"}
    require_dfg = prompt_config in {"dfg_only", "error_dfg", "cfg_dfg", "error_cfg_dfg"}
    cfg_column = str(cfg.get("cfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))
    dfg_column = str(cfg.get("dfg_dataset_column", cfg.get("source_dataset_column", "x86_64")))

    validator_script = args.validator_script or Path(str(cfg.get("validator_script", "run_humaneval.py")))
    run_label = args.run_label or (args.input_path.stem if args.input_path.is_file() else args.input_path.name)

    preflight_lines = build_preflight_lines(
        input_path=args.input_path,
        config_path=args.config,
        run_label=run_label,
        prompt_config=prompt_config,
        model_name=model_name,
        benchmark_name=str(cfg.get("benchmark", "HumanEval")),
        error_json_path=paths.error_json_path,
        validator_script=validator_script,
        cfg_column=cfg_column,
        dfg_column=dfg_column,
        cfg_dataset_id=str(cfg.get("cfg_dataset_id", "ryaasabsar/humaneval_asm_cfg")) if require_cfg else "(not used)",
        dfg_dataset_id=str(cfg.get("dfg_dataset_id", "ryaasabsar/humaneval_asm_dfg")) if require_dfg else "(not used)",
        paths=paths,
    )

    if not prompt_auto_confirm(preflight_lines):
        print("Run cancelled by user.")
        return 1

    print("Preflight confirmed. Preparing evaluator inputs...")
    if require_cfg:
        print("Loading CFG data...")
    else:
        print("CFG data not required for this prompt config.")
    if require_dfg:
        print("Loading DFG data...")
    else:
        print("DFG data not required for this prompt config.")

    cfg_data = load_graph_data(cfg, cfg_column, "cfg") if require_cfg else {}
    dfg_data = load_graph_data(cfg, dfg_column, "dfg") if require_dfg else {}

    evaluator = HumanEvalEvaluator(
        paths=paths,
        config_path=args.config.resolve(),
        validator_script=validator_script.resolve(),
        cfg_data=cfg_data,
        dfg_data=dfg_data,
    )

    engine = ComposerEngine(
        provider=provider,
        evaluator=evaluator,
        paths=paths,
        prompt_config=prompt_config,
        max_retries=max_retries,
        max_concurrency=max_concurrency,
        model_name=model_name,
        run_label=run_label,
        checkpoint_path=paths.logs_dir / f"checkpoint_{prompt_config}.json",
        startup_jitter_seconds=startup_jitter_seconds,
    )

    print("Loading errored problem specs and resolving source assembly...")
    problems = evaluator.get_problem_specs(prompt_config)
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
    final_validation_path, final_error_count, total_problems = evaluator.validate_all_outputs()

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
    return 0


def load_run_config(config_path: Path) -> dict[str, object]:
    return read_config(config_path.resolve())
