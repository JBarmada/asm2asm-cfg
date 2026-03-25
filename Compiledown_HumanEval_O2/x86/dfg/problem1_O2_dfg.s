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
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    movl    $10, %eax                              // |  1 ^                |  0                  |  0        |
    testl   %esi, %esi                             // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                    // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                             // |  2     v   ^        |  0                  |  0        |
    xorl    %r9d, %r9d                             // |  2         :^       |  0                  |  5 ^^^^^  |
    movaps  .LCPI0_0(%rip), %xmm1                  // |  2         ::       |  1  ^               |  0        |
    movq    %r8, %rdx                              // |  3    ^    v:       |  1  :               |  0        |
    movq    %rdi, %rcx                             // |  5   ^: v  ::       |  1  :               |  0        |
    jmp .LBB0_3                                    // |  4   ::    ::       |  1  :               |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_2:                                           // |                     |                     |           |
    addq    $4, %rcx                               // |  4   x:    ::       |  1  :               |  6 ^^^^^^ |
    decq    %rdx                                   // |  4   :x    ::       |  1  :               |  5  ^^^^^ |
    cmpq    %r8, %r9                               // |  4   ::    vv       |  1  :               |  6 ^^^^^^ |
    je  .LBB0_8                                    // |  4   ::    ::       |  1  :               |  1  v     |
.LBB0_3:                                           // |                     |                     |           |
    movq    %r9, %rsi                              // |  5   ::^   :v       |  1  :               |  0        |
    incq    %r9                                    // |  5   :::   :x       |  1  :               |  5  ^^^^^ |
    cmpq    %r8, %r9                               // |  5   :::   vv       |  1  :               |  6 ^^^^^^ |
    jae .LBB0_2                                    // |  3   :::            |  1  :               |  1 v      |
    movss   (%rdi,%rsi,4), %xmm2                   // |  4   ::vv           |  2  :^              |  0        |
    movl    $1, %esi                               // |  3   ::^            |  2  ::              |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_6:                                           // |                     |                     |           |
    movaps  %xmm2, %xmm3                           // |  3   :::            |  3  :v^             |  0        |
    subss   (%rcx,%rsi,4), %xmm3                   // |  3   v:v            |  2  : x             |  6 ^^^^^^ |
    andps   %xmm1, %xmm3                           // |  2    ::            |  2  v x             |  5 ^^^^^  |
    ucomiss %xmm3, %xmm0                           // |  2    ::            |  2 ^  v             |  2 ::     |
    ja  .LBB0_7                                    // |  2    ::            |  0                  |  2 vv     |
    incq    %rsi                                   // |  2    :x            |  0                  |  5  ^^^^^ |
    cmpq    %rsi, %rdx                             // |  2    vv            |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                    // |  0                  |  0                  |  1  v     |
    jmp .LBB0_2                                    // |  0                  |  0                  |  0        |
.LBB0_7:                                           // |                     |                     |           |
    movl    $1, %eax                               // |  1 ^                |  0                  |  0        |
.LBB0_8:                                           // |                     |                     |           |
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
