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
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
    mov w9, #0                                             // |  1          ^                        |  0                                  |  0      |
    cmp w0, #0                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    cneg    w10, w0, mi                                    // |  2 v         ^                       |  0                                  |  0      |
    mov w11, #52429                                        // |  2           :^                      |  0                                  |  0      |
    movk    w11, #52428, lsl #16                           // |  2           :^                      |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    umull   x12, w10, w11                                  // |  3           vv^                     |  0                                  |  0      |
    and w13, w10, #0x1                                     // |  2           v  ^                    |  0                                  |  0      |
    lsr x12, x12, #35                                      // |  2             ^:                    |  0                                  |  0      |
    eor w14, w13, #0x1                                     // |  3             :v^                   |  0                                  |  0      |
    add w8, w14, w8                                        // |  4         ^   ::v                   |  0                                  |  0      |
    add w9, w13, w9                                        // |  4         :^  :v                    |  0                                  |  0      |
    cmp w10, #9                                            // |  4         ::^ :                     |  0                                  |  4 ^^^^ |
    mov x10, x12                                           // |  4         ::^ v                     |  0                                  |  2  ::  |
    b.hi    LBB0_1                                         // |  2         ::                        |  0                                  |  2  vv  |
    stp w8, w9, [x1]                                       // |  3  v      vv                        |  0                                  |  0      |
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
