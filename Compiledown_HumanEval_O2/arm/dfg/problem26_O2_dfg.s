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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov w0, #256                                           // |  3 ^                  :            : |  0                                  |  0      |
    bl  _malloc                                            // |  4 :                  :          ^ : |  0                                  |  0      |
    str wzr, [x19]                                         // |  4 :                  v           v: |  0                                  |  0      |
    cmp w20, #4                                            // |  4 :                  :^           : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_5                                         // |  3 :                  :            : |  0                                  |  2 v  v |
    mov w8, #0                                             // |  4 :       ^          :            : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w20, #1                                            // |  5 :       :          :^           : |  0                                  |  4 ^^^^ |
    b.le    LBB0_4                                         // |  5 :       :          ::           : |  0                                  |  3 vv v |
    add w9, w8, #1                                         // |  6 :       v^         ::           : |  0                                  |  0      |
    str w9, [x19]                                          // |  6 :       :v         v:           : |  0                                  |  0      |
    str w20, [x0, w8, sxtw #2]                             // |  4 v       v           v           : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #16]                                // |  4 :                            ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  5 :                  ^^         : v |  0                                  |  0      |
    ret                                                    // |  4 :                  ::         v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  4 :       ^          ::             |  0                                  |  0      |
    mov w9, #2                                             // |  5 :       :^         ::             |  0                                  |  0      |
    b   LBB0_8                                             // |  4 :       :          ::             |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    str w8, [x19]                                          // |  4 :       v          v:             |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    add w9, w9, #1                                         // |  4 :       :^          :             |  0                                  |  0      |
    mul w10, w9, w9                                        // |  5 :       :v^         :             |  0                                  |  0      |
    cmp w10, w20                                           // |  5 :       ::^         v             |  0                                  |  4 ^^^^ |
    b.gt    LBB0_2                                         // |  4 :       ::          :             |  0                                  |  3 vv v |
LBB0_8:                                                    // |                                      |                                     |         |
    sdiv    w10, w20, w9                                   // |  5 :       :v^         v             |  0                                  |  0      |
    msub    w10, w10, w9, w20                              // |  5 :       :v^         v             |  0                                  |  0      |
    cbnz    w10, LBB0_7                                    // |  4 :       ::^                       |  0                                  |  0      |
    add x10, x0, w8, sxtw #2                               // |  4 v       v:^                       |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    sdiv    w20, w20, w9                                   // |  3          v:         ^             |  0                                  |  0      |
    str w9, [x10], #4                                      // |  3          vv         :             |  0                                  |  0      |
    sdiv    w11, w20, w9                                   // |  3          v ^        v             |  0                                  |  0      |
    msub    w11, w11, w9, w20                              // |  3          v ^        v             |  0                                  |  0      |
    add w8, w8, #1                                         // |  1         ^                         |  0                                  |  0      |
    cbz w11, LBB0_10                                       // |  1            ^                      |  0                                  |  0      |
    b   LBB0_6                                             // |  0                                   |  0                                  |  0      |
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
