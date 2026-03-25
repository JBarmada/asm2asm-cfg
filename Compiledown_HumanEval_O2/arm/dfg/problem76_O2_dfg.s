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
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
    mov w9, #2                                             // |  1          ^                        |  0                                  |  0      |
    b   LBB0_4                                             // |  1          :                        |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    sdiv    w0, w0, w9                                     // |  2 ^        v                        |  0                                  |  0      |
    add w8, w8, #1                                         // |  3 :       ^:                        |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    sdiv    w10, w0, w9                                    // |  3 v        v^                       |  0                                  |  0      |
    msub    w10, w10, w9, w0                               // |  3 v        v^                       |  0                                  |  0      |
    cbz w10, LBB0_3                                        // |  2 :         ^                       |  0                                  |  0      |
    add w9, w9, #1                                         // |  2 :        ^                        |  0                                  |  0      |
    mul w10, w9, w9                                        // |  3 :        v^                       |  0                                  |  0      |
    cmp w10, w0                                            // |  2 v         ^                       |  0                                  |  4 ^^^^ |
    b.le    LBB0_4                                         // |  0                                   |  0                                  |  3 vv v |
    cmp w0, #1                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    cinc    w8, w8, gt                                     // |  1         ^                         |  0                                  |  0      |
    cmp w8, #3                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    cset    w0, eq                                         // |  1 ^                                 |  0                                  |  1  v   |
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
