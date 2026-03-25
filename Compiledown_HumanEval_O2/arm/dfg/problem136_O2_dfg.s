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
    cmp w1, #2                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  1  :                                |  0                                  |  2 v  v |
    add x8, x0, #4                                         // |  3 v:      ^                         |  0                                  |  0      |
    mov w0, #-1                                            // |  3 ^:      :                         |  0                                  |  0      |
    mov w9, #1                                             // |  3  :      :^                        |  0                                  |  0      |
    mov w10, w1                                            // |  4  v      ::^                       |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldp w12, w11, [x8, #-4]                                // |  4         v: ^^                     |  0                                  |  0      |
    cmp w11, w12                                           // |  3          : ^v                     |  0                                  |  4 ^^^^ |
    csel    w0, w9, w0, lt                                 // |  2 ^        v                        |  0                                  |  2 v  v |
    add x9, x9, #1                                         // |  1          ^                        |  0                                  |  0      |
    add x8, x8, #4                                         // |  2         ^:                        |  0                                  |  0      |
    cmp x10, x9                                            // |  2          v^                       |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  0                                   |  0                                  |  1  v   |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w0, #-1                                            // |  1 ^                                 |  0                                  |  0      |
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
