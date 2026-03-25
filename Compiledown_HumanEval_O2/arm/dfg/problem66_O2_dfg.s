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
    stp x22, x21, [sp, #80]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #96]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #112]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #112                                      // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    mov x20, x1                                            // |  4  v                  ^        :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  4         ^           :        :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  4         v           :        :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  4         v           :        :  : |  0                                  |  0      |
    stur    x8, [x29, #-40]                                // |  4         ^           :        v  : |  0                                  |  0      |
    str x0, [sp]                                           // |  4 v                   :        :  v |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x19, _func0.xs@PAGE                            // |  4                    ^:        :  : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    add x19, x19, _func0.xs@PAGEOFF                        // |  4                    ^:        :  : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    adrp    x3, l_.str@PAGE                                // |  5    ^               ::        :  : |  0                                  |  0      |
Lloh6:                                                     // |                                      |                                     |         |
    add x3, x3, l_.str@PAGEOFF                             // |  5    ^               ::        :  : |  0                                  |  0      |
    mov x0, x19                                            // |  5 ^                  v:        :  : |  0                                  |  0      |
    mov w1, #0                                             // |  5  ^                 ::        :  : |  0                                  |  0      |
    mov w2, #50                                            // |  5   ^                ::        :  : |  0                                  |  0      |
    bl  ___sprintf_chk                                     // |  5                    ::        :^ : |  0                                  |  0      |
    mov x0, x19                                            // |  5 ^                  v:        :  : |  0                                  |  0      |
    bl  _strlen                                            // |  6 :                  ::        :^ : |  0                                  |  0      |
    subs    w21, w0, w20                                   // |  6 v                  :v^       :  : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_4                                         // |  4                    : :       :  : |  0                                  |  2 v  v |
    cmp w0, #2                                             // |  5 ^                  : :       :  : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_5                                         // |  5 :                  : :       :  : |  0                                  |  2 v  v |
    and x9, x0, #0x7fffffff                                // |  6 v        ^         : :       :  : |  0                                  |  0      |
    ubfx    x8, x0, #1, #30                                // |  6 v       ^          : :       :  : |  0                                  |  0      |
    add x9, x9, x19                                        // |  6 :        ^         v :       :  : |  0                                  |  0      |
    sub x9, x9, #1                                         // |  6 :        ^         : :       :  : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrb    w10, [x19]                                     // |  7 :        :^        v :       :  : |  0                                  |  0      |
    ldrb    w11, [x9]                                      // |  8 :        v:^       : :       :  : |  0                                  |  0      |
    strb    w11, [x19], #1                                 // |  8 :        ::v       v :       :  : |  0                                  |  0      |
    strb    w10, [x9], #-1                                 // |  7 :        vv        : :       :  : |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  6 :       ^          : :       :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  5 :                  : :       :  : |  0                                  |  1  v   |
    b   LBB0_5                                             // |  5 :                  : :       :  : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    add x8, x19, w0, sxtw                                  // |  6 v       ^          v :       :  : |  0                                  |  0      |
    sxtw    x20, w20                                       // |  6         :          :^:       :  : |  0                                  |  0      |
    sub x1, x8, x20                                        // |  7  ^      v          :v:       :  : |  0                                  |  0      |
    add x22, sp, #22                                       // |  6                    :::^      :  v |  0                                  |  0      |
    add x0, sp, #22                                        // |  7 ^                  ::::      :  v |  0                                  |  0      |
    mov w2, #50                                            // |  7   ^                ::::      :  : |  0                                  |  0      |
    bl  ___strcpy_chk                                      // |  7                    ::::      :^ : |  0                                  |  0      |
    strb    wzr, [x22, x20]                                // |  7                    :v:v      : v: |  0                                  |  0      |
    sxtw    x2, w21                                        // |  5   ^                : v       :  : |  0                                  |  0      |
    add x0, sp, #22                                        // |  4 ^                  :         :  v |  0                                  |  0      |
    mov x1, x19                                            // |  4  ^                 v         :  : |  0                                  |  0      |
    mov w3, #50                                            // |  4    ^               :         :  : |  0                                  |  0      |
    bl  ___strncat_chk                                     // |  4                    :         :^ : |  0                                  |  0      |
    add x1, sp, #22                                        // |  4  ^                 :         :  v |  0                                  |  0      |
    mov x0, x19                                            // |  4 ^                  v         :  : |  0                                  |  0      |
    mov w2, #50                                            // |  3   ^                          :  : |  0                                  |  0      |
    bl  ___strcpy_chk                                      // |  3                              :^ : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    ldur    x8, [x29, #-40]                                // |  3         ^                    v  : |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^                      : |  0                                  |  0      |
Lloh8:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v                      : |  0                                  |  0      |
Lloh9:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v                      : |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_7                                         // |  1                                 : |  0                                  |  1  v   |
Lloh10:                                                    // |                                      |                                     |         |
    adrp    x0, _func0.xs@PAGE                             // |  2 ^                               : |  0                                  |  0      |
Lloh11:                                                    // |                                      |                                     |         |
    add x0, x0, _func0.xs@PAGEOFF                          // |  2 ^                               : |  0                                  |  0      |
    ldp x29, x30, [sp, #112]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #96]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #80]                                // |  4                      ^^       : v |  0                                  |  0      |
    add sp, sp, #128                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpAdd    Lloh5, Lloh6                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh3, Lloh4                           // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh7, Lloh8, Lloh9                // |                                      |                                     |         |
    .loh AdrpAdd    Lloh10, Lloh11                         // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
.zerofill __DATA,__bss,_func0.xs,50,0                      // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "%d"                                           // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
