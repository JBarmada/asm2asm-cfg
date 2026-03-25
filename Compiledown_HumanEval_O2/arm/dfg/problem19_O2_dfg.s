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
    stp x24, x23, [sp, #-64]!                              // |  3                        vv       x |  0                                  |  0      |
    stp x22, x21, [sp, #16]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #32]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #48]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #48                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    ::         ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  5 v                  ::  ^        : |  0                                  |  0      |
    mov x0, x19                                            // |  4 ^                  v:           : |  0                                  |  0      |
    bl  _strlen                                            // |  5 :                  ::         ^ : |  0                                  |  0      |
    mov w21, #0                                            // |  5 :                  ::^          : |  0                                  |  0      |
    cbz w23, LBB0_4                                        // |  5 :                  ::  ^        : |  0                                  |  0      |
    cmp w23, w0                                            // |  5 v                  ::  ^        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  5 :                  ::  :        : |  0                                  |  2 v  v |
    mov w21, #0                                            // |  6 :                  ::^ :        : |  0                                  |  0      |
    sxtw    x22, w0                                        // |  6 v                  :: ^:        : |  0                                  |  0      |
    sub w8, w23, w0                                        // |  7 v       ^          :: :v        : |  0                                  |  0      |
    add w23, w8, #1                                        // |  6         v          :: :^        : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x0, x20                                            // |  5 ^                  :v :         : |  0                                  |  0      |
    mov x1, x19                                            // |  4  ^                 v  :         : |  0                                  |  0      |
    mov x2, x22                                            // |  3   ^                   v         : |  0                                  |  0      |
    bl  _strncmp                                           // |  2                               ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    cinc    w21, w21, eq                                   // |  2                      ^          : |  0                                  |  0      |
    add x20, x20, #1                                       // |  3                     ^:          : |  0                                  |  0      |
    subs    x23, x23, #1                                   // |  3                      : ^        : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  2                      :          : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x0, x21                                            // |  3 ^                    v          : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  4                        ^^     : v |  0                                  |  0      |
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
