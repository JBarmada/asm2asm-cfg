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
    cbz x0, LBB0_5                                         // |  3 ^                  :            : |  0                                  |  0      |
    ldrb    w8, [x19]                                      // |  3         ^          v            : |  0                                  |  0      |
    cmp w8, #91                                            // |  3         ^          :            : |  0                                  |  4 ^^^^ |
    cset    w9, eq                                         // |  3          ^         :            : |  0                                  |  1  v   |
    cmp w8, #93                                            // |  4         ^:         :            : |  0                                  |  4 ^^^^ |
    cset    w8, eq                                         // |  4         ^:         :            : |  0                                  |  1  v   |
    sub w8, w9, w8                                         // |  4         ^v         :            : |  0                                  |  0      |
    bic w8, w8, w8, asr #31                                // |  3         ^          :            : |  0                                  |  0      |
    mov w11, #1                                            // |  4         :  ^       :            : |  0                                  |  0      |
    mov x10, x8                                            // |  5         v ^:       :            : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov x9, x11                                            // |  5         :^ v       :            : |  0                                  |  0      |
    cmp x0, x11                                            // |  6 ^       :: v       :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_4                                         // |  4         ::         :            : |  0                                  |  1  v   |
    ldrb    w11, [x19, x9]                                 // |  5         :v ^       v            : |  0                                  |  0      |
    cmp w11, #91                                           // |  4         :: ^                    : |  0                                  |  4 ^^^^ |
    cinc    w10, w10, eq                                   // |  4         ::^                     : |  0                                  |  0      |
    cmp w11, #93                                           // |  4         :: ^                    : |  0                                  |  4 ^^^^ |
    cset    w11, eq                                        // |  4         :: ^                    : |  0                                  |  1  v   |
    sub w10, w10, w11                                      // |  5         ::^v                    : |  0                                  |  0      |
    bic w10, w10, w10, asr #31                             // |  4         ::^                     : |  0                                  |  0      |
    cmp w10, w8                                            // |  4         v:^                     : |  0                                  |  4 ^^^^ |
    csel    w8, w10, w8, gt                                // |  4         ^:v                     : |  0                                  |  3 vv v |
    sub w12, w8, #2                                        // |  4         v:  ^                   : |  0                                  |  0      |
    add x11, x9, #1                                        // |  4          v ^:                   : |  0                                  |  0      |
    cmp w10, w12                                           // |  4          :^ v                   : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_2                                         // |  2          :                      : |  0                                  |  3 vv v |
LBB0_4:                                                    // |                                      |                                     |         |
    cmp x0, x9                                             // |  3 ^        v                      : |  0                                  |  4 ^^^^ |
    cset    w0, hi                                         // |  2 ^                               : |  0                                  |  2  vv  |
LBB0_5:                                                    // |                                      |                                     |         |
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
