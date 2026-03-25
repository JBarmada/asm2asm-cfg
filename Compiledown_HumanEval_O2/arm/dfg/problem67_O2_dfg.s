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
    ldrb    w9, [x0]                                       // |  2 v        ^                        |  0                                  |  0      |
    cbz w9, LBB0_4                                         // |  1          ^                        |  0                                  |  0      |
    mov x8, x0                                             // |  3 v       ^:                        |  0                                  |  0      |
    mov w0, #0                                             // |  2 ^        :                        |  0                                  |  0      |
    add x8, x8, #1                                         // |  2         ^:                        |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    sub w10, w9, #65                                       // |  3         :v^                       |  0                                  |  0      |
    and w10, w10, #0xff                                    // |  2         : ^                       |  0                                  |  0      |
    cmp w10, #26                                           // |  2         : ^                       |  0                                  |  4 ^^^^ |
    csel    w9, w9, wzr, lo                                // |  3         :^                     v  |  0                                  |  1   v  |
    add w0, w0, w9, sxtb                                   // |  3 ^       :v                        |  0                                  |  0      |
    ldrb    w9, [x8], #1                                   // |  2         v^                        |  0                                  |  0      |
    cbnz    w9, LBB0_2                                     // |  1          ^                        |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
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
