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
    ldr s1, [x0]                                           // |  1 v                                 |  1  ^                               |  0      |
    str s1, [x2]                                           // |  1   v                               |  1  v                               |  0      |
    ldr s0, [x0, #4]                                       // |  1 v                                 |  1 ^                                |  0      |
    str s0, [x2, #4]                                       // |  1   v                               |  1 v                                |  0      |
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_8                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x11, #0                                            // |  2  :         ^                      |  0                                  |  0      |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    add x9, x0, #4                                         // |  3 v       :^                        |  0                                  |  0      |
    sub x10, x8, #1                                        // |  2         v ^                       |  0                                  |  0      |
    mov w12, #2139095039                                   // |  2         :   ^                     |  0                                  |  0      |
    fmov    s2, w12                                        // |  2         :   v                     |  1   ^                              |  0      |
    b   LBB0_3                                             // |  2         :   :                     |  1   :                              |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #4                                         // |  3         :^  :                     |  1   :                              |  0      |
    sub x10, x10, #1                                       // |  4         ::^ :                     |  1   :                              |  0      |
    mov x11, x12                                           // |  5         :::^v                     |  1   :                              |  0      |
    cmp x12, x8                                            // |  5         v:::^                     |  1   :                              |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  4         ::::                      |  1   :                              |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    add x12, x11, #1                                       // |  5         :::v^                     |  1   :                              |  0      |
    cmp x12, x8                                            // |  5         v:::^                     |  1   :                              |  4 ^^^^ |
    b.hs    LBB0_2                                         // |  3          :::                      |  1   :                              |  4 ^^v^ |
    mov x13, x10                                           // |  4          :v: ^                    |  1   :                              |  0      |
    mov x14, x9                                            // |  3          v :  ^                   |  1   :                              |  0      |
    b   LBB0_6                                             // |  1            :                      |  1   :                              |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    add x14, x14, #4                                       // |  2            :  ^                   |  1   :                              |  0      |
    subs    x13, x13, #1                                   // |  3            : ^:                   |  1   :                              |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  2            :  :                   |  1   :                              |  3 :v : |
LBB0_6:                                                    // |                                      |                                     |         |
    ldr s3, [x0, x11, lsl #2]                              // |  3 v          v  :                   |  2   :^                             |  3 :: : |
    ldr s4, [x14]                                          // |  1               v                   |  3   ::^                            |  3 :: : |
    fabd    s4, s3, s4                                     // |  1               :                   |  3   :v^                            |  3 :: : |
    fcmp    s4, s2                                         // |  1               :                   |  3   v:^                            |  3 :: : |
    b.pl    LBB0_5                                         // |  1               :                   |  2    ::                            |  3 v: : |
    str s3, [x2]                                           // |  2   v           :                   |  2    v:                            |  3 :: : |
    ldr s0, [x14]                                          // |  1               v                   |  3 ^  ::                            |  3 :: : |
    str s0, [x2, #4]                                       // |  1   v                               |  3 v  ::                            |  3 :: : |
    fmov    s1, s3                                         // |  0                                   |  4 :^ v:                            |  3 :: : |
    fmov    s2, s4                                         // |  0                                   |  3 : ^ v                            |  3 :: : |
    b   LBB0_5                                             // |  0                                   |  1 :                                |  3 :: : |
LBB0_8:                                                    // |                                      |                                     |         |
    fcmp    s1, s0                                         // |  0                                   |  2 v^                               |  3 :: : |
    b.le    LBB0_10                                        // |  0                                   |  2 ::                               |  3 vv v |
    stp s0, s1, [x2]                                       // |  1   v                               |  2 vv                               |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
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
