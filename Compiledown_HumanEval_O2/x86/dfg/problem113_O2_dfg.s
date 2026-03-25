                                                    // +---------------------+---------------------+-----------+
                                                    // |         GPR         |        VECTOR       |   FLAGS   |
                                                    // |                     |                     |           |
                                                    // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                    // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                    // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                    // |                     |    0123456789111111 |           |
                                                    // |  #                  |  #           012345 |  #        |
                                                    // +---------------------+---------------------+-----------+
    .text                                           // |                     |                     |           |
    .file   "code.c"                                // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %r13                                    // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rcx, %r14                              // |  3   v    :      ^  |  0                  |  0        |
    movq    %rdx, %r15                              // |  4    v   :      :^ |  0                  |  0        |
    movq    %rsi, %r13                              // |  5     v  :     ^:: |  0                  |  0        |
    movq    %rdi, %rbp                              // |  6      v^:     ::: |  0                  |  0        |
    callq   strlen@PLT                              // |  5       :x     ::: |  0                  |  0        |
    incl    %eax                                    // |  6 x     ::     ::: |  0                  |  5  ^^^^^ |
    movslq  %eax, %rdi                              // |  7 v    ^::     ::: |  0                  |  0        |
    callq   malloc@PLT                              // |  6 :     :x     ::: |  0                  |  0        |
    movq    %rax, %r12                              // |  7 v     ::    ^::: |  0                  |  0        |
    movzbl  (%rbp), %edx                            // |  7    ^  v:    :::: |  0                  |  0        |
    testb   %dl, %dl                                // |  7    v  ::    :::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                     // |  7    :  ::    :::: |  0                  |  1  v     |
    movzbl  (%r13), %ebx                            // |  8  ^ :  ::    :v:: |  0                  |  0        |
    incq    %r13                                    // |  8  : :  ::    :x:: |  0                  |  5  ^^^^^ |
    xorl    %esi, %esi                              // |  9  : :^ ::    :::: |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                              // | 10  :^:: ::    :::: |  0                  |  5 ^^^^^  |
    jmp .LBB0_5                                     // | 10  :::: ::    :::: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_6:                                            // |                     |                     |           |
    movslq  %ecx, %rax                              // | 11 ^:v:: ::    :::: |  0                  |  0        |
    incl    %ecx                                    // | 11 ::x:: ::    :::: |  0                  |  5  ^^^^^ |
    movb    %dl, (%r12,%rax)                        // | 10 v: v: ::    v::: |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    movzbl  1(%rbp,%rsi), %edx                      // |  9  : ^v v:    :::: |  0                  |  0        |
    incq    %rsi                                    // |  8  : :x  :    :::: |  0                  |  5  ^^^^^ |
    testb   %dl, %dl                                // |  7  : v   :    :::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                     // |  7  : :   :    :::: |  0                  |  1  v     |
.LBB0_5:                                            // |                     |                     |           |
    movq    %r13, %rdi                              // |  8  : : ^ :    :v:: |  0                  |  0        |
    movl    %ebx, %eax                              // |  8 ^v : : :    : :: |  0                  |  0        |
    testb   %bl, %bl                                // |  8 :v : : :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                     // |  7 :  : : :    : :: |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_8:                                            // |                     |                     |           |
    cmpb    %al, %dl                                // |  7 v  v : :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                     // |  5      : :    : :: |  0                  |  1  v     |
    movzbl  (%rdi), %eax                            // |  6 ^    v :    : :: |  0                  |  0        |
    incq    %rdi                                    // |  6 :    x :    : :: |  0                  |  5  ^^^^^ |
    testb   %al, %al                                // |  5 v      :    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                     // |  4        :    : :: |  0                  |  1  v     |
    jmp .LBB0_6                                     // |  4        :    : :: |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %ecx, %ecx                              // |  5   ^    :    : :: |  0                  |  5 ^^^^^  |
.LBB0_2:                                            // |                     |                     |           |
    movslq  %ecx, %rax                              // |  6 ^ v    :    : :: |  0                  |  0        |
    movb    $0, (%r12,%rax)                         // |  5 v      :    v :: |  0                  |  0        |
    movq    %r12, %rdi                              // |  6 :    ^ :    v :: |  0                  |  0        |
    callq   strlen@PLT                              // |  5 :      x    : :: |  0                  |  0        |
    leaq    .L.str(%rip), %rbp                      // |  6 :     ^:    : :: |  0                  |  0        |
    cmpl    $2, %eax                                // |  5 v      :    : :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_13                                    // |  5 :      :    : :: |  0                  |  2   vv   |
    movabsq $-4294967296, %rcx                      // |  6 : ^    :    : :: |  0                  |  0        |
    movl    %eax, %edx                              // |  7 v :^   :    : :: |  0                  |  0        |
    shrl    %edx                                    // |  7 : :x   :    : :: |  0                  |  5 ^^^^^  |
    shlq    $32, %rax                               // |  7 x ::   :    : :: |  0                  |  5 ^^^^^  |
    addq    %rcx, %rax                              // |  7 x v:   :    : :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // |  8 : ::^  :    : :: |  0                  |  5 ^^^^^  |
    leaq    .L.str.1(%rip), %r8                     // |  9 : :::  :^   : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_11:                                           // |                     |                     |           |
    movzbl  (%r12,%rsi), %ebx                       // | 10 :^::v  ::   v :: |  0                  |  0        |
    movq    %rax, %rdi                              // | 11 v::::^ ::   : :: |  0                  |  0        |
    sarq    $32, %rdi                               // | 11 :::::^ ::   : :: |  0                  |  5 ^^^^^  |
    cmpb    (%r12,%rdi), %bl                        // | 11 :v:::v ::   v :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                    // |  9 : :::  ::   : :: |  0                  |  1  v     |
    incq    %rsi                                    // |  9 : ::x  ::   : :: |  0                  |  5  ^^^^^ |
    addq    %rcx, %rax                              // |  9 x v::  ::   : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                              // |  7    vv  ::   : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                    // |  5        ::   : :: |  0                  |  1  v     |
    jmp .LBB0_13                                    // |  5        ::   : :: |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    movq    %r8, %rbp                               // |  6       ^:v   : :: |  0                  |  0        |
.LBB0_13:                                           // |                     |                     |           |
    movq    %r15, %rdi                              // |  6      ^::    : :v |  0                  |  0        |
    movq    %r12, %rsi                              // |  5     ^ ::    v :  |  0                  |  0        |
    callq   strcpy@PLT                              // |  4       :x    : :  |  0                  |  0        |
    movq    %r14, %rdi                              // |  5      ^::    : v  |  0                  |  0        |
    movq    %rbp, %rsi                              // |  4     ^ v:    :    |  0                  |  0        |
    callq   strcpy@PLT                              // |  2        x    :    |  0                  |  0        |
    movq    %r12, %rdi                              // |  3      ^ :    v    |  0                  |  0        |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    jmp free@PLT                                    // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "True"                                  // |                     |                     |           |
    .size   .L.str, 5                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "False"                                 // |                     |                     |           |
    .size   .L.str.1, 6                             // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
