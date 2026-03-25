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
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    add w20, w0, #1                                        // |  3 v                   ^           : |  0                                  |  0      |
    sbfiz   x0, x20, #2, #32                               // |  3 ^                   v           : |  0                                  |  0      |
    bl  _malloc                                            // |  4 :                   :         ^ : |  0                                  |  0      |
    mov w8, #1                                             // |  4 :       ^           :           : |  0                                  |  0      |
    str w8, [x0]                                           // |  4 v       v           :           : |  0                                  |  0      |
    cbz w19, LBB0_6                                        // |  4 :                  ^:           : |  0                                  |  0      |
    mov w8, #3                                             // |  4 :       ^           :           : |  0                                  |  0      |
    str w8, [x0, #4]                                       // |  4 v       v           :           : |  0                                  |  0      |
    cmp w19, #2                                            // |  4 :                  ^:           : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_6                                         // |  3 :                   :           : |  0                                  |  2 v  v |
    mov w8, #2                                             // |  4 :       ^           :           : |  0                                  |  0      |
    b   LBB0_4                                             // |  4 :       :           :           : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    lsr w9, w8, #1                                         // |  5 :       v^          :           : |  0                                  |  0      |
    add w9, w9, #1                                         // |  5 :       :^          :           : |  0                                  |  0      |
    str w9, [x0, x8, lsl #2]                               // |  5 v       vv          :           : |  0                                  |  0      |
    add x8, x8, #1                                         // |  4 :       ^           :           : |  0                                  |  0      |
    cmp x8, x20                                            // |  4 :       ^           v           : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  3 :                   :           : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    tbz w8, #0, LBB0_3                                     // |  4 :       ^           :           : |  0                                  |  0      |
    add x9, x0, x8, lsl #2                                 // |  5 v       v^          :           : |  0                                  |  0      |
    ldp w11, w10, [x9, #-8]                                // |  5          v^^        :           : |  0                                  |  0      |
    add x8, x8, #1                                         // |  5         ^: :        :           : |  0                                  |  0      |
    add w10, w10, w8, lsr #1                               // |  6         v:^:        :           : |  0                                  |  0      |
    add w10, w10, w11                                      // |  5          :^v        :           : |  0                                  |  0      |
    add w10, w10, #1                                       // |  4          :^         :           : |  0                                  |  0      |
    str w10, [x9]                                          // |  4          vv         :           : |  0                                  |  0      |
    cmp x8, x20                                            // |  3         ^           v           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  1                                 : |  0                                  |  1  v   |
LBB0_6:                                                    // |                                      |                                     |         |
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
