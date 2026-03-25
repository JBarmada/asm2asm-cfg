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
    subq    $56, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    movaps  %xmm2, 16(%rsp)                       // |  1        v         |  1   v              |  0        |
    movaps  %xmm1, 32(%rsp)                       // |  1        v         |  1  v               |  0        |
    movss   %xmm0, 8(%rsp)                        // |  1        v         |  1 v                |  0        |
    callq   roundf@PLT                            // |  1        x         |  0                  |  0        |
    movss   %xmm0, 12(%rsp)                       // |  1        v         |  1 v                |  0        |
    movaps  32(%rsp), %xmm0                       // |  1        v         |  1 ^                |  0        |
    callq   roundf@PLT                            // |  1        x         |  1 :                |  0        |
    movss   %xmm0, 4(%rsp)                        // |  1        v         |  1 v                |  0        |
    movaps  16(%rsp), %xmm0                       // |  1        v         |  1 ^                |  0        |
    callq   roundf@PLT                            // |  1        x         |  0                  |  0        |
    movss   8(%rsp), %xmm4                        // |  1        v         |  1     ^            |  0        |
    xorl    %eax, %eax                            // |  2 ^      :         |  1     :            |  5 ^^^^^  |
    movss   12(%rsp), %xmm1                       // |  1        v         |  2  ^  :            |  1  :     |
    ucomiss %xmm4, %xmm1                          // |  1        :         |  2  ^  v            |  1  :     |
    jne .LBB0_4                                   // |  1        :         |  1     :            |  1  v     |
    jp  .LBB0_4                                   // |  1        :         |  1     :            |  1  :     |
    movaps  32(%rsp), %xmm2                       // |  1        v         |  2   ^ :            |  1  :     |
    movss   4(%rsp), %xmm1                        // |  1        v         |  3  ^: :            |  1  :     |
    ucomiss %xmm2, %xmm1                          // |  1        :         |  3  ^v :            |  1  :     |
    jne .LBB0_4                                   // |  1        :         |  2   : :            |  1  v     |
    jp  .LBB0_4                                   // |  1        :         |  2   : :            |  1  :     |
    movaps  16(%rsp), %xmm3                       // |  1        v         |  3   :^:            |  1  :     |
    ucomiss %xmm3, %xmm0                          // |  1        :         |  4 ^ :v:            |  1  :     |
    jne .LBB0_4                                   // |  1        :         |  3   :::            |  1  v     |
    jp  .LBB0_4                                   // |  1        :         |  3   :::            |  0        |
    movaps  %xmm4, %xmm0                          // |  1        :         |  4 ^ ::v            |  0        |
    addss   %xmm2, %xmm0                          // |  1        :         |  4 x v::            |  6 ^^^^^^ |
    movaps  %xmm4, %xmm1                          // |  1        :         |  5 :^::v            |  0        |
    addss   %xmm3, %xmm1                          // |  1        :         |  5 :x:v:            |  6 ^^^^^^ |
    cmpeqps %xmm2, %xmm1                          // |  1        :         |  5 :vv::            |  6 ^^^^^^ |
    cmpeqps %xmm3, %xmm0                          // |  1        :         |  5 v::v:            |  6 ^^^^^^ |
    orps    %xmm1, %xmm0                          // |  1        :         |  5 xv:::            |  5 ^^^^^  |
    movd    %xmm0, %eax                           // |  2 ^      :         |  4 v :::            |  0        |
    addss   %xmm3, %xmm2                          // |  2 :      :         |  3   xv:            |  6 ^^^^^^ |
    ucomiss %xmm4, %xmm2                          // |  2 :      :         |  2   ^ v            |  1  :     |
    setnp   %cl                                   // |  3 : x    :         |  0                  |  1  :     |
    sete    %dl                                   // |  4 : :x   :         |  0                  |  1  v     |
    andb    %cl, %dl                              // |  4 : vx   :         |  0                  |  5 ^^^^^  |
    orb %al, %dl                                  // |  3 v  x   :         |  0                  |  5 ^^^^^  |
    movzbl  %dl, %eax                             // |  3 ^  v   :         |  0                  |  0        |
    andl    $1, %eax                              // |  2 x      :         |  0                  |  5 ^^^^^  |
.LBB0_4:                                          // |                     |                     |           |
    addq    $56, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
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
