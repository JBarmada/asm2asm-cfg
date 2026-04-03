from __future__ import annotations

import threading
from pathlib import Path

from .utils import ComposerRuntimePaths


def prompt_auto_confirm(lines: list[str], timeout_seconds: int = 60) -> bool:
    print("Preflight summary:")
    for line in lines:
        print(line)
    print("")
    print(f"Continue? Press Enter/Y to proceed. Auto-continues in {timeout_seconds}s.")

    response: list[str] = []

    def _read_input() -> None:
        try:
            response.append(input().strip())
        except EOFError:
            response.append("")

    reader = threading.Thread(target=_read_input, daemon=True)
    reader.start()
    reader.join(timeout_seconds)
    if reader.is_alive():
        print("No response received. Auto-confirming run.")
        return True

    answer = response[0].strip().lower() if response else ""
    if answer in {"", "y", "yes", "continue", "go"}:
        print(f"User input received: {response[0] if response else '<enter>'}")
        print("Proceeding with run setup.")
        return True

    print(f"User input received: {response[0] if response else '<empty>'}")
    print("Run cancelled by user input.")
    return False


def build_preflight_lines(
    *,
    input_path: Path,
    config_path: Path,
    run_label: str,
    prompt_config: str,
    model_name: str,
    benchmark_name: str,
    error_json_path: Path,
    validator_script: Path,
    cfg_column: str,
    dfg_column: str,
    cfg_dataset_id: str,
    dfg_dataset_id: str,
    paths: ComposerRuntimePaths,
) -> list[str]:
    planned_dirs = [
        str(paths.run_output_dir),
        str(paths.benchmark_asm_input_dir),
        str(paths.full_validation_input_dir),
        str(paths.prompts_dir),
        str(paths.raw_output_dir),
        str(paths.original_error_asm_dir),
        str(paths.fixed_asm_dir),
        str(paths.logs_dir),
        str(paths.reports_dir),
        str(paths.cleaned_output_dir),
        str(paths.clean_diagnostics_dir),
        str(paths.compile_probe_dir),
        str(paths.validation_json_dir),
    ]

    return [
        f"Input path: {input_path.resolve()}",
        f"Config: {config_path.resolve()}",
        f"Run label: {run_label}",
        f"Prompt config: {prompt_config}",
        f"Model: {model_name}",
        f"Benchmark: {benchmark_name}",
        f"Error JSON: {error_json_path}",
        f"Validator script: {validator_script.resolve()}",
        "HF split used: O2",
        f"HF CFG dataset: {cfg_dataset_id} (column: {cfg_column})",
        f"HF DFG dataset: {dfg_dataset_id} (column: {dfg_column})",
        f"Output root: {paths.run_output_dir}",
        "Directories to be created or reused:",
        *[f"- {item}" for item in planned_dirs],
    ]
