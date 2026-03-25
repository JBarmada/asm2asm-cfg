                                                           // +--------------------------------------+-------------------------------------+---------+
                                                           // |                 GPR                  |                VECTOR               |  FLAGS  |
                                                           // |                                      |                                     |         |
                                                           // |    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXS |    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV |    NZCV |
                                                           // |    0123456789111111111122222222223ZP |    01234567891111111111222222222233 |         |
                                                           // |  #           012345678901234567890R  |  #           0123456789012345678901 |  #      |
                                                           // +--------------------------------------+-------------------------------------+---------+
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .build_version macos, 15, 0 sdk_version 26, 2          // |                                      |                                     |         |
    .globl  _func0                                         // |                                      |                                     |         |
    .p2align    2                                          // |                                      |                                     |         |
_func0:                                                    // |                                      |                                     |         |
    .cfi_startproc                                         // |                                      |                                     |         |
    fmul    s3, s1, s1                                     // |  0                                   |  2  v ^                             |  0      |
    fmadd   s3, s0, s0, s3                                 // |  0                                   |  2 v  ^                             |  0      |
    fmsub   s3, s2, s2, s3                                 // |  0                                   |  2   v^                             |  0      |
    fabs    s3, s3                                         // |  0                                   |  1    ^                             |  4 ^^^^ |
    fcvt    d3, s3                                         // |  0                                   |  1    ^                             |  1 :    |
    mov x8, #17197                                         // |  1         ^                         |  0                                  |  1 :    |
    movk    x8, #60188, lsl #16                            // |  1         ^                         |  0                                  |  1 :    |
    movk    x8, #14050, lsl #32                            // |  1         ^                         |  0                                  |  1 :    |
    movk    x8, #16154, lsl #48                            // |  1         ^                         |  0                                  |  1 :    |
    fmov    d4, x8                                         // |  1         v                         |  1     ^                            |  1 :    |
    fcmp    d3, d4                                         // |  1         :                         |  2    ^v                            |  1 :    |
    b.pl    LBB0_2                                         // |  1         :                         |  0                                  |  1 v    |
    mov w0, #1                                             // |  2 ^       :                         |  0                                  |  0      |
    ret                                                    // |  2         :                     v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    fmul    s2, s2, s2                                     // |  1         :                         |  1   ^                              |  0      |
    fmadd   s3, s0, s0, s2                                 // |  1         :                         |  3 v v^                             |  0      |
    fmsub   s3, s1, s1, s3                                 // |  1         :                         |  3  v:^                             |  0      |
    fabs    s3, s3                                         // |  1         :                         |  2   :^                             |  4 ^^^^ |
    fcvt    d3, s3                                         // |  1         :                         |  2   :^                             |  1 :    |
    fmov    d4, x8                                         // |  1         v                         |  2   : ^                            |  1 :    |
    fcmp    d3, d4                                         // |  1         :                         |  3   :^v                            |  1 :    |
    b.pl    LBB0_4                                         // |  1         :                         |  1   :                              |  1 v    |
    mov w0, #1                                             // |  2 ^       :                         |  1   :                              |  0      |
    ret                                                    // |  2         :                     v   |  1   :                              |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    fmadd   s1, s1, s1, s2                                 // |  1         :                         |  2  ^v                              |  0      |
    fmsub   s0, s0, s0, s1                                 // |  1         :                         |  2 ^v                               |  0      |
    fabs    s0, s0                                         // |  1         :                         |  1 ^                                |  4 ^^^^ |
    fcvt    d0, s0                                         // |  1         :                         |  1 ^                                |  1 :    |
    fmov    d1, x8                                         // |  1         v                         |  1  ^                               |  1 :    |
    fcmp    d0, d1                                         // |  0                                   |  2 ^v                               |  1 :    |
    b.pl    LBB0_6                                         // |  0                                   |  0                                  |  1 v    |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .cfi_endproc                                           // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
