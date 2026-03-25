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
    movl    %edi, %ebp                            // |  3      v^:         |  0                  |  0        |
    movslq  %edi, %rbx                            // |  4  ^   v::         |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                       // |  4  v   ^::         |  0                  |  0        |
    callq   malloc@PLT                            // |  3  :    :x         |  0                  |  0        |
    movl    %ebx, (%rax)                          // |  4 vv    ::         |  0                  |  0        |
    cmpl    $2, %ebx                              // |  3  v    ::         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                   // |  2       ::         |  0                  |  2   vv   |
    movl    %ebp, %ecx                            // |  3   ^   v:         |  0                  |  0        |
    movl    (%rax), %ebx                          // |  4 v^:    :         |  0                  |  0        |
    leaq    -1(%rcx), %rdi                        // |  4  :v  ^ :         |  0                  |  0        |
    addq    $-2, %rcx                             // |  4  :x  : :         |  0                  |  6 ^^^^^^ |
    movl    %edi, %edx                            // |  5  ::^ v :         |  0                  |  0        |
    andl    $3, %edx                              // |  5  ::x : :         |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  6  :::^: :         |  0                  |  0        |
    cmpq    $3, %rcx                              // |  5  :v: : :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_5                                   // |  4  : : : :         |  0                  |  1 v      |
    andq    $-4, %rdi                             // |  4  : : x :         |  0                  |  5 ^^^^^  |
    movq    $-1, %rsi                             // |  5  : :^: :         |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  6  :^::: :         |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    leal    (%rbx,%rcx), %ebp                     // |  7  vv:::^:         |  0                  |  0        |
    addl    $2, %ebp                              // |  7  :::::x:         |  0                  |  6 ^^^^^^ |
    movl    %ebp, 4(%rax,%rcx,2)                  // |  8 v:v:::v:         |  0                  |  0        |
    leal    4(%rbx,%rcx), %ebp                    // |  7  vv:::^:         |  0                  |  0        |
    movl    %ebp, 8(%rax,%rcx,2)                  // |  8 v:v:::v:         |  0                  |  0        |
    leal    6(%rbx,%rcx), %ebp                    // |  7  vv:::^:         |  0                  |  0        |
    movl    %ebp, 12(%rax,%rcx,2)                 // |  8 v:v:::v:         |  0                  |  0        |
    leal    (%rbx,%rcx), %ebp                     // |  7  vv:::^:         |  0                  |  0        |
    addl    $8, %ebp                              // |  7  :::::x:         |  0                  |  6 ^^^^^^ |
    movl    %ebp, 16(%rax,%rcx,2)                 // |  8 v:v:::v:         |  0                  |  0        |
    addq    $8, %rcx                              // |  6  :x::: :         |  0                  |  6 ^^^^^^ |
    leaq    (%rdi,%rsi), %rbp                     // |  7  :::vv^:         |  0                  |  0        |
    addq    $-4, %rbp                             // |  6  :::: x:         |  0                  |  6 ^^^^^^ |
    addq    $-4, %rsi                             // |  6  :::x ::         |  0                  |  6 ^^^^^^ |
    cmpq    $-1, %rbp                             // |  6  :::: v:         |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  5  ::::  :         |  0                  |  1  v     |
    addl    %ebx, %ecx                            // |  5  vx::  :         |  0                  |  6 ^^^^^^ |
    negq    %rsi                                  // |  4   ::x  :         |  0                  |  0        |
    movl    %ecx, %ebx                            // |  5  ^v::  :         |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    testq   %rdx, %rdx                            // |  4  : v:  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  4  : ::  :         |  0                  |  1  v     |
    addl    $2, %ebx                              // |  4  x ::  :         |  0                  |  6 ^^^^^^ |
    leaq    (%rax,%rsi,4), %rcx                   // |  6 v:^:v  :         |  0                  |  0        |
    addq    %rdx, %rdx                            // |  4  ::x   :         |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                            // |  5  :::^  :         |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    leal    (%rbx,%rsi), %edi                     // |  6  v::v^ :         |  0                  |  0        |
    movl    %edi, (%rcx,%rsi,2)                   // |  5   v:vv :         |  0                  |  0        |
    addq    $2, %rsi                              // |  3    :x  :         |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                            // |  3    vv  :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  1        :         |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
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
