                                                   // +---------------------+---------------------+-----------+
                                                   // |         GPR         |        VECTOR       |   FLAGS   |
                                                   // |                     |                     |           |
                                                   // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                   // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                   // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                   // |                     |    0123456789111111 |           |
                                                   // |  #                  |  #           012345 |  #        |
                                                   // +---------------------+---------------------+-----------+
    .text                                          // |                     |                     |           |
    .file   "code.c"                               // |                     |                     |           |
    .section    .rodata.cst16,"aM",@progbits,16    // |                     |                     |           |
    .p2align    4                                  // |                     |                     |           |
.LCPI0_0:                                          // |                     |                     |           |
    .quad   0x7fffffffffffffff                     // |                     |                     |           |
    .quad   0x7fffffffffffffff                     // |                     |                     |           |
    .section    .rodata.cst8,"aM",@progbits,8      // |                     |                     |           |
    .p2align    3                                  // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .quad   0x3f1a36e2eb1c432d                     // |                     |                     |           |
    .section    .rodata.cst4,"aM",@progbits,4      // |                     |                     |           |
    .p2align    2                                  // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .long   0x00000000                             // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    pushq   %r15                                   // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    pushq   %r14                                   // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    pushq   %r12                                   // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    pushq   %rbx                                   // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    subq    $40, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 80                         // |                     |                     |           |
    .cfi_offset %rbx, -40                          // |                     |                     |           |
    .cfi_offset %r12, -32                          // |                     |                     |           |
    .cfi_offset %r14, -24                          // |                     |                     |           |
    .cfi_offset %r15, -16                          // |                     |                     |           |
    testl   %esi, %esi                             // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                    // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %r15                             // |  3      v :       ^ |  0                  |  0        |
    movl    %esi, %r12d                            // |  4     v  :    ^  : |  0                  |  0        |
    xorl    %ebx, %ebx                             // |  4  ^     :    :  : |  0                  |  5 ^^^^^  |
    xorl    %r14d, %r14d                           // |  5  :     :    : ^: |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                    // |  5  :     :    : :: |  0                  |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_8:                                           // |                     |                     |           |
    incq    %rbx                                   // |  5  x     :    : :: |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %r12                             // |  5  v     :    v :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                    // |  4  :     :      :: |  0                  |  1  v     |
.LBB0_4:                                           // |                     |                     |           |
    movss   (%r15,%rbx,4), %xmm0                   // |  4  v     :      :v |  1 ^                |  0        |
    movss   %xmm0, 12(%rsp)                        // |  2        v      :  |  1 v                |  0        |
    cvtss2sd    %xmm0, %xmm0                       // |  2        :      :  |  1 ^                |  0        |
    movaps  %xmm0, 16(%rsp)                        // |  2        v      :  |  1 v                |  0        |
    callq   round@PLT                              // |  2        x      :  |  1 :                |  0        |
    movapd  16(%rsp), %xmm2                        // |  2        v      :  |  2 : ^              |  0        |
    subsd   %xmm0, %xmm2                           // |  2        :      :  |  2 v x              |  6 ^^^^^^ |
    andpd   .LCPI0_0(%rip), %xmm2                  // |  2        :      :  |  2 : x              |  5 ^^^^^  |
    movsd   .LCPI0_1(%rip), %xmm1                  // |  2        :      :  |  3 :^:              |  2 ::     |
    ucomisd %xmm2, %xmm1                           // |  2        :      :  |  3 :^v              |  2 ::     |
    jbe .LBB0_8                                    // |  2        :      :  |  1 :                |  2 vv     |
    movss   12(%rsp), %xmm1                        // |  2        v      :  |  2 :^               |  2 ::     |
    ucomiss .LCPI0_2(%rip), %xmm1                  // |  2        :      :  |  2 :^               |  2 ::     |
    jbe .LBB0_8                                    // |  2        :      :  |  1 :                |  2 vv     |
    cvttsd2si   %xmm0, %eax                        // |  3 ^      :      :  |  1 v                |  0        |
    movl    %eax, %ecx                             // |  4 v ^    :      :  |  0                  |  0        |
    andl    $-2147483647, %ecx                     // |  3   x    :      :  |  0                  |  5 ^^^^^  |
    cmpl    $1, %ecx                               // |  3   v    :      :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                    // |  2        :      :  |  0                  |  1  v     |
    imull   %eax, %eax                             // |  4 ^  x   :      :  |  0                  |  2 ^  ^   |
    addq    %rax, %r14                             // |  3 v      :      x  |  0                  |  6 ^^^^^^ |
    jmp .LBB0_8                                    // |  1        :         |  0                  |  0        |
.LBB0_1:                                           // |                     |                     |           |
    xorl    %r14d, %r14d                           // |  2        :      ^  |  0                  |  5 ^^^^^  |
.LBB0_2:                                           // |                     |                     |           |
    movq    %r14, %rax                             // |  3 ^      :      v  |  0                  |  0        |
    addq    $40, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    popq    %rbx                                   // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    popq    %r12                                   // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    popq    %r14                                   // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    popq    %r15                                   // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
    retq                                           // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                       // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0               // |                     |                     |           |
    .cfi_endproc                                   // |                     |                     |           |
    .ident  "clang version 15.0.4"                 // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits     // |                     |                     |           |
    .addrsig                                       // |                     |                     |           |
                                                   // +.....................+.....................+...........+
                                                   // Legend:
                                                   //     ^       : Register assignment (write)
                                                   //     v       : Register usage (read)
                                                   //     x       : Register usage and reassignment (R/W)
                                                   //     :       : Register in use (live)
                                                   //     <space> : Register not in use
                                                   //     #       : Number of occupied registers
