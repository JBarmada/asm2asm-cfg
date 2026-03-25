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
    cmp w0, #1                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.lt    LBB0_6                                         // |  1 :                                 |  0                                  |  2 v  v |
    mov w9, #0                                             // |  2 :        ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  2 :       ^                         |  0                                  |  0      |
    mov w10, #35747                                        // |  2 :         ^                       |  0                                  |  0      |
    movk    w10, #47662, lsl #16                           // |  2 :         ^                       |  0                                  |  0      |
    mov w11, #20165                                        // |  3 :         :^                      |  0                                  |  0      |
    movk    w11, #50412, lsl #16                           // |  3 :         :^                      |  0                                  |  0      |
    mov w12, #15123                                        // |  4 :         ::^                     |  0                                  |  0      |
    movk    w12, #5041, lsl #16                            // |  4 :         ::^                     |  0                                  |  0      |
    mov w13, #53620                                        // |  5 :         :::^                    |  0                                  |  0      |
    movk    w13, #5957, lsl #16                            // |  5 :         :::^                    |  0                                  |  0      |
    mov w14, #52429                                        // |  6 :         ::::^                   |  0                                  |  0      |
    movk    w14, #52428, lsl #16                           // |  6 :         ::::^                   |  0                                  |  0      |
    mov w15, #10                                           // |  7 :         :::::^                  |  0                                  |  0      |
    b   LBB0_3                                             // |  7 :         ::::::                  |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w9, w9, #1                                         // |  8 :        ^::::::                  |  0                                  |  0      |
    cmp w9, w0                                             // |  8 v        ^::::::                  |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  7          :::::::                  |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mul w16, w9, w10                                       // |  8          vv:::::^                 |  0                                  |  0      |
    mul w17, w9, w11                                       // |  7          v v:::: ^                |  0                                  |  0      |
    cmp w17, w12                                           // |  5             v::: ^                |  0                                  |  4 ^^^^ |
    ccmp    w16, w13, #0, hi                               // |  4              v::^                 |  0                                  |  4 ^vv^ |
    ccmp    w9, #0, #4, ls                                 // |  3          ^    ::                  |  0                                  |  4 ^vv^ |
    b.eq    LBB0_2                                         // |  3          :    ::                  |  0                                  |  1  v   |
    mov x16, x9                                            // |  4          v    ::^                 |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    umull   x17, w16, w14                                  // |  4               v:v^                |  0                                  |  0      |
    lsr x17, x17, #35                                      // |  3                ::^                |  0                                  |  0      |
    msub    w1, w17, w15, w16                              // |  4  ^             vvv                |  0                                  |  0      |
    cmp w1, #7                                             // |  2  ^               :                |  0                                  |  4 ^^^^ |
    cinc    w8, w8, eq                                     // |  2         ^        :                |  0                                  |  0      |
    cmp w16, #9                                            // |  2                 ^:                |  0                                  |  4 ^^^^ |
    mov x16, x17                                           // |  2                 ^v                |  0                                  |  2  ::  |
    b.hi    LBB0_5                                         // |  0                                   |  0                                  |  2  vv  |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
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
