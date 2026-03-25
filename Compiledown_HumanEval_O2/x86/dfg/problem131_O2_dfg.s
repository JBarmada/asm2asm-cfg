                                                  // +---------------------+---------------------+-----------+
                                                  // |         GPR         |        VECTOR       |   FLAGS   |
                                                  // |                     |                     |           |
                                                  // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                  // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                  // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                  // |                     |    0123456789111111 |           |
                                                  // |  #                  |  #           012345 |  #        |
                                                  // +---------------------+---------------------+-----------+
    .text                                         // |                     |                     |           |
    .file   "code.c"                              // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %edi, %ebx                            // |  3  ^   v :         |  0                  |  0        |
    leal    1(%rbx), %ebp                         // |  3  v    ^:         |  0                  |  0        |
    movslq  %ebp, %rdi                            // |  4  :   ^v:         |  0                  |  0        |
    shlq    $2, %rdi                              // |  3  :   x :         |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                            // |  2  :     x         |  0                  |  0        |
    movl    $1, (%rax)                            // |  3 v:     :         |  0                  |  0        |
    testl   %ebx, %ebx                            // |  2  v     :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  2  :     :         |  0                  |  1  v     |
    movl    $3, 4(%rax)                           // |  3 v:     :         |  0                  |  0        |
    cmpl    $2, %ebx                              // |  2  v     :         |  0                  |  6 ^^^^^^ |
    jge .LBB0_2                                   // |  1        :         |  0                  |  2   vv   |
.LBB0_7:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  2       :x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    movl    %ebp, %ecx                            // |  2   ^   v          |  0                  |  0        |
    movl    $2, %edx                              // |  2   :^             |  0                  |  0        |
    movl    $3, %esi                              // |  3   ::^            |  0                  |  0        |
    jmp .LBB0_3                                   // |  3   :::            |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movl    -8(%rax,%rdx,4), %ebp                 // |  5 v :v: ^          |  0                  |  0        |
    leaq    1(%rdx), %rbx                         // |  5  ^:v: :          |  0                  |  0        |
    movl    %ebx, %edi                            // |  6  v:::^:          |  0                  |  0        |
    shrl    %edi                                  // |  6  ::::x:          |  0                  |  5 ^^^^^  |
    addl    %esi, %edi                            // |  6  :::vx:          |  0                  |  6 ^^^^^^ |
    leal    (%rdi,%rbp), %esi                     // |  6  :::^vv          |  0                  |  0        |
    incl    %esi                                  // |  4  :::x            |  0                  |  5  ^^^^^ |
.LBB0_6:                                          // |                     |                     |           |
    movl    %esi, (%rax,%rdx,4)                   // |  5 v::vv            |  0                  |  0        |
    movq    %rbx, %rdx                            // |  3  v:^             |  0                  |  0        |
    cmpq    %rcx, %rbx                            // |  3  vv:             |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  1    :             |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %dl                               // |  1    v             |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  1    :             |  0                  |  1  v     |
    movl    %edx, %esi                            // |  2    v^            |  0                  |  0        |
    shrl    %esi                                  // |  2    :x            |  0                  |  5 ^^^^^  |
    incl    %esi                                  // |  2    :x            |  0                  |  5  ^^^^^ |
    leaq    1(%rdx), %rbx                         // |  2  ^ v             |  0                  |  0        |
    jmp .LBB0_6                                   // |  0                  |  0                  |  0        |
.Lfunc_end0:                                      // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0              // |                     |                     |           |
    .cfi_endproc                                  // |                     |                     |           |
    .ident  "clang version 15.0.4"                // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits    // |                     |                     |           |
    .addrsig                                      // |                     |                     |           |
                                                  // +.....................+.....................+...........+
                                                  // Legend:
                                                  //     ^       : Register assignment (write)
                                                  //     v       : Register usage (read)
                                                  //     x       : Register usage and reassignment (R/W)
                                                  //     :       : Register in use (live)
                                                  //     <space> : Register not in use
                                                  //     #       : Number of occupied registers
