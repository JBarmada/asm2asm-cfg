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
    b.lt    LBB0_10                                        // |  1  :                                |  0                                  |  2 v  v |
    mov x9, #0                                             // |  2  :       ^                        |  0                                  |  0      |
    mov w8, #0                                             // |  2  :      ^                         |  0                                  |  0      |
    mov w10, #52429                                        // |  2  :        ^                       |  0                                  |  0      |
    movk    w10, #52428, lsl #16                           // |  2  :        ^                       |  0                                  |  0      |
    mov w11, #10                                           // |  3  :        :^                      |  0                                  |  0      |
    mov w12, w1                                            // |  4  v        ::^                     |  0                                  |  0      |
    b   LBB0_4                                             // |  3           :::                     |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w13, #1                                            // |  4           :::^                    |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add w8, w8, w13                                        // |  5         ^ :::v                    |  0                                  |  0      |
    add x9, x9, #1                                         // |  4          ^:::                     |  0                                  |  0      |
    cmp x9, x12                                            // |  4          ^::v                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_11                                        // |  3          :::                      |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldr w14, [x0, x9, lsl #2]                              // |  5 v        v::  ^                   |  0                                  |  0      |
    cmp w14, #0                                            // |  3           ::  ^                   |  0                                  |  4 ^^^^ |
    b.gt    LBB0_2                                         // |  2           ::                      |  0                                  |  3 vv v |
    neg w14, w14                                           // |  3           ::  ^                   |  0                                  |  0      |
    cmp w14, #10                                           // |  3           ::  ^                   |  0                                  |  4 ^^^^ |
    b.lo    LBB0_8                                         // |  3           ::  :                   |  0                                  |  1   v  |
    mov w13, #0                                            // |  4           :: ^:                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    umull   x15, w14, w10                                  // |  4           v:  v^                  |  0                                  |  0      |
    lsr x15, x15, #35                                      // |  3            :  :^                  |  0                                  |  0      |
    msub    w16, w15, w11, w14                             // |  4            v  vv^                 |  0                                  |  0      |
    add w13, w16, w13                                      // |  3              ^ :v                 |  0                                  |  0      |
    cmp w14, #99                                           // |  2               ^:                  |  0                                  |  4 ^^^^ |
    mov x14, x15                                           // |  2               ^v                  |  0                                  |  2  ::  |
    b.hi    LBB0_7                                         // |  1               :                   |  0                                  |  2  vv  |
    b   LBB0_9                                             // |  1               :                   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w13, #0                                            // |  2              ^:                   |  0                                  |  0      |
    mov x15, x14                                           // |  2               v^                  |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    cmp w13, w15                                           // |  2              ^ v                  |  0                                  |  4 ^^^^ |
    cset    w13, hi                                        // |  1              ^                    |  0                                  |  2  vv  |
    b   LBB0_3                                             // |  0                                   |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
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
