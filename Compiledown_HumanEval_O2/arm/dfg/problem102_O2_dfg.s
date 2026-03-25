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
    cmp w1, w0                                             // |  2 v^                                |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  1  :                                |  0                                  |  2 v  v |
    mov w0, #-1                                            // |  2 ^:                                |  0                                  |  0      |
    ret                                                    // |  3 ::                            v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    and w8, w1, #0x80000001                                // |  3 :v      ^                         |  0                                  |  0      |
    cmp w1, w0                                             // |  2 v^                                |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1  :                                |  0                                  |  1  v   |
    cmp w8, #1                                             // |  2  :      ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1  :                                |  0                                  |  1  v   |
    mov w0, #-1                                            // |  2 ^:                                |  0                                  |  0      |
    ret                                                    // |  2  :                            v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    cmp w8, #1                                             // |  2  :      ^                         |  0                                  |  4 ^^^^ |
    cset    w8, eq                                         // |  2  :      ^                         |  0                                  |  1  v   |
    sub w0, w1, w8                                         // |  3 ^v      v                         |  0                                  |  0      |
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
