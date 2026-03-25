                                                           // +--------------------------------------+-------------------------------------+---------+
                                                           // |                 GPR                  |                VECTOR               |  FLAGS  |
                                                           // |                                      |                                     |         |
                                                           // |    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXS |    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV |    NZCV |
                                                           // |    0123456789111111111122222222223ZP |    01234567891111111111222222222233 |         |
                                                           // |  #           012345678901234567890R  |  #           0123456789012345678901 |  #      |
                                                           // +--------------------------------------+-------------------------------------+---------+
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .build_version macos, 15, 0 sdk_version 26, 2          // |                                      |                                     |         |
    .section    __TEXT,__literal16,16byte_literals         // |                                      |                                     |         |
    .p2align    4, 0x0                                     // |                                      |                                     |         |
lCPI0_0:                                                   // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
    .long   2                                              // |                                      |                                     |         |
    .long   3                                              // |                                      |                                     |         |
    .long   4                                              // |                                      |                                     |         |
lCPI0_1:                                                   // |                                      |                                     |         |
    .long   0                                              // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
    .long   2                                              // |                                      |                                     |         |
    .long   3                                              // |                                      |                                     |         |
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .globl  _func0                                         // |                                      |                                     |         |
    .p2align    2                                          // |                                      |                                     |         |
_func0:                                                    // |                                      |                                     |         |
    .cfi_startproc                                         // |                                      |                                     |         |
    cmp w1, #2                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_6                                         // |  1  :                                |  0                                  |  2 v  v |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    cmp w1, #5                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lo    LBB0_3                                         // |  0                                   |  0                                  |  1   v  |
    sub x9, x2, x0                                         // |  3 v v      ^                        |  0                                  |  0      |
    sub x9, x9, #4                                         // |  1          ^                        |  0                                  |  0      |
    cmp x9, #64                                            // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.hs    LBB0_7                                         // |  0                                   |  0                                  |  4 ^^v^ |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w11, #1                                            // |  1            ^                      |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    sub x9, x2, #4                                         // |  3   v      ^ :                      |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ucvtf   s0, w11                                        // |  2          : v                      |  1 ^                                |  0      |
    ldr s1, [x0, x11, lsl #2]                              // |  3 v        : v                      |  1  ^                               |  0      |
    fmul    s0, s1, s0                                     // |  2          : :                      |  2 ^v                               |  0      |
    str s0, [x9, x11, lsl #2]                              // |  2          v v                      |  1 v                                |  0      |
    add x11, x11, #1                                       // |  1            ^                      |  0                                  |  0      |
    cmp x8, x11                                            // |  2         ^  v                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1         :                         |  0                                  |  1  v   |
LBB0_6:                                                    // |                                      |                                     |         |
    ret                                                    // |  2         :                     v   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    sub x9, x8, #1                                         // |  2         v^                        |  0                                  |  0      |
    cmp w1, #17                                            // |  2  ^       :                        |  0                                  |  4 ^^^^ |
    b.hs    LBB0_9                                         // |  1          :                        |  0                                  |  4 ^^v^ |
    mov x10, #0                                            // |  2          :^                       |  0                                  |  0      |
    mov w12, #1                                            // |  2          :  ^                     |  0                                  |  0      |
    b   LBB0_13                                            // |  1          :                        |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    and x10, x9, #0xfffffffffffffff0                       // |  2          v^                       |  0                                  |  0      |
    orr x12, x10, #0x1                                     // |  2           v ^                     |  0                                  |  0      |
    add x11, x0, #36                                       // |  4 v         :^:                     |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x13, lCPI0_0@PAGE                              // |  4           :::^                    |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr q0, [x13, lCPI0_0@PAGEOFF]                         // |  4           :::v                    |  1 ^                                |  0      |
    add x13, x2, #32                                       // |  5   v       :::^                    |  1 :                                |  0      |
    movi.4s v1, #4                                         // |  4           ::::                    |  2 :^                               |  4 ^^^^ |
    movi.4s v2, #8                                         // |  4           ::::                    |  3 ::^                              |  4 ^^^^ |
    movi.4s v3, #12                                        // |  4           ::::                    |  4 :::^                             |  4 ^^^^ |
    movi.4s v4, #16                                        // |  4           ::::                    |  5 ::::^                            |  4 ^^^^ |
    mov x14, x10                                           // |  5           v:::^                   |  5 :::::                            |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    add.4s  v5, v0, v1                                     // |  4           ::::                    |  6 vv:::^                           |  4 ^^^^ |
    add.4s  v6, v0, v2                                     // |  4           ::::                    |  5 v v:: ^                          |  4 ^^^^ |
    add.4s  v7, v0, v3                                     // |  4           ::::                    |  4 v  v:  ^                         |  4 ^^^^ |
    ucvtf.4s    v16, v0                                    // |  4           ::::                    |  3 v   :           ^                |  4 ^^^^ |
    ucvtf.4s    v5, v5                                     // |  4           ::::                    |  2     :^                           |  4 ^^^^ |
    ucvtf.4s    v6, v6                                     // |  4           ::::                    |  2     : ^                          |  4 ^^^^ |
    ucvtf.4s    v7, v7                                     // |  4           ::::                    |  2     :  ^                         |  4 ^^^^ |
    ldp q17, q18, [x11, #-32]                              // |  4           :v::                    |  3     :            ^^              |  0      |
    ldp q19, q20, [x11], #64                               // |  4           :v::                    |  5     :            ::^^            |  0      |
    fmul.4s v16, v17, v16                                  // |  3           : ::                    |  6     :           ^v:::            |  4 ^^^^ |
    fmul.4s v5, v18, v5                                    // |  3           : ::                    |  6     :^          : v::            |  4 ^^^^ |
    fmul.4s v6, v19, v6                                    // |  3           : ::                    |  6     ::^         :  v:            |  4 ^^^^ |
    fmul.4s v7, v20, v7                                    // |  3           : ::                    |  6     :::^        :   v            |  4 ^^^^ |
    stp q16, q5, [x13, #-32]                               // |  3           : :v                    |  5     :v::        v                |  0      |
    stp q6, q7, [x13], #64                                 // |  3           : :v                    |  3     : vv                         |  0      |
    add.4s  v0, v0, v4                                     // |  2           : :                     |  2 ^   v                            |  4 ^^^^ |
    subs    x14, x14, #16                                  // |  3           : : ^                   |  0                                  |  4 ^^^^ |
    b.ne    LBB0_10                                        // |  2           : :                     |  0                                  |  1  v   |
    cmp x9, x10                                            // |  3          ^v :                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  2           : :                     |  0                                  |  1  v   |
    tst x9, #0xc                                           // |  3          ^: :                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_16                                        // |  3          :: :                     |  0                                  |  1  v   |
LBB0_13:                                                   // |                                      |                                     |         |
    and x13, x9, #0xfffffffffffffffc                       // |  4          v: :^                    |  0                                  |  0      |
    orr x11, x13, #0x1                                     // |  4           :^:v                    |  0                                  |  0      |
    dup.4s  v0, w12                                        // |  3           : v:                    |  1 ^                                |  4 ^^^^ |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x12, lCPI0_1@PAGE                              // |  3           : ^:                    |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    ldr q1, [x12, lCPI0_1@PAGEOFF]                         // |  3           : v:                    |  1  ^                               |  0      |
    add.4s  v0, v0, v1                                     // |  2           :  :                    |  2 ^v                               |  4 ^^^^ |
    lsl x14, x10, #2                                       // |  3           v  :^                   |  1 :                                |  0      |
    add x12, x2, x14                                       // |  4   v         ^:v                   |  1 :                                |  0      |
    add x14, x14, x0                                       // |  4 v           ::^                   |  1 :                                |  0      |
    add x14, x14, #4                                       // |  3             ::^                   |  1 :                                |  0      |
    sub x10, x10, x13                                      // |  4           ^ :v:                   |  1 :                                |  0      |
    movi.4s v1, #4                                         // |  3             :::                   |  2 :^                               |  4 ^^^^ |
LBB0_14:                                                   // |                                      |                                     |         |
    ldr q2, [x14], #16                                     // |  3             ::v                   |  3 ::^                              |  0      |
    ucvtf.4s    v3, v0                                     // |  2             ::                    |  3 v: ^                             |  4 ^^^^ |
    fmul.4s v2, v2, v3                                     // |  2             ::                    |  3  :^v                             |  4 ^^^^ |
    str q2, [x12], #16                                     // |  2             v:                    |  2  :v                              |  0      |
    add.4s  v0, v0, v1                                     // |  1              :                    |  2 ^v                               |  4 ^^^^ |
    adds    x10, x10, #4                                   // |  2           ^  :                    |  0                                  |  4 ^^^^ |
    b.ne    LBB0_14                                        // |  2           :  :                    |  0                                  |  1  v   |
    cmp x9, x13                                            // |  3          ^:  v                    |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  1           :                       |  0                                  |  1  v   |
    b   LBB0_6                                             // |  1           :                       |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    orr x11, x10, #0x1                                     // |  2           v^                      |  0                                  |  0      |
    b   LBB0_4                                             // |  0                                   |  0                                  |  0      |
    .loh AdrpLdr    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpLdr    Lloh2, Lloh3                           // |                                      |                                     |         |
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
