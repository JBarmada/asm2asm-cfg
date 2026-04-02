# ModularComposer

ModularComposer is a provider-agnostic assembly repair pipeline for HumanEval-style benchmarks.
It repairs only failed translations, validates each candidate, retries with feedback, and writes full run artifacts.

This implementation is organized so model providers (Gemini/OpenAI), benchmark evaluators, and orchestration are isolated and easy to extend.

## What It Does

1. Reads an input experiment directory or translation JSON.
2. Selects errored problems from error metadata.
3. Builds prompt variants (base/error/cfg/dfg combinations).
4. Calls a model provider to generate repaired assembly.
5. Validates each attempt with the HumanEval validator script.
6. Retries with feedback up to configured limits.
7. Produces final validation JSON, logs, diagnostics, checkpoints, and reports.

## Current Structure

- `humaneval_compose_gemini.py`
  - Thin entrypoint for Gemini provider.
- `humaneval_compose_openai.py`
  - Thin entrypoint for OpenAI provider.
- `config.json`
  - Shared runtime configuration.
- `human_eval_evaluator.py`
  - Validator script used by HumanEval evaluator.
- `composers/core.py`
  - `ComposerEngine` orchestration loop.
- `composers/humaneval_runner.py`
  - Shared argument parsing and shared run pipeline.
- `composers/preflight.py`
  - Preflight summary and 60s auto-confirm flow.
- `composers/utils.py`
  - Dataclasses, path resolution, cleanup helpers, checkpoint helpers.
- `composers/providers/base.py`
  - `ModelProvider`, `QuotaExhaustedError`, `FatalProviderError`.
- `composers/providers/gemini.py`
  - Gemini provider implementation with retries, jitter, fatal model-not-found detection.
- `composers/providers/openai.py`
  - OpenAI provider implementation with retries and jitter.
- `composers/evaluators/base.py`
  - `BaseEvaluator` interface.
- `composers/evaluators/humaneval.py`
  - HumanEval evaluator and graph dataset loader.

## Provider/Evaluator/Engine Boundaries

### Provider Layer

Responsible for:

- API auth and client lifecycle.
- Request retries and backoff.
- Provider-specific fatal/quota error detection.

Not responsible for:

- Benchmark parsing.
- Filesystem orchestration.
- Validation subprocess calls.

### Evaluator Layer

Responsible for:

- Parsing error payload and building problem specs.
- Materializing source asm files for JSON input mode.
- Running benchmark validation per attempt.
- Running final validation over merged fixed outputs.

Not responsible for:

- Model API calls.
- Retry orchestration policy.

### Engine Layer

Responsible for:

- Worker pool and concurrency.
- Prompt construction and iterative retry flow.
- Writing run artifacts (prompts/raw/cleaned/diagnostics).
- Checkpointing and resume.
- Final report generation.

## Prompt Configs

Supported prompt strategies:

- `base`
- `error_only`
- `cfg_only`
- `dfg_only`
- `error_cfg`
- `error_dfg`
- `cfg_dfg`
- `error_cfg_dfg`

## Input Modes

### 1) Directory Input

Pass an experiment directory. The runner resolves source asm from:

- `translated_asm/`, or
- `<target_arch_normalized>_asm/`

Error JSON is resolved from:

- `--error-json` if provided, else
- `error_json` in config, else
- latest `jsons/*_error_problems.json`

### 2) JSON Input

Pass a translation JSON directly. The evaluator:

- filters errored entries,
- synthesizes asm files from each entry `pred`,
- stores synthesized asm under the run output `json_input_asm` directory.

## Running

From the `ModularComposer` directory:

### Gemini

```bash
python humaneval_compose_gemini.py <input_dir_or_json> --config config.json
```

### OpenAI

```bash
python humaneval_compose_openai.py <input_dir_or_json> --config config.json
```

### Useful Overrides

```bash
--prompt-config error_cfg_dfg
--run-label my_run_name
--model gemini-3-flash-preview
--max-concurrency 8
--max-retries 3
--retry-base-seconds 2.0
--retry-jitter-seconds 1.0
--startup-jitter-seconds 2.0
--resume-checkpoint results/composer/.../logs/checkpoint_error_cfg_dfg.json
--validator-script human_eval_evaluator.py
```

## Preflight Confirmation

Before model calls begin, the pipeline prints:

- input path
- config path
- run label
- prompt config
- model
- benchmark
- error JSON path
- validator script path
- HF split (`O2`)
- HF CFG/DFG dataset IDs and columns
- output root
- all directories to create/reuse

Then it waits for confirmation. Behavior:

- `y`->enter => continue immediately
- no input for 60 seconds => auto-confirm
- any other input => cancel run

## Output Layout

Outputs are grouped under:

`results/composer/<run_label>/<config_base>/<prompt_config>/`

Main subfolders:

- `json_input_asm/` (JSON input mode synthesized source asm)
- `prompts/`
- `raw_model_output/`
- `cleaned_model_output/`
- `clean_diagnostics/`
- `original_error_<arch>_asm/`
- `fixed_<arch>_asm/`
- `compile_probe/`
- `validation_json/`
- `full_validation_input_asm/`
- `logs/`
- `txts/` (final report)

## Retry and Jitter

There are two independent jitter controls:

- `startup_jitter_seconds`
  - Random delay before each worker starts, reduces request burst at t=0.
- `retry_jitter_seconds`
  - Random delay added to retry backoff, reduces synchronized retries.

Provider retry base is controlled by `retry_base_seconds`.

## Fatal and Quota Errors

### Gemini-details

- Daily quota exhaustion is detected and raises `QuotaExhaustedError`.
- Model-not-found / unsupported model errors (404 NOT_FOUND on model) raise `FatalProviderError`.

Both are treated as stop-run conditions by the engine.

### OpenAI-details

- Quota exhaustion (`insufficient_quota`) is treated as fatal for the run.

## Checkpoint and Resume

- Checkpoint path is per prompt config:
  - `logs/checkpoint_<prompt_config>.json`
- Resume with `--resume-checkpoint <path>`.
- Resume keeps previously completed problem results and continues pending ones.

## Config Reference

`config.json` fields commonly used:

### Model and run settings

- `composer_model`
- `composer_prompt_config`
- `max_workers`
- `max_retries`
- `retry_base_seconds`
- `retry_jitter_seconds`
- `startup_jitter_seconds`

### Graph settings

- `graph_source` (`hf` or disabled values)
- `cfg_dataset_id` (optional, default provided)
- `dfg_dataset_id` (optional, default provided)
- `cfg_dataset_column`
- `dfg_dataset_column`
- `source_dataset_column`

### Toolchain/runtime settings

- `target_arch`
- `test_root`
- `clang`
- `compile_flags`
- `link_flags`
- `qemu`
- `use_qemu`
- `timeout_seconds`
- `validator_script`

## Notes for Extending

### Add a new provider

1. Add module under `composers/providers/`.
2. Implement `ModelProvider.generate_repair`.
3. Wire a new thin entry script similar to current two compose entrypoints.

### Add a new evaluator

1. Add module under `composers/evaluators/` implementing `BaseEvaluator`.
2. Update shared runner or add a benchmark-specific runner to instantiate the new evaluator.

## Common Pitfalls

- Wrong provider model name: Gemini will fail fast with `FatalProviderError` if model is unsupported.
- Mismatched target toolchain: ensure `compile_flags`, `link_flags`, `qemu`, and `target_arch` are consistent.
- Validator path mismatch: ensure `validator_script` points to an existing script in this folder.
- Missing graph package: CFG/DFG prompt modes require `datasets` package.

## Quick Start Example

```bash
python humaneval_compose_gemini.py ../Qwen-Translations/riscv/3b/<run>.json --config config.json --run-label run0
```

This will run preflight confirmation, then process errored problems only, and write results under `results/composer/run0/...`.
