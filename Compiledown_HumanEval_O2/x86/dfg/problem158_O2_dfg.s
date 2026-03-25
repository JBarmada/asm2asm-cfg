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
    .section    .rodata.cst8,"aM",@progbits,8      // |                     |                     |           |
    .p2align    3                                  // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .quad   0x3f1a36e2eb1c432d                     // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    mulss   %xmm1, %xmm1                           // |  2 x  x             |  1  ^               |  2 ^  ^   |
    mulss   %xmm0, %xmm0                           // |  2 x  x             |  2 ^:               |  2 ^  ^   |
    movaps  %xmm0, %xmm3                           // |  2 :  :             |  3 v: ^             |  0        |
    addss   %xmm1, %xmm3                           // |  2 :  :             |  3 :v x             |  6 ^^^^^^ |
    mulss   %xmm2, %xmm2                           // |  2 x  x             |  4 ::^:             |  2 ^  ^   |
    subss   %xmm2, %xmm3                           // |  0                  |  4 ::vx             |  6 ^^^^^^ |
    andps   .LCPI0_0(%rip), %xmm3                  // |  0                  |  4 :::x             |  5 ^^^^^  |
    cvtss2sd    %xmm3, %xmm4                       // |  0                  |  5 :::v^            |  2 ::     |
    movl    $1, %eax                               // |  1 ^                |  4 ::: :            |  2 ::     |
    movsd   .LCPI0_1(%rip), %xmm3                  // |  0                  |  5 :::^:            |  2 ::     |
    ucomisd %xmm4, %xmm3                           // |  0                  |  5 :::^v            |  2 ::     |
    ja  .LBB0_4                                    // |  0                  |  3 :::              |  2 vv     |
    movaps  %xmm0, %xmm4                           // |  0                  |  4 v:: ^            |  0        |
    addss   %xmm2, %xmm4                           // |  0                  |  4 ::v x            |  6 ^^^^^^ |
    subss   %xmm1, %xmm4                           // |  0                  |  4 :v: x            |  6 ^^^^^^ |
    andps   .LCPI0_0(%rip), %xmm4                  // |  0                  |  4 ::: x            |  5 ^^^^^  |
    cvtss2sd    %xmm4, %xmm4                       // |  0                  |  4 ::: ^            |  2 ::     |
    ucomisd %xmm4, %xmm3                           // |  0                  |  5 :::^v            |  2 ::     |
    ja  .LBB0_4                                    // |  0                  |  3 :::              |  2 vv     |
    addss   %xmm2, %xmm1                           // |  0                  |  3 :xv              |  6 ^^^^^^ |
    subss   %xmm0, %xmm1                           // |  0                  |  2 vx               |  6 ^^^^^^ |
    andps   .LCPI0_0(%rip), %xmm1                  // |  0                  |  1  x               |  5 ^^^^^  |
    xorps   %xmm0, %xmm0                           // |  0                  |  2 ^:               |  5 ^^^^^  |
    cvtss2sd    %xmm1, %xmm0                       // |  0                  |  2 ^v               |  2 ::     |
    ucomisd %xmm0, %xmm3                           // |  0                  |  2 v  ^             |  2 ::     |
    ja  .LBB0_4                                    // |  0                  |  0                  |  2 vv     |
    xorl    %eax, %eax                             // |  1 ^                |  0                  |  5 ^^^^^  |
.LBB0_4:                                           // |                     |                     |           |
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
