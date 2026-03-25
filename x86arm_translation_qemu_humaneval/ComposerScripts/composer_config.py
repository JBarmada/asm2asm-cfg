from __future__ import annotations

from datetime import datetime
from pathlib import Path

# This file is the single source of truth for ComposerScripts paths and defaults.
SCRIPTS_DIR = Path(__file__).resolve().parent
PROJECT_DIR = SCRIPTS_DIR.parent
ASMWORK_DIR = PROJECT_DIR.parent
RESULTS_ROOT_DIR = PROJECT_DIR / "results"
COMPOSER_RESULTS_ROOT_DIR = RESULTS_ROOT_DIR / "composer"

SUPPORTED_LANGUAGES = (
    "arm",
    "x86",
    "riscv",
)
DEFAULT_SOURCE_LANGUAGE = "arm"

# Shared source directories used by translation/composer flows.
INPUT_S_DIR = ASMWORK_DIR / "Compiledown_HumanEval_O2" / DEFAULT_SOURCE_LANGUAGE / "asm"
INPUT_TEST_DIR = ASMWORK_DIR / "HumanEval_source"
CFG_DIR = ASMWORK_DIR / "Compiledown_HumanEval_O2" / DEFAULT_SOURCE_LANGUAGE / "cfg"
DFG_DIR = ASMWORK_DIR / "Compiledown_HumanEval_O2" / DEFAULT_SOURCE_LANGUAGE / "dfg"

# Existing script that compiles/runs ARM and emits errored-problem JSON.
RUN_ERROR_JSON_SCRIPT = SCRIPTS_DIR / "run_arm_translation_error_json.py"

# Composer defaults.
ALLOWED_MODELS = (
    "gemini-3-flash-preview",
    "gemini-3.1-pro-preview",
)
DEFAULT_MODEL = "gemini-3-flash-preview"
DEFAULT_MAX_RETRIES = 3
DEFAULT_MAX_CONCURRENCY = 100
DEFAULT_RETRY_BASE_SECONDS = 3.0
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


def benchmark_source_asm_dir(benchmark_name: str, source_language: str) -> Path:
    """Return benchmark assembly directory for the selected source language."""

    language = source_language.strip().lower()
    return benchmark_dir(benchmark_name) / f"{language}_asm"


def language_cfg_dir(source_language: str) -> Path:
    """Return language-specific CFG directory under Compiledown_HumanEval_O2."""

    language = source_language.strip().lower()
    return ASMWORK_DIR / "Compiledown_HumanEval_O2" / language / "cfg"


def language_dfg_dir(source_language: str) -> Path:
    """Return language-specific DFG directory under Compiledown_HumanEval_O2."""

    language = source_language.strip().lower()
    return ASMWORK_DIR / "Compiledown_HumanEval_O2" / language / "dfg"


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
    return COMPOSER_RESULTS_ROOT_DIR / run_name


def composer_prompts_dir(run_dir: Path) -> Path:
    return run_dir / "prompts"


def composer_raw_output_dir(run_dir: Path) -> Path:
    return run_dir / "raw_model_output"


def composer_fixed_asm_dir(run_dir: Path, source_language: str = DEFAULT_SOURCE_LANGUAGE) -> Path:
    language = source_language.strip().lower()
    return run_dir / f"fixed_{language}_asm"


def composer_logs_dir(run_dir: Path) -> Path:
    return run_dir / "logs"


def composer_original_error_asm_dir(run_dir: Path, source_language: str = DEFAULT_SOURCE_LANGUAGE) -> Path:
    language = source_language.strip().lower()
    return run_dir / f"original_error_{language}_asm"


def composer_reports_dir(run_dir: Path) -> Path:
    return run_dir / "txts"


def composer_brief_report_path(run_dir: Path) -> Path:
    return composer_reports_dir(run_dir) / "brief.txt"


def composer_verbose_report_path(run_dir: Path) -> Path:
    return composer_reports_dir(run_dir) / "verbose.txt"
