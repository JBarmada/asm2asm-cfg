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
    stp x26, x25, [sp, #-80]!                              // |  3                          vv     x |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
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
    mov x19, x2                                            // |  3   v                ^            : |  0                                  |  0      |
    mov x20, x1                                            // |  4  v                 :^           : |  0                                  |  0      |
    mov x21, x0                                            // |  5 v                  ::^          : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str@PAGE                               // |  5                    :::^         : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str@PAGEOFF                           // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  ::::         : |  0                                  |  4 ^^^^ |
    csetm   w23, ne                                        // |  6                    ::::^        : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x20                                            // |  5  ^                 :v:          : |  0                                  |  0      |
    bl  _strcmp                                            // |  5                    :::        ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  5 ^                  :::          : |  0                                  |  4 ^^^^ |
    csetm   w24, ne                                        // |  5                    :::  ^       : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str.1@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str.1@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  ::::         : |  0                                  |  4 ^^^^ |
    csinc   w23, w23, wzr, ne                              // |  7                    ::::^       v: |  0                                  |  1  v   |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x20                                            // |  5  ^                 :v:          : |  0                                  |  0      |
    bl  _strcmp                                            // |  5                    :::        ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  5 ^                  :::          : |  0                                  |  4 ^^^^ |
    csinc   w24, w24, wzr, ne                              // |  6                    :::  ^      v: |  0                                  |  1  v   |
Lloh4:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str.2@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str.2@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    mov w25, #2                                            // |  6                    ::::  ^      : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  ::::  :      : |  0                                  |  4 ^^^^ |
    csel    w23, w25, w23, eq                              // |  7                    ::::^ v      : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v  :      : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:   :      : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :::   :    ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  :::   :      : |  0                                  |  4 ^^^^ |
    csel    w24, w25, w24, eq                              // |  6                    :::  ^v      : |  0                                  |  1  v   |
Lloh6:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str.3@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str.3@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    mov w25, #3                                            // |  6                    ::::  ^      : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  ::::  :      : |  0                                  |  4 ^^^^ |
    csel    w23, w25, w23, eq                              // |  7                    ::::^ v      : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v  :      : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:   :      : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :::   :    ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  :::   :      : |  0                                  |  4 ^^^^ |
    csel    w24, w25, w24, eq                              // |  6                    :::  ^v      : |  0                                  |  1  v   |
Lloh8:                                                     // |                                      |                                     |         |
    adrp    x22, l_.str.4@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh9:                                                     // |                                      |                                     |         |
    add x22, x22, l_.str.4@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    mov w25, #4                                            // |  6                    ::::  ^      : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  ::::  :      : |  0                                  |  4 ^^^^ |
    csel    w23, w25, w23, eq                              // |  7                    ::::^ v      : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v  :      : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:   :      : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :::   :    ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  :::   :      : |  0                                  |  4 ^^^^ |
    csel    w24, w25, w24, eq                              // |  6                    :::  ^v      : |  0                                  |  1  v   |
Lloh10:                                                    // |                                      |                                     |         |
    adrp    x22, l_.str.5@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh11:                                                    // |                                      |                                     |         |
    add x22, x22, l_.str.5@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    mov w25, #5                                            // |  6                    ::::  ^      : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  ::::  :      : |  0                                  |  4 ^^^^ |
    csel    w23, w25, w23, eq                              // |  7                    ::::^ v      : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v  :      : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:   :      : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :::   :    ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  :::   :      : |  0                                  |  4 ^^^^ |
    csel    w24, w25, w24, eq                              // |  6                    :::  ^v      : |  0                                  |  1  v   |
Lloh12:                                                    // |                                      |                                     |         |
    adrp    x22, l_.str.6@PAGE                             // |  5                    :::^         : |  0                                  |  0      |
Lloh13:                                                    // |                                      |                                     |         |
    add x22, x22, l_.str.6@PAGEOFF                         // |  5                    :::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  6 ^                  :::v         : |  0                                  |  0      |
    mov x1, x21                                            // |  6  ^                 ::v:         : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    ::::       ^ : |  0                                  |  0      |
    mov w25, #6                                            // |  6                    ::::  ^      : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  ::::  :      : |  0                                  |  4 ^^^^ |
    csel    w23, w25, w23, eq                              // |  7                    ::::^ v      : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v  :      : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:   :      : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :::   :    ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  6 ^                  :::   :      : |  0                                  |  4 ^^^^ |
    csel    w24, w25, w24, eq                              // |  6                    :::  ^v      : |  0                                  |  1  v   |
Lloh14:                                                    // |                                      |                                     |         |
    adrp    x22, l_.str.7@PAGE                             // |  6                    :::^ :       : |  0                                  |  0      |
Lloh15:                                                    // |                                      |                                     |         |
    add x22, x22, l_.str.7@PAGEOFF                         // |  6                    :::^ :       : |  0                                  |  0      |
    mov x0, x22                                            // |  7 ^                  :::v :       : |  0                                  |  0      |
    mov x1, x21                                            // |  7  ^                 ::v: :       : |  0                                  |  0      |
    bl  _strcmp                                            // |  6                    :: : :     ^ : |  0                                  |  0      |
    mov w21, #7                                            // |  6                    ::^: :       : |  0                                  |  0      |
    cmp w0, #0                                             // |  7 ^                  :::: :       : |  0                                  |  4 ^^^^ |
    csel    w23, w21, w23, eq                              // |  7                    ::v:^:       : |  0                                  |  1  v   |
    mov x0, x22                                            // |  7 ^                  :::v :       : |  0                                  |  0      |
    mov x1, x20                                            // |  6  ^                 :v:  :       : |  0                                  |  0      |
    bl  _strcmp                                            // |  5                    : :  :     ^ : |  0                                  |  0      |
    cmp w0, #0                                             // |  5 ^                  : :  :       : |  0                                  |  4 ^^^^ |
    csel    w8, w21, w24, eq                               // |  5         ^          : v  v       : |  0                                  |  1  v   |
    cmn w23, #1                                            // |  3                    :   ^        : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  2                    :            : |  0                                  |  1  v   |
    cmn w8, #1                                             // |  3         ^          :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  3         :          :            : |  0                                  |  1  v   |
    cmp w23, w8                                            // |  4         v          :   ^        : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_10                                        // |  4         :          :   :        : |  0                                  |  2  v:  |
    csel    w21, w23, w8, hi                               // |  5         v          : ^ v        : |  0                                  |  2  vv  |
    csel    w20, w23, w8, lo                               // |  6         v          :^: v        : |  0                                  |  1   v  |
    mvn w8, w20                                            // |  5         ^          :v:          : |  0                                  |  0      |
    add w8, w21, w8                                        // |  5         ^          ::v          : |  0                                  |  0      |
    str w8, [x19]                                          // |  5         v          v::          : |  0                                  |  0      |
    cmp w8, #1                                             // |  5         ^          :::          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_10                                        // |  5         :          :::          : |  0                                  |  2 v  v |
    ubfiz   x0, x8, #3, #32                                // |  6 ^       v          :::          : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                  :::        ^ : |  0                                  |  0      |
    add w14, w20, #1                                       // |  6 :             ^    :v:          : |  0                                  |  0      |
    cmp w14, w21                                           // |  6 :             ^    ::v          : |  0                                  |  4 ^^^^ |
    b.hs    LBB0_11                                        // |  6 :             :    :::          : |  0                                  |  4 ^^v^ |
    sub w10, w21, w20                                      // |  7 :         ^   :    :vv          : |  0                                  |  0      |
    sub w9, w10, #2                                        // |  7 :        ^v   :    ::           : |  0                                  |  0      |
Lloh16:                                                    // |                                      |                                     |         |
    adrp    x8, l___const.func0.planets@PAGE               // |  6 :       ^     :    ::           : |  0                                  |  0      |
Lloh17:                                                    // |                                      |                                     |         |
    add x8, x8, l___const.func0.planets@PAGEOFF            // |  6 :       ^     :    ::           : |  0                                  |  0      |
    cmp w9, #7                                             // |  7 :       :^    :    ::           : |  0                                  |  4 ^^^^ |
    b.lo    LBB0_12                                        // |  7 :       ::    :    ::           : |  0                                  |  1   v  |
    cmp w10, #2                                            // |  8 :       ::^   :    ::           : |  0                                  |  4 ^^^^ |
    b.mi    LBB0_12                                        // |  7 :       ::    :    ::           : |  0                                  |  1 v    |
    mov x11, #0                                            // |  8 :       :: ^  :    ::           : |  0                                  |  0      |
    add x12, x9, #1                                        // |  9 :       :v :^ :    ::           : |  0                                  |  0      |
    and x13, x12, #0x1fffffff8                             // |  9 :       :  :v^:    ::           : |  0                                  |  0      |
    add x9, x13, x14                                       // |  9 :       :^ : vv    ::           : |  0                                  |  0      |
    add w10, w20, w13                                      // |  8 :       : ^: v     :v           : |  0                                  |  0      |
    add x14, x8, x14, lsl #3                               // |  7 :       v  : :^    :            : |  0                                  |  0      |
    add x14, x14, #32                                      // |  7 :       :  : :^    :            : |  0                                  |  0      |
    mov x15, #34359738368                                  // |  8 :       :  : ::^   :            : |  0                                  |  0      |
    mov x16, x13                                           // |  9 :       :  : v::^  :            : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    ldp q0, q1, [x14, #-32]                                // |  8 :       :  : :v:   :            : |  2 ^^                               |  0      |
    ldp q2, q3, [x14], #64                                 // |  8 :       :  : :v:   :            : |  4 ::^^                             |  0      |
    add x17, x0, x11, asr #29                              // |  9 v       :  v ::: ^ :            : |  4 ::::                             |  0      |
    stp q0, q1, [x17]                                      // |  7         :    ::: v :            : |  4 vv::                             |  0      |
    stp q2, q3, [x17, #32]                                 // |  7         :    ::: v :            : |  2   vv                             |  0      |
    add x11, x11, x15                                      // |  7         :  ^ ::v   :            : |  0                                  |  0      |
    subs    x16, x16, #8                                   // |  6         :    :: ^  :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_8                                         // |  5         :    ::    :            : |  0                                  |  1  v   |
    cmp x12, x13                                           // |  6         :   ^v:    :            : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_11                                        // |  4         :     :    :            : |  0                                  |  1  v   |
    b   LBB0_13                                            // |  4         :     :    :            : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    mov x0, #0                                             // |  5 ^       :     :    :            : |  0                                  |  0      |
    str wzr, [x19]                                         // |  6 :       :     :    v           v: |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #64]                                // |  6 :       :     :              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  7 :       :     :    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  8 :       :     :     :^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  9 :       :     :     :: ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  9 :       :     :     ::   ^^   : v |  0                                  |  0      |
    ret                                                    // |  6 :       :     :     ::        v   |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    mov x9, x14                                            // |  6 :       :^    v     ::            |  0                                  |  0      |
    mov x10, x20                                           // |  6 :       ::^         v:            |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    sub w11, w21, w9                                       // |  6 :       :v ^        :v            |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    ldr x12, [x8, x9, lsl #3]                              // |  5 :       vv  ^       :             |  0                                  |  0      |
    sub w10, w10, w20                                      // |  5 :        :^ :       v             |  0                                  |  0      |
    str x12, [x0, w10, sxtw #3]                            // |  4 v        :v v                     |  0                                  |  0      |
    mov x10, x9                                            // |  2          v^                       |  0                                  |  0      |
    add x9, x9, #1                                         // |  1          ^                        |  0                                  |  0      |
    subs    w11, w11, #1                                   // |  1            ^                      |  0                                  |  4 ^^^^ |
    b.ne    LBB0_14                                        // |  0                                   |  0                                  |  1  v   |
    b   LBB0_11                                            // |  0                                   |  0                                  |  0      |
    .loh AdrpAdd    Lloh14, Lloh15                         // |                                      |                                     |         |
    .loh AdrpAdd    Lloh12, Lloh13                         // |                                      |                                     |         |
    .loh AdrpAdd    Lloh10, Lloh11                         // |                                      |                                     |         |
    .loh AdrpAdd    Lloh8, Lloh9                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh6, Lloh7                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh4, Lloh5                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh16, Lloh17                         // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "Mercury"                                      // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "Venus"                                        // |                                      |                                     |         |
l_.str.2:                                                  // |                                      |                                     |         |
    .asciz  "Earth"                                        // |                                      |                                     |         |
l_.str.3:                                                  // |                                      |                                     |         |
    .asciz  "Mars"                                         // |                                      |                                     |         |
l_.str.4:                                                  // |                                      |                                     |         |
    .asciz  "Jupiter"                                      // |                                      |                                     |         |
l_.str.5:                                                  // |                                      |                                     |         |
    .asciz  "Saturn"                                       // |                                      |                                     |         |
l_.str.6:                                                  // |                                      |                                     |         |
    .asciz  "Uranus"                                       // |                                      |                                     |         |
l_.str.7:                                                  // |                                      |                                     |         |
    .asciz  "Neptune"                                      // |                                      |                                     |         |
    .section    __DATA,__const                             // |                                      |                                     |         |
    .p2align    3, 0x0                                     // |                                      |                                     |         |
l___const.func0.planets:                                   // |                                      |                                     |         |
    .quad   l_.str                                         // |                                      |                                     |         |
    .quad   l_.str.1                                       // |                                      |                                     |         |
    .quad   l_.str.2                                       // |                                      |                                     |         |
    .quad   l_.str.3                                       // |                                      |                                     |         |
    .quad   l_.str.4                                       // |                                      |                                     |         |
    .quad   l_.str.5                                       // |                                      |                                     |         |
    .quad   l_.str.6                                       // |                                      |                                     |         |
    .quad   l_.str.7                                       // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
