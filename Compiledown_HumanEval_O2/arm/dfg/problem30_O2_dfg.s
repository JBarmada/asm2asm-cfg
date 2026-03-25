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
    stp x26, x25, [sp, #-80]!                              // |  3                          vv     x |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    .cfi_offset w25, -72                                   // |                                      |                                     |         |
    .cfi_offset w26, -80                                   // |                                      |                                     |         |
    mov x19, x3                                            // |  3    v               ^            : |  0                                  |  0      |
    mov x20, x2                                            // |  4   v                :^           : |  0                                  |  0      |
    mov x24, x1                                            // |  5  v                 ::   ^       : |  0                                  |  0      |
    mov x21, x0                                            // |  6 v                  ::^  :       : |  0                                  |  0      |
    mov x0, x2                                             // |  6 ^ v                ::   :       : |  0                                  |  0      |
    bl  _strlen                                            // |  6 :                  ::   :     ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  6 v                  ::  ^:       : |  0                                  |  0      |
    sbfiz   x0, x24, #3, #32                               // |  5 ^                  ::   v       : |  0                                  |  0      |
    bl  _malloc                                            // |  5 :                  ::         ^ : |  0                                  |  0      |
    str x0, [x19]                                          // |  4 v                  v:           : |  0                                  |  0      |
    cmp w24, #1                                            // |  4                    ::   ^       : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  4                    ::   :       : |  0                                  |  2 v  v |
    mov w22, #0                                            // |  5                    :: ^ :       : |  0                                  |  0      |
    sxtw    x23, w23                                       // |  6                    :: :^:       : |  0                                  |  0      |
    mov w25, w24                                           // |  7                    :: ::v^      : |  0                                  |  0      |
    b   LBB0_3                                             // |  5                    :: ::        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x21, x21, #8                                       // |  6                    ::^::        : |  0                                  |  0      |
    subs    x25, x25, #1                                   // |  7                    ::::: ^      : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  6                    :::::        : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr x24, [x21]                                         // |  7                    ::v::^       : |  0                                  |  0      |
    mov x0, x24                                            // |  7 ^                  :: ::v       : |  0                                  |  0      |
    mov x1, x20                                            // |  7  ^                 :v :::       : |  0                                  |  0      |
    mov x2, x23                                            // |  6   ^                :  :v:       : |  0                                  |  0      |
    bl  _strncmp                                           // |  5                    :  : :     ^ : |  0                                  |  0      |
    cbnz    w0, LBB0_2                                     // |  5 ^                  :  : :       : |  0                                  |  0      |
    ldr x8, [x19]                                          // |  5         ^          v  : :       : |  0                                  |  0      |
    str x24, [x8, w22, sxtw #3]                            // |  4         v             v v       : |  0                                  |  0      |
    add w22, w22, #1                                       // |  2                       ^         : |  0                                  |  0      |
    b   LBB0_2                                             // |  1                                 : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov w22, #0                                            // |  2                       ^         : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x0, x22                                            // |  3 ^                     v         : |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  4                          ^^   : v |  0                                  |  0      |
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
