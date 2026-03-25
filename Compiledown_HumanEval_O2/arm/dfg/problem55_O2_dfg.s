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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    ::         ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  5 v                  ::^          : |  0                                  |  0      |
    mov x0, x19                                            // |  4 ^                  v:           : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    ::         ^ : |  0                                  |  0      |
    cmp w21, #1                                            // |  4                    ::^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_13                                        // |  4                    :::          : |  0                                  |  2 v  v |
    cmp w0, #1                                             // |  5 ^                  :::          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_12                                        // |  5 :                  :::          : |  0                                  |  2 v  v |
    mov x10, #0                                            // |  6 :         ^        :::          : |  0                                  |  0      |
    and x8, x21, #0x7fffffff                               // |  7 :       ^ :        ::v          : |  0                                  |  0      |
    and x9, x0, #0x7fffffff                                // |  7 v       :^:        ::           : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrb    w11, [x20, x10]                                // |  7         ::v^       :v           : |  0                                  |  0      |
    mov x12, x9                                            // |  6         :v  ^      ::           : |  0                                  |  0      |
    mov x13, x19                                           // |  6         ::   ^     v:           : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    ldrb    w14, [x13], #1                                 // |  7         ::   v^    ::           : |  0                                  |  0      |
    cmp w11, w14                                           // |  7         :: ^  v    ::           : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  5         ::         ::           : |  0                                  |  1  v   |
    subs    x12, x12, #1                                   // |  6         ::  ^      ::           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  5         ::         ::           : |  0                                  |  1  v   |
    b   LBB0_12                                            // |  5         ::         ::           : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x10, x10, #1                                       // |  6         ::^        ::           : |  0                                  |  0      |
    cmp x10, x8                                            // |  6         v:^        ::           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  5         ::         ::           : |  0                                  |  1  v   |
    mov x10, #0                                            // |  6         ::^        ::           : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    ldrb    w11, [x19, x10]                                // |  7         ::v^       v:           : |  0                                  |  0      |
    mov x12, x8                                            // |  5         v:  ^       :           : |  0                                  |  0      |
    mov x13, x20                                           // |  4          :   ^      v           : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    ldrb    w14, [x13], #1                                 // |  4          :   v^                 : |  0                                  |  0      |
    cmp w11, w14                                           // |  4          : ^  v                 : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_11                                        // |  2          :                      : |  0                                  |  1  v   |
    mov w0, #0                                             // |  3 ^        :                      : |  0                                  |  0      |
    subs    x12, x12, #1                                   // |  3          :  ^                   : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_9                                         // |  2          :                      : |  0                                  |  1  v   |
    b   LBB0_14                                            // |  2          :                      : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    add x10, x10, #1                                       // |  3          :^                     : |  0                                  |  0      |
    mov w0, #1                                             // |  3 ^        :                      : |  0                                  |  0      |
    cmp x10, x9                                            // |  3          v^                     : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_8                                         // |  1                                 : |  0                                  |  1  v   |
    b   LBB0_14                                            // |  1                                 : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    mov w0, #0                                             // |  2 ^                               : |  0                                  |  0      |
    b   LBB0_14                                            // |  1                                 : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    cmp w0, #1                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    cset    w0, lt                                         // |  2 ^                               : |  0                                  |  2 v  v |
LBB0_14:                                                   // |                                      |                                     |         |
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
