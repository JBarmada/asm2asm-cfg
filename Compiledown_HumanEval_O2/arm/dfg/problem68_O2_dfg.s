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
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  4  v                 ^         :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  4         ^          :         :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  4         v          :         :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  4         v          :         :  : |  0                                  |  0      |
    stur    x8, [x29, #-24]                                // |  4         ^          :         v  : |  0                                  |  0      |
    strh    wzr, [sp, #32]                                 // |  4                    :         : vv |  0                                  |  0      |
    str xzr, [sp, #24]                                     // |  4                    :         : vv |  0                                  |  0      |
    strh    wzr, [sp, #16]                                 // |  4                    :         : vv |  0                                  |  0      |
    str xzr, [sp, #8]                                      // |  4                    :         : vv |  0                                  |  0      |
    ldrb    w12, [x0]                                      // |  5 v           ^      :         :  : |  0                                  |  0      |
    cbz w12, LBB0_8                                        // |  4             ^      :         :  : |  0                                  |  0      |
    mov w13, #0                                            // |  4              ^     :         :  : |  0                                  |  0      |
    mov w10, #0                                            // |  4           ^        :         :  : |  0                                  |  0      |
    add x8, x0, #1                                         // |  5 v       ^          :         :  : |  0                                  |  0      |
    add x9, sp, #24                                        // |  5         :^         :         :  v |  0                                  |  0      |
    add x11, sp, #8                                        // |  6         :: ^       :         :  v |  0                                  |  0      |
    b   LBB0_4                                             // |  6         :: :       :         :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w10, #0                                            // |  7         ::^:       :         :  : |  0                                  |  4 ^^^^ |
    cset    w12, eq                                        // |  7         :: :^      :         :  : |  0                                  |  1  v   |
    cmp w13, #0                                            // |  7         :: : ^     :         :  : |  0                                  |  4 ^^^^ |
    cset    w14, gt                                        // |  8         :: : :^    :         :  : |  0                                  |  3 vv v |
    tst w12, w14                                           // |  9         :: :^:v    :         :  : |  0                                  |  4 ^^^^ |
    csinc   w10, w10, wzr, eq                              // |  9         ::^: :     :         : v: |  0                                  |  1  v   |
    csel    w14, wzr, w13, ne                              // |  9         :: : v^    :         : v: |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrb    w12, [x8], #1                                  // |  8         v: :^ :    :         :  : |  0                                  |  0      |
    mov x13, x14                                           // |  7          : : ^v    :         :  : |  0                                  |  0      |
    cbz w12, LBB0_8                                        // |  7          : :^:     :         :  : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    sxtb    w14, w12                                       // |  8          : :v:^    :         :  : |  0                                  |  0      |
    sub w14, w14, #48                                      // |  8          : :::^    :         :  : |  0                                  |  0      |
    cmp w14, #9                                            // |  8          : :::^    :         :  : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_2                                         // |  7          : :::     :         :  : |  0                                  |  2  vv  |
    add w14, w13, #1                                       // |  8          : ::v^    :         :  : |  0                                  |  0      |
    cbz w10, LBB0_7                                        // |  8          :^:::     :         :  : |  0                                  |  0      |
    strb    w12, [x11, w13, sxtw]                          // |  7          : vvv     :         :  : |  0                                  |  0      |
    mov w10, #1                                            // |  7          :^ ::     :         :  : |  0                                  |  0      |
    b   LBB0_3                                             // |  6          :  ::     :         :  : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    strb    w12, [x9, w13, sxtw]                           // |  6          v  vv     :         :  : |  0                                  |  0      |
    b   LBB0_3                                             // |  3                    :         :  : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    add x0, sp, #24                                        // |  4 ^                  :         :  v |  0                                  |  0      |
    bl  _atoi                                              // |  5 :                  :         :^ : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^        :  : |  0                                  |  0      |
    add x0, sp, #8                                         // |  5 ^                  ::        :  v |  0                                  |  0      |
    bl  _atoi                                              // |  6 :                  ::        :^ : |  0                                  |  0      |
    ldur    x8, [x29, #-24]                                // |  6 :       ^          ::        v  : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  6 :       :^         ::           : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  6 :       :v         ::           : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  6 :       :v         ::           : |  0                                  |  0      |
    cmp x9, x8                                             // |  6 :       v^         ::           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_10                                        // |  4 :                  ::           : |  0                                  |  1  v   |
    add w8, w20, w0                                        // |  5 v       ^          :v           : |  0                                  |  0      |
    sub w0, w19, w8                                        // |  4 ^       v          v            : |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    add sp, sp, #80                                        // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
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
