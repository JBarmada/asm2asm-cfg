# run_arm_translation_results.py

This document explains how to use `run_arm_translation_results.py` to compile translated ARM assembly files, link them with the matching HumanEval `test.c`, run the resulting AArch64 executables with QEMU, and write human-readable reports.

## What the script does

Given a directory of translated ARM `.s` files such as:

`x86_arm_translation_qemu_humaneval/results/exp01/arm_asm`

the script will:

1. Find each ARM assembly file.
2. Infer the problem name from the filename, for example `problem100_O2.s` -> `problem100`.
3. Find the matching test harness at `HumanEval_source/problem100/test.c`.
4. Compile the translated ARM assembly to an object file.
5. Compile the test harness to an object file for `aarch64-linux-gnu`.
6. Link both objects into a static executable.
7. Run the executable with `qemu-aarch64`.
8. Write two timestamped text reports.

## Expected input layout

The script assumes this workspace layout:

```text
.ASMwork/
  HumanEval_source/
    problem100/
      test.c
  x86_arm_translation_qemu_humaneval/
    run_arm_translation_results.py
    results/
      exp01/
        arm_asm/
          problem100_O2.s
```

## Recommended environment

Use the Docker image described in [crosscompiling-manual.md](../crosscompiling-manual.md), because it already contains the required cross-compilation tools and QEMU.

### Pull the image

```bash
docker pull nadinemostafa/crosscompile:latest
```

### Start the container

Run this from the workspace root on the host machine:

```bash
docker run --rm -it -v "${PWD}:/datasets" nadinemostafa/crosscompile:latest bash
```

Inside the container, your workspace will be available at `/datasets`.

## Basic usage

Inside the Docker container:

```bash
cd /datasets
python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm
```

## Run one filtered problem

Example for `problem100`:

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --problems 100
```

You can also pass the full problem name:

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --problems problem100
```

## Run a small batch

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --problems 100 101 102 103 104
```

## Command-line options

```text
usage: run_arm_translation_results.py [-h]
                                      [--problems PROBLEMS [PROBLEMS ...]]
                                      [--test-root TEST_ROOT]
                                      [--clang CLANG]
                                      [--qemu QEMU]
                                      [--sysroot SYSROOT]
                                      [--timeout TIMEOUT]
                                      [--no-link-math]
                                      arm_dir
```

### Positional argument

- `arm_dir`: Directory containing translated ARM `.s` files.

### Optional arguments

- `--problems`: Restrict execution to a subset of problems. Accepts either numbers like `100` or names like `problem100`.
- `--test-root`: Override the default `HumanEval_source` location.
- `--clang`: Override the clang executable name. Default is `clang-17`.
- `--qemu`: Override the QEMU executable name. Default is `qemu-aarch64`.
- `--sysroot`: Pass an explicit sysroot to clang if your toolchain requires it.
- `--timeout`: Timeout in seconds for each compile, link, or QEMU run. Default is `30`.
- `--no-link-math`: Disable linking with `-lm`. By default the script links with `-lm` because some translated programs reference math functions such as `ceil` and `floor`.

## Output locations

If the input directory is:

`x86_arm_translation_qemu_humaneval/results/exp01/arm_asm`

then the script writes outputs under:

`x86_arm_translation_qemu_humaneval/results/exp01`

### Per-problem artifacts

Executables and object files are written to:

`x86_arm_translation_qemu_humaneval/results/exp01/HEproblems/problemN`

Example:

```text
results/exp01/HEproblems/problem100/
  problem100_O2.o
  test.o
  problem100_arm_exe
```

### Reports

Two timestamped reports are written to:

`x86_arm_translation_qemu_humaneval/results/exp01/txts`

Example:

```text
20260314_100358_brief.txt
20260314_100358_verbose.txt
```

The brief report contains:

- Run start and finish time
- Input directory
- Test root
- Problem filter used
- Number of problems processed
- Status counts
- Failure summary

The verbose report additionally contains:

- Per-problem status
- Paths used
- All build and run commands
- Return codes
- Captured stdout and stderr

## Interpreting results

### `passed`

The binary compiled, linked, ran under QEMU, and exited with code `0`.

### `build_error`

Compilation or linking failed. This is often a toolchain or symbol-resolution problem, but it can also be caused by invalid translated assembly.

### `runtime_error`

The executable ran under QEMU but returned a nonzero exit code. For HumanEval tests, this often means an assertion failed or the program crashed.

### `timeout`

One of the compile, link, or QEMU steps exceeded the configured timeout.

### `missing_test`

The script could not find the corresponding `test.c` for that problem.

### `invalid_name`

The assembly filename did not match the expected pattern `problemN_*.s`.

## Troubleshooting

### Undefined symbols such as `ceil` or `floor`

The script now links with `-lm` by default. If you still see these errors, confirm you are using the Docker toolchain environment and that static math libraries are available there.

### `clang-17` or `qemu-aarch64` not found

Run inside the Docker image from [crosscompiling-manual.md](../crosscompiling-manual.md), or override the executable names with `--clang` and `--qemu`.

### No files matched

Check that:

1. The input directory exists.
2. It contains `.s` files.
3. Your `--problems` filter matches the filename pattern.

### A problem builds but fails at runtime

That usually indicates a translation correctness issue rather than a pure toolchain issue. Inspect the verbose report first, then compare the translated assembly with the original x86 or reference ARM version.

## Quick reference

Run all translated results for `exp01`:

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm
```

Run one problem:

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --problems 100
```

Run with a longer timeout:

```bash
cd /datasets && python3 x86_arm_translation_qemu_humaneval/run_arm_translation_results.py x86_arm_translation_qemu_humaneval/results/exp01/arm_asm --timeout 120
```