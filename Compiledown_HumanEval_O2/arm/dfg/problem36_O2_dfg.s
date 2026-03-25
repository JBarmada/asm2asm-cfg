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
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    mov w9, #16384                                         // |  1          ^                        |  0                                  |  0      |
    movk    w9, #50716, lsl #16                            // |  1          ^                        |  0                                  |  0      |
    fmov    s0, w9                                         // |  1          v                        |  1 ^                                |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr s1, [x0], #4                                       // |  1 v                                 |  1  ^                               |  0      |
    fcmp    s0, s1                                         // |  0                                   |  2 ^v                               |  0      |
    fcsel   s0, s1, s0, mi                                 // |  0                                   |  2 ^v                               |  0      |
    subs    x8, x8, #1                                     // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  0                                   |  0                                  |  1  v   |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w8, #16384                                         // |  1         ^                         |  0                                  |  0      |
    movk    w8, #50716, lsl #16                            // |  1         ^                         |  0                                  |  0      |
    fmov    s0, w8                                         // |  1         v                         |  1 ^                                |  0      |
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
