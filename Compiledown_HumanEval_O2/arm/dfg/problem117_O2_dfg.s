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
    b.lt    LBB0_18                                        // |  1  :                                |  0                                  |  2 v  v |
    mov x10, #0                                            // |  2  :        ^                       |  0                                  |  0      |
    mov w8, w1                                             // |  2  v      ^                         |  0                                  |  0      |
    mov w9, #1                                             // |  2         :^                        |  0                                  |  0      |
    b   LBB0_3                                             // |  1         :                         |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  2         :^                        |  0                                  |  0      |
    mov x10, x11                                           // |  4         ::^v                      |  0                                  |  0      |
    cmp x11, x8                                            // |  4         v::^                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_18                                        // |  3         :::                       |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    add x11, x10, #1                                       // |  4         ::v^                      |  0                                  |  0      |
    cmp x11, x8                                            // |  4         v::^                      |  0                                  |  4 ^^^^ |
    b.hs    LBB0_2                                         // |  3         :::                       |  0                                  |  4 ^^v^ |
    mov x12, x9                                            // |  4         :v: ^                     |  0                                  |  0      |
    b   LBB0_7                                             // |  3         : : :                     |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    str w15, [x0, x10, lsl #2]                             // |  5 v       : v :  v                  |  0                                  |  0      |
    str w13, [x0, x12, lsl #2]                             // |  5 v       : : vv                    |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x12, x12, #1                                       // |  3         : : ^                     |  0                                  |  0      |
    cmp x12, x8                                            // |  3         v : ^                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  2           : :                     |  0                                  |  1  v   |
LBB0_7:                                                    // |                                      |                                     |         |
    ldr w13, [x0, x10, lsl #2]                             // |  4 v         v :^                    |  0                                  |  0      |
    cmp w13, #1                                            // |  2             :^                    |  0                                  |  4 ^^^^ |
    b.lt    LBB0_10                                        // |  2             ::                    |  0                                  |  2 v  v |
    mov w14, #0                                            // |  3             ::^                   |  0                                  |  0      |
    mov x15, x13                                           // |  3             :v ^                  |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    and w16, w15, #0x1                                     // |  4             :: v^                 |  0                                  |  0      |
    add w14, w14, w16                                      // |  5             ::^:v                 |  0                                  |  0      |
    lsr w16, w15, #1                                       // |  4             :: v^                 |  0                                  |  0      |
    cmp w15, #2                                            // |  4             :: ^:                 |  0                                  |  4 ^^^^ |
    mov x15, x16                                           // |  4             :: ^v                 |  0                                  |  1   :  |
    b.hs    LBB0_9                                         // |  2             ::                    |  0                                  |  4 ^^v^ |
    b   LBB0_11                                            // |  2             ::                    |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    mov w14, #0                                            // |  3             ::^                   |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    ldr w15, [x0, x12, lsl #2]                             // |  5 v           v::^                  |  0                                  |  0      |
    cmp w15, #1                                            // |  3              ::^                  |  0                                  |  4 ^^^^ |
    b.lt    LBB0_15                                        // |  3              :::                  |  0                                  |  2 v  v |
    mov w16, #0                                            // |  4              :::^                 |  0                                  |  0      |
    mov x17, x15                                           // |  4              ::v ^                |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    and w1, w17, #0x1                                      // |  4  ^           ::  v                |  0                                  |  0      |
    add w16, w16, w1                                       // |  5  v           :: ^:                |  0                                  |  0      |
    lsr w1, w17, #1                                        // |  4  ^           ::  v                |  0                                  |  0      |
    cmp w17, #1                                            // |  4  :           ::  ^                |  0                                  |  4 ^^^^ |
    mov x17, x1                                            // |  4  v           ::  ^                |  0                                  |  2  ::  |
    b.hi    LBB0_13                                        // |  2              ::                   |  0                                  |  2  vv  |
    cmp w16, w14                                           // |  3              :v ^                 |  0                                  |  4 ^^^^ |
    b.lo    LBB0_5                                         // |  2              ::                   |  0                                  |  1   v  |
    b   LBB0_16                                            // |  2              ::                   |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov w16, #0                                            // |  3              :: ^                 |  0                                  |  0      |
    cmp w16, w14                                           // |  3              :v ^                 |  0                                  |  4 ^^^^ |
    b.lo    LBB0_5                                         // |  1              :                    |  0                                  |  2  :v  |
LBB0_16:                                                   // |                                      |                                     |         |
    b.ne    LBB0_6                                         // |  1              :                    |  0                                  |  1  v   |
    cmp w15, w13                                           // |  2              v ^                  |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  0                                   |  0                                  |  2 v  v |
    b   LBB0_6                                             // |  0                                   |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
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
