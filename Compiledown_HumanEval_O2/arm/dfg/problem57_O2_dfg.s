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
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
    b   LBB0_3                                             // |  0                                   |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    add w8, w8, #1                                         // |  1         ^                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w9, #62                                            // |  1          ^                        |  0                                  |  4 ^^^^ |
    cset    w9, eq                                         // |  1          ^                        |  0                                  |  1  v   |
    subs    w8, w8, w9                                     // |  2         ^v                        |  0                                  |  4 ^^^^ |
    b.mi    LBB0_6                                         // |  0                                   |  0                                  |  1 v    |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrb    w9, [x0], #1                                   // |  2 v        ^                        |  0                                  |  0      |
    cmp w9, #60                                            // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  0                                   |  0                                  |  1  v   |
    cbnz    w9, LBB0_2                                     // |  1          ^                        |  0                                  |  0      |
    cmp w8, #0                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    cset    w0, eq                                         // |  1 ^                                 |  0                                  |  1  v   |
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
