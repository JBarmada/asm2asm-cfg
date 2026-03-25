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
    mov x19, x3                                            // |  3    v               ^            : |  0                                  |  0      |
    mov x20, x2                                            // |  4   v                :^           : |  0                                  |  0      |
    mov x22, x1                                            // |  5  v                 :: ^         : |  0                                  |  0      |
    mov x23, x0                                            // |  6 v                  :: :^        : |  0                                  |  0      |
    bl  _strlen                                            // |  6                    :: ::      ^ : |  0                                  |  0      |
    add w8, w0, #1                                         // |  7 v       ^          :: ::        : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  7 ^       v          :: ::        : |  0                                  |  0      |
    bl  _malloc                                            // |  7 :                  :: ::      ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  7 v                  ::^::        : |  0                                  |  0      |
    ldrb    w11, [x23]                                     // |  7            ^       ::::v        : |  0                                  |  0      |
    cbz w11, LBB0_8                                        // |  7            ^       :::::        : |  0                                  |  0      |
    mov x9, #0                                             // |  8          ^ :       :::::        : |  0                                  |  0      |
    mov w8, #0                                             // |  8         ^  :       :::::        : |  0                                  |  0      |
    ldrb    w10, [x22], #1                                 // |  9         : ^:       :::v:        : |  0                                  |  0      |
    b   LBB0_4                                             // |  9         : ::       :::::        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    strb    w11, [x21, w8, sxtw]                           // |  9         v :v       ::v::        : |  0                                  |  0      |
    add w8, w8, #1                                         // |  8         ^ :        :::::        : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  8          ^:        :::::        : |  0                                  |  0      |
    ldrb    w11, [x23, x9]                                 // |  9          v:^       ::::v        : |  0                                  |  0      |
    cbz w11, LBB0_7                                        // |  7           :^       ::::         : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x12, x22                                           // |  7           : ^      :::v         : |  0                                  |  0      |
    mov x13, x10                                           // |  7           v :^     :::          : |  0                                  |  0      |
    cbz w10, LBB0_2                                        // |  7           ^ ::     :::          : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    cmp w11, w13                                           // |  7            ^:v     :::          : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_3                                         // |  5             :      :::          : |  0                                  |  1  v   |
    ldrb    w13, [x12], #1                                 // |  6             v^     :::          : |  0                                  |  0      |
    cbnz    w13, LBB0_5                                    // |  5              ^     :::          : |  0                                  |  0      |
    b   LBB0_2                                             // |  4                    :::          : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    sxtw    x8, w8                                         // |  5         ^          :::          : |  0                                  |  0      |
    b   LBB0_9                                             // |  4                    :::          : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov x8, #0                                             // |  5         ^          :::          : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    strb    wzr, [x21, x8]                                 // |  6         v          ::v         v: |  0                                  |  0      |
    mov x0, x21                                            // |  5 ^                  ::v          : |  0                                  |  0      |
    bl  _strlen                                            // |  5                    :::        ^ : |  0                                  |  0      |
    cmp w0, #2                                             // |  5 ^                  :::          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_13                                        // |  5 :                  :::          : |  0                                  |  2 v  v |
    ubfx    x8, x0, #1, #30                                // |  6 v       ^          :::          : |  0                                  |  0      |
    mov x9, #-4294967296                                   // |  6 :        ^         :::          : |  0                                  |  0      |
    add x11, x9, x0, lsl #32                               // |  7 v        v ^       :::          : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x10, l_.str.1@PAGE                             // |  7          :^:       :::          : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x10, x10, l_.str.1@PAGEOFF                         // |  7          :^:       :::          : |  0                                  |  0      |
    mov x12, x21                                           // |  8          :::^      ::v          : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str@PAGE                               // |  9          ::::      :::^         : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str@PAGEOFF                           // |  9          ::::      :::^         : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    ldrb    w13, [x12], #1                                 // |  9          :::v^     :::          : |  0                                  |  0      |
    asr x14, x11, #32                                      // |  8          ::v  ^    :::          : |  0                                  |  0      |
    ldrb    w14, [x21, x14]                                // |  7          ::   v    ::v          : |  0                                  |  0      |
    cmp w13, w14                                           // |  8          ::  ^v    :::          : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_14                                        // |  6          ::        :::          : |  0                                  |  1  v   |
    add x11, x11, x9                                       // |  7          v:^       :::          : |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  6         ^ :        :::          : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  5           :        :::          : |  0                                  |  1  v   |
    b   LBB0_15                                            // |  5           :        :::          : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
Lloh4:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str@PAGE                               // |  6           :        :::^         : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str@PAGEOFF                           // |  6           :        :::^         : |  0                                  |  0      |
    b   LBB0_15                                            // |  5           :        :::          : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    mov x22, x10                                           // |  6           v        :::^         : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov x0, x20                                            // |  6 ^                  :v::         : |  0                                  |  0      |
    mov x1, x21                                            // |  5  ^                 : v:         : |  0                                  |  0      |
    bl  _strcpy                                            // |  5                    : ::       ^ : |  0                                  |  0      |
    mov x0, x19                                            // |  5 ^                  v ::         : |  0                                  |  0      |
    mov x1, x22                                            // |  4  ^                   :v         : |  0                                  |  0      |
    bl  _strcpy                                            // |  3                      :        ^ : |  0                                  |  0      |
    mov x0, x21                                            // |  3 ^                    v          : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  3                    ^^           v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  3                      ^^         v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  3                        ^^       v |  0                                  |  0      |
    b   _free                                              // |  0                                   |  0                                  |  0      |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh4, Lloh5                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "True"                                         // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "False"                                        // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
