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
    sub sp, sp, #112                                       // |  1                                 ^ |  0                                  |  0      |
    stp x28, x27, [sp, #16]                                // |  3                            vv   v |  0                                  |  0      |
    stp x26, x25, [sp, #32]                                // |  3                          vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #48]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #64]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #80]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #96]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #96                                       // |  2                              ^  v |  0                                  |  0      |
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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  3 v                   ^           : |  0                                  |  0      |
    bl  _strlen                                            // |  3                     :         ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  4 v                   :^          : |  0                                  |  0      |
    cmp w21, #1                                            // |  3                     :^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                         // |  3                     ::          : |  0                                  |  2 v  v |
    add w8, w21, #2                                        // |  4         ^           :v          : |  0                                  |  0      |
    mov w9, #43691                                         // |  4          ^          ::          : |  0                                  |  0      |
    movk    w9, #43690, lsl #16                            // |  4          ^          ::          : |  0                                  |  0      |
    umull   x8, w8, w9                                     // |  5         ^v          ::          : |  0                                  |  0      |
    lsr x23, x8, #33                                       // |  5         v           :: ^        : |  0                                  |  0      |
    and x24, x21, #0x7fffffff                              // |  5         :           :v  ^       : |  0                                  |  0      |
    mov w25, #3                                            // |  5         :           :   :^      : |  0                                  |  0      |
    add x26, sp, #12                                       // |  6         :           :   ::^     v |  0                                  |  0      |
    mov w27, #3                                            // |  7         :           :   :::^    : |  0                                  |  0      |
    b   LBB0_4                                             // |  6         :           :   :::     : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w9, [sp, #12]                                  // |  7         :^          :   :::     v |  0                                  |  0      |
    strb    w8, [sp, #12]                                  // |  7         v:          :   :::     v |  0                                  |  0      |
    ldrb    w8, [sp, #14]                                  // |  7         ^:          :   :::     v |  0                                  |  0      |
    strb    w8, [sp, #13]                                  // |  7         v:          :   :::     v |  0                                  |  0      |
    strb    w9, [sp, #14]                                  // |  6          v          :   :::     v |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x1, sp, #12                                        // |  6  ^                  :   :::     v |  0                                  |  0      |
    mov x0, x20                                            // |  6 ^                   v   :::     : |  0                                  |  0      |
    mov x2, x22                                            // |  6   ^                   v :::     : |  0                                  |  0      |
    bl  _strncpy                                           // |  5                         :::   ^ : |  0                                  |  0      |
    add x20, x20, #3                                       // |  5                     ^   :::     : |  0                                  |  0      |
    sub w21, w21, #3                                       // |  6                     :^  :::     : |  0                                  |  0      |
    add x27, x27, #3                                       // |  7                     ::  :::^    : |  0                                  |  0      |
    subs    x23, x23, #1                                   // |  7                     :: ^:::     : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  6                     ::  :::     : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    cmp x27, x24                                           // |  7                     ::  v::^    : |  0                                  |  4 ^^^^ |
    csel    w28, w21, w25, hi                              // |  6                     :v   v: ^   : |  0                                  |  2  vv  |
    sxtw    x22, w28                                       // |  5                     : ^   : v   : |  0                                  |  0      |
    add x0, sp, #12                                        // |  5 ^                   : :   :     v |  0                                  |  0      |
    mov x1, x20                                            // |  5  ^                  v :   :     : |  0                                  |  0      |
    mov x2, x22                                            // |  4   ^                   v   :     : |  0                                  |  0      |
    mov w3, #4                                             // |  4    ^                  :   :     : |  0                                  |  0      |
    bl  ___strncpy_chk                                     // |  4                       :   :   ^ : |  0                                  |  0      |
    strb    wzr, [x26, x22]                                // |  4                       v   v    v: |  0                                  |  0      |
    cmp w28, #3                                            // |  2                             ^   : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  1                                 : |  0                                  |  1  v   |
    ldrb    w8, [sp, #13]                                  // |  2         ^                       v |  0                                  |  0      |
    cbz w19, LBB0_2                                        // |  3         :          ^            : |  0                                  |  0      |
    ldrb    w9, [sp, #14]                                  // |  3         :^                      v |  0                                  |  0      |
    strb    w8, [sp, #14]                                  // |  3         v:                      v |  0                                  |  0      |
    ldrb    w8, [sp, #12]                                  // |  3         ^:                      v |  0                                  |  0      |
    strb    w8, [sp, #13]                                  // |  3         v:                      v |  0                                  |  0      |
    strb    w9, [sp, #12]                                  // |  2          v                      v |  0                                  |  0      |
    b   LBB0_3                                             // |  1                                 : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #96]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #80]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #64]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #48]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #32]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp, #16]                                // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #112                                       // |  2                               : ^ |  0                                  |  0      |
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
