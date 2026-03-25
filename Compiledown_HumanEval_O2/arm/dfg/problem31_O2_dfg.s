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
    stp x22, x21, [sp, #-48]!                              // |  3                      vv         x |  0                                  |  0      |
    stp x20, x19, [sp, #16]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #32]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #32                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    mov x19, x2                                            // |  3   v                ^            : |  0                                  |  0      |
    mov x21, x1                                            // |  4  v                 : ^          : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^:          : |  0                                  |  0      |
    sbfiz   x0, x21, #2, #32                               // |  4 ^                  : v          : |  0                                  |  0      |
    bl  _malloc                                            // |  4 :                  :          ^ : |  0                                  |  0      |
    str wzr, [x19]                                         // |  4 :                  v           v: |  0                                  |  0      |
    cmp w21, #1                                            // |  4 :                  : ^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  4 :                  : :          : |  0                                  |  2 v  v |
    mov w9, #0                                             // |  5 :        ^         : :          : |  0                                  |  0      |
    mov w8, w21                                            // |  6 :       ^:         : v          : |  0                                  |  0      |
    b   LBB0_3                                             // |  4 :        :         :            : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x20, x20, #4                                       // |  5 :        :         :^           : |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  6 :       ^:         ::           : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_5                                         // |  5 :        :         ::           : |  0                                  |  3 :v : |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr s0, [x20]                                          // |  5 :        :         :v           : |  1 ^                                |  3 :: : |
    fcmp    s0, #0.0                                       // |  4 :        :         :            : |  1 ^                                |  3 :: : |
    b.le    LBB0_2                                         // |  4 :        :         :            : |  1 :                                |  3 vv v |
    str s0, [x0, w9, sxtw #2]                              // |  4 v        v         :            : |  1 v                                |  0      |
    add w9, w9, #1                                         // |  3          ^         :            : |  0                                  |  0      |
    str w9, [x19]                                          // |  3          v         v            : |  0                                  |  0      |
    b   LBB0_2                                             // |  1                                 : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
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
