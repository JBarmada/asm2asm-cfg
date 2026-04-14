from __future__ import annotations

from composers import execute_pipeline, get_cfg_or_default, load_run_config, parse_shared_args
from composers.providers import OpenAIProvider


def main() -> int:
    args = parse_shared_args("Run benchmark-aware ModularComposer with OpenAI")
    cfg = load_run_config(args.config)

    model_name = args.model or str(cfg.get("composer_model", cfg.get("model_name", "gpt-4o-mini")))
    max_retries = int(args.max_retries or get_cfg_or_default(cfg, "max_retries", 3))
    retry_base_seconds = float(args.retry_base_seconds or get_cfg_or_default(cfg, "retry_base_seconds", 2.0))
    retry_jitter_seconds = float(
        args.retry_jitter_seconds if args.retry_jitter_seconds is not None else get_cfg_or_default(cfg, "retry_jitter_seconds", 1.0)
    )

    provider = OpenAIProvider(
        model_name=model_name,
        max_api_retries=max_retries,
        retry_base_seconds=retry_base_seconds,
        retry_jitter_seconds=retry_jitter_seconds,
    )

    return execute_pipeline(args, cfg, provider, model_name)


if __name__ == "__main__":
    raise SystemExit(main())
