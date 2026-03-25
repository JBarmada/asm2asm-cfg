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
    b.ge    LBB0_3                                         // |  0                                   |  0                                  |  2 v  v |
LBB0_1:                                                    // |                                      |                                     |         |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ret                                                    // |  2 :                             v   |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    ldp w9, w8, [x0]                                       // |  3 v       ^^                        |  0                                  |  0      |
    cmp w8, w9                                             // |  2         ^v                        |  0                                  |  4 ^^^^ |
    b.ge    LBB0_5                                         // |  0                                   |  0                                  |  2 v  v |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  2 :                             v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x8, x0                                             // |  2 v       ^                         |  0                                  |  0      |
    cmp w1, #2                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    cset    w0, eq                                         // |  2 ^:                                |  0                                  |  1  v   |
    b.eq    LBB0_2                                         // |  1  :                                |  0                                  |  1  v   |
    mov w9, w1                                             // |  2  v       ^                        |  0                                  |  0      |
    add x8, x8, #8                                         // |  1         ^                         |  0                                  |  0      |
    sub x9, x9, #2                                         // |  1          ^                        |  0                                  |  0      |
    b   LBB0_8                                             // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    add x8, x8, #4                                         // |  1         ^                         |  0                                  |  0      |
    subs    x9, x9, #1                                     // |  2         :^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  1         :                         |  0                                  |  1  v   |
LBB0_8:                                                    // |                                      |                                     |         |
    ldp w11, w10, [x8, #-4]                                // |  3         v ^^                      |  0                                  |  0      |
    cmp w10, w11                                           // |  3         : ^v                      |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  1         :                         |  0                                  |  3 v: v |
    b.ne    LBB0_7                                         // |  1         :                         |  0                                  |  1  v   |
    ldur    w11, [x8, #-8]                                 // |  2         v  ^                      |  0                                  |  0      |
    cmp w10, w11                                           // |  2           ^v                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_7                                         // |  0                                   |  0                                  |  1  v   |
    b   LBB0_4                                             // |  0                                   |  0                                  |  0      |
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
