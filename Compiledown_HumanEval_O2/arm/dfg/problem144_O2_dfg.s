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
    stp x24, x23, [sp, #-64]!                              // |  3                        vv       x |  0                                  |  0      |
    stp x22, x21, [sp, #16]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #32]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #48]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #48                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov x23, #0                                            // |  4                    ::  ^        : |  0                                  |  0      |
    mov w22, #0                                            // |  4                    :: ^         : |  0                                  |  0      |
    mov w21, #0                                            // |  5                    ::^:         : |  0                                  |  0      |
    mov w24, #32                                           // |  6                    :::: ^       : |  0                                  |  0      |
    b   LBB0_3                                             // |  6                    :::: :       : |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    add x0, x19, w21, sxtw                                 // |  7 ^                  v:v: :       : |  0                                  |  0      |
    mov w2, w22                                            // |  6   ^                :: v :       : |  0                                  |  0      |
    sub x1, x8, x2                                         // |  8  ^v     v          :: : :       : |  0                                  |  0      |
    bl  _memcpy                                            // |  6                    :: : :     ^ : |  0                                  |  0      |
    add w21, w21, w22                                      // |  6                    ::^v :       : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w22, #0                                            // |  5                    :: ^ :       : |  0                                  |  0      |
    add x23, x23, #1                                       // |  5                    ::  ^:       : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x8, x20, x23                                       // |  6         ^          :v  v:       : |  0                                  |  0      |
    ldrb    w9, [x8]                                       // |  5         v^         :    :       : |  0                                  |  0      |
    cmp w9, #32                                            // |  5         :^         :    :       : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  4         :          :    :       : |  0                                  |  1  v   |
    cbz w9, LBB0_13                                        // |  5         :^         :    :       : |  0                                  |  0      |
    add w22, w22, #1                                       // |  5         :          :  ^ :       : |  0                                  |  0      |
    add x23, x23, #1                                       // |  5         :          :   ^:       : |  0                                  |  0      |
    b   LBB0_3                                             // |  4         :          :    :       : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    cmp w22, #2                                            // |  5         :          :  ^ :       : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_2                                         // |  4         :          :    :       : |  0                                  |  2 v  v |
    cmp w22, #4                                            // |  5         :          :  ^ :       : |  0                                  |  4 ^^^^ |
    b.lo    LBB0_11                                        // |  5         :          :  : :       : |  0                                  |  1   v  |
    mov w9, #3                                             // |  6         :^         :  : :       : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    sub w10, w9, #1                                        // |  7         :v^        :  : :       : |  0                                  |  0      |
    udiv    w11, w22, w10                                  // |  8         ::v^       :  v :       : |  0                                  |  0      |
    msub    w10, w11, w10, w22                             // |  8         ::^v       :  v :       : |  0                                  |  0      |
    cbz w10, LBB0_2                                        // |  7         ::^        :  : :       : |  0                                  |  0      |
    mul w10, w9, w9                                        // |  7         :v^        :  : :       : |  0                                  |  0      |
    add w9, w9, #1                                         // |  6         :^         :  : :       : |  0                                  |  0      |
    cmp w10, w22                                           // |  6         : ^        :  v :       : |  0                                  |  4 ^^^^ |
    b.le    LBB0_9                                         // |  4         :          :    :       : |  0                                  |  3 vv v |
LBB0_11:                                                   // |                                      |                                     |         |
    cmp w21, #1                                            // |  5         :          : ^  :       : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_1                                         // |  5         :          : :  :       : |  0                                  |  2 v  v |
    strb    w24, [x19, w21, uxtw]                          // |  5         :          v v  v       : |  0                                  |  0      |
    add w21, w21, #1                                       // |  4         :          : ^          : |  0                                  |  0      |
    b   LBB0_1                                             // |  3         :          :            : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    cmp w22, #2                                            // |  4         :          :  ^         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_21                                        // |  3         :          :            : |  0                                  |  2 v  v |
    cmp w22, #4                                            // |  4         :          :  ^         : |  0                                  |  4 ^^^^ |
    b.lo    LBB0_18                                        // |  4         :          :  :         : |  0                                  |  1   v  |
    mov w9, #3                                             // |  5         :^         :  :         : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    sub w10, w9, #1                                        // |  6         :v^        :  :         : |  0                                  |  0      |
    udiv    w11, w22, w10                                  // |  7         ::v^       :  v         : |  0                                  |  0      |
    msub    w10, w11, w10, w22                             // |  7         ::^v       :  v         : |  0                                  |  0      |
    cbz w10, LBB0_21                                       // |  6         ::^        :  :         : |  0                                  |  0      |
    mul w10, w9, w9                                        // |  6         :v^        :  :         : |  0                                  |  0      |
    add w9, w9, #1                                         // |  5         :^         :  :         : |  0                                  |  0      |
    cmp w10, w22                                           // |  5         : ^        :  v         : |  0                                  |  4 ^^^^ |
    b.le    LBB0_16                                        // |  4         :          :  :         : |  0                                  |  3 vv v |
LBB0_18:                                                   // |                                      |                                     |         |
    cmp w21, #1                                            // |  5         :          : ^:         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_20                                        // |  5         :          : ::         : |  0                                  |  2 v  v |
    mov w9, #32                                            // |  6         :^         : ::         : |  0                                  |  0      |
    strb    w9, [x19, w21, uxtw]                           // |  6         :v         v v:         : |  0                                  |  0      |
    add w21, w21, #1                                       // |  5         :          : ^:         : |  0                                  |  0      |
LBB0_20:                                                   // |                                      |                                     |         |
    add x0, x19, w21, sxtw                                 // |  6 ^       :          v v:         : |  0                                  |  0      |
    mov w2, w22                                            // |  5   ^     :          :  v         : |  0                                  |  0      |
    sub x1, x8, x2                                         // |  6  ^v     v          :  :         : |  0                                  |  0      |
    bl  _memcpy                                            // |  4                    :  :       ^ : |  0                                  |  0      |
    add w21, w21, w22                                      // |  4                    : ^v         : |  0                                  |  0      |
LBB0_21:                                                   // |                                      |                                     |         |
    strb    wzr, [x19, w21, sxtw]                          // |  4                    v v         v: |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  4                        ^^     : v |  0                                  |  0      |
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
