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
    cmp w0, w1                                             // |  2 ^v                                |  0                                  |  4 ^^^^ |
    b.le    LBB0_2                                         // |  0                                   |  0                                  |  3 vv v |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str@PAGE                                // |  1 ^                                 |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str@PAGEOFF                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  2 :                             v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    stp x20, x19, [sp, #-32]!                              // |  4 :                  vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  4 :                            vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  3 :                            ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    add w19, w1, w0                                        // |  4 vv                 ^            : |  0                                  |  0      |
    mov w0, #33                                            // |  3 ^                  :            : |  0                                  |  0      |
    bl  _malloc                                            // |  4 :                  :          ^ : |  0                                  |  0      |
    strb    wzr, [x0]                                      // |  4 v                  :           v: |  0                                  |  0      |
    strb    wzr, [x0, #32]!                                // |  4 x                  :           v: |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add w8, w19, w19, lsr #31                              // |  4 :       ^          v            : |  0                                  |  0      |
    asr w8, w8, #1                                         // |  3 :       ^                       : |  0                                  |  0      |
    and w9, w8, #0x1                                       // |  4 :       v^                      : |  0                                  |  0      |
    cmp w8, #0                                             // |  3 :       ^                       : |  0                                  |  4 ^^^^ |
    cneg    w9, w9, lt                                     // |  4 :       :^                      : |  0                                  |  0      |
    add w9, w9, #48                                        // |  4 :       :^                      : |  0                                  |  0      |
    strb    w9, [x0, #-1]!                                 // |  4 x       :v                      : |  0                                  |  0      |
    cmp w19, #3                                            // |  3         :          ^            : |  0                                  |  4 ^^^^ |
    mov x19, x8                                            // |  3         v          ^            : |  0                                  |  3 :: : |
    b.gt    LBB0_3                                         // |  1                                 : |  0                                  |  3 vv v |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  4                    ^^         : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "-1"                                           // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
