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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov x0, x1                                             // |  5 ^v                 ::           : |  0                                  |  0      |
    bl  _strlen                                            // |  5 :                  ::         ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  5 v                  ::  ^        : |  0                                  |  0      |
    mov w8, #1                                             // |  5         ^          ::  :        : |  0                                  |  0      |
    orr w8, w8, w23, lsl #1                                // |  5         ^          ::  v        : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  5 ^       v          ::           : |  0                                  |  0      |
    bl  _malloc                                            // |  5 :                  ::         ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  5 v                  ::^          : |  0                                  |  0      |
    cmp w23, #1                                            // |  5                    ::: ^        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  5                    ::: :        : |  0                                  |  2 v  v |
    mov x22, #0                                            // |  6                    :::^:        : |  0                                  |  0      |
    and x25, x23, #0x7fffffff                              // |  7                    ::::v ^      : |  0                                  |  0      |
    mov w24, #1                                            // |  7                    :::: ^:      : |  0                                  |  0      |
    mov x23, x25                                           // |  7                    ::::^ v      : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x1, x19, x22                                       // |  8  ^                 v::v: :      : |  0                                  |  0      |
    mov x0, x21                                            // |  8 ^                  ::v:: :      : |  0                                  |  0      |
    mov x2, x23                                            // |  8   ^                ::::v :      : |  0                                  |  0      |
    bl  _strncpy                                           // |  8                    ::::: :    ^ : |  0                                  |  0      |
    add x0, x21, x23                                       // |  8 ^                  ::v:v :      : |  0                                  |  0      |
    mov x1, x19                                            // |  7  ^                 v:::  :      : |  0                                  |  0      |
    mov x2, x22                                            // |  6   ^                 ::v  :      : |  0                                  |  0      |
    bl  _strncpy                                           // |  5                     ::   :    ^ : |  0                                  |  0      |
    strb    wzr, [x21, x25]                                // |  5                     :v   v     v: |  0                                  |  0      |
    mov x0, x20                                            // |  5 ^                   v:   :      : |  0                                  |  0      |
    mov x1, x21                                            // |  4  ^                   v   :      : |  0                                  |  0      |
    bl  _strstr                                            // |  4                      :   :    ^ : |  0                                  |  0      |
    cbnz    x0, LBB0_5                                     // |  4 ^                    :   :      : |  0                                  |  0      |
    add x22, x22, #1                                       // |  4                      :^  :      : |  0                                  |  0      |
    cmp x22, x25                                           // |  4                      :^  v      : |  0                                  |  4 ^^^^ |
    cset    w24, lo                                        // |  3                      :  ^       : |  0                                  |  1   v  |
    subs    x23, x23, #1                                   // |  3                      : ^        : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  2                      :          : |  0                                  |  1  v   |
    b   LBB0_5                                             // |  2                      :          : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w24, #0                                            // |  3                      :  ^       : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x0, x21                                            // |  4 ^                    v  :       : |  0                                  |  0      |
    bl  _free                                              // |  3                         :     ^ : |  0                                  |  0      |
    and w0, w24, #0x1                                      // |  3 ^                       v       : |  0                                  |  0      |
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
