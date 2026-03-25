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
    b.lt    LBB0_14                                        // |  1  :                                |  0                                  |  2 v  v |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    cmp w1, #4                                             // |  2  ^      :                         |  0                                  |  4 ^^^^ |
    b.hs    LBB0_3                                         // |  1         :                         |  0                                  |  4 ^^v^ |
    mov x9, #0                                             // |  2         :^                        |  0                                  |  0      |
    b   LBB0_12                                            // |  1         :                         |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp w1, #16                                            // |  2  ^      :                         |  0                                  |  4 ^^^^ |
    b.hs    LBB0_5                                         // |  1         :                         |  0                                  |  4 ^^v^ |
    mov x9, #0                                             // |  2         :^                        |  0                                  |  0      |
    b   LBB0_9                                             // |  1         :                         |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    and x9, x8, #0x7ffffff0                                // |  2         v^                        |  0                                  |  0      |
    add x10, x0, #32                                       // |  4 v       ::^                       |  0                                  |  0      |
    movi.4s v0, #1                                         // |  3         :::                       |  1 ^                                |  4 ^^^^ |
    mov x11, x9                                            // |  4         :v:^                      |  1 :                                |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    ldp q1, q2, [x10, #-32]                                // |  2         : v                       |  3 :^^                              |  0      |
    ldp q3, q4, [x10]                                      // |  2         : v                       |  3 :  ^^                            |  0      |
    add.4s  v1, v1, v0                                     // |  2         : :                       |  2 v^                               |  4 ^^^^ |
    add.4s  v2, v2, v0                                     // |  2         : :                       |  3 v:^                              |  4 ^^^^ |
    add.4s  v3, v3, v0                                     // |  2         : :                       |  4 v::^                             |  4 ^^^^ |
    add.4s  v4, v4, v0                                     // |  2         : :                       |  5 v:::^                            |  4 ^^^^ |
    stp q1, q2, [x10, #-32]                                // |  2         : v                       |  4  vv::                            |  0      |
    stp q3, q4, [x10], #64                                 // |  2         : v                       |  2    vv                            |  0      |
    subs    x11, x11, #16                                  // |  2         :  ^                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_6                                         // |  1         :                         |  0                                  |  1  v   |
    cmp x9, x8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_14                                        // |  1          :                        |  0                                  |  1  v   |
    tst x8, #0xc                                           // |  2         ^:                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_12                                        // |  2         ::                        |  0                                  |  1  v   |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x11, x9                                            // |  3         :v ^                      |  0                                  |  0      |
    and x9, x8, #0x7ffffffc                                // |  3         v^ :                      |  0                                  |  0      |
    add x10, x0, x11, lsl #2                               // |  5 v       ::^v                      |  0                                  |  0      |
    sub x11, x11, x9                                       // |  4         :v:^                      |  0                                  |  0      |
    movi.4s v0, #1                                         // |  2         : :                       |  1 ^                                |  4 ^^^^ |
LBB0_10:                                                   // |                                      |                                     |         |
    ldr q1, [x10]                                          // |  2         : v                       |  2 :^                               |  0      |
    add.4s  v1, v1, v0                                     // |  2         : :                       |  2 v^                               |  4 ^^^^ |
    str q1, [x10], #16                                     // |  2         : v                       |  1  v                               |  0      |
    adds    x11, x11, #4                                   // |  2         :  ^                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_10                                        // |  1         :                         |  0                                  |  1  v   |
    cmp x9, x8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_14                                        // |  1          :                        |  0                                  |  1  v   |
LBB0_12:                                                   // |                                      |                                     |         |
    add x10, x0, x9, lsl #2                                // |  3 v        v^                       |  0                                  |  0      |
    sub x8, x8, x9                                         // |  3         ^v:                       |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    ldr w9, [x10]                                          // |  2          ^v                       |  0                                  |  0      |
    add w9, w9, #1                                         // |  2          ^:                       |  0                                  |  0      |
    str w9, [x10], #4                                      // |  2          vv                       |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_13                                        // |  0                                   |  0                                  |  1  v   |
LBB0_14:                                                   // |                                      |                                     |         |
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
