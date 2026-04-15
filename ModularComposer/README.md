# ModularComposer

ModularComposer is a provider-agnostic assembly repair pipeline for benchmarked translation experiments.
It now supports three benchmark families through one shared runner:

- `humaneval`
- `mceval`
- `bringup`

The pipeline is organized around clean boundaries:

- providers generate repair candidates,
- benchmark adapters load failures and validate outputs,
- the engine handles prompts, retries, checkpoints, and run artifacts.

## Entry Points

Primary entrypoints:

- `compose_gemini.py`
- `compose_openai.py`

Backward-compatible HumanEval wrappers are still present:

- `humaneval_compose_gemini.py`
- `humaneval_compose_openai.py`

Repository helper scripts are also available for common full-run workflows:

- `composer_run_all_o2.sh`
- `gemini_HE_run_all.sh`
- `gemini_MC_full_qwen0p5b_base.sh`
- `gemini_MC_full_qwen0p5b_error_cfg_dfg.sh`
- `gemini_BU_full_qwen0p5b_base.sh`
- `gemini_BU_full_qwen0p5b_error_cfg_dfg.sh`

## Supported Targets

Canonical public ISA IDs:

- `x86`
- `armv8-linux`
- `armv8.4a-apple`
- `riscv`

Accepted compatibility aliases:

- `arm_linux`
- `arm_apple`
- `armv8`
- `armv8.4a`

The config loader also accepts legacy values such as `x86_64` and `riscv64` for backward compatibility.

## Benchmark Behavior

### HumanEval

- Standard C compile/link/run flow.
- Default CFG/DFG dataset IDs are built in.
- Prompt contract keeps the expected single benchmark symbol, typically `func0`.

### McEval

- Standard C compile/link/run flow.
- Expected function symbols are extracted from the local benchmark task files.
- CFG/DFG prompt modes require explicit `cfg_dataset_id` and `dfg_dataset_id`.

### BringUpBench

- Makefile-driven build and test flow.
- Prompts treat the input as a translation-unit replacement, not a single function.
- Prompt concurrency can remain high, but validation concurrency defaults to `1`.
- BringUp can opt into controlled speed experiments with:
  - `bringup_validation_concurrency_limit`
  - `bringup_skip_clean`
  - `bringup_force_rebuild`
- Direct `compose_*.py` runs require explicit `cfg_dataset_id` and `dfg_dataset_id` for CFG/DFG prompt modes.

## Input Routes

ModularComposer supports two first-class inputs.

### 1. Evaluated JSON Input

Pass a JSON produced by `cpu-transpiler-inference/eval.py`.

Example:

```bash
python compose_gemini.py ../some_eval_results/humaneval_riscv.json --config config.json
```

In this mode the pipeline:

- reads errored entries from the JSON,
- materializes assembly into `json_input_asm/`,
- repairs only the failing tasks.

### 2. ASM Directory / Experiment Directory Input

Pass either:

- an experiment directory containing `translated_asm/`, or
- a direct `*_asm/` directory.

If an error JSON is available, use `--error-json`. If not, ModularComposer can bootstrap one automatically.

Example using an existing error JSON:

```bash
python compose_gemini.py ../runs/mceval_x86_to_riscv --config config_examples/mceval_riscv.json --error-json ../runs/mceval_x86_to_riscv/jsons/O2_error_problems.json
```

Example with automatic bootstrap:

```bash
python compose_gemini.py ../runs/bringup_x86_to_arm/translated_asm --config config_examples/bringup_armv8-linux.json --bootstrap-errors
```

When bootstrap is enabled and no error JSON is found, the benchmark adapter first evaluates the input assembly and writes:

- `validation_json/bootstrap_error_problems.json`

The composition run then continues from that generated error list.

## Running

Run commands from the `ModularComposer` directory.

### Gemini

```bash
python compose_gemini.py <input_path> --config <config.json>
```

### OpenAI

```bash
python compose_openai.py <input_path> --config <config.json>
```

Useful overrides:

```bash
--benchmark humaneval|mceval|bringup
--benchmark-root ../cpu-transpiler-inference/benchmarks/mceval-c
--target-isa x86|armv8-linux|armv8.4a-apple|riscv
--input-mode auto|evaluated_json|asm_dir
--bootstrap-errors
--prompt-config base|error_only|cfg_only|dfg_only|error_cfg|error_dfg|cfg_dfg|error_cfg_dfg
--run-label my_run
--error-json path/to/error_problems.json
--model gemini-3-flash-preview
--max-concurrency 8
--prompt-concurrency 8
--validation-concurrency 1
--max-retries 3
--resume-checkpoint results/composer/<run>/logs/checkpoint_<prompt>.json
```

### Generic Campaign Runner

`composer_run_all_o2.sh` is the generic campaign helper.

- The default unfiltered sweep is qwen-only and ordered as:
  - `qwen0.5b`
  - `qwen3b`
  - `qwen1.5b`
- The intended operator pattern is one terminal per benchmark:
  - `./composer_run_all_o2.sh --benchmark humaneval ...`
  - `./composer_run_all_o2.sh --benchmark bringup ...`
  - `./composer_run_all_o2.sh --benchmark mceval ...`
- Default prompt coverage in the generic runner is:
  - `base`
  - `error_cfg_dfg`
- HumanEval `qwen0.5b` `error_cfg_dfg` is intentionally skipped for the Gemini composer campaign.
- The shared qwen config defaults are:
  - `Prompt concurrency: 100`
  - `Validation concurrency: 100`
- The generic runner applies benchmark-specific campaign overrides:
  - HumanEval: `100/100`
  - McEval: `100/100`
  - BringUpBench: `64/16`
- BringUp preflight should still clamp to:
  - `Prompt concurrency: 64`
  - `Validation concurrency: 1`
- Generic run labels are kept under:
  - `results/composer/<provider>Composer/<translation-model>/<benchmark>/<source>-to-<target>`
- Legacy HumanEval qwen run directories are migrated into that canonical layout automatically before real HumanEval runs.
- If you want to tidy the HumanEval layout without launching jobs, use:
  - `./composer_run_all_o2.sh --benchmark humaneval --migrate-humaneval-legacy --list`
- Plain `--list` and `--dry-run` remain non-mutating unless you explicitly add `--migrate-humaneval-legacy`.

### Target ISA Override Examples

```bash
python compose_gemini.py <input_path> --config config.json --target-isa x86
python compose_gemini.py <input_path> --config config.json --target-isa armv8-linux
python compose_gemini.py <input_path> --config config.json --target-isa armv8.4a-apple
python compose_gemini.py <input_path> --config config.json --target-isa riscv
```

## Config Shape

Primary config fields:

- `benchmark`
- `benchmark_root`
- `target_isa`
- `source_isa`
- `composer_model`
- `composer_prompt_config`
- `max_workers`
- `prompt_concurrency`
- `validation_concurrency`
- `max_retries`
- `bootstrap_errors`
- `clang`
- `compile_flags`
- `link_flags`
- `qemu`
- `use_qemu`
- `timeout_seconds`
- `standard_timeout_seconds`
- `bringup_timeout_seconds`
- `make_target`
- `bringup_validation_concurrency_limit`
- `bringup_skip_clean`
- `bringup_force_rebuild`
- `graph_source`
- `graph_split`
- `cfg_dataset_id`
- `dfg_dataset_id`
- `source_dataset_column`
- `cfg_dataset_column`
- `dfg_dataset_column`

Compatibility aliases are still accepted during transition:

- `target_arch` -> `target_isa`
- `test_root` -> `benchmark_root` for legacy HumanEval configs
- `source_arch` -> `source_isa`

`validator_script` is no longer part of the normal runner path.

### Default Config

The repository default is `config.json`.

### Example Configs

Canonical example configs live in `config_examples/`:

- `humaneval_x86.json`
- `humaneval_armv8-linux.json`
- `humaneval_armv8.4a-apple.json`
- `humaneval_riscv.json`
- `mceval_x86.json`
- `mceval_armv8-linux.json`
- `mceval_armv8.4a-apple.json`
- `mceval_riscv.json`
- `bringup_x86.json`
- `bringup_armv8-linux.json`
- `bringup_armv8.4a-apple.json`
- `bringup_riscv.json`

The existing `configs_compose/` files were also migrated to the canonical key names for compatibility with older experiment naming.

## Graph Data Rules

Graph prompt configs are:

- `cfg_only`
- `dfg_only`
- `error_cfg`
- `error_dfg`
- `cfg_dfg`
- `error_cfg_dfg`

Dataset behavior:

- HumanEval can use built-in default dataset IDs.
- Direct `compose_*.py` runs for McEval and BringUpBench fail fast unless you set `cfg_dataset_id` and/or `dfg_dataset_id` explicitly.
- `composer_run_all_o2.sh` auto-fills graph dataset defaults for `error_cfg_dfg`:
  - McEval CFG: `ryaasabsar/mceval_asm_cfg`
  - McEval DFG: `ryaasabsar/mceval_asm_dfg`
  - BringUp CFG: `ryaasabsar/bringup_asm_cfg`
  - BringUp DFG: `ryaasabsar/bringup_asm_dfg`

If you do not want graph inputs, use a non-graph prompt config such as `base` or `error_only`.

Retry feedback behavior:

- `base` does not receive prior validation feedback.
- `error_*` prompt configs receive cleaned toolchain/runtime diagnostics only.
- Those diagnostics are derived from build, link, qemu, and benchmark test artifacts already produced by validation.
- Raw stderr/stdout and command logs remain on disk for auditability.
- Retries do not use source code, source-level semantics, expected outputs, or benchmark-specific oracle hints.

McEval graph note:

- The generic runner can now auto-inject these McEval graph defaults for McEval graph prompts:
  - `ryaasabsar/mceval_asm_cfg`
  - `ryaasabsar/mceval_asm_dfg`
- The dedicated qwen0.5b McEval Gemini script also defaults to:
  - `ryaasabsar/mceval_asm_cfg`
  - `ryaasabsar/mceval_asm_dfg`
  and still allows overrides.

## Preflight

Before model calls begin, the runner prints a preflight summary containing:

- input path
- config path
- run label
- prompt config
- model
- benchmark
- benchmark root
- target ISA
- input mode
- prompt concurrency
- validation concurrency
- resolved ASM input dir
- resolved or bootstrapped error JSON path
- graph split and dataset IDs
- output directories

The run waits up to 60 seconds for confirmation and auto-continues if no input is received.

## Output Layout

Outputs are written under:

`results/composer/<run_label>/<prompt_config>/`

Key directories:

- `json_input_asm/`
- `prompts/`
- `raw_model_output/`
- `cleaned_model_output/`
- `clean_diagnostics/`
- `original_error_<target_isa>_asm/`
- `fixed_<target_isa>_asm/`
- `compile_probe/`
- `validation_json/`
- `full_validation_input_asm/`
- `logs/`
- `txts/`

## Example Workflows

### HumanEval from `eval.py` JSON

```bash
python compose_gemini.py ../results/humaneval_eval_riscv.json --config config_examples/humaneval_riscv.json
```

### McEval from an experiment directory

```bash
python compose_openai.py ../runs/mceval_riscv_experiment --config config_examples/mceval_riscv.json --error-json ../runs/mceval_riscv_experiment/jsons/O2_error_problems.json
```

### BringUpBench from raw translated assembly

```bash
python compose_gemini.py ../runs/bringup_arm/translated_asm --config config_examples/bringup_armv8-linux.json --bootstrap-errors
```

### BringUpBench full qwen0.5b base run

```bash
bash gemini_BU_full_qwen0p5b_base.sh
```

### BringUpBench full qwen0.5b `error_cfg_dfg` run

This helper defaults to:

- `cfg_dataset_id=ryaasabsar/bringup_asm_cfg`
- `dfg_dataset_id=ryaasabsar/bringup_asm_dfg`

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh
```

### BringUpBench speed experiment

Use a run-label suffix so the experimental outputs do not collide with the baseline directories.

Safer first experiment:

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh \
  --run-label-suffix exp-vc2-skipclean \
  --validation-concurrency-limit 2 \
  --skip-clean
```

More aggressive variant:

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh \
  --run-label-suffix exp-vc2-skipclean-nob \
  --validation-concurrency-limit 2 \
  --skip-clean \
  --no-force-rebuild
```

The same speed flags are also supported by `gemini_BU_full_qwen0p5b_base.sh`.

## Extending

### Add a provider

1. Add a module under `composers/providers/`.
2. Implement `ModelProvider.generate_repair`.
3. Add a thin entry script similar to `compose_gemini.py`.

### Add a benchmark

1. Add an adapter under `composers/benchmarks/`.
2. Implement the `BenchmarkAdapter` interface.
3. Register it in `composers/benchmarks/__init__.py`.

## Notes

- `source_isa` controls graph-column selection for the source program. Change it to match the original translation source in your experiment.
- BringUpBench uses isolated scratch workspaces. Validation defaults to one worker, but controlled experiments can raise the cap with `bringup_validation_concurrency_limit`.
- Direct ZIP ingestion is not part of this repo path. Pass the evaluated JSON or the extracted ASM directory instead.
