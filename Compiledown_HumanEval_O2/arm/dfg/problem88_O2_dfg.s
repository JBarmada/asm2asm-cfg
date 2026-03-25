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
    stp x28, x27, [sp, #-96]!                              // |  3                            vv   x |  0                                  |  0      |
    stp x26, x25, [sp, #16]                                // |  3                          vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #32]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #48]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #64]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #80]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #80                                       // |  2                              ^  v |  0                                  |  0      |
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
    .cfi_offset w27, -88                                   // |                                      |                                     |         |
    .cfi_offset w28, -96                                   // |                                      |                                     |         |
    mov x19, x4                                            // |  3     v              ^            : |  0                                  |  0      |
    mov x20, x3                                            // |  4    v               :^           : |  0                                  |  0      |
    mov x21, x2                                            // |  5   v                ::^          : |  0                                  |  0      |
    mov x24, x1                                            // |  6  v                 :::  ^       : |  0                                  |  0      |
    mov x23, x0                                            // |  6 v                  ::: ^        : |  0                                  |  0      |
    mov w0, #800                                           // |  6 ^                  ::: :        : |  0                                  |  0      |
    bl  _malloc                                            // |  7 :                  ::: :      ^ : |  0                                  |  0      |
    mov x22, x0                                            // |  7 v                  :::^:        : |  0                                  |  0      |
    cmp w24, #1                                            // |  7                    :::::^       : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_8                                         // |  6                    :::::        : |  0                                  |  2 v  v |
    mov x26, #0                                            // |  7                    :::::  ^     : |  0                                  |  0      |
    mov w25, #0                                            // |  7                    ::::: ^      : |  0                                  |  0      |
    mov w24, w24                                           // |  8                    :::::^:      : |  0                                  |  0      |
    b   LBB0_3                                             // |  8                    :::::::      : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x26, x26, #1                                       // |  9                    :::::::^     : |  0                                  |  0      |
    cmp x26, x24                                           // |  9                    :::::v:^     : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_9                                         // |  8                    ::::: ::     : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr w27, [x21, x26, lsl #2]                            // |  9                    ::v:: :v^    : |  0                                  |  0      |
    cmp w27, #1                                            // |  8                    :: :: ::^    : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_2                                         // |  7                    :: :: ::     : |  0                                  |  2 v  v |
    ldr x8, [x23, x26, lsl #3]                             // |  8         ^          :: :v :v     : |  0                                  |  0      |
    sub x28, x8, #4                                        // |  8         v          :: :  :: ^   : |  0                                  |  0      |
    b   LBB0_6                                             // |  7                    :: :  :: :   : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    sub x27, x27, #1                                       // |  8                    :: :  ::^:   : |  0                                  |  0      |
    add x8, x27, #1                                        // |  9         ^          :: :  ::v:   : |  0                                  |  0      |
    cmp x8, #1                                             // |  9         ^          :: :  ::::   : |  0                                  |  4 ^^^^ |
    b.ls    LBB0_2                                         // |  8                    :: :  ::::   : |  0                                  |  4 ^vv^ |
LBB0_6:                                                    // |                                      |                                     |         |
    ldr w8, [x28, x27, lsl #2]                             // |  9         ^          :: :  ::vv   : |  0                                  |  0      |
    cmp w8, w20                                            // |  8         ^          :v :  :::    : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  6                    :  :  :::    : |  0                                  |  1  v   |
    mov w0, #8                                             // |  7 ^                  :  :  :::    : |  0                                  |  0      |
    bl  _malloc                                            // |  8 :                  :  :  :::  ^ : |  0                                  |  0      |
    str x0, [x22, w25, sxtw #3]                            // |  7 v                  :  v  v::    : |  0                                  |  0      |
    sub w8, w27, #1                                        // |  7 :       ^          :  :   :v    : |  0                                  |  0      |
    stp w26, w8, [x0]                                      // |  6 v       v          :  :   v     : |  0                                  |  0      |
    add w25, w25, #1                                       // |  4                    :  :  ^      : |  0                                  |  0      |
    b   LBB0_5                                             // |  3                    :  :         : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w25, #0                                            // |  4                    :  :  ^      : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    str w25, [x19]                                         // |  4                    v  :  v      : |  0                                  |  0      |
    mov x0, x22                                            // |  3 ^                     v         : |  0                                  |  0      |
    ldp x29, x30, [sp, #80]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #64]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #48]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #32]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #16]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp], #96                                // |  4                            ^^ : v |  0                                  |  0      |
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
