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
    stp x28, x27, [sp, #-80]!                              // |  3                            vv   x |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
    sub sp, sp, #1040                                      // |  2                              :  ^ |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    .cfi_offset w27, -72                                   // |                                      |                                     |         |
    .cfi_offset w28, -80                                   // |                                      |                                     |         |
    mov x20, x0                                            // |  4 v                   ^        :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  4         ^           :        :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  4         v           :        :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  4         v           :        :  : |  0                                  |  0      |
    stur    x8, [x29, #-72]                                // |  4         ^           :        v  : |  0                                  |  0      |
    add x21, sp, #8                                        // |  4                     :^       :  v |  0                                  |  0      |
    add x0, sp, #8                                         // |  5 ^                   ::       :  v |  0                                  |  0      |
    mov w1, #1024                                          // |  4  ^                  ::       :    |  0                                  |  0      |
    bl  _bzero                                             // |  4                     ::       :^   |  0                                  |  0      |
    ldrb    w0, [x20]                                      // |  4 ^                   v:       :    |  0                                  |  0      |
    cbz w0, LBB0_8                                         // |  3 ^                    :       :    |  0                                  |  0      |
    mov w19, #0                                            // |  3                    ^ :       :    |  0                                  |  0      |
    add x20, x20, #1                                       // |  3                     ^:       :    |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x22, __DefaultRuneLocale@GOTPAGE               // |  4                     ::^      :    |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x22, [x22, __DefaultRuneLocale@GOTPAGEOFF]         // |  4                     ::v      :    |  0                                  |  0      |
    mov w23, #1                                            // |  5                     :::^     :    |  0                                  |  0      |
    b   LBB0_3                                             // |  5                     ::::     :    |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    ldrb    w0, [x20], #1                                  // |  6 ^                   v:::     :    |  0                                  |  0      |
    cbz w0, LBB0_9                                         // |  5 ^                    :::     :    |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    bl  ___tolower                                         // |  6 :                    :::     :^   |  0                                  |  0      |
    sxtb    x24, w0                                        // |  6 v                    :::^    :    |  0                                  |  0      |
    ldr w8, [x21, x24, lsl #2]                             // |  6         ^            v::v    :    |  0                                  |  0      |
    cbnz    w8, LBB0_2                                     // |  6         ^            ::::    :    |  0                                  |  0      |
    and w0, w0, #0xff                                      // |  6 ^                    ::::    :    |  0                                  |  0      |
    cmp w0, #127                                           // |  6 ^                    ::::    :    |  0                                  |  4 ^^^^ |
    b.hi    LBB0_6                                         // |  6 :                    ::::    :    |  0                                  |  2  vv  |
    add x8, x22, w0, uxtw #2                               // |  7 v       ^            :v::    :    |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  5         v            : ::    :    |  0                                  |  0      |
    and w0, w8, #0x100                                     // |  6 ^       v            : ::    :    |  0                                  |  0      |
    cbnz    w0, LBB0_7                                     // |  5 ^                    : ::    :    |  0                                  |  0      |
    b   LBB0_2                                             // |  4                      : ::    :    |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w1, #256                                           // |  5  ^                   : ::    :    |  0                                  |  0      |
    bl  ___maskrune                                        // |  5                      : ::    :^   |  0                                  |  0      |
    cbz w0, LBB0_2                                         // |  5 ^                    : ::    :    |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    str w23, [x21, x24, lsl #2]                            // |  4                      v vv    :    |  0                                  |  0      |
    add w19, w19, #1                                       // |  2                    ^         :    |  0                                  |  0      |
    b   LBB0_2                                             // |  1                              :    |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w19, #0                                            // |  2                    ^         :    |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    ldur    x8, [x29, #-72]                                // |  3         ^          :         v    |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^         :              |  0                                  |  0      |
Lloh6:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v         :              |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v         :              |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^         :              |  0                                  |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  1                    :              |  0                                  |  1  v   |
    mov x0, x19                                            // |  2 ^                  v              |  0                                  |  0      |
    add sp, sp, #1040                                      // |  1                                 ^ |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x28, x27, [sp], #80                                // |  4                            ^^ : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpLdrGot Lloh3, Lloh4                           // |                                      |                                     |         |
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
