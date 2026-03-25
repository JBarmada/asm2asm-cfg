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
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    subq    $96, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 144                       // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movq    %rdi, %r15                            // |  3      v :       ^ |  0                  |  0        |
    movl    %esi, %r14d                           // |  4     v  :      ^: |  0                  |  0        |
    cmpl    $8, %esi                              // |  4     v  :      :: |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                   // |  3        :      :: |  0                  |  1 v      |
    xorl    %ebx, %ebx                            // |  4  ^     :      :: |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  4       ^:      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  3        :      :: |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %ebp, %ebp                            // |  4       ^:      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  3        :      :: |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    movl    %r14d, %ebx                           // |  4  ^     :      v: |  0                  |  0        |
    andl    $-8, %ebx                             // |  4  x     :      :: |  0                  |  5 ^^^^^  |
    leaq    (,%r14,4), %r12                       // |  5  :     :    ^ v: |  0                  |  0        |
    andq    $-32, %r12                            // |  5  :     :    x :: |  0                  |  5 ^^^^^  |
    pxor    %xmm2, %xmm2                          // |  5  :     :    : :: |  1   ^              |  0        |
    xorl    %ebp, %ebp                            // |  6  :    ^:    : :: |  1   :              |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                          // |  6  :    ::    : :: |  2  ^:              |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movdqa  %xmm1, 64(%rsp)                       // |  6  :    :v    : :: |  2  v:              |  0        |
    movdqa  %xmm2, 80(%rsp)                       // |  6  :    :v    : :: |  1   v              |  0        |
    movups  (%r15,%rbp), %xmm1                    // |  6  :    v:    : :v |  1  ^               |  0        |
    movaps  %xmm1, (%rsp)                         // |  6  :    :v    : :: |  1  v               |  0        |
    movups  16(%r15,%rbp), %xmm0                  // |  6  :    v:    : :v |  2 ^:               |  0        |
    movaps  %xmm0, 32(%rsp)                       // |  6  :    :v    : :: |  2 v:               |  0        |
    movaps  %xmm1, %xmm0                          // |  6  :    ::    : :: |  2 ^v               |  0        |
    shufps  $255, %xmm1, %xmm0                    // |  6  :    ::    : :: |  1 :                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  %xmm0, 16(%rsp)                       // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  (%rsp), %xmm0                         // |  6  :    :v    : :: |  1 ^                |  0        |
    movhlps %xmm0, %xmm0                          // |  6  :    ::    : :: |  1 ^                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  0                  |  0        |
    unpcklps    16(%rsp), %xmm0                   // |  6  :    :v    : :: |  1 ^                |  0        |
    movaps  %xmm0, 48(%rsp)                       // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  (%rsp), %xmm0                         // |  6  :    :v    : :: |  1 ^                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  %xmm0, 16(%rsp)                       // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  (%rsp), %xmm0                         // |  6  :    :v    : :: |  1 ^                |  0        |
    shufps  $85, %xmm0, %xmm0                     // |  6  :    ::    : :: |  1 :                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  16(%rsp), %xmm1                       // |  6  :    :v    : :: |  2 :^               |  0        |
    unpcklps    %xmm0, %xmm1                      // |  6  :    ::    : :: |  2 v^               |  0        |
    unpcklpd    48(%rsp), %xmm1                   // |  6  :    :v    : :: |  1  ^               |  0        |
    movaps  %xmm1, 16(%rsp)                       // |  6  :    :v    : :: |  1  v               |  0        |
    movaps  32(%rsp), %xmm0                       // |  6  :    :v    : :: |  1 ^                |  0        |
    shufps  $255, %xmm0, %xmm0                    // |  6  :    ::    : :: |  1 :                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  %xmm0, (%rsp)                         // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  32(%rsp), %xmm0                       // |  6  :    :v    : :: |  1 ^                |  0        |
    movhlps %xmm0, %xmm0                          // |  6  :    ::    : :: |  1 ^                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  0                  |  0        |
    unpcklps    (%rsp), %xmm0                     // |  6  :    :v    : :: |  1 ^                |  0        |
    movaps  %xmm0, (%rsp)                         // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  32(%rsp), %xmm0                       // |  6  :    :v    : :: |  1 ^                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  %xmm0, 48(%rsp)                       // |  6  :    :v    : :: |  1 v                |  0        |
    movaps  32(%rsp), %xmm0                       // |  6  :    :v    : :: |  1 ^                |  0        |
    shufps  $85, %xmm0, %xmm0                     // |  6  :    ::    : :: |  1 :                |  0        |
    callq   ceilf@PLT                             // |  6  :    :x    : :: |  1 :                |  0        |
    movaps  48(%rsp), %xmm1                       // |  6  :    :v    : :: |  2 :^               |  0        |
    unpcklps    %xmm0, %xmm1                      // |  6  :    ::    : :: |  2 v^               |  0        |
    unpcklpd    (%rsp), %xmm1                     // |  6  :    :v    : :: |  1  ^               |  0        |
    cvttps2dq   16(%rsp), %xmm0                   // |  6  :    :v    : :: |  1 ^                |  0        |
    cvttps2dq   %xmm1, %xmm1                      // |  6  :    ::    : :: |  1  ^               |  0        |
    pshufd  $245, %xmm0, %xmm2                    // |  6  :    ::    : :: |  0                  |  0        |
    pmuludq %xmm0, %xmm0                          // |  6  :    ::    : :: |  1 ^                |  0        |
    pshufd  $232, %xmm0, %xmm0                    // |  6  :    ::    : :: |  0                  |  0        |
    pmuludq %xmm2, %xmm2                          // |  6  :    ::    : :: |  1   ^              |  0        |
    pshufd  $232, %xmm2, %xmm2                    // |  6  :    ::    : :: |  1   :              |  0        |
    punpckldq   %xmm2, %xmm0                      // |  6  :    ::    : :: |  2 ^ v              |  0        |
    movdqa  80(%rsp), %xmm2                       // |  6  :    :v    : :: |  2 : ^              |  0        |
    paddd   %xmm0, %xmm2                          // |  6  :    ::    : :: |  2 v ^              |  0        |
    pshufd  $245, %xmm1, %xmm0                    // |  6  :    ::    : :: |  1   :              |  0        |
    pmuludq %xmm1, %xmm1                          // |  6  :    ::    : :: |  2  ^:              |  0        |
    pshufd  $232, %xmm1, %xmm1                    // |  6  :    ::    : :: |  1   :              |  0        |
    pmuludq %xmm0, %xmm0                          // |  6  :    ::    : :: |  2 ^ :              |  0        |
    pshufd  $232, %xmm0, %xmm0                    // |  6  :    ::    : :: |  2 : :              |  0        |
    punpckldq   %xmm0, %xmm1                      // |  6  :    ::    : :: |  3 v^:              |  0        |
    movdqa  64(%rsp), %xmm0                       // |  6  :    :v    : :: |  3 ^::              |  0        |
    paddd   %xmm1, %xmm0                          // |  6  :    ::    : :: |  3 ^v:              |  0        |
    movdqa  %xmm0, 64(%rsp)                       // |  6  :    :v    : :: |  2 v :              |  0        |
    movdqa  64(%rsp), %xmm1                       // |  6  :    :v    : :: |  2  ^:              |  0        |
    addq    $32, %rbp                             // |  6  :    x:    : :: |  1   :              |  6 ^^^^^^ |
    cmpq    %rbp, %r12                            // |  6  :    v:    v :: |  1   :              |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  4  :     :      :: |  1   :              |  1  v     |
    paddd   %xmm2, %xmm1                          // |  4  :     :      :: |  2  ^v              |  0        |
    pshufd  $238, %xmm1, %xmm0                    // |  4  :     :      :: |  1  :               |  0        |
    paddd   %xmm1, %xmm0                          // |  4  :     :      :: |  2 ^v               |  0        |
    pshufd  $85, %xmm0, %xmm1                     // |  4  :     :      :: |  1 :                |  0        |
    paddd   %xmm0, %xmm1                          // |  4  :     :      :: |  2 v^               |  0        |
    movd    %xmm1, %ebp                           // |  5  :    ^:      :: |  1  v               |  0        |
    cmpq    %r14, %rbx                            // |  5  v    ::      v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  5  :    ::      :: |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movss   (%r15,%rbx,4), %xmm0                  // |  5  v    ::      :v |  1 ^                |  0        |
    callq   ceilf@PLT                             // |  4  :    :x      :  |  1 :                |  0        |
    cvttss2si   %xmm0, %eax                       // |  5 ^:    ::      :  |  1 v                |  0        |
    imull   %eax, %eax                            // |  6 ^: x  ::      :  |  0                  |  2 ^  ^   |
    addl    %eax, %ebp                            // |  5 v:    x:      :  |  0                  |  6 ^^^^^^ |
    incq    %rbx                                  // |  4  x    ::      :  |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %r14                            // |  4  v    ::      v  |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  2       ::         |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movl    %ebp, %eax                            // |  3 ^     v:         |  0                  |  0        |
    addq    $96, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
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
