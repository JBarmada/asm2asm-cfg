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
    sub sp, sp, #80                                        // |  1                                 ^ |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    cmp w0, #1                                             // |  3 ^                  :            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  2                    :            : |  0                                  |  2 v  v |
    neg w22, w19                                           // |  3                    v  ^         : |  0                                  |  0      |
    mov w21, #2                                            // |  3                      ^:         : |  0                                  |  0      |
    mov w23, #1                                            // |  3                       :^        : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  4                     ^ ::        : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  4                     ^ ::        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    str x23, [sp]                                          // |  4                     : :v        v |  0                                  |  0      |
    mov x0, #0                                             // |  4 ^                   : :         : |  0                                  |  0      |
    mov x1, #0                                             // |  5 :^                  : :         : |  0                                  |  0      |
    mov x2, x20                                            // |  5 : ^                 v :         : |  0                                  |  0      |
    bl  _snprintf                                          // |  4 :                     :       ^ : |  0                                  |  0      |
    add w21, w0, w21                                       // |  4 v                    ^:         : |  0                                  |  0      |
    add w23, w23, #1                                       // |  4                      ::^        : |  0                                  |  0      |
    add w8, w22, w23                                       // |  5         ^            :vv        : |  0                                  |  0      |
    cmp w8, #1                                             // |  3         ^            :          : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  2                      :          : |  0                                  |  1  v   |
    sxtw    x0, w21                                        // |  3 ^                    v          : |  0                                  |  0      |
    b   LBB0_5                                             // |  1                                 : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w0, #2                                             // |  2 ^                               : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    bl  _malloc                                            // |  3 :                             ^ : |  0                                  |  0      |
    mov x20, x0                                            // |  3 v                   ^           : |  0                                  |  0      |
    cbz x0, LBB0_9                                         // |  3 ^                   :           : |  0                                  |  0      |
    mov w8, #48                                            // |  3         ^           :           : |  0                                  |  0      |
    strh    w8, [x20]                                      // |  3         v           v           : |  0                                  |  0      |
    cmp w19, #1                                            // |  3                    ^:           : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_9                                         // |  3                    ::           : |  0                                  |  2 v  v |
    add x21, x20, #1                                       // |  4                    :v^          : |  0                                  |  0      |
    neg w22, w19                                           // |  5                    v::^         : |  0                                  |  0      |
    mov w23, #1                                            // |  5                     :::^        : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x19, l_.str@PAGE                               // |  6                    ^::::        : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x19, x19, l_.str@PAGEOFF                           // |  6                    ^::::        : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    str x23, [sp]                                          // |  6                    ::::v        v |  0                                  |  0      |
    mov x0, x21                                            // |  6 ^                  ::v:         : |  0                                  |  0      |
    mov x1, x19                                            // |  6 :^                 v: :         : |  0                                  |  0      |
    bl  _sprintf                                           // |  5 :                   : :       ^ : |  0                                  |  0      |
    add x21, x21, w0, sxtw                                 // |  5 v                   :^:         : |  0                                  |  0      |
    add w23, w23, #1                                       // |  4                     : :^        : |  0                                  |  0      |
    add w8, w22, w23                                       // |  5         ^           : vv        : |  0                                  |  0      |
    cmp w8, #1                                             // |  3         ^           :           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_8                                         // |  2                     :           : |  0                                  |  1  v   |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    add sp, sp, #80                                        // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  " %d"                                          // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
