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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r15d                           // |  3     v  :       ^ |  0                  |  0        |
    movq    %rdi, %r12                            // |  4      v :    ^  : |  0                  |  0        |
    movl    %esi, %r13d                           // |  5     v  :    :^ : |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5       ^:    :: : |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  6  ^    ::    :: : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movq    (%r12,%rbp,8), %rdi                   // |  7  :   ^v:    v: : |  0                  |  0        |
    callq   strlen@PLT                            // |  6  :    :x    :: : |  0                  |  0        |
    addl    %eax, %ebx                            // |  7 vx    ::    :: : |  0                  |  6 ^^^^^^ |
    incq    %rbp                                  // |  6  :    x:    :: : |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r13                            // |  6  :    v:    :v : |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  5  :     :    :: : |  0                  |  1  v     |
    incl    %ebx                                  // |  5  x     :    :: : |  0                  |  5  ^^^^^ |
    movslq  %ebx, %rdi                            // |  6  v   ^ :    :: : |  0                  |  0        |
    callq   malloc@PLT                            // |  4        x    :: : |  0                  |  0        |
    testq   %rax, %rax                            // |  5 v      :    :: : |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  4        :    :: : |  0                  |  1  v     |
    movq    %rax, %r14                            // |  6 v      :    ::^: |  0                  |  0        |
    movb    $0, (%rax)                            // |  6 v      :    :::: |  0                  |  0        |
    testl   %r15d, %r15d                          // |  5        :    :::v |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                  // |  4        :    :::  |  0                  |  3  vvv   |
    xorl    %ebx, %ebx                            // |  5  ^     :    :::  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movq    (%r12,%rbx,8), %rsi                   // |  6  v  ^  :    v::  |  0                  |  0        |
    movq    %r14, %rdi                            // |  5  :   ^ :     :v  |  0                  |  0        |
    callq   strcat@PLT                            // |  3  :     x     :   |  0                  |  0        |
    incq    %rbx                                  // |  3  x     :     :   |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %r13                            // |  3  v     :     v   |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_11                                  // |  1        :         |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movl    $1, %edi                              // |  2      ^ :         |  0                  |  0        |
    callq   malloc@PLT                            // |  1        x         |  0                  |  0        |
    testq   %rax, %rax                            // |  2 v      :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  1        :         |  0                  |  1  v     |
    movq    %rax, %r14                            // |  3 v      :      ^  |  0                  |  0        |
    movb    $0, (%rax)                            // |  2 v      :         |  0                  |  0        |
    jmp .LBB0_11                                  // |  1        :         |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    xorl    %r14d, %r14d                          // |  2        :      ^  |  0                  |  5 ^^^^^  |
.LBB0_11:                                         // |                     |                     |           |
    movq    %r14, %rax                            // |  3 ^      :      v  |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
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
