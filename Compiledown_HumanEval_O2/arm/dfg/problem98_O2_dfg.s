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
    cmp w0, #0                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    cneg    w8, w0, mi                                     // |  2 v       ^                         |  0                                  |  0      |
    mov w9, #52429                                         // |  2         :^                        |  0                                  |  0      |
    movk    w9, #52428, lsl #16                            // |  2         :^                        |  0                                  |  0      |
    umull   x10, w8, w9                                    // |  3         vv^                       |  0                                  |  0      |
    lsr x10, x10, #35                                      // |  1           ^                       |  0                                  |  0      |
    mov w11, #10                                           // |  2           :^                      |  0                                  |  0      |
    msub    w8, w10, w11, w8                               // |  3         ^ vv                      |  0                                  |  0      |
    cmp w1, #0                                             // |  3  ^      :  :                      |  0                                  |  4 ^^^^ |
    cneg    w10, w1, mi                                    // |  4  v      : ^:                      |  0                                  |  0      |
    umull   x9, w10, w9                                    // |  4         :^v:                      |  0                                  |  0      |
    lsr x9, x9, #35                                        // |  4         :^::                      |  0                                  |  0      |
    msub    w9, w9, w11, w10                               // |  4         :^vv                      |  0                                  |  0      |
    mul w0, w9, w8                                         // |  3 ^       vv                        |  0                                  |  0      |
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
