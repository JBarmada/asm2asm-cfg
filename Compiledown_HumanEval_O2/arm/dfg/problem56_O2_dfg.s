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
    stp x28, x27, [sp, #-48]!                              // |  3                            vv   x |  0                                  |  0      |
    stp x20, x19, [sp, #16]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #32]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #32                                       // |  2                              ^  v |  0                                  |  0      |
    sub sp, sp, #4016                                      // |  2                              :  ^ |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w27, -40                                   // |                                      |                                     |         |
    .cfi_offset w28, -48                                   // |                                      |                                     |         |
    mov x19, x0                                            // |  4 v                  ^         :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  3         ^                    :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  3         v                    :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  3         v                    :  : |  0                                  |  0      |
    stur    x8, [x29, #-40]                                // |  3         ^                    v  : |  0                                  |  0      |
    add x20, sp, #8                                        // |  3                     ^        :  v |  0                                  |  0      |
    add x0, sp, #8                                         // |  4 ^                   :        :  v |  0                                  |  0      |
    mov w1, #4000                                          // |  4  ^                  :        :  : |  0                                  |  0      |
    bl  _bzero                                             // |  4                     :        :^ : |  0                                  |  0      |
    mov w8, #1                                             // |  4         ^           :        :  : |  0                                  |  0      |
    str w8, [sp, #12]                                      // |  4         v           :        :  v |  0                                  |  0      |
    cmp w19, #2                                            // |  3                    ^:        :    |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  3                    ::        :    |  0                                  |  2 v  v |
    add w9, w19, #1                                        // |  4          ^         v:        :    |  0                                  |  0      |
    add x8, x20, #8                                        // |  4         ^          :v        :    |  0                                  |  0      |
    sub x9, x9, #2                                         // |  5         :^         ::        :    |  0                                  |  0      |
    mov w10, #1                                            // |  5         : ^        ::        :    |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldur    w11, [x8, #-8]                                 // |  5         v  ^       ::        :    |  0                                  |  0      |
    add w10, w11, w10                                      // |  6         : ^v       ::        :    |  0                                  |  0      |
    str w10, [x8], #4                                      // |  5         v v        ::        :    |  0                                  |  0      |
    subs    x9, x9, #1                                     // |  4          ^         ::        :    |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3                    ::        :    |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr w0, [x20, w19, sxtw #2]                            // |  4 ^                  vv        :    |  0                                  |  0      |
    ldur    x8, [x29, #-40]                                // |  2         ^                    v    |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  2         :^                        |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  2         :v                        |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  2         :v                        |  0                                  |  0      |
    cmp x9, x8                                             // |  2         v^                        |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  0                                   |  0                                  |  1  v   |
    add sp, sp, #4016                                      // |  1                                 ^ |  0                                  |  0      |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x28, x27, [sp], #48                                // |  4                            ^^ : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh3, Lloh4, Lloh5                // |                                      |                                     |         |
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
