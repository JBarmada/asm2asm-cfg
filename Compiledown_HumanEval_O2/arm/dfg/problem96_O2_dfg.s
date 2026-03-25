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
    cbz w1, LBB0_15                                        // |  1  ^                                |  0                                  |  0      |
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_18                                        // |  1  :                                |  0                                  |  2 v  v |
    stp x28, x27, [sp, #-96]!                              // |  4  :                         vv   x |  0                                  |  0      |
    stp x26, x25, [sp, #16]                                // |  4  :                       vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #32]                                // |  4  :                     vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #48]                                // |  4  :                   vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #64]                                // |  4  :                 vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #80]                                // |  4  :                           vv v |  0                                  |  0      |
    add x29, sp, #80                                       // |  3  :                           ^  v |  0                                  |  0      |
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
    mov x19, x0                                            // |  4 v:                 ^            : |  0                                  |  0      |
    mov x21, #0                                            // |  4  :                 : ^          : |  0                                  |  0      |
    mov w26, #0                                            // |  4  :                 :      ^     : |  0                                  |  0      |
    mov w22, #0                                            // |  4  :                 :  ^         : |  0                                  |  0      |
    mov w23, #0                                            // |  4  :                 :   ^        : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x24, __DefaultRuneLocale@GOTPAGE               // |  4  :                 :    ^       : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]         // |  4  :                 :    v       : |  0                                  |  0      |
    mov w25, w1                                            // |  5  v                 :    :^      : |  0                                  |  0      |
    b   LBB0_4                                             // |  4                    :    ::      : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x21, x21, #1                                       // |  5                    : ^  ::      : |  0                                  |  0      |
    mov w0, #1                                             // |  5 ^                  :    ::      : |  0                                  |  0      |
    cmp x21, x25                                           // |  5                    : ^  :v      : |  0                                  |  4 ^^^^ |
    cset    w26, hs                                        // |  5                    : :  : ^     : |  0                                  |  2  :v  |
    b.eq    LBB0_17                                        // |  5                    : :  : :     : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    lsl x8, x21, #4                                        // |  6         ^          : v  : :     : |  0                                  |  0      |
    ldr x8, [x19, x8]                                      // |  5         v          v    : :     : |  0                                  |  0      |
    ldrb    w20, [x8]                                      // |  5         v           ^   : :     : |  0                                  |  0      |
    cbz w20, LBB0_3                                        // |  5         :           ^   : :     : |  0                                  |  0      |
    add x27, x8, #1                                        // |  5         v               : :^    : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    tbnz    w20, #7, LBB0_9                                // |  5                     ^   : ::    : |  0                                  |  0      |
    add x8, x24, w20, uxtw #2                              // |  6         ^           v   v ::    : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  6         v           :   : ::    : |  0                                  |  0      |
    tbz w8, #8, LBB0_16                                    // |  6         ^           :   : ::    : |  0                                  |  0      |
    tst w8, #0x8000                                        // |  6         ^           :   : ::    : |  0                                  |  4 ^^^^ |
    csinc   w22, w22, wzr, eq                              // |  7                     : ^ : ::   v: |  0                                  |  1  v   |
    b   LBB0_11                                            // |  5                     :   : ::    : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x0, x20                                            // |  6 ^                   v   : ::    : |  0                                  |  0      |
    mov w1, #256                                           // |  6  ^                  :   : ::    : |  0                                  |  0      |
    bl  ___maskrune                                        // |  6                     :   : ::  ^ : |  0                                  |  0      |
    cbz w0, LBB0_16                                        // |  6 ^                   :   : ::    : |  0                                  |  0      |
    mov x0, x20                                            // |  6 ^                   v   : ::    : |  0                                  |  0      |
    mov w1, #32768                                         // |  5  ^                      : ::    : |  0                                  |  0      |
    bl  ___maskrune                                        // |  5                         : ::  ^ : |  0                                  |  0      |
    ldurb   w20, [x27, #-1]                                // |  5                     ^   : :v    : |  0                                  |  0      |
    cmp w0, #0                                             // |  5 ^                       : ::    : |  0                                  |  4 ^^^^ |
    csinc   w22, w22, wzr, eq                              // |  6                       ^ : ::   v: |  0                                  |  1  v   |
    tbnz    w20, #7, LBB0_14                               // |  6                     ^ : : ::    : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    add x8, x24, w20, uxtw #2                              // |  7         ^           v : v ::    : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  5         v             :   ::    : |  0                                  |  0      |
    and w0, w8, #0x1000                                    // |  6 ^       v             :   ::    : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    cmp w0, #0                                             // |  5 ^                     :   ::    : |  0                                  |  4 ^^^^ |
    csinc   w23, w23, wzr, eq                              // |  6                       :^  ::   v: |  0                                  |  1  v   |
    add w8, w23, w22                                       // |  6         ^             vv  ::    : |  0                                  |  0      |
    cmp w8, #2                                             // |  4         ^                 ::    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_16                                        // |  3                           ::    : |  0                                  |  1  v   |
    ldrb    w20, [x27], #1                                 // |  4                     ^     :v    : |  0                                  |  0      |
    cbnz    w20, LBB0_6                                    // |  3                     ^     :     : |  0                                  |  0      |
    b   LBB0_3                                             // |  3                     :     :     : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    mov x0, x20                                            // |  4 ^                   v     :     : |  0                                  |  0      |
    mov w1, #4096                                          // |  3  ^                        :     : |  0                                  |  0      |
    bl  ___maskrune                                        // |  3                           :   ^ : |  0                                  |  0      |
    b   LBB0_12                                            // |  3                           :   : : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov w0, #0                                             // |  4 ^                         :   : : |  0                                  |  0      |
    ret                                                    // |  3                           :   v : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    and w0, w26, #0x1                                      // |  3 ^                         v     : |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #80]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #64]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #48]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #32]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #16]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp], #96                                // |  4                            ^^ : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    mov w0, #1                                             // |  2 ^                             :   |  0                                  |  0      |
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
