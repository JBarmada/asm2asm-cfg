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
    mov x14, #0                                            // |  2  :            ^                   |  0                                  |  0      |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    add x9, x0, #4                                         // |  3 v       :^                        |  0                                  |  0      |
    sub x10, x8, #1                                        // |  2         v ^                       |  0                                  |  0      |
    mov w11, #1                                            // |  2         :  ^                      |  0                                  |  0      |
    b   LBB0_3                                             // |  1         :                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #4                                         // |  2         :^                        |  0                                  |  0      |
    sub x10, x10, #1                                       // |  3         ::^                       |  0                                  |  0      |
    mov x14, x12                                           // |  5         ::: v ^                   |  0                                  |  0      |
    mov x11, x13                                           // |  6         :::^ v:                   |  0                                  |  0      |
    cmp x12, x8                                            // |  5         v:: ^ :                   |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  4         :::   :                   |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    add x12, x14, #1                                       // |  5         ::: ^ v                   |  0                                  |  0      |
    cmp x12, x8                                            // |  5         v:: ^ :                   |  0                                  |  4 ^^^^ |
    cset    w13, lo                                        // |  4          ::  ^:                   |  0                                  |  1   v  |
    b.hs    LBB0_2                                         // |  3          ::   :                   |  0                                  |  4 ^^v^ |
    ldr w14, [x0, x14, lsl #2]                             // |  4 v        ::   v                   |  0                                  |  0      |
    mov x15, x10                                           // |  3          :v    ^                  |  0                                  |  0      |
    mov x16, x9                                            // |  2          v      ^                 |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ldr w17, [x16], #4                                     // |  2                 v^                |  0                                  |  0      |
    cmn w14, w17                                           // |  2               ^  v                |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  0                                   |  0                                  |  1  v   |
    subs    x15, x15, #1                                   // |  1                ^                  |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  0                                   |  0                                  |  1  v   |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w11, #0                                            // |  1            ^                      |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    and w0, w11, #0x1                                      // |  2 ^          v                      |  0                                  |  0      |
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
