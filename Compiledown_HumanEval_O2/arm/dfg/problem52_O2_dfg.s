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
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    ldrb    w22, [x0]                                      // |  4 v                  :  ^         : |  0                                  |  0      |
    cbz w22, LBB0_5                                        // |  3                    :  ^         : |  0                                  |  0      |
    add x21, x19, #1                                       // |  3                    v ^          : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  4                    :^:          : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  4                    :^:          : |  0                                  |  0      |
    b   LBB0_3                                             // |  4                    :::          : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w22, [x21], #1                                 // |  5                    ::v^         : |  0                                  |  0      |
    cbz w22, LBB0_5                                        // |  4                    :: ^         : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    sxtb    w1, w22                                        // |  5  ^                 :: v         : |  0                                  |  0      |
    mov x0, x20                                            // |  5 ^                  :v :         : |  0                                  |  0      |
    mov w2, #11                                            // |  4   ^                :  :         : |  0                                  |  0      |
    bl  _memchr                                            // |  4                    :  :       ^ : |  0                                  |  0      |
    cbnz    x0, LBB0_2                                     // |  4 ^                  :  :         : |  0                                  |  0      |
    strb    w22, [x19], #1                                 // |  3                    v  v         : |  0                                  |  0      |
    b   LBB0_2                                             // |  2                    :            : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    strb    wzr, [x19]                                     // |  3                    v           v: |  0                                  |  0      |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
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
