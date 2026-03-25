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
    sub sp, sp, #128                                       // |  1                                 ^ |  0                                  |  0      |
    stp x29, x30, [sp, #112]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #112                                      // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    mov w8, #0                                             // |  3         ^                    :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  4         :^                   :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  4         :v                   :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  4         :v                   :  : |  0                                  |  0      |
    stur    x9, [x29, #-8]                                 // |  4         :^                   v  : |  0                                  |  0      |
    str xzr, [sp, #96]                                     // |  4         :                    : vv |  0                                  |  0      |
    movi.2d v0, #0000000000000000                          // |  3         :                    :  : |  1 ^                                |  0      |
    stp q0, q0, [sp, #64]                                  // |  3         :                    :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #32]                                  // |  3         :                    :  v |  1 v                                |  0      |
    stp q0, q0, [sp]                                       // |  3         :                    :  v |  1 v                                |  0      |
    mov x9, sp                                             // |  4         :^                   :  v |  0                                  |  0      |
    b   LBB0_2                                             // |  4         ::                   :  : |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    add x0, x0, #1                                         // |  5 ^       ::                   :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w10, [x0]                                      // |  6 v       ::^                  :  : |  0                                  |  0      |
    cmp w10, #32                                           // |  5         ::^                  :  : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_1                                         // |  4         ::                   :  : |  0                                  |  1  v   |
    cbz w10, LBB0_5                                        // |  5         ::^                  :  : |  0                                  |  0      |
    sxtb    x10, w10                                       // |  5         ::^                  :  : |  0                                  |  0      |
    add x10, x9, x10, lsl #2                               // |  5         :v^                  :  : |  0                                  |  0      |
    sub x10, x10, #388                                     // |  4         : ^                  :  : |  0                                  |  0      |
    ldr w11, [x10]                                         // |  5         : v^                 :  : |  0                                  |  0      |
    add w12, w11, #1                                       // |  6         : :v^                :  : |  0                                  |  0      |
    str w12, [x10]                                         // |  5         : v v                :  : |  0                                  |  0      |
    cmp w11, w8                                            // |  4         v  ^                 :  : |  0                                  |  4 ^^^^ |
    csinc   w8, w8, w11, lt                                // |  4         ^  v                 :  : |  0                                  |  2 v  v |
    b   LBB0_1                                             // |  3         :                    :  : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x10, #0                                            // |  4         : ^                  :  : |  0                                  |  0      |
    mov w9, #0                                             // |  4         :^                   :  : |  0                                  |  0      |
    mov x11, sp                                            // |  5         :: ^                 :  v |  0                                  |  0      |
    b   LBB0_7                                             // |  5         :: :                 :  : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x10, x10, #1                                       // |  6         ::^:                 :  : |  0                                  |  0      |
    cmp x10, #26                                           // |  6         ::^:                 :  : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_9                                         // |  6         ::::                 :  : |  0                                  |  1  v   |
LBB0_7:                                                    // |                                      |                                     |         |
    ldr w12, [x11, x10, lsl #2]                            // |  7         ::vv^                :  : |  0                                  |  0      |
    str w12, [x1, x10, lsl #2]                             // |  7  v      ::v v                :  : |  0                                  |  0      |
    cmp w12, w8                                            // |  6         v:: ^                :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_6                                         // |  5         :::                  :  : |  0                                  |  1  v   |
    add w12, w10, #97                                      // |  6         ::v ^                :  : |  0                                  |  0      |
    strb    w12, [x3, w9, sxtw]                            // |  6    v    :v  v                :  : |  0                                  |  0      |
    add w9, w9, #1                                         // |  4         :^                   :  : |  0                                  |  0      |
    b   LBB0_6                                             // |  4         ::                   :  : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    str w8, [x2]                                           // |  5   v     v:                   :  : |  0                                  |  0      |
    strb    wzr, [x3, w9, sxtw]                            // |  5    v     v                   : v: |  0                                  |  0      |
    ldur    x8, [x29, #-8]                                 // |  3         ^                    v  : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^                      : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v                      : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v                      : |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  1                                 : |  0                                  |  1  v   |
    ldp x29, x30, [sp, #112]                               // |  3                              ^^ v |  0                                  |  0      |
    add sp, sp, #128                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
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
