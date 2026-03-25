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
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    bl  _strlen                                            // |  3                    :          ^ : |  0                                  |  0      |
    sub w22, w0, #2                                        // |  4 v                  :  ^         : |  0                                  |  0      |
    cmp w22, #1                                            // |  3                    :  ^         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                         // |  2                    :            : |  0                                  |  2 v  v |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  3                    :^           : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  3                    :^           : |  0                                  |  0      |
    b   LBB0_3                                             // |  3                    ::           : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    subs    x22, x22, #1                                   // |  4                    :: ^         : |  0                                  |  4 ^^^^ |
    b.le    LBB0_7                                         // |  4                    :: :         : |  0                                  |  3 vv v |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrsb   w21, [x19, x22]                                // |  5                    v:^v         : |  0                                  |  0      |
    mov x0, x20                                            // |  6 ^                  :v::         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    mov w2, #11                                            // |  6   ^                ::::         : |  0                                  |  0      |
    bl  _memchr                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    cbz x0, LBB0_2                                         // |  6 ^                  ::::         : |  0                                  |  0      |
    add x23, x19, x22                                      // |  6                    v::v^        : |  0                                  |  0      |
    ldrsb   w1, [x23, #1]                                  // |  5  ^                  :: v        : |  0                                  |  0      |
    mov x0, x20                                            // |  5 ^                   v: :        : |  0                                  |  0      |
    mov w2, #11                                            // |  5   ^                 :: :        : |  0                                  |  0      |
    bl  _memchr                                            // |  5                     :: :      ^ : |  0                                  |  0      |
    cbnz    x0, LBB0_2                                     // |  5 ^                   :: :        : |  0                                  |  0      |
    ldursb  w1, [x23, #-1]                                 // |  5  ^                  :: v        : |  0                                  |  0      |
    mov x0, x20                                            // |  4 ^                   v:          : |  0                                  |  0      |
    mov w2, #11                                            // |  3   ^                  :          : |  0                                  |  0      |
    bl  _memchr                                            // |  3                      :        ^ : |  0                                  |  0      |
    cbnz    x0, LBB0_2                                     // |  3 ^                    :          : |  0                                  |  0      |
    and w8, w21, #0xff                                     // |  3         ^            v          : |  0                                  |  0      |
    b   LBB0_8                                             // |  1                                 : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  2         ^                       : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x0, _func0.out@PAGE                            // |  3 ^       :                       : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x0, x0, _func0.out@PAGEOFF                         // |  3 ^       :                       : |  0                                  |  0      |
    strb    w8, [x0]                                       // |  3 v       v                       : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  4                        ^^     : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
.zerofill __DATA,__bss,_func0.out,2,0                      // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "AEIOUaeiou"                                   // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
