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
    mov x21, x1                                            // |  3  v                   ^          : |  0                                  |  0      |
    mov x19, x0                                            // |  4 v                  ^ :          : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    : :        ^ : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^:          : |  0                                  |  0      |
    mov x0, x21                                            // |  4 ^                  : v          : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    : :        ^ : |  0                                  |  0      |
    cmp w20, #1                                            // |  4                    :^:          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_9                                         // |  4                    :::          : |  0                                  |  2 v  v |
    mov w11, #0                                            // |  5            ^       :::          : |  0                                  |  0      |
    and x8, x20, #0x7fffffff                               // |  5         ^          :v:          : |  0                                  |  0      |
    mov w9, #1                                             // |  4          ^         : :          : |  0                                  |  0      |
    mov x10, x19                                           // |  4           ^        v :          : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w12, [x10], #1                                 // |  5           v ^      : :          : |  0                                  |  0      |
    cmp w12, #40                                           // |  4             ^      : :          : |  0                                  |  4 ^^^^ |
    cinc    w11, w11, eq                                   // |  4            ^       : :          : |  0                                  |  0      |
    cmp w12, #41                                           // |  4             ^      : :          : |  0                                  |  4 ^^^^ |
    cset    w12, eq                                        // |  4             ^      : :          : |  0                                  |  1  v   |
    sub w11, w11, w12                                      // |  5            ^v      : :          : |  0                                  |  0      |
    cmp w11, #0                                            // |  4            ^       : :          : |  0                                  |  4 ^^^^ |
    csel    w9, wzr, w9, lt                                // |  5          ^         : :         v: |  0                                  |  2 v  v |
    subs    x8, x8, #1                                     // |  4         ^          : :          : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3                    : :          : |  0                                  |  1  v   |
    cmp w0, #1                                             // |  4 ^                  : :          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_10                                        // |  4 :                  : :          : |  0                                  |  2 v  v |
LBB0_4:                                                    // |                                      |                                     |         |
    and x12, x0, #0x7fffffff                               // |  5 v           ^      : :          : |  0                                  |  0      |
    mov x8, x12                                            // |  5         ^   v      : :          : |  0                                  |  0      |
    mov x10, x21                                           // |  4           ^        : v          : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ldrb    w13, [x10], #1                                 // |  5           v  ^     : :          : |  0                                  |  0      |
    cmp w13, #40                                           // |  4              ^     : :          : |  0                                  |  4 ^^^^ |
    cinc    w11, w11, eq                                   // |  4            ^       : :          : |  0                                  |  0      |
    cmp w13, #41                                           // |  4              ^     : :          : |  0                                  |  4 ^^^^ |
    cset    w13, eq                                        // |  4              ^     : :          : |  0                                  |  1  v   |
    sub w11, w11, w13                                      // |  5            ^ v     : :          : |  0                                  |  0      |
    cmp w11, #0                                            // |  4            ^       : :          : |  0                                  |  4 ^^^^ |
    csel    w9, wzr, w9, lt                                // |  5          ^         : :         v: |  0                                  |  2 v  v |
    subs    x8, x8, #1                                     // |  4         ^          : :          : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  3                    : :          : |  0                                  |  1  v   |
    cmp w11, #0                                            // |  4            ^       : :          : |  0                                  |  4 ^^^^ |
    ccmp    w9, #0, #4, eq                                 // |  4          ^         : :          : |  0                                  |  4 ^v^^ |
    b.ne    LBB0_12                                        // |  3                    : :          : |  0                                  |  1  v   |
    mov w10, #0                                            // |  4           ^        : :          : |  0                                  |  0      |
    mov w8, #1                                             // |  4         ^          : :          : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    ldrb    w9, [x21], #1                                  // |  4          ^         : v          : |  0                                  |  0      |
    cmp w9, #40                                            // |  3          ^         :            : |  0                                  |  4 ^^^^ |
    cinc    w10, w10, eq                                   // |  3           ^        :            : |  0                                  |  0      |
    cmp w9, #41                                            // |  3          ^         :            : |  0                                  |  4 ^^^^ |
    cset    w9, eq                                         // |  3          ^         :            : |  0                                  |  1  v   |
    sub w10, w10, w9                                       // |  4          v^        :            : |  0                                  |  0      |
    cmp w10, #0                                            // |  3           ^        :            : |  0                                  |  4 ^^^^ |
    csel    w8, wzr, w8, lt                                // |  4         ^          :           v: |  0                                  |  2 v  v |
    subs    x12, x12, #1                                   // |  3             ^      :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_8                                         // |  2                    :            : |  0                                  |  1  v   |
    b   LBB0_13                                            // |  2                    :            : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov w11, #0                                            // |  3            ^       :            : |  0                                  |  0      |
    mov w9, #1                                             // |  3          ^         :            : |  0                                  |  0      |
    cmp w0, #1                                             // |  3 ^                  :            : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_4                                         // |  2                    :            : |  0                                  |  2 v  v |
LBB0_10:                                                   // |                                      |                                     |         |
    mov w10, #0                                            // |  3           ^        :            : |  0                                  |  0      |
    mov w8, #1                                             // |  3         ^          :            : |  0                                  |  0      |
    cbnz    w11, LBB0_13                                   // |  3            ^       :            : |  0                                  |  0      |
    cbz w9, LBB0_13                                        // |  3          ^         :            : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str@PAGE                                // |  3 ^                  :            : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str@PAGEOFF                             // |  3 ^                  :            : |  0                                  |  0      |
    b   LBB0_17                                            // |  2                    :            : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    cmp w20, #1                                            // |  3                    :^           : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_16                                        // |  3                    ::           : |  0                                  |  2 v  v |
    and x9, x20, #0x7fffffff                               // |  4          ^         :v           : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    ldrb    w11, [x19], #1                                 // |  3            ^       v            : |  0                                  |  0      |
    cmp w11, #40                                           // |  2            ^                    : |  0                                  |  4 ^^^^ |
    cinc    w10, w10, eq                                   // |  2           ^                     : |  0                                  |  0      |
    cmp w11, #41                                           // |  2            ^                    : |  0                                  |  4 ^^^^ |
    cset    w11, eq                                        // |  2            ^                    : |  0                                  |  1  v   |
    sub w10, w10, w11                                      // |  3           ^v                    : |  0                                  |  0      |
    cmp w10, #0                                            // |  2           ^                     : |  0                                  |  4 ^^^^ |
    csel    w8, wzr, w8, lt                                // |  3         ^                      v: |  0                                  |  2 v  v |
    subs    x9, x9, #1                                     // |  2          ^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_15                                        // |  1                                 : |  0                                  |  1  v   |
LBB0_16:                                                   // |                                      |                                     |         |
    cmp w8, #0                                             // |  2         ^                       : |  0                                  |  4 ^^^^ |
    ccmp    w10, #0, #0, ne                                // |  2           ^                     : |  0                                  |  4 ^v^^ |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x8, l_.str.1@PAGE                              // |  2         ^                       : |  0                                  |  1  :   |
Lloh3:                                                     // |                                      |                                     |         |
    add x8, x8, l_.str.1@PAGEOFF                           // |  2         ^                       : |  0                                  |  1  :   |
Lloh4:                                                     // |                                      |                                     |         |
    adrp    x9, l_.str@PAGE                                // |  3         :^                      : |  0                                  |  1  :   |
Lloh5:                                                     // |                                      |                                     |         |
    add x9, x9, l_.str@PAGEOFF                             // |  3         :^                      : |  0                                  |  1  :   |
    csel    x0, x9, x8, eq                                 // |  4 ^       vv                      : |  0                                  |  1  v   |
LBB0_17:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh4, Lloh5                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "Yes"                                          // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "No"                                           // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
