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
    b.lt    LBB0_7                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x9, #0                                             // |  2  :       ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  2  :      ^                         |  0                                  |  0      |
    mov w10, #52429                                        // |  2  :        ^                       |  0                                  |  0      |
    movk    w10, #52428, lsl #16                           // |  2  :        ^                       |  0                                  |  0      |
    mov w11, w1                                            // |  3  v        :^                      |  0                                  |  0      |
    b   LBB0_3                                             // |  2           ::                      |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  3          ^::                      |  0                                  |  0      |
    cmp x9, x11                                            // |  3          ^:v                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  2          ::                       |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr w12, [x0, x9, lsl #2]                              // |  4 v        v: ^                     |  0                                  |  0      |
    cmp w12, #11                                           // |  2           : ^                     |  0                                  |  4 ^^^^ |
    b.lt    LBB0_2                                         // |  2           : :                     |  0                                  |  2 v  v |
    mov x13, x12                                           // |  3           : v^                    |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x14, x13                                           // |  3           :  v^                   |  0                                  |  0      |
    umull   x13, w13, w10                                  // |  2           v  ^                    |  0                                  |  0      |
    lsr x13, x13, #35                                      // |  1              ^                    |  0                                  |  0      |
    cmp w14, #99                                           // |  2              :^                   |  0                                  |  4 ^^^^ |
    b.hi    LBB0_5                                         // |  1              :                    |  0                                  |  2  vv  |
    and w12, w12, w13                                      // |  2             ^v                    |  0                                  |  0      |
    and w12, w12, #0x1                                     // |  1             ^                     |  0                                  |  0      |
    add w8, w12, w8                                        // |  2         ^   v                     |  0                                  |  0      |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
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
