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
    mov x20, x0                                            // |  3 v                   ^           : |  0                                  |  0      |
    bl  _strlen                                            // |  3                     :         ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  4 v                   :^          : |  0                                  |  0      |
    cmp w21, #1                                            // |  3                     :^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  3                     ::          : |  0                                  |  2 v  v |
    mov w19, #0                                            // |  4                    ^::          : |  0                                  |  0      |
    and x23, x21, #0x7fffffff                              // |  4                     :v ^        : |  0                                  |  0      |
    mov x24, x20                                           // |  4                     v:  ^       : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str@PAGE                               // |  5                     ::^ :       : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str@PAGEOFF                           // |  5                     ::^ :       : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrsb   w1, [x24], #1                                  // |  6  ^                  ::: v       : |  0                                  |  0      |
    mov x0, x22                                            // |  5 ^                   ::v         : |  0                                  |  0      |
    mov w2, #11                                            // |  4   ^                 ::          : |  0                                  |  0      |
    bl  _memchr                                            // |  4                     ::        ^ : |  0                                  |  0      |
    cmp x0, #0                                             // |  4 ^                   ::          : |  0                                  |  4 ^^^^ |
    cinc    w19, w19, ne                                   // |  4                    ^::          : |  0                                  |  0      |
    subs    x23, x23, #1                                   // |  4                     :: ^        : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3                     ::          : |  0                                  |  1  v   |
    sub w8, w21, #1                                        // |  4         ^           :v          : |  0                                  |  0      |
    ldrb    w8, [x20, w8, uxtw]                            // |  3         v           v           : |  0                                  |  0      |
    orr w8, w8, #0x20                                      // |  2         ^                       : |  0                                  |  0      |
    cmp w8, #121                                           // |  2         ^                       : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_6                                         // |  1                                 : |  0                                  |  1  v   |
    add w19, w19, #1                                       // |  2                    ^            : |  0                                  |  0      |
    b   LBB0_6                                             // |  1                                 : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov w19, #0                                            // |  2                    ^            : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov x0, x19                                            // |  3 ^                  v            : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  4                        ^^     : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "aeiouAEIOU"                                   // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
