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
    frinta  s3, s0                                         // |  0                                   |  2 v  ^                             |  0      |
    frinta  s4, s1                                         // |  0                                   |  2  v  ^                            |  0      |
    frinta  s5, s2                                         // |  0                                   |  2   v  ^                           |  0      |
    fcmp    s3, s0                                         // |  0                                   |  2 v  ^                             |  0      |
    fccmp   s4, s1, #0, eq                                 // |  0                                   |  2  v  ^                            |  0      |
    fccmp   s5, s2, #0, eq                                 // |  0                                   |  2   v  ^                           |  0      |
    b.eq    LBB0_2                                         // |  0                                   |  0                                  |  1  v   |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    fadd    s3, s0, s1                                     // |  0                                   |  3 vv ^                             |  0      |
    fcmp    s3, s2                                         // |  0                                   |  2   v^                             |  0      |
    cset    w8, eq                                         // |  1         ^                         |  0                                  |  1  v   |
    fadd    s3, s0, s2                                     // |  0                                   |  3 v v^                             |  0      |
    fcmp    s3, s1                                         // |  0                                   |  2  v ^                             |  0      |
    csinc   w8, w8, wzr, ne                                // |  2         ^                      v  |  0                                  |  1  v   |
    fadd    s1, s1, s2                                     // |  1         :                         |  2  ^v                              |  0      |
    fcmp    s1, s0                                         // |  1         :                         |  2 v^                               |  0      |
    csinc   w0, w8, wzr, ne                                // |  3 ^       v                      v  |  0                                  |  1  v   |
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
