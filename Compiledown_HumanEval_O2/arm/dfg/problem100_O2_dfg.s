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
    bl  _atof                                              // |  2                               ^ : |  0                                  |  0      |
    fmov    d1, #-0.50000000                               // |  1                                 : |  1  ^                               |  0      |
    fadd    d1, d0, d1                                     // |  1                                 : |  2 v^                               |  0      |
    frintp  d1, d1                                         // |  1                                 : |  1  ^                               |  0      |
    fmov    d2, #0.50000000                                // |  1                                 : |  2  :^                              |  0      |
    fadd    d2, d0, d2                                     // |  1                                 : |  3 v:^                              |  0      |
    frintm  d2, d2                                         // |  1                                 : |  2  :^                              |  0      |
    fcmp    d0, #0.0                                       // |  1                                 : |  3 ^::                              |  0      |
    fcsel   d0, d1, d2, mi                                 // |  1                                 : |  3 ^vv                              |  0      |
    fcvtzs  w0, d0                                         // |  2 ^                               : |  1 v                                |  4 ^^^^ |
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
