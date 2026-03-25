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
    sub sp, sp, #448                                       // |  1                                 ^ |  0                                  |  0      |
    stp x28, x27, [sp, #416]                               // |  3                            vv   v |  0                                  |  0      |
    stp x29, x30, [sp, #432]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #432                                      // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w27, -24                                   // |                                      |                                     |         |
    .cfi_offset w28, -32                                   // |                                      |                                     |         |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  3         ^                    :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  3         v                    :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  3         v                    :  : |  0                                  |  0      |
    stur    x8, [x29, #-24]                                // |  3         ^                    v  : |  0                                  |  0      |
    movi.2d v0, #0000000000000000                          // |  2                              :  : |  1 ^                                |  0      |
    stp q0, q0, [sp, #368]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #336]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #304]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #272]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #240]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #208]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #176]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #144]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #112]                                 // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #80]                                  // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #48]                                  // |  2                              :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #16]                                  // |  2                              :  v |  1 v                                |  0      |
    str q0, [sp]                                           // |  2                              :  v |  1 v                                |  0      |
    mov w8, #1                                             // |  3         ^                    :  : |  0                                  |  0      |
    str w8, [sp, #8]                                       // |  3         v                    :  v |  0                                  |  0      |
    cmp w0, #3                                             // |  3 ^                            :  : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  3 :                            :  : |  0                                  |  2 v  v |
    mov w11, #0                                            // |  4 :          ^                 :  : |  0                                  |  0      |
    add w9, w0, #1                                         // |  5 v        ^ :                 :  : |  0                                  |  0      |
    mov x8, sp                                             // |  5 :       ^  :                 :  v |  0                                  |  0      |
    orr x8, x8, #0xc                                       // |  5 :       ^  :                 :  : |  0                                  |  0      |
    sub x9, x9, #3                                         // |  6 :       :^ :                 :  : |  0                                  |  0      |
    mov w10, #1                                            // |  6 :       : ^:                 :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldur    w12, [x8, #-8]                                 // |  6 :       v  :^                :  : |  0                                  |  0      |
    add w10, w10, w11                                      // |  7 :       : ^v:                :  : |  0                                  |  0      |
    add w10, w12, w10                                      // |  6 :       : ^ v                :  : |  0                                  |  0      |
    str w10, [x8], #4                                      // |  6 :       v v :                :  : |  0                                  |  0      |
    mov x11, x12                                           // |  5 :          ^v                :  : |  0                                  |  0      |
    subs    x9, x9, #1                                     // |  4 :        ^                   :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3 :                            :  : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x8, sp                                             // |  4 :       ^                    :  v |  0                                  |  0      |
    ldr w0, [x8, w0, sxtw #2]                              // |  4 v       v                    :  : |  0                                  |  0      |
    ldur    x8, [x29, #-24]                                // |  3         ^                    v  : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^                      : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v                      : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v                      : |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1                                 : |  0                                  |  1  v   |
    ldp x29, x30, [sp, #432]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x28, x27, [sp, #416]                               // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #448                                       // |  2                               : ^ |  0                                  |  0      |
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
