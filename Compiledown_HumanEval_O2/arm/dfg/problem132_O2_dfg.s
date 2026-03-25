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
    b.lt    LBB0_4                                         // |  1 :                                 |  0                                  |  2 v  v |
    mov w9, #0                                             // |  2 :        ^                        |  0                                  |  0      |
    mov w8, #1                                             // |  2 :       ^                         |  0                                  |  0      |
    mov w10, #52429                                        // |  2 :         ^                       |  0                                  |  0      |
    movk    w10, #52428, lsl #16                           // |  2 :         ^                       |  0                                  |  0      |
    mov w11, #10                                           // |  3 :         :^                      |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    umull   x12, w0, w10                                   // |  4 v         v:^                     |  0                                  |  0      |
    lsr x12, x12, #35                                      // |  3 :          :^                     |  0                                  |  0      |
    msub    w13, w12, w11, w0                              // |  4 v          vv^                    |  0                                  |  0      |
    tst w13, #0x1                                          // |  2             :^                    |  0                                  |  4 ^^^^ |
    csinc   w13, w13, wzr, ne                              // |  3             :^                 v  |  0                                  |  1  v   |
    mul w8, w13, w8                                        // |  3         ^   :v                    |  0                                  |  1  :   |
    csinc   w9, w9, wzr, eq                                // |  4         :^  :                  v  |  0                                  |  1  v   |
    cmp w0, #9                                             // |  3 ^       :   :                     |  0                                  |  4 ^^^^ |
    mov x0, x12                                            // |  3 ^       :   v                     |  0                                  |  2  ::  |
    b.hi    LBB0_2                                         // |  1         :                         |  0                                  |  2  vv  |
    cmp w9, #0                                             // |  2         :^                        |  0                                  |  4 ^^^^ |
    csel    w0, wzr, w8, eq                                // |  3 ^       v                      v  |  0                                  |  1  v   |
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
