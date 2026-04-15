## Workspace Status

This manual is kept for reference and historical setup guidance.
The only directory currently maintained in this workspace is [ModularComposer](ModularComposer).

## Setup the environment

1. Download the docker image

    ```bash
    docker pull nadinemostafa/crosscompile:latest
    ```

    ```bash
    docker build -t my-crosscompile .
    ```

    Make a .docker.env files with
    '''text
    GOOGLE_API_KEY=Your API key
    HF_TOKEN=
    OPENAI_API_KEY=
    '''

2. Run the docker image

    ```bash
       docker run --rm -it --env-file .docker.env -v "${PWD}:/datasets" my-crosscompile bash
       bash
    ```

    Replace `<datasets_path>` with the path to the datasets you want to use in your project. This will mount the datasets directory to the `/datasets` directory inside the docker container.

This Docker image is set up with all the necessary tools and libraries for cross-compiling your project. You can now navigate to the `/datasets` directory inside the container to access your datasets and start working on your project.

### ModularComposer quick start inside Docker

Current maintained workflow:

```bash
cd /datasets/ModularComposer
```

BringUpBench qwen0.5b `error_cfg_dfg` full run:

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh
```

The helper defaults to these Hugging Face graph datasets:

- `ryaasabsar/bringup_asm_cfg`
- `ryaasabsar/bringup_asm_dfg`

Controlled BringUp speed experiment:

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh \
  --run-label-suffix exp-vc2-skipclean \
  --validation-concurrency-limit 2 \
  --skip-clean
```

More aggressive BringUp experiment:

```bash
bash gemini_BU_full_qwen0p5b_error_cfg_dfg.sh \
  --run-label-suffix exp-vc2-skipclean-nob \
  --validation-concurrency-limit 2 \
  --skip-clean \
  --no-force-rebuild
```

### Tools included in the Docker image:
- clang-17
- LLVM-17
- LLD-17
- riscv64-linux-gnu-gcc
- aarch64-linux-gnu-gcc
- qemu-riscv64
- qemu-aarch64

## Create x86-64 assembly files from C source code and running the executable
To create assembly files from your C source code, you can use the `clang` compiler with the `-S` flag. This will generate assembly code for your source files. Here’s how you can do it:

```bash
# 1. Generate assembly
clang-17 \
  -target x86_64-unknown-linux-gnu \
  -masm=intel \
  -S file.c \
  -o <file_name>_x86.s

# 2. Compile assembly to object
clang-17 -target x86_64-unknown-linux-gnu -masm=intel -c <file_name>_x86.s -o <file_name>_x86.o

# 3. Link object to executable (runnable)
clang-17 <file_name>_x86.o -o <file_name>_exe

#4. run executable
./<file_name>_exe
```
Replace `<file_name>` with the name of your C source file (without the `.c` extension). This will generate an assembly file (`.s`), compile it to an object file (`.o`), link it to create an executable, and then run the executable.

## Cross-compiling for Arm and running the executable
To cross-compile your C source code for the Arm architecture, you can use the `clang` compiler with the appropriate target flags. Here’s how you can do it:

```bash
# 1. Generate ARM64 assembly
clang-17 -S -O2 -target aarch64-linux-gnu <file_name>.c -o <file_name>_arm.s

# 2. Compile assembly to object
clang-17 -c <file_name>_arm.s -o <file_name>_arm.o -target aarch64-linux-gnu

# 3. Link object to static executable
clang-17 <file_name>_arm.o -o <file_name>_arm_exe \
    -target aarch64-linux-gnu -static -fuse-ld=lld

# 4. Run the executable using qemu
qemu-aarch64 ./<file_name>_arm_exe

```

Replace `<file_name>` with the name of your C source file (without the `.c` extension). This will generate an ARM64 assembly file (`_arm.s`), compile it to an object file (`_arm.o`), link it to create a static executable, and then run the executable using QEMU.

## Cross-compiling for RISC-V and running the executable
To cross-compile your C source code for the RISC-V architecture, you can use the `clang` compiler with the appropriate target flags. Here’s how you can do it:

```bash
# 1. Generate RISC-V assembly
clang-17 -S -O2 -target riscv64-unknown-linux-gnu -march=rv64gc -mabi=lp64d <file_name>.c -o <file_name>_riscv.s

# 2. Compile assembly to object
clang-17 -c <file_name>_riscv.s -o <file_name>_riscv.o -target riscv64-unknown-linux-gnu

# 3. Link object to static executable
clang-17 <file_name>_riscv.o -o <file_name>_riscv_exe \
    -target riscv64-unknown-linux-gnu -march=rv64gc -mabi=lp64d -static -fuse-ld=lld

# 4. Run the executable using qemu
qemu-riscv64 ./<file_name>_riscv_exe
```

Replace `<file_name>` with the name of your C source file (without the `.c` extension). This will generate a RISC-V assembly file (`_riscv.s`), compile it to an object file (`_riscv.o`), link it to create a static executable, and then run the executable using QEMU.



