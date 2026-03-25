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
    b.lt    LBB0_8                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x12, #0                                            // |  2  :          ^                     |  0                                  |  0      |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    add x9, x0, #4                                         // |  3 v       :^                        |  0                                  |  0      |
    sub x10, x8, #1                                        // |  2         v ^                       |  0                                  |  0      |
    b   LBB0_3                                             // |  1         :                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #4                                         // |  2         :^                        |  0                                  |  0      |
    sub x10, x10, #1                                       // |  3         ::^                       |  0                                  |  0      |
    mov x12, x11                                           // |  5         :::v^                     |  0                                  |  0      |
    cmp x11, x8                                            // |  5         v::^:                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  4         ::: :                     |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    add x11, x12, #1                                       // |  5         :::^v                     |  0                                  |  0      |
    cmp x11, x8                                            // |  5         v::^:                     |  0                                  |  4 ^^^^ |
    b.hs    LBB0_2                                         // |  3          :: :                     |  0                                  |  4 ^^v^ |
    ldr s1, [x0, x12, lsl #2]                              // |  4 v        :: v                     |  1  ^                               |  1 :    |
    mov x12, x10                                           // |  3          :v ^                     |  1  :                               |  1 :    |
    mov x13, x9                                            // |  2          v   ^                    |  1  :                               |  1 :    |
LBB0_5:                                                    // |                                      |                                     |         |
    ldr s2, [x13]                                          // |  1              v                    |  2  :^                              |  1 :    |
    fabd    s2, s1, s2                                     // |  0                                   |  2  v^                              |  1 :    |
    fcmp    s2, s0                                         // |  0                                   |  2 v ^                              |  1 :    |
    b.mi    LBB0_7                                         // |  0                                   |  0                                  |  1 v    |
    add x13, x13, #4                                       // |  1              ^                    |  0                                  |  0      |
    subs    x12, x12, #1                                   // |  1             ^                     |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  0                                   |  0                                  |  1  v   |
    b   LBB0_2                                             // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w0, #10                                            // |  1 ^                                 |  0                                  |  0      |
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
