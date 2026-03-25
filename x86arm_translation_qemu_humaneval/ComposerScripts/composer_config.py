from __future__ import annotations

from datetime import datetime
from pathlib import Path

# This file is the single source of truth for ComposerScripts paths and defaults.
SCRIPTS_DIR = Path(__file__).resolve().parent
PROJECT_DIR = SCRIPTS_DIR.parent
ASMWORK_DIR = PROJECT_DIR.parent
RESULTS_ROOT_DIR = PROJECT_DIR / "results"

# Existing script that compiles/runs ARM and emits errored-problem JSON.
RUN_ERROR_JSON_SCRIPT = SCRIPTS_DIR / "run_arm_translation_error_json.py"

# Composer defaults.
ALLOWED_MODELS = (
    "gemini-3-flash-preview",
    "gemini-3.1-pro-preview",
)
DEFAULT_MODEL = "gemini-3-flash-preview"
DEFAULT_MAX_RETRIES = 3
DEFAULT_TIMEOUT_SECONDS = 30

PROMPT_CONFIGS = (
    "base",
    "error_only",
    "cfg_only",
    "dfg_only",
    "error_cfg",
    "error_dfg",
    "cfg_dfg",
    "error_cfg_dfg",
)


def benchmark_dir(benchmark_name: str) -> Path:
    """Return the canonical results directory for a benchmark (e.g., exp01.2)."""

    return RESULTS_ROOT_DIR / benchmark_name


def benchmark_arm_dir(benchmark_name: str) -> Path:
    """Return the ARM assembly input directory for a benchmark run."""

    return benchmark_dir(benchmark_name) / "arm_asm"


def benchmark_json_dir(benchmark_name: str) -> Path:
    """Return the JSON report directory for a benchmark run."""

    return benchmark_dir(benchmark_name) / "jsons"


def latest_error_json_path(benchmark_name: str) -> Path | None:
    """Return newest *_error_problems.json file for the benchmark, or None."""

    json_dir = benchmark_json_dir(benchmark_name)
    if not json_dir.exists() or not json_dir.is_dir():
        return None

    candidates = sorted(
        json_dir.glob("*_error_problems.json"),
        key=lambda p: p.stat().st_mtime,
    )
    return candidates[-1] if candidates else None


def _sanitize_fragment(value: str) -> str:
    """Convert free-form text into a filesystem-safe path fragment."""

    allowed = set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.")
    cleaned = "".join(ch if ch in allowed else "_" for ch in value.strip())
    return cleaned.strip("_") or "value"


def composer_output_dir(
    benchmark_name: str,
    model_name: str,
    prompt_config: str,
    timestamp: str | None = None,
) -> Path:
    """Return output dir: <benchmark>_<model>_<promptconfig>_<timestamp>."""

    ts = timestamp or datetime.now().strftime("%Y%m%d_%H%M%S")
    run_name = "_".join(
        [
            _sanitize_fragment(benchmark_name),
            _sanitize_fragment(model_name),
            _sanitize_fragment(prompt_config),
            _sanitize_fragment(ts),
        ]
    )
    return RESULTS_ROOT_DIR / run_name


def composer_prompts_dir(run_dir: Path) -> Path:
    return run_dir / "prompts"


def composer_raw_output_dir(run_dir: Path) -> Path:
    return run_dir / "raw_model_output"


def composer_fixed_asm_dir(run_dir: Path) -> Path:
    return run_dir / "fixed_arm_asm"


def composer_logs_dir(run_dir: Path) -> Path:
    return run_dir / "logs"
