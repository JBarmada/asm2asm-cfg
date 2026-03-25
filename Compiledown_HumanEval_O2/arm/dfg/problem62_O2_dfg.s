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
    cbz x0, LBB0_6                                         // |  3 ^                  :            : |  0                                  |  0      |
    ldrb    w8, [x19]                                      // |  4 :       ^          v            : |  0                                  |  0      |
    cmp w8, #40                                            // |  4 :       ^          :            : |  0                                  |  4 ^^^^ |
    cset    w9, eq                                         // |  4 :        ^         :            : |  0                                  |  1  v   |
    cmp w8, #41                                            // |  4 :       ^          :            : |  0                                  |  4 ^^^^ |
    cset    w8, eq                                         // |  4 :       ^          :            : |  0                                  |  1  v   |
    subs    w9, w9, w8                                     // |  5 :       v^         :            : |  0                                  |  4 ^^^^ |
    b.mi    LBB0_7                                         // |  3 :                  :            : |  0                                  |  1 v    |
    mov x8, #0                                             // |  4 :       ^          :            : |  0                                  |  0      |
    add x10, x19, #1                                       // |  5 :       : ^        v            : |  0                                  |  0      |
    sub x11, x0, #1                                        // |  5 v       : :^                    : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp x11, x8                                            // |  4         v :^                    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  3         : :                     : |  0                                  |  1  v   |
    ldrb    w12, [x10, x8]                                 // |  4         v v ^                   : |  0                                  |  0      |
    cmp w12, #40                                           // |  2             ^                   : |  0                                  |  4 ^^^^ |
    cinc    w9, w9, eq                                     // |  2          ^                      : |  0                                  |  0      |
    cmp w12, #41                                           // |  2             ^                   : |  0                                  |  4 ^^^^ |
    cset    w12, eq                                        // |  2             ^                   : |  0                                  |  1  v   |
    add x8, x8, #1                                         // |  3         ^   :                   : |  0                                  |  0      |
    subs    w9, w9, w12                                    // |  4         :^  v                   : |  0                                  |  4 ^^^^ |
    b.pl    LBB0_3                                         // |  2         :                       : |  0                                  |  1 v    |
    mov w9, #0                                             // |  3         :^                      : |  0                                  |  0      |
    cmp x0, x8                                             // |  3 ^       v                       : |  0                                  |  4 ^^^^ |
    cset    w8, ls                                         // |  2         ^                       : |  0                                  |  2  vv  |
    b   LBB0_9                                             // |  1                                 : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w8, #1                                             // |  2         ^                       : |  0                                  |  0      |
    mov w9, #1                                             // |  2          ^                      : |  0                                  |  0      |
    b   LBB0_9                                             // |  1                                 : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  2         ^                       : |  0                                  |  0      |
    mov w9, #0                                             // |  2          ^                      : |  0                                  |  0      |
    b   LBB0_9                                             // |  1                                 : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    cmp w9, #0                                             // |  2          ^                      : |  0                                  |  4 ^^^^ |
    cset    w9, eq                                         // |  2          ^                      : |  0                                  |  1  v   |
    mov w8, #1                                             // |  3         ^:                      : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    and w0, w8, w9                                         // |  4 ^       vv                      : |  0                                  |  0      |
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
