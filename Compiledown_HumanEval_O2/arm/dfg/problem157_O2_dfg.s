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
    strb    wzr, [x1]                                      // |  2  v                             v  |  0                                  |  0      |
    cmp w0, #1                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                         // |  1 :                                 |  0                                  |  2 v  v |
    stp x26, x25, [sp, #-80]!                              // |  4 :                        vv     x |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  4 :                      vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  4 :                    vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  4 :                  vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  4 :                            vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  3 :                            ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    .cfi_offset w25, -72                                   // |                                      |                                     |         |
    .cfi_offset w26, -80                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  4 :v                 ^            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov w8, #0                                             // |  3         ^          :            : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x22, l___const.func0.num@PAGE                  // |  3                    :  ^         : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x22, x22, l___const.func0.num@PAGEOFF              // |  3                    :  ^         : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x23, l___const.func0.rep@PAGE                  // |  4                    :  :^        : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x23, x23, l___const.func0.rep@PAGEOFF              // |  4                    :  :^        : |  0                                  |  0      |
    b   LBB0_3                                             // |  4                    :  ::        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w20, #0                                            // |  5                    :^ ::        : |  0                                  |  4 ^^^^ |
    cinc    w8, w24, gt                                    // |  6         ^          :  ::v       : |  0                                  |  3 :: : |
    b.le    LBB0_6                                         // |  5         :          :  ::        : |  0                                  |  3 vv v |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w24, w8                                            // |  6         v          :  ::^       : |  0                                  |  0      |
    ldr w25, [x22, w8, uxtw #2]                            // |  7         v          :  v::^      : |  0                                  |  0      |
    cmp w20, w25                                           // |  6                    :^  ::v      : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_2                                         // |  5                    :   :::      : |  0                                  |  2 v  v |
    ldr x21, [x23, x24, lsl #3]                            // |  6                    : ^ vv:      : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x0, x19                                            // |  5 ^                  v :   :      : |  0                                  |  0      |
    mov x1, x21                                            // |  4  ^                   v   :      : |  0                                  |  0      |
    bl  _strcat                                            // |  3                          :    ^ : |  0                                  |  0      |
    sub w20, w20, w25                                      // |  3                     ^    v      : |  0                                  |  0      |
    cmp w20, w25                                           // |  3                     ^    v      : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_5                                         // |  1                                 : |  0                                  |  2 v  v |
    b   LBB0_2                                             // |  1                                 : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  4                          ^^   : v |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "m"                                            // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "cm"                                           // |                                      |                                     |         |
l_.str.2:                                                  // |                                      |                                     |         |
    .asciz  "d"                                            // |                                      |                                     |         |
l_.str.3:                                                  // |                                      |                                     |         |
    .asciz  "cd"                                           // |                                      |                                     |         |
l_.str.4:                                                  // |                                      |                                     |         |
    .asciz  "c"                                            // |                                      |                                     |         |
l_.str.5:                                                  // |                                      |                                     |         |
    .asciz  "xc"                                           // |                                      |                                     |         |
l_.str.6:                                                  // |                                      |                                     |         |
    .asciz  "l"                                            // |                                      |                                     |         |
l_.str.7:                                                  // |                                      |                                     |         |
    .asciz  "xl"                                           // |                                      |                                     |         |
l_.str.8:                                                  // |                                      |                                     |         |
    .asciz  "x"                                            // |                                      |                                     |         |
l_.str.9:                                                  // |                                      |                                     |         |
    .asciz  "ix"                                           // |                                      |                                     |         |
l_.str.10:                                                 // |                                      |                                     |         |
    .asciz  "v"                                            // |                                      |                                     |         |
l_.str.11:                                                 // |                                      |                                     |         |
    .asciz  "iv"                                           // |                                      |                                     |         |
l_.str.12:                                                 // |                                      |                                     |         |
    .asciz  "i"                                            // |                                      |                                     |         |
    .section    __DATA,__const                             // |                                      |                                     |         |
    .p2align    3, 0x0                                     // |                                      |                                     |         |
l___const.func0.rep:                                       // |                                      |                                     |         |
    .quad   l_.str                                         // |                                      |                                     |         |
    .quad   l_.str.1                                       // |                                      |                                     |         |
    .quad   l_.str.2                                       // |                                      |                                     |         |
    .quad   l_.str.3                                       // |                                      |                                     |         |
    .quad   l_.str.4                                       // |                                      |                                     |         |
    .quad   l_.str.5                                       // |                                      |                                     |         |
    .quad   l_.str.6                                       // |                                      |                                     |         |
    .quad   l_.str.7                                       // |                                      |                                     |         |
    .quad   l_.str.8                                       // |                                      |                                     |         |
    .quad   l_.str.9                                       // |                                      |                                     |         |
    .quad   l_.str.10                                      // |                                      |                                     |         |
    .quad   l_.str.11                                      // |                                      |                                     |         |
    .quad   l_.str.12                                      // |                                      |                                     |         |
    .section    __TEXT,__const                             // |                                      |                                     |         |
    .p2align    2, 0x0                                     // |                                      |                                     |         |
l___const.func0.num:                                       // |                                      |                                     |         |
    .long   1000                                           // |                                      |                                     |         |
    .long   900                                            // |                                      |                                     |         |
    .long   500                                            // |                                      |                                     |         |
    .long   400                                            // |                                      |                                     |         |
    .long   100                                            // |                                      |                                     |         |
    .long   90                                             // |                                      |                                     |         |
    .long   50                                             // |                                      |                                     |         |
    .long   40                                             // |                                      |                                     |         |
    .long   10                                             // |                                      |                                     |         |
    .long   9                                              // |                                      |                                     |         |
    .long   5                                              // |                                      |                                     |         |
    .long   4                                              // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
