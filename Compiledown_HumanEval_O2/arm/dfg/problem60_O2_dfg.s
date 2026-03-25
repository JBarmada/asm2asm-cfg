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
    cmp w0, #4                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  0                                   |  0                                  |  2 v  v |
LBB0_1:                                                    // |                                      |                                     |         |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w8, #2                                             // |  1         ^                         |  0                                  |  0      |
    cmp w0, w8                                             // |  2 ^       v                         |  0                                  |  4 ^^^^ |
    b.gt    LBB0_5                                         // |  1 :                                 |  0                                  |  3 vv v |
LBB0_3:                                                    // |                                      |                                     |         |
    add w8, w8, #1                                         // |  2 :       ^                         |  0                                  |  0      |
    mul w9, w8, w8                                         // |  3 :       v^                        |  0                                  |  0      |
    cmp w9, w0                                             // |  3 v       :^                        |  0                                  |  4 ^^^^ |
    b.gt    LBB0_1                                         // |  1         :                         |  0                                  |  3 vv v |
    cmp w0, w8                                             // |  2 ^       v                         |  0                                  |  4 ^^^^ |
    b.le    LBB0_3                                         // |  2 :       :                         |  0                                  |  3 vv v |
LBB0_5:                                                    // |                                      |                                     |         |
    sdiv    w9, w0, w8                                     // |  3 v       v^                        |  0                                  |  0      |
    msub    w9, w9, w8, w0                                 // |  3 v       v^                        |  0                                  |  0      |
    cbnz    w9, LBB0_3                                     // |  2         :^                        |  0                                  |  0      |
    sdiv    w0, w0, w8                                     // |  2 ^       v                         |  0                                  |  0      |
    cmp w0, w8                                             // |  2 ^       v                         |  0                                  |  4 ^^^^ |
    b.gt    LBB0_5                                         // |  0                                   |  0                                  |  3 vv v |
    b   LBB0_3                                             // |  0                                   |  0                                  |  0      |
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
