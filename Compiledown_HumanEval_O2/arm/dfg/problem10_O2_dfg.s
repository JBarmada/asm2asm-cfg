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
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  1  :                                |  0                                  |  2 v  v |
    stp x20, x19, [sp, #-32]!                              // |  4  :                 vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  4  :                           vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  3  :                           ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x20, x1                                            // |  3  v                  ^           : |  0                                  |  0      |
    mov x19, x0                                            // |  4 v                  ^:           : |  0                                  |  0      |
    ubfiz   x0, x20, #2, #32                               // |  4 ^                  :v           : |  0                                  |  0      |
    bl  _malloc                                            // |  4                    ::         ^ : |  0                                  |  0      |
    cbz x0, LBB0_4                                         // |  4 ^                  ::           : |  0                                  |  0      |
    mov x8, #0                                             // |  5 :       ^          ::           : |  0                                  |  0      |
    mov w10, w20                                           // |  6 :       : ^        :v           : |  0                                  |  0      |
    ldr w9, [x19]                                          // |  5 :       :^         v            : |  0                                  |  0      |
    lsl x10, x10, #2                                       // |  6 :       ::^        :            : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr w11, [x19, x8]                                     // |  6 :       v: ^       v            : |  0                                  |  0      |
    cmp w11, w9                                            // |  5 :       :v ^                    : |  0                                  |  4 ^^^^ |
    csel    w9, w11, w9, gt                                // |  5 :       :^ v                    : |  0                                  |  3 vv v |
    str w9, [x0, x8]                                       // |  4 v       vv                      : |  0                                  |  0      |
    add x8, x8, #4                                         // |  2         ^                       : |  0                                  |  0      |
    cmp x10, x8                                            // |  3         v ^                     : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  1                                 : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  4                    ^^         : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x0, #0                                             // |  2 ^                             :   |  0                                  |  0      |
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
