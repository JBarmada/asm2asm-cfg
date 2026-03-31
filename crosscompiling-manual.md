## Setup the environment

1. Download the docker image
    ```bash
    docker pull nadinemostafa/crosscompile:latest
    ```

2. Run the docker image
    ```bash
       docker run --rm -it --env-file .docker.env -v "${PWD}:/datasets" my-crosscompile bash
       bash
    ```
    Replace `<datasets_path>` with the path to the datasets you want to use in your project. This will mount the datasets directory to the `/datasets` directory inside the docker container.

This Docker image is set up with all the necessary tools and libraries for cross-compiling your project. You can now navigate to the `/datasets` directory inside the container to access your datasets and start working on your project.

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



