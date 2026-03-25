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
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    bl  _strlen                                            // |  3                    :          ^ : |  0                                  |  0      |
    cbz w0, LBB0_10                                        // |  3 ^                  :            : |  0                                  |  0      |
    lsl x20, x0, #32                                       // |  4 v                  :^           : |  0                                  |  0      |
    mov x8, #-4294967296                                   // |  4         ^          ::           : |  0                                  |  0      |
    add x8, x20, x8                                        // |  4         ^          :v           : |  0                                  |  0      |
    asr x8, x8, #32                                        // |  4         ^          ::           : |  0                                  |  0      |
    ldrsb   x8, [x19, x8]                                  // |  4         v          v:           : |  0                                  |  0      |
    tbnz    x8, #63, LBB0_6                                // |  4         ^          ::           : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x9, __DefaultRuneLocale@GOTPAGE                // |  4          ^         ::           : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]           // |  4          v         ::           : |  0                                  |  0      |
    add x8, x9, x8, lsl #2                                 // |  5         ^v         ::           : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  4         v          ::           : |  0                                  |  0      |
    and w8, w8, #0x100                                     // |  4         ^          ::           : |  0                                  |  0      |
    cbz w8, LBB0_7                                         // |  4         ^          ::           : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp w0, #1                                             // |  4 ^                  ::           : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  3                    ::           : |  0                                  |  1  v   |
    mov x8, #-8589934592                                   // |  4         ^          ::           : |  0                                  |  0      |
    add x8, x20, x8                                        // |  4         ^          :v           : |  0                                  |  0      |
    asr x8, x8, #32                                        // |  3         ^          :            : |  0                                  |  0      |
    ldrsb   x8, [x19, x8]                                  // |  3         v          v            : |  0                                  |  0      |
    tbnz    x8, #63, LBB0_8                                // |  2         ^                       : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x9, __DefaultRuneLocale@GOTPAGE                // |  2          ^                      : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    ldr x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]           // |  2          v                      : |  0                                  |  0      |
    add x8, x9, x8, lsl #2                                 // |  3         ^v                      : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  2         v                       : |  0                                  |  0      |
    and w0, w8, #0x100                                     // |  3 ^       v                       : |  0                                  |  0      |
    b   LBB0_9                                             // |  3 :       :                       : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x21, x0                                            // |  4 v       :            ^          : |  0                                  |  0      |
    and w0, w8, #0xff                                      // |  4 ^       v            :          : |  0                                  |  0      |
    mov w1, #256                                           // |  4 :^                   :          : |  0                                  |  0      |
    bl  ___maskrune                                        // |  4 :                    :        ^ : |  0                                  |  0      |
    mov x8, x0                                             // |  4 v       ^            :          : |  0                                  |  0      |
    mov x0, x21                                            // |  3 ^                    v          : |  0                                  |  0      |
    cbnz    w8, LBB0_3                                     // |  2         ^                       : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  3 ^       :                       : |  0                                  |  0      |
    b   LBB0_10                                            // |  2         :                       : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    and w0, w8, #0xff                                      // |  3 ^       v                       : |  0                                  |  0      |
    mov w1, #256                                           // |  2  ^                              : |  0                                  |  0      |
    bl  ___maskrune                                        // |  2                               ^ : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    cmp w0, #0                                             // |  2 ^                               : |  0                                  |  4 ^^^^ |
    cset    w0, eq                                         // |  2 ^                               : |  0                                  |  1  v   |
LBB0_10:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpLdrGot Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpLdrGot Lloh2, Lloh3                           // |                                      |                                     |         |
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
