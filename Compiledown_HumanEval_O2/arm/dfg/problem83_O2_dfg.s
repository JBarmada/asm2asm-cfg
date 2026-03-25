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
    stp x29, x30, [sp, #-16]!                              // |  3                              vv x |  0                                  |  0      |
    mov x29, sp                                            // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    bl  _strlen                                            // |  2                               ^ : |  0                                  |  0      |
    cmp w0, #2                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  1                                 : |  0                                  |  2 v  v |
    mov w8, #0                                             // |  2         ^                       : |  0                                  |  0      |
    b   LBB0_6                                             // |  1                                 : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w0, #4                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    b.hs    LBB0_4                                         // |  2 :                               : |  0                                  |  4 ^^v^ |
    mov w8, #1                                             // |  3 :       ^                       : |  0                                  |  0      |
    b   LBB0_6                                             // |  2 :                               : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w9, #3                                             // |  3 :        ^                      : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    sub w8, w9, #1                                         // |  4 :       ^v                      : |  0                                  |  0      |
    udiv    w10, w0, w8                                    // |  5 v       v:^                     : |  0                                  |  0      |
    msub    w8, w10, w8, w0                                // |  5 v       ^:v                     : |  0                                  |  0      |
    cmp w8, #0                                             // |  4 :       ^:                      : |  0                                  |  4 ^^^^ |
    cset    w8, ne                                         // |  4 :       ^:                      : |  0                                  |  1  v   |
    mul w10, w9, w9                                        // |  5 :       :v^                     : |  0                                  |  1  :   |
    add w9, w9, #1                                         // |  4 :       :^                      : |  0                                  |  1  :   |
    ccmp    w10, w0, #0, ne                                // |  4 v       : ^                     : |  0                                  |  4 ^v^^ |
    b.le    LBB0_5                                         // |  2         :                       : |  0                                  |  3 vv v |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x0, x8                                             // |  3 ^       v                       : |  0                                  |  0      |
    ldp x29, x30, [sp], #16                                // |  3                              ^^ v |  0                                  |  0      |
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
