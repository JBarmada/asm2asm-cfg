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
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov x0, x1                                             // |  4 ^v                 :            : |  0                                  |  0      |
    mov w8, #1                                             // |  4 :       ^          :            : |  0                                  |  0      |
    str w8, [x2]                                           // |  5 : v     v          :            : |  0                                  |  0      |
    str w8, [x1]                                           // |  5 :v      v          :            : |  0                                  |  0      |
    cmp w20, #1                                            // |  4 :                  :^           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_9                                         // |  3 :                  :            : |  0                                  |  1  v   |
LBB0_1:                                                    // |                                      |                                     |         |
    ldr w8, [x19]                                          // |  4 :       ^          v            : |  0                                  |  0      |
    cmp w8, #2                                             // |  4 :       ^          :            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_8                                         // |  3 :                  :            : |  0                                  |  2 v  v |
    mov w8, #1                                             // |  4 :       ^          :            : |  0                                  |  0      |
    b   LBB0_5                                             // |  3 :                  :            : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x10, #0                                            // |  4 :         ^        :            : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    str w9, [x0, w10, sxtw #2]                             // |  5 v        vv        :            : |  0                                  |  0      |
    add x8, x8, #1                                         // |  4 :       ^          :            : |  0                                  |  0      |
    ldrsw   x9, [x19]                                      // |  4 :        ^         v            : |  0                                  |  0      |
    cmp x8, x9                                             // |  4 :       ^v                      : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_8                                         // |  3 :       :                       : |  0                                  |  2 v  v |
LBB0_5:                                                    // |                                      |                                     |         |
    ldr w9, [x0, x8, lsl #2]                               // |  4 v       v^                      : |  0                                  |  0      |
    mov x10, x8                                            // |  5 :       v:^                     : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    sub x11, x10, #1                                       // |  5 :        :v^                    : |  0                                  |  0      |
    ldr w12, [x0, w11, uxtw #2]                            // |  6 v        ::v^                   : |  0                                  |  0      |
    cmp w12, w9                                            // |  6 :        v::^                   : |  0                                  |  4 ^^^^ |
    b.le    LBB0_4                                         // |  5 :         :::                   : |  0                                  |  3 vv v |
    str w12, [x0, x10, lsl #2]                             // |  5 v         v:v                   : |  0                                  |  0      |
    add x12, x11, #1                                       // |  4 :          v^                   : |  0                                  |  0      |
    mov x10, x11                                           // |  4 :         ^v                    : |  0                                  |  0      |
    cmp x12, #1                                            // |  3 :           ^                   : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_6                                         // |  2 :                               : |  0                                  |  3 vv v |
    b   LBB0_3                                             // |  2 :                               : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  4 :                            ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  5 :                  ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  7 :                  ::^^       : v |  0                                  |  0      |
    ret                                                    // |  4 :                  ::         v   |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov w21, #10                                           // |  4 :                  ::^            |  0                                  |  0      |
    b   LBB0_12                                            // |  4 :                  :::            |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    add w8, w20, w20, lsr #31                              // |  5 :       ^          :v:            |  0                                  |  0      |
    asr w20, w8, #1                                        // |  5 :       v          :^:            |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    cmp w20, #1                                            // |  4 :                  :^:            |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  4 :                  :::            |  0                                  |  1  v   |
LBB0_12:                                                   // |                                      |                                     |         |
    and w8, w20, #0x80000001                               // |  5 :       ^          :v:            |  0                                  |  0      |
    cmp w8, #1                                             // |  5 :       ^          :::            |  0                                  |  4 ^^^^ |
    b.ne    LBB0_10                                        // |  4 :                  :::            |  0                                  |  1  v   |
    ldr w8, [x19]                                          // |  5 :       ^          v::            |  0                                  |  0      |
    cmp w8, w21                                            // |  5 :       ^          ::v            |  0                                  |  4 ^^^^ |
    b.lt    LBB0_15                                        // |  3 :                  ::             |  0                                  |  2 v  v |
    lsl w21, w21, #1                                       // |  4 :                  ::^            |  0                                  |  0      |
    sbfiz   x1, x21, #2, #32                               // |  5 :^                 ::v            |  0                                  |  0      |
    bl  _realloc                                           // |  4 :                  ::         ^   |  0                                  |  0      |
    ldr w8, [x19]                                          // |  4 :       ^          v:             |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    add w9, w8, #1                                         // |  5 :       v^         ::             |  0                                  |  0      |
    str w9, [x19]                                          // |  5 :       :v         v:             |  0                                  |  0      |
    str w20, [x0, w8, sxtw #2]                             // |  3 v       v           v             |  0                                  |  0      |
    add w8, w20, w20, lsl #1                               // |  2         ^           v             |  0                                  |  0      |
    add w20, w8, #1                                        // |  2         v           ^             |  0                                  |  0      |
    b   LBB0_11                                            // |  0                                   |  0                                  |  0      |
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
