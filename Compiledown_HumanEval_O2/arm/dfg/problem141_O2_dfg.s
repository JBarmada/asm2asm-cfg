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
    ldrb    w8, [x0]                                       // |  4 v       ^          :            : |  0                                  |  0      |
    cbz w8, LBB0_16                                        // |  3         ^          :            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov x22, #0                                            // |  4                    :: ^         : |  0                                  |  0      |
    mov w21, #0                                            // |  4                    ::^          : |  0                                  |  0      |
    mov w26, #0                                            // |  5                    :::    ^     : |  0                                  |  0      |
    mov w23, #24415                                        // |  5                    ::: ^        : |  0                                  |  0      |
    mov w24, #95                                           // |  6                    ::: :^       : |  0                                  |  0      |
    mov w25, #45                                           // |  7                    ::: ::^      : |  0                                  |  0      |
    b   LBB0_4                                             // |  7                    ::: :::      : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w26, w26, #1                                       // |  8                    ::: :::^     : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x22, x22, #1                                       // |  8                    :::^:::      : |  0                                  |  0      |
    mov x0, x20                                            // |  9 ^                  :v:::::      : |  0                                  |  0      |
    bl  _strlen                                            // |  9                    :::::::    ^ : |  0                                  |  0      |
    cmp x0, x22                                            // |  9 ^                  :::v:::      : |  0                                  |  4 ^^^^ |
    b.ls    LBB0_13                                        // |  8                    :::::::      : |  0                                  |  4 ^vv^ |
LBB0_4:                                                    // |                                      |                                     |         |
    ldrb    w8, [x20, x22]                                 // |  9         ^          :v:v:::      : |  0                                  |  0      |
    cmp w8, #32                                            // |  9         ^          :::::::      : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  8                    :::::::      : |  0                                  |  1  v   |
    cmp w26, #2                                            // |  9                    :::::::^     : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  8                    :::::::      : |  0                                  |  1  v   |
    cmp w26, #1                                            // |  9                    :::::::^     : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_9                                         // |  8                    :::::::      : |  0                                  |  1  v   |
    strb    w24, [x19, w21, sxtw]                          // |  8                    v:v::v:      : |  0                                  |  0      |
    b   LBB0_11                                            // |  7                    ::::: :      : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    strh    w23, [x19, w21, sxtw]                          // |  7                    v:v:v :      : |  0                                  |  0      |
    add w21, w21, #2                                       // |  6                    ::^:  :      : |  0                                  |  0      |
    b   LBB0_12                                            // |  6                    ::::  :      : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    cmp w26, #3                                            // |  7                    ::::  :^     : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_12                                        // |  6                    ::::  :      : |  0                                  |  2 v  v |
    strb    w25, [x19, w21, sxtw]                          // |  6                    v:v:  v      : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    add w21, w21, #1                                       // |  5                    ::^:         : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    mov w26, #0                                            // |  6                    ::::   ^     : |  0                                  |  0      |
    ldrb    w8, [x20, x22]                                 // |  6         ^          :v:v         : |  0                                  |  0      |
    strb    w8, [x19, w21, sxtw]                           // |  4         v          v v          : |  0                                  |  0      |
    add w21, w21, #1                                       // |  3                    : ^          : |  0                                  |  0      |
    b   LBB0_3                                             // |  3                    : :          : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    cmp w26, #1                                            // |  4                    : :    ^     : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_17                                        // |  3                    : :          : |  0                                  |  1  v   |
    cmp w26, #2                                            // |  4                    : :    ^     : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_18                                        // |  3                    : :          : |  0                                  |  1  v   |
    mov w8, #24415                                         // |  4         ^          : :          : |  0                                  |  0      |
    strh    w8, [x19, w21, sxtw]                           // |  4         v          v v          : |  0                                  |  0      |
    add w21, w21, #2                                       // |  3                    : ^          : |  0                                  |  0      |
    b   LBB0_21                                            // |  2                    :            : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    mov w21, #0                                            // |  3                    : ^          : |  0                                  |  0      |
    b   LBB0_21                                            // |  3                    : :          : |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    mov w8, #95                                            // |  4         ^          : :          : |  0                                  |  0      |
    b   LBB0_20                                            // |  3                    : :          : |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    cmp w26, #3                                            // |  4                    : :    ^     : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_21                                        // |  3                    : :          : |  0                                  |  2 v  v |
    mov w8, #45                                            // |  4         ^          : :          : |  0                                  |  0      |
LBB0_20:                                                   // |                                      |                                     |         |
    strb    w8, [x19, w21, sxtw]                           // |  4         v          v v          : |  0                                  |  0      |
    add w21, w21, #1                                       // |  3                    : ^          : |  0                                  |  0      |
LBB0_21:                                                   // |                                      |                                     |         |
    strb    wzr, [x19, w21, sxtw]                          // |  4                    v v         v: |  0                                  |  0      |
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
