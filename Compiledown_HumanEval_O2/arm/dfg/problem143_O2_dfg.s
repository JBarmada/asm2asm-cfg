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
    b.lt    LBB0_7                                         // |  1  :                                |  0                                  |  2 v  v |
    mov x9, #0                                             // |  2  :       ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  3  :      ^:                        |  0                                  |  0      |
    mov x10, #-6148914691236517206                         // |  3  :       :^                       |  0                                  |  0      |
    movk    x10, #43691                                    // |  3  :       :^                       |  0                                  |  0      |
    mov w11, w1                                            // |  4  v       ::^                      |  0                                  |  0      |
    b   LBB0_4                                             // |  2          ::                       |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr w12, [x0, x9, lsl #2]                              // |  4 v        v: ^                     |  0                                  |  0      |
    mul w12, w12, w12                                      // |  2           : ^                     |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add w8, w12, w8                                        // |  3         ^ : v                     |  0                                  |  0      |
    add x9, x9, #1                                         // |  2          ^:                       |  0                                  |  0      |
    cmp x11, x9                                            // |  3          v:^                      |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  2          ::                       |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    umulh   x12, x9, x10                                   // |  3          vv ^                     |  0                                  |  0      |
    lsr x12, x12, #1                                       // |  2          :  ^                     |  0                                  |  0      |
    add w12, w12, w12, lsl #1                              // |  2          :  ^                     |  0                                  |  0      |
    cmp w12, w9                                            // |  2          v  ^                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  1          :                        |  0                                  |  1  v   |
    ldr w12, [x0, x9, lsl #2]                              // |  3 v        v  ^                     |  0                                  |  0      |
    tst w9, #0x3                                           // |  2          ^  :                     |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  1             :                     |  0                                  |  1  v   |
    mul w13, w12, w12                                      // |  2             v^                    |  0                                  |  0      |
    mul w12, w13, w12                                      // |  2             ^v                    |  0                                  |  0      |
    b   LBB0_3                                             // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
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
