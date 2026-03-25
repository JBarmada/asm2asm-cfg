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
    b.lt    LBB0_6                                         // |  1  :                                |  0                                  |  2 v  v |
    ldr w8, [x0]                                           // |  3 v:      ^                         |  0                                  |  0      |
    tbnz    w8, #31, LBB0_7                                // |  2  :      ^                         |  0                                  |  0      |
    mov w9, w1                                             // |  2  v       ^                        |  0                                  |  0      |
    mov w11, #1                                            // |  1            ^                      |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x10, x11                                           // |  2           ^v                      |  0                                  |  0      |
    cmp x9, x11                                            // |  3          ^:v                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_5                                         // |  2          ::                       |  0                                  |  1  v   |
    ldr w12, [x0, x10, lsl #2]                             // |  4 v        :v ^                     |  0                                  |  0      |
    add x11, x10, #1                                       // |  4          :v^:                     |  0                                  |  0      |
    adds    w8, w12, w8                                    // |  3         ^:  v                     |  0                                  |  4 ^^^^ |
    b.pl    LBB0_3                                         // |  1          :                        |  0                                  |  1 v    |
LBB0_5:                                                    // |                                      |                                     |         |
    cmp x10, x9                                            // |  2          v^                       |  0                                  |  4 ^^^^ |
    cset    w0, lo                                         // |  1 ^                                 |  0                                  |  1   v  |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
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
