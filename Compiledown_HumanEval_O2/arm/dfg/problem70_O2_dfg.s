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
    stp x20, x19, [sp, #-32]!                              // |  3                    vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x20, x1                                            // |  3  v                  ^           : |  0                                  |  0      |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    add w8, w1, #1                                         // |  4  v      ^          :            : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  4 ^       v          :            : |  0                                  |  0      |
    mov w1, #4                                             // |  4 :^                 :            : |  0                                  |  0      |
    bl  _calloc                                            // |  4 :                  :          ^ : |  0                                  |  0      |
    cmp w20, #1                                            // |  4 :                  :^           : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  4 :                  ::           : |  0                                  |  2 v  v |
    mov w8, w20                                            // |  5 :       ^          :v           : |  0                                  |  0      |
    mov w20, #-1                                           // |  4 :                  :^           : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrsw   x9, [x19], #4                                  // |  5 :        ^         v:           : |  0                                  |  0      |
    ldr w10, [x0, x9, lsl #2]                              // |  5 v        v^         :           : |  0                                  |  0      |
    add w10, w10, #1                                       // |  5 :        :^         :           : |  0                                  |  0      |
    str w10, [x0, x9, lsl #2]                              // |  5 v        vv         :           : |  0                                  |  0      |
    cmp w9, w20                                            // |  3          ^          v           : |  0                                  |  4 ^^^^ |
    csel    w11, w9, w20, gt                               // |  4          v ^        v           : |  0                                  |  3 vv v |
    cmp w10, w9                                            // |  4          v^:                    : |  0                                  |  4 ^^^^ |
    csel    w20, w20, w11, lt                              // |  3            v        ^           : |  0                                  |  2 v  v |
    subs    x8, x8, #1                                     // |  2         ^                       : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  1                                 : |  0                                  |  1  v   |
    b   LBB0_4                                             // |  1                                 : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w20, #-1                                           // |  2                     ^           : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    bl  _free                                              // |  3                     :         ^ : |  0                                  |  0      |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  4                    ^^         : v |  0                                  |  0      |
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
