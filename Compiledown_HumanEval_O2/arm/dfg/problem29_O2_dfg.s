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
    cmp w1, #1                                             // |  2  ^                              : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_6                                         // |  2  :                              : |  0                                  |  2 v  v |
    mov x19, x0                                            // |  4 v:                 ^            : |  0                                  |  0      |
    mov w21, #0                                            // |  4  :                 : ^          : |  0                                  |  0      |
    mov w20, w1                                            // |  4  v                 :^           : |  0                                  |  0      |
    mov x22, x20                                           // |  4                    :v ^         : |  0                                  |  0      |
    mov x23, x0                                            // |  4 v                  :   ^        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr x0, [x23], #8                                      // |  4 ^                  :   v        : |  0                                  |  0      |
    bl  _strlen                                            // |  4 :                  :          ^ : |  0                                  |  0      |
    add w21, w21, w0                                       // |  4 v                  : ^          : |  0                                  |  0      |
    subs    x22, x22, #1                                   // |  4                    : :^         : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3                    : :          : |  0                                  |  1  v   |
    add w8, w21, #1                                        // |  4         ^          : v          : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  4 ^       v          :            : |  0                                  |  0      |
    bl  _malloc                                            // |  3                    :          ^ : |  0                                  |  0      |
    cbz x0, LBB0_8                                         // |  3 ^                  :            : |  0                                  |  0      |
    strb    wzr, [x0]                                      // |  4 v                  :           v: |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ldr x1, [x19], #8                                      // |  3  ^                 v            : |  0                                  |  0      |
    bl  _strcat                                            // |  2                               ^ : |  0                                  |  0      |
    subs    x20, x20, #1                                   // |  2                     ^           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1                                 : |  0                                  |  1  v   |
    b   LBB0_8                                             // |  1                                 : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w0, #1                                             // |  2 ^                               : |  0                                  |  0      |
    bl  _malloc                                            // |  2                               ^ : |  0                                  |  0      |
    cbz x0, LBB0_8                                         // |  2 ^                               : |  0                                  |  0      |
    strb    wzr, [x0]                                      // |  3 v                              v: |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
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
