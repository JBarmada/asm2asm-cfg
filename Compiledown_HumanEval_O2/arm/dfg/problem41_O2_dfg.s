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
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_9                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x11, #0                                            // |  2  :         ^                      |  0                                  |  0      |
    add x8, x0, #8                                         // |  4 v:      ^  :                      |  0                                  |  0      |
    mov w9, #1                                             // |  4  :      :^ :                      |  0                                  |  0      |
    mov w10, #2                                            // |  5  :      ::^:                      |  0                                  |  0      |
    mov w13, #1                                            // |  6  :      :::: ^                    |  0                                  |  0      |
    mov w12, w1                                            // |  6  v      ::::^                     |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x14, x11, #1                                       // |  7  :      :::v: ^                   |  0                                  |  0      |
    mov x16, x10                                           // |  6  :      ::v :   ^                 |  0                                  |  0      |
    mov x17, x8                                            // |  5  :      v:  :    ^                |  0                                  |  0      |
    mov x3, x9                                             // |  4  : ^     v  :                     |  0                                  |  0      |
    cmp x14, x12                                           // |  3  :          v ^                   |  0                                  |  4 ^^^^ |
    cset    w15, lo                                        // |  4  :          : :^                  |  0                                  |  1   v  |
    b.lo    LBB0_5                                         // |  4  :          : ::                  |  0                                  |  1   v  |
LBB0_3:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  5  :       ^  : ::                  |  0                                  |  0      |
    add x8, x8, #4                                         // |  5  :      ^   : ::                  |  0                                  |  0      |
    add w10, w10, #1                                       // |  5  :        ^ : ::                  |  0                                  |  0      |
    mov x11, x14                                           // |  5  :         ^: v:                  |  0                                  |  0      |
    mov x13, x15                                           // |  5  :         ::^ v                  |  0                                  |  0      |
    cmp x14, x12                                           // |  4  :         :v ^                   |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3  :         ::                     |  0                                  |  1  v   |
    b   LBB0_9                                             // |  3  :         ::                     |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    add x17, x17, #4                                       // |  4  :         ::    ^                |  0                                  |  0      |
    add w16, w16, #1                                       // |  5  :         ::   ^:                |  0                                  |  0      |
    mov x3, x2                                             // |  7  :v^       ::   ::                |  0                                  |  0      |
    cmp x2, x12                                            // |  7  :^:       :v   ::                |  0                                  |  4 ^^^^ |
    b.eq    LBB0_3                                         // |  5  : :       :    ::                |  0                                  |  1  v   |
LBB0_5:                                                    // |                                      |                                     |         |
    add x2, x3, #1                                         // |  6  :^v       :    ::                |  0                                  |  0      |
    cmp w2, w1                                             // |  6  v^:       :    ::                |  0                                  |  4 ^^^^ |
    b.ge    LBB0_4                                         // |  5  : :       :    ::                |  0                                  |  2 v  v |
    ldr w4, [x0, x11, lsl #2]                              // |  7 v: :^      v    ::                |  0                                  |  0      |
    ldr w3, [x0, x3, lsl #2]                               // |  6 v: v:           ::                |  0                                  |  0      |
    add w3, w3, w4                                         // |  5  : ^v           ::                |  0                                  |  0      |
    mov x4, x16                                            // |  4  :  ^           v:                |  0                                  |  0      |
    mov x5, x17                                            // |  3  :   ^           v                |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    ldr w6, [x5], #4                                       // |  3  :   v^                           |  0                                  |  0      |
    cmn w3, w6                                             // |  3  : ^  v                           |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  1  :                                |  0                                  |  1  v   |
    add w4, w4, #1                                         // |  2  :  ^                             |  0                                  |  0      |
    cmp w4, w1                                             // |  2  v  ^                             |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                         // |  0                                   |  0                                  |  2 v  v |
    b   LBB0_4                                             // |  0                                   |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov w13, #0                                            // |  1              ^                    |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    and w0, w13, #0x1                                      // |  2 ^            v                    |  0                                  |  0      |
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
