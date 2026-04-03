# oldTranslations

This directory is an archive of older translation pipelines, experiment outputs, and supporting scripts.
It is not the actively maintained part of the workspace.

The only maintained directory in the workspace is [ModularComposer](../ModularComposer).

## What Is Here

This archive contains historical work in several directions:

- `x86arm_translation_qemu_humaneval/`
  - Older x86 -> ARM translation and evaluation pipeline.
  - Includes comparison, bucketing, regression summary, and HumanEval evaluation helpers.
- `ARMv8-Transpilation/`
  - Earlier ARMv8 translation scripts and results.
- `RISCV-Transpilation/`
  - Earlier RISC-V translation scripts and results.
- `x86riscv-translation/`
  - Earlier x86 -> RISC-V related experiments and utilities.
- `asm_translation_config.json`
  - Shared configuration used by older translation workflows.

## Use This Folder For

- Looking up past experiment outputs.
- Recovering old scripts or prompt templates.
- Comparing historical approaches across architectures.
- Reference only, unless you are intentionally reviving one of the archived pipelines.

## Notes

- Some subfolders contain their own README or manual files.
- Paths and scripts here may be stale relative to the current maintained codebase.
- For active development, use [ModularComposer](../ModularComposer) instead.
