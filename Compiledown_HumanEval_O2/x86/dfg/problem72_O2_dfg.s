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
    .section    .rodata.cst4,"aM",@progbits,4     // |                     |                     |           |
    .p2align    2                                 // |                     |                     |           |
.LCPI0_0:                                         // |                     |                     |           |
    .long   0xbf800000                            // |                     |                     |           |
.LCPI0_1:                                         // |                     |                     |           |
    .long   0x3f000000                            // |                     |                     |           |
.LCPI0_2:                                         // |                     |                     |           |
    .long   0x42c80000                            // |                     |                     |           |
    .text                                         // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    movaps  %xmm0, %xmm4                          // |  1        :         |  2 v   ^            |  0        |
    movaps  %xmm1, %xmm0                          // |  1        :         |  2 ^v               |  0        |
    addss   %xmm2, %xmm0                          // |  1        :         |  2 x v              |  6 ^^^^^^ |
    ucomiss %xmm0, %xmm4                          // |  1        :         |  2 v   ^            |  1 :      |
    movss   .LCPI0_0(%rip), %xmm3                 // |  1        :         |  2    ^:            |  1 :      |
    jae .LBB0_7                                   // |  1        :         |  1     :            |  1 v      |
    movaps  %xmm4, %xmm0                          // |  1        :         |  2 ^   v            |  0        |
    addss   %xmm1, %xmm0                          // |  1        :         |  3 xv  :            |  6 ^^^^^^ |
    ucomiss %xmm0, %xmm2                          // |  1        :         |  3 v ^ :            |  1 :      |
    jae .LBB0_7                                   // |  1        :         |  3 : : :            |  1 v      |
    movaps  %xmm4, %xmm5                          // |  1        :         |  4 : : v^           |  0        |
    addss   %xmm2, %xmm5                          // |  1        :         |  4 : v :x           |  6 ^^^^^^ |
    ucomiss %xmm5, %xmm1                          // |  1        :         |  5 :^: :v           |  1 :      |
    jae .LBB0_7                                   // |  1        :         |  4 ::: :            |  1 v      |
    addss   %xmm2, %xmm0                          // |  1        :         |  4 x:v :            |  6 ^^^^^^ |
    mulss   .LCPI0_1(%rip), %xmm0                 // |  3 x  x   :         |  4 ^:: :            |  2 ^  ^   |
    movaps  %xmm0, %xmm3                          // |  3 :  :   :         |  5 v::^:            |  0        |
    subss   %xmm4, %xmm3                          // |  3 :  :   :         |  5 :::xv            |  6 ^^^^^^ |
    mulss   %xmm0, %xmm3                          // |  3 x  x   :         |  4 v::^             |  2 ^  ^   |
    movaps  %xmm0, %xmm4                          // |  3 :  :   :         |  5 v:::^            |  0        |
    subss   %xmm1, %xmm4                          // |  3 :  :   :         |  5 :v::x            |  6 ^^^^^^ |
    mulss   %xmm3, %xmm4                          // |  3 x  x   :         |  4 : :v^            |  2 ^  ^   |
    subss   %xmm2, %xmm0                          // |  3 :  :   :         |  3 x v :            |  6 ^^^^^^ |
    mulss   %xmm4, %xmm0                          // |  3 x  x   :         |  2 ^   v            |  2 ^  ^   |
    xorps   %xmm1, %xmm1                          // |  3 :  :   :         |  1  ^               |  5 ^^^^^  |
    ucomiss %xmm1, %xmm0                          // |  3 :  :   :         |  2 ^v               |  1 :      |
    jb  .LBB0_5                                   // |  3 :  :   :         |  0                  |  1 v      |
    sqrtss  %xmm0, %xmm0                          // |  3 :  :   :         |  1 ^                |  0        |
    jmp .LBB0_6                                   // |  3 :  :   :         |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    callq   sqrtf@PLT                             // |  3 :  :   x         |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    mulss   .LCPI0_2(%rip), %xmm0                 // |  3 x  x   :         |  1 ^                |  2 ^  ^   |
    callq   roundf@PLT                            // |  3 :  :   x         |  1 :                |  0        |
    movaps  %xmm0, %xmm3                          // |  3 :  :   :         |  2 v  ^             |  0        |
    divss   .LCPI0_2(%rip), %xmm3                 // |  3 x  x   :         |  1    ^             |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movaps  %xmm3, %xmm0                          // |  1        :         |  2 ^  v             |  0        |
    popq    %rax                                  // |  2 ^      x         |  0                  |  0        |
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
