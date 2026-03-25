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
    cbz w1, LBB0_3                                         // |  1  ^                                |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    mov x8, x1                                             // |  2  v      ^                         |  0                                  |  0      |
    sdiv    w9, w0, w1                                     // |  4 vv      :^                        |  0                                  |  0      |
    msub    w1, w9, w1, w0                                 // |  4 v^      :v                        |  0                                  |  0      |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
    cbnz    w1, LBB0_1                                     // |  2  ^      :                         |  0                                  |  0      |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
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
