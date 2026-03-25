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
    stp x20, x19, [sp, #-32]!                              // |  3                    vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    bl  _strlen                                            // |  2                               ^ : |  0                                  |  0      |
    cmp x0, #3                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    b.hs    LBB0_3                                         // |  1                                 : |  0                                  |  4 ^^v^ |
LBB0_1:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  2 ^                               : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #16]                                // |  4 :                            ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  5 :                  ^^         : v |  0                                  |  0      |
    ret                                                    // |  3 :                  :          v   |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x8, x19, #2                                        // |  3 :       ^          v              |  0                                  |  0      |
    sub x9, x0, #2                                         // |  3 v       :^                        |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    ldrb    w10, [x8]                                      // |  2         v ^                       |  0                                  |  0      |
    ldurb   w11, [x8, #-1]                                 // |  2         v  ^                      |  0                                  |  0      |
    cmp w10, w11                                           // |  3         : ^v                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  1         :                         |  0                                  |  1  v   |
    ldurb   w11, [x8, #-2]                                 // |  2         v  ^                      |  0                                  |  0      |
    cmp w10, w11                                           // |  2           ^v                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  0                                   |  0                                  |  1  v   |
    add x8, x8, #1                                         // |  1         ^                         |  0                                  |  0      |
    subs    x9, x9, #1                                     // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  0                                   |  0                                  |  1  v   |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
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
