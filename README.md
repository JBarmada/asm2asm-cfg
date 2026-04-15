# ASMwork Workspace

This repository is a workspace for assembly translation experiments, supporting data, and archived outputs.

Only one directory is currently maintained:

- [ModularComposer](ModularComposer)

Everything else should be treated as historical, experimental, or reference material unless it is explicitly called out otherwise.

## What ModularComposer Is For

ModularComposer is the active codebase in this workspace. It provides a modular pipeline for:

- running provider-backed assembly repair experiments,
- validating generated assembly against HumanEval-style tests,
- retrying failed repairs with feedback,
- writing run artifacts, checkpoints, and reports.

If you want the current implementation details, start with [ModularComposer/README.md](ModularComposer/README.md).
That README now also documents the current BringUpBench helper scripts, including the `error_cfg_dfg` runner and the opt-in speed experiment flags for validation concurrency, skipping `make clean`, and disabling forced rebuilds.

## Workspace Layout

Some notable top-level areas in the workspace are:

- [ModularComposer](ModularComposer) - maintained composer pipeline.
- [crosscompiling-manual.md](crosscompiling-manual.md) - cross-compilation notes.
- [Compiledown_HumanEval_O2](Compiledown_HumanEval_O2) - source material used by older experiments.
- [HumanEval_source](HumanEval_source) - HumanEval test harness sources.
- [oldTranslations](oldTranslations) - archived outputs and older experiments.
- [Qwen-Translations](Qwen-Translations) - translation artifacts and experiment data.
- [CFGstuff](CFGstuff) - CFG-related helper scripts and configs.

## How To Use This Workspace

For day-to-day work, focus on [ModularComposer](ModularComposer). The other folders are useful for context, archived results, or source data, but they are not the maintained entrypoints of the project.

If you need broader workspace history or supporting material, browse the remaining directories as reference only.

