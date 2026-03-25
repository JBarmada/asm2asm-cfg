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
    sub sp, sp, #112                                       // |  1                                 ^ |  0                                  |  0      |
    stp x28, x27, [sp, #16]                                // |  3                            vv   v |  0                                  |  0      |
    stp x26, x25, [sp, #32]                                // |  3                          vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #48]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #64]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #80]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #96]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #96                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    .cfi_offset w25, -72                                   // |                                      |                                     |         |
    .cfi_offset w26, -80                                   // |                                      |                                     |         |
    .cfi_offset w27, -88                                   // |                                      |                                     |         |
    .cfi_offset w28, -96                                   // |                                      |                                     |         |
    str wzr, [x2]                                          // |  3   v                            v: |  0                                  |  0      |
    cmp w1, #0                                             // |  2  ^                              : |  0                                  |  4 ^^^^ |
    b.le    LBB0_18                                        // |  2  :                              : |  0                                  |  3 vv v |
    mov x20, x2                                            // |  4  :v                 ^           : |  0                                  |  0      |
    mov x19, x0                                            // |  5 v:                 ^:           : |  0                                  |  0      |
    mov x22, #0                                            // |  5  :                 :: ^         : |  0                                  |  0      |
    mov w23, #0                                            // |  5  :                 ::  ^        : |  0                                  |  0      |
    ubfiz   x24, x1, #3, #32                               // |  6  v                 ::  :^       : |  0                                  |  0      |
    b   LBB0_3                                             // |  4                    ::  :        : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x22, x22, #8                                       // |  5                    :: ^:        : |  0                                  |  0      |
    cmp x24, x22                                           // |  6                    :: v:^       : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_5                                         // |  5                    :: ::        : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldr x21, [x19, x22]                                    // |  6                    v:^v:        : |  0                                  |  0      |
    mov x0, x21                                            // |  6 ^                  ::v :        : |  0                                  |  0      |
    bl  _strlen                                            // |  6                    ::: :      ^ : |  0                                  |  0      |
    tbnz    w0, #0, LBB0_2                                 // |  6 ^                  ::: :        : |  0                                  |  0      |
    str x21, [x19, w23, sxtw #3]                           // |  5                    v:v v        : |  0                                  |  0      |
    add w23, w23, #1                                       // |  5                    ::: ^        : |  0                                  |  0      |
    str w23, [x20]                                         // |  5                    :v: v        : |  0                                  |  0      |
    b   LBB0_2                                             // |  4                    : : :        : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    subs    w24, w23, #1                                   // |  5                    : : v^       : |  0                                  |  4 ^^^^ |
    b.le    LBB0_16                                        // |  5                    : : ::       : |  0                                  |  3 vv v |
    mov w25, #0                                            // |  6                    : : ::^      : |  0                                  |  0      |
    add x8, x19, #8                                        // |  6         ^          v : ::       : |  0                                  |  0      |
    str x8, [sp, #8]                                       // |  6         v          : : ::       v |  0                                  |  0      |
    mov x8, x24                                            // |  6         ^          : : :v       : |  0                                  |  0      |
    b   LBB0_8                                             // |  5                    : : ::       : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    add w25, w25, #1                                       // |  6                    : : ::^      : |  0                                  |  0      |
    sub w8, w27, #1                                        // |  7         ^          : : ::  v    : |  0                                  |  0      |
    cmp w25, w24                                           // |  7         :          : : :v^      : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_16                                        // |  6         :          : : : :      : |  0                                  |  1  v   |
LBB0_8:                                                    // |                                      |                                     |         |
    mov w27, w8                                            // |  7         v          : : : : ^    : |  0                                  |  0      |
    sub w8, w25, w23                                       // |  7         ^          : : v v :    : |  0                                  |  0      |
    cmn w8, #2                                             // |  6         ^          : : :   :    : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_7                                         // |  5                    : : :   :    : |  0                                  |  3 vv v |
    ldr x20, [x19]                                         // |  6                    v^: :   :    : |  0                                  |  0      |
    mov x28, x27                                           // |  7                    ::: :   v^   : |  0                                  |  0      |
    ldr x26, [sp, #8]                                      // |  6                    ::: :  ^     v |  0                                  |  0      |
    b   LBB0_12                                            // |  6                    ::: :  :     : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    stp x21, x20, [x26, #-8]                               // |  6                    :vv :  v     : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    add x26, x26, #8                                       // |  5                    ::  :  ^     : |  0                                  |  0      |
    subs    x28, x28, #1                                   // |  6                    ::  :  : ^   : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  5                    ::  :  :     : |  0                                  |  1  v   |
LBB0_12:                                                   // |                                      |                                     |         |
    mov x0, x20                                            // |  6 ^                  :v  :  :     : |  0                                  |  0      |
    bl  _strlen                                            // |  7 :                  ::  :  :   ^ : |  0                                  |  0      |
    mov x22, x0                                            // |  7 v                  :: ^:  :     : |  0                                  |  0      |
    ldr x21, [x26]                                         // |  6                    ::^ :  v     : |  0                                  |  0      |
    mov x0, x21                                            // |  6 ^                  ::v :        : |  0                                  |  0      |
    bl  _strlen                                            // |  7 :                  ::: :      ^ : |  0                                  |  0      |
    cmp x22, x0                                            // |  7 v                  :::^:        : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_10                                        // |  5                    ::: :        : |  0                                  |  2  vv  |
    b.ne    LBB0_15                                        // |  5                    ::: :        : |  0                                  |  1  v   |
    mov x0, x20                                            // |  6 ^                  :v: :        : |  0                                  |  0      |
    mov x1, x21                                            // |  5  ^                 : v :        : |  0                                  |  0      |
    bl  _strcmp                                            // |  5                    : : :      ^ : |  0                                  |  0      |
    cmp w0, #1                                             // |  5 ^                  : : :        : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_10                                        // |  4                    : : :        : |  0                                  |  2 v  v |
LBB0_15:                                                   // |                                      |                                     |         |
    mov x20, x21                                           // |  5                    :^v :        : |  0                                  |  0      |
    b   LBB0_11                                            // |  3                    :   :        : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    sbfiz   x0, x23, #3, #32                               // |  4 ^                  :   v        : |  0                                  |  0      |
    bl  _malloc                                            // |  3                    :          ^ : |  0                                  |  0      |
    cmp w23, #1                                            // |  3                    :   ^        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_19                                        // |  3                    :   :        : |  0                                  |  2 v  v |
    ubfiz   x2, x23, #3, #32                               // |  4   ^                :   v        : |  0                                  |  0      |
    mov x1, x19                                            // |  3  ^                 v            : |  0                                  |  0      |
    ldp x29, x30, [sp, #96]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #80]                                // |  3                    ^^           v |  0                                  |  0      |
    ldp x22, x21, [sp, #64]                                // |  3                      ^^         v |  0                                  |  0      |
    ldp x24, x23, [sp, #48]                                // |  3                        ^^       v |  0                                  |  0      |
    ldp x26, x25, [sp, #32]                                // |  3                          ^^     v |  0                                  |  0      |
    ldp x28, x27, [sp, #16]                                // |  3                            ^^   v |  0                                  |  0      |
    add sp, sp, #112                                       // |  1                                 ^ |  0                                  |  0      |
    b   _memcpy                                            // |  1                                 : |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    mov x0, #0                                             // |  2 ^                               : |  0                                  |  0      |
    ldp x29, x30, [sp, #96]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #80]                                // |  3                    ^^           v |  0                                  |  0      |
    ldp x22, x21, [sp, #64]                                // |  3                      ^^         v |  0                                  |  0      |
    ldp x24, x23, [sp, #48]                                // |  3                        ^^       v |  0                                  |  0      |
    ldp x26, x25, [sp, #32]                                // |  3                          ^^     v |  0                                  |  0      |
    ldp x28, x27, [sp, #16]                                // |  3                            ^^   v |  0                                  |  0      |
    add sp, sp, #112                                       // |  1                                 ^ |  0                                  |  0      |
    b   _malloc                                            // |  1                                 : |  0                                  |  0      |
LBB0_19:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #96]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #80]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #64]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #48]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #32]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp, #16]                                // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #112                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
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
