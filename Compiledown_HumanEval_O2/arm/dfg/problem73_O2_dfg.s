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
    add w8, w1, w1, lsr #31                                // |  2  v      ^                         |  0                                  |  0      |
    asr w9, w8, #1                                         // |  2         v^                        |  0                                  |  0      |
    cmp w1, #2                                             // |  2  ^       :                        |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  2  :       :                        |  0                                  |  2 v  v |
    mov w8, #0                                             // |  3  :      ^:                        |  0                                  |  0      |
    add x10, x0, w1, uxtw #2                               // |  4 vv       :^                       |  0                                  |  0      |
    sub x10, x10, #4                                       // |  3  :       :^                       |  0                                  |  0      |
    mov x11, x9                                            // |  4  :       v:^                      |  0                                  |  0      |
    mov x12, x0                                            // |  5 v:       :: ^                     |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr w13, [x12], #4                                     // |  5  :       :: v^                    |  0                                  |  0      |
    ldr w14, [x10], #-4                                    // |  4  :       :v   ^                   |  0                                  |  0      |
    cmp w13, w14                                           // |  4  :       :   ^v                   |  0                                  |  4 ^^^^ |
    b.ne    LBB0_8                                         // |  3  :       :   :                    |  0                                  |  1  v   |
    add w8, w8, w13, lsl #1                                // |  4  :      ^:   v                    |  0                                  |  0      |
    subs    x11, x11, #1                                   // |  3  :       : ^                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  2  :       :                        |  0                                  |  1  v   |
    b   LBB0_5                                             // |  2  :       :                        |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  3  :      ^:                        |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    and w10, w1, #0x80000001                               // |  3  v       :^                       |  0                                  |  0      |
    cmp w10, #1                                            // |  2          :^                       |  0                                  |  4 ^^^^ |
    b.ne    LBB0_7                                         // |  1          :                        |  0                                  |  1  v   |
    ldr w9, [x0, w9, uxtw #2]                              // |  2 v        v                        |  0                                  |  0      |
    add w8, w9, w8                                         // |  2         ^v                        |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    cmp w8, w2                                             // |  2   v     ^                         |  0                                  |  4 ^^^^ |
    cset    w0, le                                         // |  1 ^                                 |  0                                  |  3 vv v |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
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
