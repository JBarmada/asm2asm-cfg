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
    b.lt    LBB0_8                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x11, #0                                            // |  2  :         ^                      |  0                                  |  0      |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    add x9, x0, #4                                         // |  4 v:      :^                        |  0                                  |  0      |
    sub x10, x8, #1                                        // |  3  :      v ^                       |  0                                  |  0      |
    b   LBB0_3                                             // |  2  :      :                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #4                                         // |  3  :      :^                        |  0                                  |  0      |
    sub x10, x10, #1                                       // |  4  :      ::^                       |  0                                  |  0      |
    mov x11, x12                                           // |  6  :      :::^v                     |  0                                  |  0      |
    cmp x12, x8                                            // |  6  :      v:::^                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  5  :      ::::                      |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    add x12, x11, #1                                       // |  6  :      :::v^                     |  0                                  |  0      |
    cmp x12, x8                                            // |  6  :      v:::^                     |  0                                  |  4 ^^^^ |
    b.hs    LBB0_2                                         // |  4  :       :::                      |  0                                  |  4 ^^v^ |
    mov x13, x10                                           // |  5  :       :v: ^                    |  0                                  |  0      |
    mov x14, x9                                            // |  4  :       v :  ^                   |  0                                  |  0      |
    b   LBB0_6                                             // |  2  :         :                      |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    add x14, x14, #4                                       // |  3  :         :  ^                   |  0                                  |  0      |
    subs    x13, x13, #1                                   // |  4  :         : ^:                   |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  3  :         :  :                   |  0                                  |  3 :v : |
LBB0_6:                                                    // |                                      |                                     |         |
    ldr s0, [x0, x11, lsl #2]                              // |  4 v:         v  :                   |  1 ^                                |  3 :: : |
    ldr s1, [x14]                                          // |  3  :         :  v                   |  1  ^                               |  3 :: : |
    fcmp    s0, s1                                         // |  3  :         :  :                   |  2 ^v                               |  3 :: : |
    b.le    LBB0_5                                         // |  3  :         :  :                   |  2 ::                               |  3 vv v |
    str s1, [x0, x11, lsl #2]                              // |  4 v:         v  :                   |  2 :v                               |  0      |
    str s0, [x14]                                          // |  2  :            v                   |  1 v                                |  0      |
    b   LBB0_5                                             // |  1  :                                |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    and w8, w1, #0x80000001                                // |  2  v      ^                         |  0                                  |  0      |
    cmp w8, #1                                             // |  2  :      ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_10                                        // |  1  :                                |  0                                  |  1  v   |
    lsr w8, w1, #1                                         // |  2  v      ^                         |  0                                  |  0      |
    ldr s0, [x0, w8, uxtw #2]                              // |  3 v:      v                         |  1 ^                                |  0      |
    ret                                                    // |  2  :                            v   |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    add w8, w1, w1, lsr #31                                // |  2  v      ^                         |  0                                  |  0      |
    asr w8, w8, #1                                         // |  1         ^                         |  0                                  |  0      |
    add x8, x0, w8, sxtw #2                                // |  2 v       ^                         |  0                                  |  0      |
    ldp s1, s0, [x8, #-4]                                  // |  1         v                         |  2 ^^                               |  0      |
    fadd    s0, s0, s1                                     // |  0                                   |  2 ^v                               |  0      |
    fmov    s1, #0.50000000                                // |  0                                   |  1  ^                               |  0      |
    fmul    s0, s0, s1                                     // |  0                                   |  2 ^v                               |  0      |
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
