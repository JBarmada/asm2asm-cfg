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
    str wzr, [x3]                                          // |  2    v                           v  |  0                                  |  0      |
    cmp w1, w0                                             // |  2 v^                                |  0                                  |  4 ^^^^ |
    csel    w9, w1, w0, gt                                 // |  3 vv       ^                        |  0                                  |  3 vv v |
    csel    w8, w1, w0, lt                                 // |  3 vv      ^                         |  0                                  |  2 v  v |
    add w9, w9, #1                                         // |  1          ^                        |  0                                  |  0      |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    add w8, w8, #1                                         // |  1         ^                         |  0                                  |  0      |
    cmp w9, w8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_5                                         // |  0                                   |  0                                  |  1  v   |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w8, #9                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.gt    LBB0_1                                         // |  0                                   |  0                                  |  3 vv v |
    tbnz    w8, #0, LBB0_1                                 // |  1         ^                         |  0                                  |  0      |
    ldrsw   x10, [x3]                                      // |  3    v    : ^                       |  0                                  |  0      |
    add w11, w10, #1                                       // |  3         : v^                      |  0                                  |  0      |
    str w11, [x3]                                          // |  4    v    : :v                      |  0                                  |  0      |
    str w8, [x2, x10, lsl #2]                              // |  3   v     v v                       |  0                                  |  0      |
    b   LBB0_1                                             // |  0                                   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
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
