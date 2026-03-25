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
    mov w8, #0                                             // |  4         ^          ::           : |  0                                  |  0      |
    mov w22, #0                                            // |  4                    :: ^         : |  0                                  |  0      |
    mov w21, #0                                            // |  5                    ::^:         : |  0                                  |  0      |
    mov x0, #0                                             // |  6 ^                  ::::         : |  0                                  |  0      |
    b   LBB0_2                                             // |  6 :                  ::::         : |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    cbz w9, LBB0_7                                         // |  7 :        ^         ::::         : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w9, [x20], #1                                  // |  7 :        ^         :v::         : |  0                                  |  0      |
    cmp w9, #40                                            // |  6 :        ^         : ::         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  5 :                  : ::         : |  0                                  |  1  v   |
    cmp w9, #41                                            // |  6 :        ^         : ::         : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_1                                         // |  5 :                  : ::         : |  0                                  |  1  v   |
    subs    w8, w8, #1                                     // |  6 :       ^          : ::         : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  5 :                  : ::         : |  0                                  |  1  v   |
    add w23, w21, #1                                       // |  6 :                  : v:^        : |  0                                  |  0      |
    sbfiz   x1, x23, #2, #32                               // |  7 :^                 : ::v        : |  0                                  |  0      |
    bl  _realloc                                           // |  7 :                  : :::      ^ : |  0                                  |  0      |
    mov w8, #0                                             // |  7 :       ^          : :::        : |  0                                  |  0      |
    str w22, [x0, w21, sxtw #2]                            // |  6 v                  : vv:        : |  0                                  |  0      |
    mov x21, x23                                           // |  4                    : ^ v        : |  0                                  |  0      |
    mov w22, #0                                            // |  4                    : :^         : |  0                                  |  0      |
    b   LBB0_2                                             // |  4                    : ::         : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    cmp w8, w22                                            // |  5         ^          : :v         : |  0                                  |  4 ^^^^ |
    csinc   w22, w22, w8, lt                               // |  5         v          : :^         : |  0                                  |  2 v  v |
    add w8, w8, #1                                         // |  4         ^          : :          : |  0                                  |  0      |
    b   LBB0_2                                             // |  3                    : :          : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    str w21, [x19]                                         // |  3                    v v          : |  0                                  |  0      |
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
