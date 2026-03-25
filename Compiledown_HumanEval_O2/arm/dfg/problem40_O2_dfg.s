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
    mov w9, #0                                             // |  1          ^                        |  0                                  |  0      |
    mov w11, #2                                            // |  1            ^                      |  0                                  |  0      |
    mov w10, #1                                            // |  1           ^                       |  0                                  |  0      |
    b   LBB0_3                                             // |  1           :                       |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    mov w12, #1                                            // |  2           : ^                     |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w11, w8, w10                                       // |  4         v v^:                     |  0                                  |  0      |
    add w9, w9, w12                                        // |  3          ^ :v                     |  0                                  |  0      |
    cmp w9, w0                                             // |  3 v        ^ :                      |  0                                  |  4 ^^^^ |
    mov x10, x8                                            // |  3         v ^:                      |  0                                  |  1  :   |
    b.eq    LBB0_9                                         // |  1            :                      |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp w9, w0                                             // |  3 v        ^ :                      |  0                                  |  4 ^^^^ |
    b.ge    LBB0_8                                         // |  1            :                      |  0                                  |  2 v  v |
    mov x8, x11                                            // |  2         ^  v                      |  0                                  |  0      |
    cmp w11, #4                                            // |  2         :  ^                      |  0                                  |  4 ^^^^ |
    b.lt    LBB0_1                                         // |  1         :                         |  0                                  |  2 v  v |
    mov w11, #2                                            // |  2         :  ^                      |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    udiv    w12, w8, w11                                   // |  3         v  v^                     |  0                                  |  0      |
    msub    w12, w12, w11, w8                              // |  3         v  v^                     |  0                                  |  0      |
    cmp w12, #0                                            // |  2         :   ^                     |  0                                  |  4 ^^^^ |
    add w11, w11, #1                                       // |  2         :  ^                      |  0                                  |  1  :   |
    mul w13, w11, w11                                      // |  3         :  v ^                    |  0                                  |  1  :   |
    ccmp    w13, w8, #0, ne                                // |  2         v    ^                    |  0                                  |  4 ^v^^ |
    b.le    LBB0_6                                         // |  1         :                         |  0                                  |  3 vv v |
    cmp w12, #0                                            // |  2         :   ^                     |  0                                  |  4 ^^^^ |
    cset    w12, ne                                        // |  2         :   ^                     |  0                                  |  1  v   |
    b   LBB0_2                                             // |  1         :                         |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  2 ^       :                         |  0                                  |  0      |
    ret                                                    // |  2         :                     v   |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
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
