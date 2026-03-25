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
    mov x8, x0                                             // |  2 v       ^                         |  0                                  |  0      |
    ldr x0, [x0]                                           // |  1 v                                 |  0                                  |  0      |
    cmp w1, #2                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  1  :                                |  0                                  |  2 v  v |
    mov w9, w1                                             // |  2  v       ^                        |  0                                  |  0      |
    add x8, x8, #8                                         // |  1         ^                         |  0                                  |  0      |
    sub x9, x9, #1                                         // |  2         :^                        |  0                                  |  0      |
    mov x10, x0                                            // |  3 v       : ^                       |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr x11, [x8], #8                                      // |  2         v  ^                      |  0                                  |  0      |
    and x10, x10, x10, asr #63                             // |  2           ^:                      |  0                                  |  0      |
    add x10, x11, x10                                      // |  2           ^v                      |  0                                  |  0      |
    cmp x10, x0                                            // |  2 v         ^                       |  0                                  |  4 ^^^^ |
    csel    x0, x10, x0, lt                                // |  2 ^         v                       |  0                                  |  2 v  v |
    subs    x9, x9, #1                                     // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  0                                   |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
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
