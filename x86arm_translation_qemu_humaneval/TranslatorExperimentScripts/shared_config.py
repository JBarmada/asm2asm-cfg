from pathlib import Path

# This file is the single source of truth for shared experiment paths.
SCRIPTS_DIR = Path(__file__).resolve().parent
PROJECT_DIR = SCRIPTS_DIR.parent
ASMWORK_DIR = PROJECT_DIR.parent

INPUT_S_DIR = ASMWORK_DIR / "Compiledown_HumanEval_O2" / "x86" / "asm"
INPUT_TEST_DIR = ASMWORK_DIR / "HumanEval_source"
CFG_DIR = ASMWORK_DIR / "Compiledown_HumanEval_O2" / "x86" / "cfg"
RESULTS_ROOT_DIR = PROJECT_DIR / "results"


def experiment_output_dir(experiment_name):
    """Return the canonical output directory for an experiment name."""
    return RESULTS_ROOT_DIR / experiment_name
