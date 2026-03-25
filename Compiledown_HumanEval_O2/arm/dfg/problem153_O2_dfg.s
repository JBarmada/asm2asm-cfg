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
    cmp w3, #1                                             // |  1    ^                              |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  1    :                              |  0                                  |  2 v  v |
    mov w8, w3                                             // |  2    v    ^                         |  0                                  |  0      |
    cmp w3, #4                                             // |  1    ^                              |  0                                  |  4 ^^^^ |
    b.hs    LBB0_6                                         // |  0                                   |  0                                  |  4 ^^v^ |
    mov x9, #0                                             // |  1          ^                        |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    lsl x12, x9, #2                                        // |  2          v  ^                     |  0                                  |  0      |
    add x10, x2, x12                                       // |  4   v      :^ v                     |  0                                  |  0      |
    add x11, x1, x12                                       // |  5  v       ::^v                     |  0                                  |  0      |
    add x12, x0, x12                                       // |  5 v        :::^                     |  0                                  |  0      |
    sub x8, x8, x9                                         // |  5         ^v:::                     |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    ldr w9, [x12], #4                                      // |  4          ^::v                     |  0                                  |  0      |
    ldr w13, [x11], #4                                     // |  3           :v ^                    |  0                                  |  0      |
    subs    w9, w9, w13                                    // |  3          ^:  v                    |  0                                  |  4 ^^^^ |
    cneg    w9, w9, mi                                     // |  2          ^:                       |  0                                  |  0      |
    str w9, [x10], #4                                      // |  2          vv                       |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  1         :                         |  0                                  |  1  v   |
LBB0_5:                                                    // |                                      |                                     |         |
    ret                                                    // |  2         :                     v   |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x9, #0                                             // |  2         :^                        |  0                                  |  0      |
    sub x10, x2, x0                                        // |  4 v v     : ^                       |  0                                  |  0      |
    cmp x10, #64                                           // |  2         : ^                       |  0                                  |  4 ^^^^ |
    b.lo    LBB0_3                                         // |  1         :                         |  0                                  |  1   v  |
    sub x10, x2, x1                                        // |  4  vv     : ^                       |  0                                  |  0      |
    cmp x10, #64                                           // |  2         : ^                       |  0                                  |  4 ^^^^ |
    b.lo    LBB0_3                                         // |  1         :                         |  0                                  |  1   v  |
    cmp w3, #16                                            // |  2    ^    :                         |  0                                  |  4 ^^^^ |
    b.hs    LBB0_10                                        // |  1         :                         |  0                                  |  4 ^^v^ |
    mov x9, #0                                             // |  2         :^                        |  0                                  |  0      |
    b   LBB0_14                                            // |  1         :                         |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    and x9, x8, #0x7ffffff0                                // |  2         v^                        |  0                                  |  0      |
    add x10, x2, #32                                       // |  4   v     ::^                       |  0                                  |  0      |
    add x11, x1, #32                                       // |  5  v      :::^                      |  0                                  |  0      |
    add x12, x0, #32                                       // |  6 v       ::::^                     |  0                                  |  0      |
    mov x13, x9                                            // |  6         :v:::^                    |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    ldp q0, q1, [x12, #-32]                                // |  4         : ::v                     |  2 ^^                               |  0      |
    ldp q2, q3, [x12], #64                                 // |  4         : ::v                     |  2   ^^                             |  0      |
    ldp q4, q5, [x11, #-32]                                // |  3         : :v                      |  2     ^^                           |  0      |
    ldp q6, q7, [x11], #64                                 // |  3         : :v                      |  4     ::^^                         |  0      |
    sabd.4s v0, v0, v4                                     // |  2         : :                       |  5 ^   v:::                         |  4 ^^^^ |
    sabd.4s v1, v1, v5                                     // |  2         : :                       |  5 :^   v::                         |  4 ^^^^ |
    sabd.4s v2, v2, v6                                     // |  2         : :                       |  5 ::^   v:                         |  4 ^^^^ |
    sabd.4s v3, v3, v7                                     // |  2         : :                       |  5 :::^   v                         |  4 ^^^^ |
    stp q0, q1, [x10, #-32]                                // |  2         : v                       |  4 vv::                             |  0      |
    stp q2, q3, [x10], #64                                 // |  2         : v                       |  2   vv                             |  0      |
    subs    x13, x13, #16                                  // |  2         :    ^                    |  0                                  |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  1         :                         |  0                                  |  1  v   |
    cmp x9, x8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_5                                         // |  1          :                        |  0                                  |  1  v   |
    tst x8, #0xc                                           // |  2         ^:                        |  0                                  |  4 ^^^^ |
    b.eq    LBB0_3                                         // |  2         ::                        |  0                                  |  1  v   |
LBB0_14:                                                   // |                                      |                                     |         |
    mov x13, x9                                            // |  3         :v   ^                    |  0                                  |  0      |
    and x9, x8, #0x7ffffffc                                // |  3         v^   :                    |  0                                  |  0      |
    lsl x12, x13, #2                                       // |  4         ::  ^v                    |  0                                  |  0      |
    add x10, x0, x12                                       // |  5 v       ::^ v                     |  0                                  |  0      |
    add x11, x1, x12                                       // |  6  v      :::^v                     |  0                                  |  0      |
    add x12, x2, x12                                       // |  6   v     ::::^                     |  0                                  |  0      |
    sub x13, x13, x9                                       // |  6         :v:::^                    |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    ldr q0, [x10], #16                                     // |  4         : v::                     |  1 ^                                |  0      |
    ldr q1, [x11], #16                                     // |  3         :  v:                     |  1  ^                               |  0      |
    sabd.4s v0, v0, v1                                     // |  2         :   :                     |  2 ^v                               |  4 ^^^^ |
    str q0, [x12], #16                                     // |  2         :   v                     |  1 v                                |  0      |
    adds    x13, x13, #4                                   // |  2         :    ^                    |  0                                  |  4 ^^^^ |
    b.ne    LBB0_15                                        // |  1         :                         |  0                                  |  1  v   |
    cmp x9, x8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  0                                   |  0                                  |  1  v   |
    b   LBB0_5                                             // |  0                                   |  0                                  |  0      |
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
