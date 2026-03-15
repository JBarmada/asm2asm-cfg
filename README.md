# ASMwork: x86 -> ARM Translation Pipeline

This workspace contains an end-to-end pipeline for:

1. Translating O2 x86 assembly (HumanEval functions) to ARMv8 AArch64 assembly with Gemini.
2. Compiling and running translated ARM under QEMU against HumanEval tests.
3. Bucketizing failures into repeatable error categories.
4. Comparing two experiment runs and tracking regressions.

The core pipeline scripts live in the folder below:

- `x86_arm_translation_qemu_humaneval`

## 1) What Each Script Does

### Translation experiments

- `x86_arm_translation_qemu_humaneval/exp01_gemini_single_prompt_no_cfg.py`
  - Sequential translation.
  - Input: x86 assembly only.
  - Output: translated ARM files under `results/exp01/arm_asm`.

- `x86_arm_translation_qemu_humaneval/exp01.1_gemini_single_prompt_no_cfg.py`
  - Parallel translation with retries/backoff.
  - Input: x86 assembly only.
  - Output: translated ARM files under `results/exp01.1/arm_asm`.

- `x86_arm_translation_qemu_humaneval/exp02_gemini_single_prompt_cfg.py`
  - Sequential translation using x86 assembly + CFG.
  - Output: translated ARM files under `results/exp02/arm_asm`.

- `x86_arm_translation_qemu_humaneval/exp02.1_gemini_single_prompt_cfg.py`
  - Parallel translation using x86 assembly + CFG.
  - Output: translated ARM files under `results/exp02.1/arm_asm`.

### Build/run evaluation

- `x86_arm_translation_qemu_humaneval/run_arm_translation_results.py`
  - Compiles each translated `.s` file for `aarch64-linux-gnu`.
  - Links with the corresponding HumanEval `test.c`.
  - Runs with `qemu-aarch64`.
  - Writes reports to `results/<exp>/txts` and per-problem artifacts to `results/<exp>/HEproblems`.

### Failure bucketing and comparison

- `x86_arm_translation_qemu_humaneval/bucketize_verbose_report.py`
  - Parses one verbose evaluation report (`*_verbose.txt`).
  - Classifies failures into known buckets (invalid addressing, illegal immediates, segfault, etc.).
  - Saves a JSON summary (`bucketjson/*_buckets.json`).

- `x86_arm_translation_qemu_humaneval/compare_bucket_runs.py`
  - Compares two runs (either verbose reports or bucket JSONs).
  - Produces side-by-side status transitions and bucket deltas.
  - Writes artifacts in `results/comparisons/<timestamp>_<old>_vs_<new>`.

- `x86_arm_translation_qemu_humaneval/summarize_regressions.py`
  - Reads `problem_transitions.csv` from a comparison directory.
  - Prints a regression-focused summary table.
  - Optionally writes `regressions_summary.csv`.

### Utility patcher

- `x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py`
  - Adds missing `.globl func0` / `.type func0,@function` directives when needed.
  - Useful for a specific recurring assembler/linker failure mode.

## 2) Required Inputs and Layout

Expected important folders in this workspace:

- `Compiledown_HumanEval_O2/x86/asm`: x86 assembly inputs.
- `Compiledown_HumanEval_O2/x86/cfg`: CFG inputs (for CFG experiments).
- `HumanEval_source/problemN/test.c`: HumanEval C test harnesses.

Translation outputs are created under:

- `x86_arm_translation_qemu_humaneval/results/<experiment-name>`

## 3) Environment Setup

## Gemini API key

Set your API key before translation:

```powershell
$env:GEMINI_API_KEY = "<your_key_here>"
```

## Cross-compile + QEMU toolchain

Evaluation requires:

- `clang-17` (or equivalent cross-compile clang)
- `qemu-aarch64`
- static link dependencies for AArch64

See details in:

- `crosscompiling-manual.md`
- `x86_arm_translation_qemu_humaneval/README_run_arm_translation_results.md`

## 4) End-to-End Pipeline (Typical)

Run commands from workspace root (`ASMwork`).

### Step A: Run a translation experiment

Example (parallel, no CFG):

```bash
python x86_arm_translation_qemu_humaneval/exp01.1_gemini_single_prompt_no_cfg.py
```

Example (parallel, with CFG):

```bash
python x86_arm_translation_qemu_humaneval/exp02.1_gemini_single_prompt_cfg.py
```

### Step B: Evaluate translated ARM against HumanEval tests

Example for exp01.1:

```bash
python x86_arm_translation_qemu_humaneval/run_arm_translation_results.py \
  x86_arm_translation_qemu_humaneval/results/exp01.1/arm_asm
```

This generates:

- `results/exp01.1/txts/<timestamp>_brief.txt`
- `results/exp01.1/txts/<timestamp>_verbose.txt`

### Step C: Bucketize one verbose report

```bash
python x86_arm_translation_qemu_humaneval/bucketize_verbose_report.py \
  x86_arm_translation_qemu_humaneval/results/exp01.1/txts/<timestamp>_verbose.txt
```

### Step D: Compare two experiment runs

```bash
python x86_arm_translation_qemu_humaneval/compare_bucket_runs.py \
  x86_arm_translation_qemu_humaneval/results/exp01/txts/<old_timestamp>_verbose.txt \
  x86_arm_translation_qemu_humaneval/results/exp02.1/txts/<new_timestamp>_verbose.txt \
  --label-old exp01 --label-new exp02.1
```

This writes comparison artifacts under:

- `x86_arm_translation_qemu_humaneval/results/comparisons/<timestamp>_exp01_vs_exp02.1/`

### Step E: Summarize regressions from the comparison

```bash
python x86_arm_translation_qemu_humaneval/summarize_regressions.py \
  x86_arm_translation_qemu_humaneval/results/comparisons/<comparison_dir>
```

Or auto-use latest comparison:

```bash
python x86_arm_translation_qemu_humaneval/summarize_regressions.py
```

Write CSV instead of terminal table:

```bash
python x86_arm_translation_qemu_humaneval/summarize_regressions.py --include-changed --csv
```

## 5) How to Read the Main Outputs

### Translation outputs

For each problem file:

- `prompts/problemN.txt`: exact prompt sent to the model.
- `raw_model_output/problemN.txt`: raw model text output.
- `arm_asm/problemN*.s`: cleaned ARM assembly used for evaluation.
- `failures.log`: API/request failures during translation.

### Evaluation statuses from run_arm_translation_results

- `passed`: binary ran under QEMU and exited with code 0.
- `build_error`: compile/link failed.
- `runtime_error`: executable ran but exited non-zero.
- `timeout`: compile/link/run exceeded timeout.
- `missing_test`: `test.c` not found for that problem.
- `invalid_name`: assembly filename did not match expected `problemN...` pattern.

### Comparison artifacts

Inside `results/comparisons/<comparison_dir>`:

- `comparison_summary.txt`: human-readable overall summary.
- `problem_transitions.csv`: per-problem old/new statuses and bucket deltas.
- `status_transition_counts.csv`: aggregate transition counts.
- `bucket_deltas.csv`: per-bucket old/new counts and problem additions/removals.
- `comparison_summary.json`: machine-readable structured summary.

## 6) Useful Optional Commands

### Patch missing func0 exports in translated assembly

```bash
python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
  x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --dry-run
```

```bash
python x86_arm_translation_qemu_humaneval/fix_missing_func0_export.py \
  x86_arm_translation_qemu_humaneval/results/exp01/arm_asm
```

### Run CFG validators across all problems (separate from translation pipeline)

```bash
./run_all.sh
```

## 7) Practical Workflow Recommendation

For reliable experiment tracking:

1. Run one translation experiment (for example `exp01.1` or `exp02.1`).
2. Evaluate with `run_arm_translation_results.py`.
3. Keep the generated `*_verbose.txt` file path.
4. Compare against a baseline run using `compare_bucket_runs.py`.
5. Use `summarize_regressions.py` to focus on newly broken problems first.

This keeps each run reproducible and makes regressions easy to diagnose.
