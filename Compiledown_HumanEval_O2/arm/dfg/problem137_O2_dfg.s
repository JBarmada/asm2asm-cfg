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
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  1  :                                |  0                                  |  2 v  v |
    mov w8, #0                                             // |  2  :      ^                         |  0                                  |  0      |
    mov w9, #0                                             // |  3  :      :^                        |  0                                  |  0      |
    mov w10, w1                                            // |  4  v      ::^                       |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr w11, [x0], #4                                      // |  4 v       :: ^                      |  0                                  |  0      |
    cmp w11, w8                                            // |  3         v: ^                      |  0                                  |  4 ^^^^ |
    csel    w12, w11, w8, lt                               // |  4         v: v^                     |  0                                  |  2 v  v |
    cmp w8, #0                                             // |  3         ^: :                      |  0                                  |  4 ^^^^ |
    csel    w12, w11, w12, eq                              // |  4         :: v^                     |  0                                  |  1  v   |
    cmp w11, #0                                            // |  3         :: ^                      |  0                                  |  4 ^^^^ |
    csel    w12, w8, w12, eq                               // |  3         v:  ^                     |  0                                  |  1  v   |
    cmp w11, w9                                            // |  3          v ^:                     |  0                                  |  4 ^^^^ |
    csel    w13, w11, w9, gt                               // |  4          v v:^                    |  0                                  |  3 vv v |
    cmp w9, #0                                             // |  3          ^ ::                     |  0                                  |  4 ^^^^ |
    csel    w13, w11, w13, eq                              // |  3            v:^                    |  0                                  |  1  v   |
    tst w11, #0x80000000                                   // |  3            ^::                    |  0                                  |  4 ^^^^ |
    csel    w9, w9, w13, eq                                // |  3          ^  :v                    |  0                                  |  1  v   |
    csel    w8, w12, w8, eq                                // |  3         ^:  v                     |  0                                  |  1  v   |
    subs    x10, x10, #1                                   // |  3         ::^                       |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  2         ::                        |  0                                  |  1  v   |
    stp w9, w8, [x2]                                       // |  3   v     vv                        |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w9, #0                                             // |  1          ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  2         ^:                        |  0                                  |  0      |
    stp w9, w8, [x2]                                       // |  3   v     vv                        |  0                                  |  0      |
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
