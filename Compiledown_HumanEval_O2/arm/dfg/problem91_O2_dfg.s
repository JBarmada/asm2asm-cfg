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
    cmp w1, #2                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  1  :                                |  0                                  |  2 v  v |
    mov w0, #-1                                            // |  2 ^:                                |  0                                  |  0      |
    ret                                                    // |  3 ::                            v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w8, w1                                             // |  3 :v      ^                         |  0                                  |  0      |
    mov w9, #2147483647                                    // |  2 :        ^                        |  0                                  |  0      |
    mov w10, #2147483647                                   // |  3 :        :^                       |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr w11, [x0], #4                                      // |  4 v        ::^                      |  0                                  |  0      |
    cmp w11, w10                                           // |  3          :v^                      |  0                                  |  4 ^^^^ |
    ccmp    w11, w9, #0, ne                                // |  3          v:^                      |  0                                  |  4 ^v^^ |
    csel    w9, w9, w11, ge                                // |  3          ^:v                      |  0                                  |  2 v  v |
    cmp w11, w10                                           // |  2           v^                      |  0                                  |  4 ^^^^ |
    csel    w11, w11, w10, lt                              // |  2           v^                      |  0                                  |  2 v  v |
    csel    w9, w10, w9, lt                                // |  3          ^v:                      |  0                                  |  2 v  v |
    mov x10, x11                                           // |  2           ^v                      |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  0                                   |  0                                  |  1  v   |
    mov w8, #2147483647                                    // |  1         ^                         |  0                                  |  0      |
    cmp w9, w8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    csinv   w0, w9, wzr, ne                                // |  3 ^        v                     v  |  0                                  |  1  v   |
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
