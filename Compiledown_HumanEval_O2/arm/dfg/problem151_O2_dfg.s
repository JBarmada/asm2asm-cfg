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
    cmp w0, #1                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    cset    w8, gt                                         // |  1         ^                         |  0                                  |  3 vv v |
    cmp w0, #4                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  1 :                                 |  0                                  |  2 v  v |
    mov w9, #2                                             // |  2 :        ^                        |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    udiv    w10, w0, w9                                    // |  3 v        v^                       |  0                                  |  0      |
    msub    w10, w10, w9, w0                               // |  3 v        v^                       |  0                                  |  0      |
    cmp w10, #0                                            // |  2 :         ^                       |  0                                  |  4 ^^^^ |
    csel    w8, wzr, w8, eq                                // |  3 :       ^                      v  |  0                                  |  1  v   |
    add w9, w9, #1                                         // |  2 :        ^                        |  0                                  |  0      |
    mul w10, w9, w9                                        // |  3 :        v^                       |  0                                  |  0      |
    cmp w10, w0                                            // |  2 v         ^                       |  0                                  |  4 ^^^^ |
    b.le    LBB0_2                                         // |  0                                   |  0                                  |  3 vv v |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp w8, #0                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    csel    w0, w2, w1, eq                                 // |  3 ^vv                               |  0                                  |  1  v   |
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
