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
    cmp w1, #1                                             // |  2  ^                              : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  2  :                              : |  0                                  |  2 v  v |
    mov x19, x0                                            // |  4 v:                 ^            : |  0                                  |  0      |
    mov w22, #0                                            // |  4  :                 :  ^         : |  0                                  |  0      |
    mov w23, w1                                            // |  4  v                 :   ^        : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  3                    :^           : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  3                    :^           : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr x21, [x19], #8                                     // |  3                    v ^          : |  0                                  |  0      |
    mov x0, x21                                            // |  3 ^                    v          : |  0                                  |  0      |
    bl  _strlen                                            // |  4 :                    :        ^ : |  0                                  |  0      |
    cmp w22, w0                                            // |  4 v                    :^         : |  0                                  |  4 ^^^^ |
    csel    w22, w22, w0, gt                               // |  4 v                    :^         : |  0                                  |  3 vv v |
    csel    x20, x21, x20, lt                              // |  3                     ^v          : |  0                                  |  2 v  v |
    subs    x23, x23, #1                                   // |  2                        ^        : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  1                                 : |  0                                  |  1  v   |
    b   LBB0_4                                             // |  1                                 : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  2                     ^           : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  2                     ^           : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  4                        ^^     : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .space  1                                              // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
