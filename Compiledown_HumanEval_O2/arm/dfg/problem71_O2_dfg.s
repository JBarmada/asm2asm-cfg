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
    subs    w8, w1, #1                                     // |  2  v      ^                         |  0                                  |  4 ^^^^ |
    b.le    LBB0_7                                         // |  1         :                         |  0                                  |  3 vv v |
    mov x9, #0                                             // |  2         :^                        |  0                                  |  0      |
    mov w11, w1                                            // |  3  v      :  ^                      |  0                                  |  0      |
    add x10, x0, #4                                        // |  3 v       : ^                       |  0                                  |  0      |
    sub x11, x11, #1                                       // |  2         :  ^                      |  0                                  |  0      |
    b   LBB0_3                                             // |  1         :                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x10, x10, #4                                       // |  2         : ^                       |  0                                  |  0      |
    sub x11, x11, #1                                       // |  3         : :^                      |  0                                  |  0      |
    cmp x9, x8                                             // |  4         v^::                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  4         ::::                      |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x12, x9                                            // |  5         :v::^                     |  0                                  |  0      |
    add x9, x9, #1                                         // |  5         :^:::                     |  0                                  |  0      |
    mov x13, x11                                           // |  5         : :v:^                    |  0                                  |  0      |
    mov x14, x10                                           // |  5         : v:: ^                   |  0                                  |  0      |
    b   LBB0_5                                             // |  3         :  ::                     |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    add x14, x14, #4                                       // |  4         :  :: ^                   |  0                                  |  0      |
    subs    x13, x13, #1                                   // |  5         :  ::^:                   |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  4         :  :: :                   |  0                                  |  1  v   |
LBB0_5:                                                    // |                                      |                                     |         |
    ldr w15, [x0, x12, lsl #2]                             // |  6 v       :  :v :^                  |  0                                  |  0      |
    ldr w16, [x14]                                         // |  5         :  :: v ^                 |  0                                  |  0      |
    cmp w15, w16                                           // |  6         :  :: :^v                 |  0                                  |  4 ^^^^ |
    b.le    LBB0_4                                         // |  6         :  :: :::                 |  0                                  |  3 vv v |
    str w16, [x0, x12, lsl #2]                             // |  7 v       :  :v ::v                 |  0                                  |  0      |
    str w15, [x14]                                         // |  4         :  :  vv                  |  0                                  |  0      |
    b   LBB0_4                                             // |  2         :  :                      |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    cmp w1, #1                                             // |  3  ^      :  :                      |  0                                  |  4 ^^^^ |
    b.lt    LBB0_13                                        // |  2         :  :                      |  0                                  |  2 v  v |
    mov x9, #0                                             // |  3         :^ :                      |  0                                  |  0      |
    mov w10, #0                                            // |  3         : ^:                      |  0                                  |  0      |
    b   LBB0_11                                            // |  3         : ::                      |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    add x12, x2, w10, sxtw #2                              // |  5   v     : v:^                     |  0                                  |  0      |
    str w11, [x12]                                         // |  3         :  vv                     |  0                                  |  0      |
    ldr w11, [x0, w8, sxtw #2]                             // |  4 v       v  ^:                     |  0                                  |  0      |
    sub w8, w8, #1                                         // |  3         ^  ::                     |  0                                  |  0      |
    add w10, w10, #2                                       // |  4         : ^::                     |  0                                  |  0      |
    str w11, [x12, #4]                                     // |  4         : :vv                     |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    cmp x9, w8, sxtw                                       // |  3         v^:                       |  0                                  |  4 ^^^^ |
    add x9, x9, #1                                         // |  3         :^:                       |  0                                  |  2 :  : |
    b.ge    LBB0_13                                        // |  3         :::                       |  0                                  |  2 v  v |
LBB0_11:                                                   // |                                      |                                     |         |
    ldr w11, [x0, x9, lsl #2]                              // |  5 v       :v:^                      |  0                                  |  0      |
    cmp x9, w8, uxtw                                       // |  4         v^::                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_9                                         // |  2           ::                      |  0                                  |  1  v   |
    str w11, [x2, w10, sxtw #2]                            // |  3   v       vv                      |  0                                  |  0      |
    add w10, w10, #1                                       // |  1           ^                       |  0                                  |  0      |
    b   LBB0_10                                            // |  0                                   |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
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
