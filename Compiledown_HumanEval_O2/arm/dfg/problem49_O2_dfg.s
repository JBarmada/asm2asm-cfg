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
    stp x20, x19, [sp, #-32]!                              // |  3                    vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    bl  _strlen                                            // |  3                    :          ^ : |  0                                  |  0      |
    cmp w0, #2                                             // |  3 ^                  :            : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  2                    :            : |  0                                  |  2 v  v |
    mov w0, #1                                             // |  3 ^                  :            : |  0                                  |  0      |
    b   LBB0_8                                             // |  3 :                  :            : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w8, [x19]                                      // |  4 :       ^          v            : |  0                                  |  0      |
    sub w9, w0, #1                                         // |  4 v        ^         :            : |  0                                  |  0      |
    ldrb    w9, [x19, w9, sxtw]                            // |  4 :        v         v            : |  0                                  |  0      |
    cmp w8, w9                                             // |  5 :       ^v         :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_7                                         // |  3 :                  :            : |  0                                  |  1  v   |
    ubfx    x8, x0, #1, #30                                // |  4 v       ^          :            : |  0                                  |  0      |
    mov x9, #-8589934592                                   // |  4 :        ^         :            : |  0                                  |  0      |
    add x9, x9, x0, lsl #32                                // |  4 v        ^         :            : |  0                                  |  0      |
    mov w12, #1                                            // |  4          :  ^      :            : |  0                                  |  0      |
    mov x10, #-4294967296                                  // |  5          :^ :      :            : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x11, x12                                           // |  6          ::^v      :            : |  0                                  |  0      |
    cmp x8, x12                                            // |  7         ^:::v      :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  6         ::::       :            : |  0                                  |  1  v   |
    ldrb    w13, [x19, x11]                                // |  7         :::v ^     v            : |  0                                  |  0      |
    asr x12, x9, #32                                       // |  7         :v::^      :            : |  0                                  |  0      |
    ldrb    w14, [x19, x12]                                // |  7         : ::v ^    v            : |  0                                  |  0      |
    add x9, x9, x10                                        // |  6         :^v:  :                 : |  0                                  |  0      |
    add x12, x11, #1                                       // |  5         :  v^ :                 : |  0                                  |  0      |
    cmp w13, w14                                           // |  4         :    ^v                 : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_4                                         // |  2         :                       : |  0                                  |  1  v   |
LBB0_6:                                                    // |                                      |                                     |         |
    cmp x11, x8                                            // |  3         v  ^                    : |  0                                  |  4 ^^^^ |
    cset    w0, hs                                         // |  2 ^                               : |  0                                  |  1   v  |
    b   LBB0_8                                             // |  1                                 : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w0, #0                                             // |  2 ^                               : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  4                    ^^         : v |  0                                  |  0      |
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
