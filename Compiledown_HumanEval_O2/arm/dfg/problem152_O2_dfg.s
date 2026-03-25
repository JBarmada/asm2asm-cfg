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
    b.lt    LBB0_6                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x8, x0                                             // |  3 v:      ^                         |  0                                  |  0      |
    mov x0, #0                                             // |  2 ^:                                |  0                                  |  0      |
    mov w9, w1                                             // |  2  v       ^                        |  0                                  |  0      |
    mov x10, #17197                                        // |  1           ^                       |  0                                  |  0      |
    movk    x10, #60188, lsl #16                           // |  1           ^                       |  0                                  |  0      |
    movk    x10, #14050, lsl #32                           // |  1           ^                       |  0                                  |  0      |
    movk    x10, #16154, lsl #48                           // |  1           ^                       |  0                                  |  0      |
    fmov    d0, x10                                        // |  1           v                       |  1 ^                                |  0      |
    b   LBB0_3                                             // |  0                                   |  1 :                                |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x8, x8, #4                                         // |  1         ^                         |  1 :                                |  0      |
    subs    x9, x9, #1                                     // |  2         :^                        |  1 :                                |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  1         :                         |  1 :                                |  2 :v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr s1, [x8]                                           // |  1         v                         |  2 :^                               |  1 :    |
    fcvt    d3, s1                                         // |  0                                   |  3 :v ^                             |  1 :    |
    frinta  d2, d3                                         // |  0                                   |  3 : ^v                             |  1 :    |
    fabd    d3, d3, d2                                     // |  0                                   |  3 : v^                             |  1 :    |
    fcmp    d3, d0                                         // |  0                                   |  3 v :^                             |  1 :    |
    b.pl    LBB0_2                                         // |  0                                   |  1   :                              |  1 v    |
    fcmp    s1, #0.0                                       // |  0                                   |  2  ^:                              |  0      |
    fcvtzs  w10, d2                                        // |  1           ^                       |  1   v                              |  4 ^^^^ |
    and w11, w10, #0x80000001                              // |  2           v^                      |  0                                  |  3 :: : |
    ccmp    w11, #1, #0, gt                                // |  1            ^                      |  0                                  |  4 vv^v |
    b.ne    LBB0_2                                         // |  0                                   |  0                                  |  1  v   |
    mul w10, w10, w10                                      // |  1           ^                       |  0                                  |  0      |
    add x0, x0, x10                                        // |  2 ^         v                       |  0                                  |  0      |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x0, #0                                             // |  1 ^                                 |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
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
