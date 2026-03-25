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
    b.lt    LBB0_13                                        // |  1  :                                |  0                                  |  2 v  v |
    mov x9, #0                                             // |  2  :       ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  2  :      ^                         |  0                                  |  0      |
    mov w10, w1                                            // |  3  v      : ^                       |  0                                  |  0      |
    b   LBB0_4                                             // |  2         : :                       |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w11, w8                                            // |  3         v :^                      |  0                                  |  4 ^^^^ |
    csel    w8, w11, w8, gt                                // |  3         ^ :v                      |  0                                  |  3 vv v |
LBB0_3:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  2          ^:                       |  0                                  |  0      |
    cmp x9, x10                                            // |  2          ^v                       |  0                                  |  4 ^^^^ |
    b.eq    LBB0_9                                         // |  1          :                        |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldr w11, [x0, x9, lsl #2]                              // |  3 v        v ^                      |  0                                  |  0      |
    cmp w11, #2                                            // |  1            ^                      |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  0                                   |  0                                  |  2 v  v |
    cmp w11, #4                                            // |  1            ^                      |  0                                  |  4 ^^^^ |
    b.lo    LBB0_2                                         // |  1            :                      |  0                                  |  1   v  |
    mov w12, #3                                            // |  2            :^                     |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    sub w13, w12, #1                                       // |  3            :v^                    |  0                                  |  0      |
    udiv    w14, w11, w13                                  // |  4            v:v^                   |  0                                  |  0      |
    msub    w13, w14, w13, w11                             // |  4            v:^v                   |  0                                  |  0      |
    cbz w13, LBB0_3                                        // |  3            ::^                    |  0                                  |  0      |
    mul w13, w12, w12                                      // |  3            :v^                    |  0                                  |  0      |
    add w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w13, w11                                           // |  2            v ^                    |  0                                  |  4 ^^^^ |
    b.le    LBB0_7                                         // |  0                                   |  0                                  |  3 vv v |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    cmp w8, #1                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.lt    LBB0_13                                        // |  1         :                         |  0                                  |  2 v  v |
    mov w0, #0                                             // |  2 ^       :                         |  0                                  |  0      |
    mov w9, #52429                                         // |  2         :^                        |  0                                  |  0      |
    movk    w9, #52428, lsl #16                            // |  2         :^                        |  0                                  |  0      |
    mov w10, #10                                           // |  3         ::^                       |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    umull   x11, w8, w9                                    // |  4         vv:^                      |  0                                  |  0      |
    lsr x11, x11, #35                                      // |  3         : :^                      |  0                                  |  0      |
    msub    w12, w11, w10, w8                              // |  4         v vv^                     |  0                                  |  0      |
    add w0, w12, w0                                        // |  3 ^          :v                     |  0                                  |  0      |
    cmp w8, #9                                             // |  2         ^  :                      |  0                                  |  4 ^^^^ |
    mov x8, x11                                            // |  2         ^  v                      |  0                                  |  2  ::  |
    b.hi    LBB0_11                                        // |  0                                   |  0                                  |  2  vv  |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
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
