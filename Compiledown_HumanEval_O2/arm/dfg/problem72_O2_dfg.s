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
    fadd    s4, s0, s1                                     // |  0                                   |  3 vv  ^                            |  0      |
    fadd    s5, s0, s2                                     // |  0                                   |  3 v v  ^                           |  0      |
    fadd    s6, s1, s2                                     // |  0                                   |  3  vv   ^                          |  0      |
    fmov    s3, #-1.00000000                               // |  0                                   |  1    ^                             |  0      |
    fcmp    s6, s0                                         // |  0                                   |  2 v     ^                          |  0      |
    fccmp   s4, s2, #0, hi                                 // |  0                                   |  2   v ^                            |  0      |
    fccmp   s5, s1, #0, hi                                 // |  0                                   |  3  v  :^                           |  0      |
    b.ls    LBB0_2                                         // |  0                                   |  1     :                            |  4 ^vv^ |
    fadd    s3, s4, s2                                     // |  0                                   |  3   v^v                            |  0      |
    fmov    s4, #0.50000000                                // |  0                                   |  1     ^                            |  0      |
    fmul    s3, s3, s4                                     // |  0                                   |  2    ^v                            |  0      |
    fsub    s0, s3, s0                                     // |  0                                   |  2 ^  v                             |  0      |
    fmul    s0, s3, s0                                     // |  0                                   |  2 ^  v                             |  0      |
    fsub    s1, s3, s1                                     // |  0                                   |  2  ^ v                             |  0      |
    fmul    s0, s1, s0                                     // |  0                                   |  3 ^v :                             |  0      |
    fsub    s1, s3, s2                                     // |  0                                   |  3  ^vv                             |  0      |
    fmul    s0, s1, s0                                     // |  0                                   |  2 ^v                               |  0      |
    fsqrt   s0, s0                                         // |  0                                   |  1 ^                                |  0      |
    mov w8, #1120403456                                    // |  1         ^                         |  0                                  |  0      |
    fmov    s1, w8                                         // |  1         v                         |  1  ^                               |  0      |
    fmul    s0, s0, s1                                     // |  0                                   |  2 ^v                               |  0      |
    frinta  s0, s0                                         // |  0                                   |  2 ^:                               |  0      |
    fdiv    s3, s0, s1                                     // |  0                                   |  3 vv ^                             |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    fmov    s0, s3                                         // |  0                                   |  2 ^  v                             |  0      |
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
