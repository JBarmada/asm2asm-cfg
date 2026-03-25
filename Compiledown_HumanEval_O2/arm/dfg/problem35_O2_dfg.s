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
    mov x19, x2                                            // |  3   v                ^            : |  0                                  |  0      |
    mov x21, x1                                            // |  4  v                 : ^          : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^:          : |  0                                  |  0      |
    sbfiz   x0, x21, #2, #32                               // |  5 ^                  ::v          : |  0                                  |  0      |
    bl  _malloc                                            // |  5 :                  ::         ^ : |  0                                  |  0      |
    cmp w21, #1                                            // |  5 :                  ::^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_15                                        // |  5 :                  :::          : |  0                                  |  2 v  v |
    mov x9, #0                                             // |  6 :        ^         :::          : |  0                                  |  0      |
    mov w8, #0                                             // |  6 :       ^          :::          : |  0                                  |  0      |
    mov w10, w21                                           // |  7 :       : ^        ::v          : |  0                                  |  0      |
    b   LBB0_4                                             // |  6 :       : :        ::           : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    str w11, [x0, w8, sxtw #2]                             // |  7 v       v :v       ::           : |  0                                  |  0      |
    add w8, w8, #1                                         // |  6 :       ^ :        ::           : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  6 :        ^:        ::           : |  0                                  |  0      |
    cmp x9, x10                                            // |  6 :        ^v        ::           : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  5 :        :         ::           : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldr w11, [x20, x9, lsl #2]                             // |  6 :        v ^       :v           : |  0                                  |  0      |
    cmp w8, #1                                             // |  4 :       ^          :            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_2                                         // |  4 :       :          :            : |  0                                  |  2 v  v |
    mov w12, w8                                            // |  5 :       v   ^      :            : |  0                                  |  0      |
    mov x13, x0                                            // |  4 v            ^     :            : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    ldr w14, [x13], #4                                     // |  5 :            v^    :            : |  0                                  |  0      |
    cmp w11, w14                                           // |  5 :          ^  v    :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_3                                         // |  3 :                  :            : |  0                                  |  1  v   |
    subs    x12, x12, #1                                   // |  4 :           ^      :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_6                                         // |  3 :                  :            : |  0                                  |  1  v   |
    b   LBB0_2                                             // |  3 :                  :            : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    cmp w8, #2                                             // |  4 :       ^          :            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_16                                        // |  4 :       :          :            : |  0                                  |  2 v  v |
    mov x10, #0                                            // |  5 :       : ^        :            : |  0                                  |  0      |
    sub w9, w8, #1                                         // |  5 :       v^         :            : |  0                                  |  0      |
    mov w12, w8                                            // |  6 :       v:  ^      :            : |  0                                  |  0      |
    add x11, x0, #4                                        // |  5 v        : ^       :            : |  0                                  |  0      |
    sub x12, x12, #1                                       // |  5 :        :  ^      :            : |  0                                  |  0      |
    b   LBB0_11                                            // |  4 :        :         :            : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    add x11, x11, #4                                       // |  5 :        : ^       :            : |  0                                  |  0      |
    sub x12, x12, #1                                       // |  6 :        : :^      :            : |  0                                  |  0      |
    cmp x10, x9                                            // |  7 :        v^::      :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_16                                        // |  6 :         :::      :            : |  0                                  |  1  v   |
LBB0_11:                                                   // |                                      |                                     |         |
    mov x13, x10                                           // |  7 :         v::^     :            : |  0                                  |  0      |
    add x10, x10, #1                                       // |  7 :         ^:::     :            : |  0                                  |  0      |
    mov x14, x12                                           // |  7 :          :v:^    :            : |  0                                  |  0      |
    mov x15, x11                                           // |  6 :          v : ^   :            : |  0                                  |  0      |
    b   LBB0_13                                            // |  4 :            :     :            : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    add x15, x15, #4                                       // |  5 :            : ^   :            : |  0                                  |  0      |
    subs    x14, x14, #1                                   // |  6 :            :^:   :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  5 :            : :   :            : |  0                                  |  1  v   |
LBB0_13:                                                   // |                                      |                                     |         |
    ldr w16, [x0, x13, lsl #2]                             // |  6 v            v :^  :            : |  0                                  |  0      |
    ldr w17, [x15]                                         // |  6 :            : v ^ :            : |  0                                  |  0      |
    cmp w16, w17                                           // |  7 :            : :^v :            : |  0                                  |  4 ^^^^ |
    b.le    LBB0_12                                        // |  7 :            : ::: :            : |  0                                  |  3 vv v |
    str w17, [x0, x13, lsl #2]                             // |  7 v            v ::v :            : |  0                                  |  0      |
    str w16, [x15]                                         // |  4                vv  :            : |  0                                  |  0      |
    b   LBB0_12                                            // |  2                    :            : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov w8, #0                                             // |  3         ^          :            : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    str w8, [x19]                                          // |  3         v          v            : |  0                                  |  0      |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
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
