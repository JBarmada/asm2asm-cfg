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
    ldrb    w8, [x0]                                       // |  3 v       ^                       : |  0                                  |  0      |
    cbz w8, LBB0_14                                        // |  2         ^                       : |  0                                  |  0      |
    mov x19, x0                                            // |  4 v       :          ^            : |  0                                  |  0      |
    mov w20, #0                                            // |  4         :          :^           : |  0                                  |  0      |
    mov w23, #0                                            // |  4         :          :   ^        : |  0                                  |  0      |
    mov w22, #1                                            // |  4         :          :  ^         : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x24, __DefaultRuneLocale@GOTPAGE               // |  5         :          :  : ^       : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]         // |  5         :          :  : v       : |  0                                  |  0      |
    mov x25, #70377334112256                               // |  6         :          :  : :^      : |  0                                  |  0      |
    movk    x25, #32768, lsl #48                           // |  6         :          :  : :^      : |  0                                  |  0      |
    mov w26, #1                                            // |  7         :          :  : ::^     : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    sxtb    w0, w8                                         // |  7 ^       v          :  : ::      : |  0                                  |  0      |
    tbnz    w8, #7, LBB0_4                                 // |  7 :       ^          :  : ::      : |  0                                  |  0      |
    add x9, x24, w0, uxtw #2                               // |  7 v        ^         :  : v:      : |  0                                  |  0      |
    ldr w9, [x9, #60]                                      // |  7 :        v         :  : ::      : |  0                                  |  0      |
    and w21, w9, #0x4000                                   // |  8 :        v         : ^: ::      : |  0                                  |  0      |
    b   LBB0_5                                             // |  6 :                  :  : ::      : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w1, #16384                                         // |  7 :^                 :  : ::      : |  0                                  |  0      |
    bl  ___maskrune                                        // |  7 :                  :  : ::    ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  7 v                  : ^: ::      : |  0                                  |  0      |
    ldrb    w8, [x19]                                      // |  6         ^          v  : ::      : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    cmp w21, #0                                            // |  7         :          : ^: ::      : |  0                                  |  4 ^^^^ |
    ccmp    w23, #0, #4, ne                                // |  7         :          :  :^::      : |  0                                  |  4 ^v^^ |
    cinc    w20, w20, ne                                   // |  7         :          :^ : ::      : |  0                                  |  0      |
    and w9, w8, #0xff                                      // |  7         v^         :  : ::      : |  0                                  |  0      |
    cmp w9, #73                                            // |  7         :^         :  : ::      : |  0                                  |  4 ^^^^ |
    ccmp    w26, #0, #4, eq                                // |  7         :          :  : ::^     : |  0                                  |  4 ^v^^ |
    b.ne    LBB0_8                                         // |  7         :          :  : :::     : |  0                                  |  1  v   |
    sxtb    w0, w8                                         // |  8 ^       v          :  : :::     : |  0                                  |  0      |
    tbnz    w8, #7, LBB0_11                                // |  8 :       ^          :  : :::     : |  0                                  |  0      |
    cmp w21, #0                                            // |  9 :       :          : ^: :::     : |  0                                  |  4 ^^^^ |
    add x9, x24, w0, uxtw #2                               // |  9 v       :^         :  : v::     : |  0                                  |  1  :   |
    ldr w9, [x9, #60]                                      // |  8         :v         :  : :::     : |  0                                  |  1  :   |
    and w9, w9, #0x4000                                    // |  8         :^         :  : :::     : |  0                                  |  1  :   |
    ccmp    w9, #0, #4, eq                                 // |  8         :^         :  : :::     : |  0                                  |  4 ^v^^ |
    csel    w23, wzr, w23, eq                              // |  9         :          :  :^:::    v: |  0                                  |  1  v   |
    and w0, w8, #0xff                                      // |  8 ^       v          :  : :::     : |  0                                  |  0      |
    b   LBB0_9                                             // |  6                    :  : :::     : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w0, #73                                            // |  7 ^                  :  : :::     : |  0                                  |  0      |
    mov w23, #1                                            // |  8 :                  :  :^:::     : |  0                                  |  0      |
    mov w8, #73                                            // |  8 :       ^          :  : :::     : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    add x9, x24, w0, uxtw #2                               // |  9 v       :^         :  : v::     : |  0                                  |  0      |
    ldr w9, [x9, #60]                                      // |  7         :v         :  :  ::     : |  0                                  |  0      |
    and w0, w9, #0x4000                                    // |  8 ^       :v         :  :  ::     : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    cmp w0, #0                                             // |  7 ^       :          :  :  ::     : |  0                                  |  4 ^^^^ |
    csel    w9, wzr, w26, eq                               // |  9 :       :^         :  :  :v    v: |  0                                  |  1  v   |
    and w10, w8, #0xff                                     // |  8 :       v:^        :  :  :      : |  0                                  |  0      |
    and x8, x8, #0xff                                      // |  7 :       ^:         :  :  :      : |  0                                  |  0      |
    lsl x8, x22, x8                                        // |  7 :       ^:         :  v  :      : |  0                                  |  0      |
    tst x8, x25                                            // |  7 :       ^:         :  :  v      : |  0                                  |  4 ^^^^ |
    csel    w8, w22, w9, ne                                // |  6 :       ^v         :  v         : |  0                                  |  1  v   |
    cmp w10, #63                                           // |  6 :       ::^        :            : |  0                                  |  4 ^^^^ |
    csel    w26, w9, w8, hi                                // |  6 :       vv         :      ^     : |  0                                  |  2  vv  |
    ldrb    w8, [x19, #1]!                                 // |  4 :       ^          x            : |  0                                  |  0      |
    cbnz    w8, LBB0_2                                     // |  4 :       ^          :            : |  0                                  |  0      |
    b   LBB0_15                                            // |  3 :                  :            : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    mov w1, #16384                                         // |  4 :^                 :            : |  0                                  |  0      |
    bl  ___maskrune                                        // |  4 :                  :          ^ : |  0                                  |  0      |
    mov x8, x0                                             // |  4 v       ^          :            : |  0                                  |  0      |
    cmp w21, #0                                            // |  3                    : ^          : |  0                                  |  4 ^^^^ |
    ldrsb   w0, [x19]                                      // |  3 ^                  v            : |  0                                  |  1  :   |
    ccmp    w8, #0, #4, eq                                 // |  3         ^          :            : |  0                                  |  4 ^v^^ |
    csel    w23, wzr, w23, eq                              // |  4                    :   ^       v: |  0                                  |  1  v   |
    tbnz    w0, #31, LBB0_13                               // |  3 ^                  :            : |  0                                  |  0      |
    mov x8, x0                                             // |  4 v       ^          :            : |  0                                  |  0      |
    b   LBB0_9                                             // |  2                    :            : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    mov w1, #16384                                         // |  3  ^                 :            : |  0                                  |  0      |
    bl  ___maskrune                                        // |  3                    :          ^ : |  0                                  |  0      |
    ldrb    w8, [x19]                                      // |  3         ^          v            : |  0                                  |  0      |
    b   LBB0_10                                            // |  1                                 : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    mov w20, #0                                            // |  2                     ^           : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  4                          ^^   : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpLdrGot Lloh0, Lloh1                           // |                                      |                                     |         |
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
