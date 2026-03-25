                                                           // +--------------------------------------+-------------------------------------+---------+
                                                           // |                 GPR                  |                VECTOR               |  FLAGS  |
                                                           // |                                      |                                     |         |
                                                           // |    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXS |    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV |    NZCV |
                                                           // |    0123456789111111111122222222223ZP |    01234567891111111111222222222233 |         |
                                                           // |  #           012345678901234567890R  |  #           0123456789012345678901 |  #      |
                                                           // +--------------------------------------+-------------------------------------+---------+
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .build_version macos, 15, 0 sdk_version 26, 2          // |                                      |                                     |         |
    .section    __TEXT,__literal16,16byte_literals         // |                                      |                                     |         |
    .p2align    4, 0x0                                     // |                                      |                                     |         |
lCPI0_0:                                                   // |                                      |                                     |         |
    .long   0                                              // |                                      |                                     |         |
    .long   0                                              // |                                      |                                     |         |
    .long   2                                              // |                                      |                                     |         |
    .long   0                                              // |                                      |                                     |         |
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
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
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x8, lCPI0_0@PAGE                               // |  3         ^                    :  : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr q0, [x8, lCPI0_0@PAGEOFF]                          // |  3         v                    :  : |  1 ^                                |  0      |
    str q0, [sp]                                           // |  2                              :  v |  1 v                                |  0      |
    cmp w0, #4                                             // |  3 ^                            :  : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  3 :                            :  : |  0                                  |  2 v  v |
    mov w11, #0                                            // |  4 :          ^                 :  : |  0                                  |  0      |
    mov w8, #0                                             // |  5 :       ^  :                 :  : |  0                                  |  0      |
    add w10, w0, #1                                        // |  5 v         ^:                 :  : |  0                                  |  0      |
    mov x9, sp                                             // |  5 :        ^ :                 :  v |  0                                  |  0      |
    orr x9, x9, #0x8                                       // |  5 :        ^ :                 :  : |  0                                  |  0      |
    sub x10, x10, #4                                       // |  6 :        :^:                 :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldr w12, [x9]                                          // |  6 :        v :^                :  : |  0                                  |  0      |
    add w8, w8, w11                                        // |  7 :       ^: v:                :  : |  0                                  |  0      |
    add w8, w12, w8                                        // |  6 :       ^:  v                :  : |  0                                  |  0      |
    ldur    w11, [x9, #-8]                                 // |  6 :        v ^:                :  : |  0                                  |  0      |
    add w8, w8, w11                                        // |  7 :       ^: v:                :  : |  0                                  |  0      |
    str w8, [x9, #8]                                       // |  6 :       vv  :                :  : |  0                                  |  0      |
    add x9, x9, #4                                         // |  5 :        ^  :                :  : |  0                                  |  0      |
    mov x11, x12                                           // |  5 :          ^v                :  : |  0                                  |  0      |
    subs    x10, x10, #1                                   // |  4 :         ^                  :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  3 :                            :  : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x8, sp                                             // |  4 :       ^                    :  v |  0                                  |  0      |
    ldr w0, [x8, w0, sxtw #2]                              // |  4 v       v                    :  : |  0                                  |  0      |
    ldur    x8, [x29, #-24]                                // |  3         ^                    v  : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^                      : |  0                                  |  0      |
Lloh6:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v                      : |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v                      : |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_5                                         // |  1                                 : |  0                                  |  1  v   |
    ldp x29, x30, [sp, #432]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x28, x27, [sp, #416]                               // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #448                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpLdr    Lloh3, Lloh4                           // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh5, Lloh6, Lloh7                // |                                      |                                     |         |
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
