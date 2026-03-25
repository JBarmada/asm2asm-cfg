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
    ldrb    w12, [x0]                                      // |  2 v           ^                     |  0                                  |  0      |
    cbz w12, LBB0_4                                        // |  1             ^                     |  0                                  |  0      |
    mov x9, #0                                             // |  1          ^                        |  0                                  |  0      |
    add x8, x0, #1                                         // |  3 v       ^:                        |  0                                  |  0      |
    mov w10, #20165                                        // |  3         ::^                       |  0                                  |  0      |
    mov w11, #26                                           // |  4         :::^                      |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    sxtb    w12, w12                                       // |  5         ::::^                     |  0                                  |  0      |
    sub w12, w12, #93                                      // |  5         ::::^                     |  0                                  |  0      |
    mul w13, w12, w10                                      // |  6         ::v:v^                    |  0                                  |  0      |
    lsr w14, w13, #19                                      // |  5         :: : v^                   |  0                                  |  0      |
    add w13, w14, w13, lsr #31                             // |  5         :: : ^v                   |  0                                  |  0      |
    msub    w12, w13, w11, w12                             // |  5         :: v^v                    |  0                                  |  0      |
    add w12, w12, #97                                      // |  3         ::  ^                     |  0                                  |  0      |
    strb    w12, [x1, x9]                                  // |  4  v      :v  v                     |  0                                  |  0      |
    add x13, x9, #1                                        // |  3         :v   ^                    |  0                                  |  0      |
    ldrb    w12, [x8, x9]                                  // |  4         vv  ^:                    |  0                                  |  0      |
    mov x9, x13                                            // |  2          ^   v                    |  0                                  |  0      |
    cbnz    w12, LBB0_2                                    // |  2             ^:                    |  0                                  |  0      |
    strb    wzr, [x1, x13]                                 // |  3  v           v                 v  |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    strb    wzr, [x1, xzr]                                 // |  2  v                             v  |  0                                  |  0      |
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
