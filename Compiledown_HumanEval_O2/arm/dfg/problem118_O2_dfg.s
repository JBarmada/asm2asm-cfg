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
    str x2, [sp, #8]                                       // |  2   v                             v |  0                                  |  0      |
    mov x20, x1                                            // |  3  v                  ^           : |  0                                  |  0      |
    mov x21, x0                                            // |  4 v                   :^          : |  0                                  |  0      |
    bl  _strlen                                            // |  4                     ::        ^ : |  0                                  |  0      |
    add x22, x0, #1                                        // |  5 v                   ::^         : |  0                                  |  0      |
    mov x0, x22                                            // |  5 ^                   ::v         : |  0                                  |  0      |
    bl  _malloc                                            // |  5 :                   ::        ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  5 v                   :: ^        : |  0                                  |  0      |
    mov x27, #0                                            // |  5                     :: :   ^    : |  0                                  |  0      |
    mov x24, #0                                            // |  6                     :: :^  :    : |  0                                  |  0      |
    mov w25, #0                                            // |  7                     :: ::^ :    : |  0                                  |  0      |
    mov w19, #0                                            // |  7                    ^:: ::  :    : |  0                                  |  0      |
    mov w28, #0                                            // |  7                     :: ::  :^   : |  0                                  |  0      |
    b   LBB0_3                                             // |  7                     :: ::  ::   : |  0                                  |  0      |
LBB0_1:                                                    // |                                      |                                     |         |
    mov w25, #0                                            // |  8                     :: ::^ ::   : |  0                                  |  0      |
    add w19, w27, #1                                       // |  8                    ^:: ::  v:   : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add x27, x27, #1                                       // |  8                    ::: ::  ^:   : |  0                                  |  0      |
    cmp x22, x27                                           // |  9                    :::^::  v:   : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_14                                        // |  8                    ::: ::  ::   : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    ldrsb   w26, [x21, x27]                                // |  9                    ::v :: ^v:   : |  0                                  |  0      |
    tbnz    w26, #31, LBB0_5                               // |  9                    ::: :: ^::   : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, __DefaultRuneLocale@GOTPAGE                // | 10         ^          ::: :: :::   : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, __DefaultRuneLocale@GOTPAGEOFF]           // | 10         v          ::: :: :::   : |  0                                  |  0      |
    add x8, x8, w26, uxtw #2                               // | 10         ^          ::: :: v::   : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // | 10         v          ::: :: :::   : |  0                                  |  0      |
    and w0, w8, #0x4000                                    // | 11 ^       v          ::: :: :::   : |  0                                  |  0      |
    b   LBB0_6                                             // |  9                    ::: :: :::   : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov x0, x26                                            // | 10 ^                  ::: :: v::   : |  0                                  |  0      |
    mov w1, #16384                                         // |  9  ^                 ::: ::  ::   : |  0                                  |  0      |
    bl  ___maskrune                                        // |  9                    ::: ::  :: ^ : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    cmp w26, #0                                            // |  9                    ::: :: ^::   : |  0                                  |  4 ^^^^ |
    ccmp    w0, #0, #0, ne                                 // | 10 ^                  ::: :: :::   : |  0                                  |  4 ^v^^ |
    b.eq    LBB0_9                                         // |  9                    ::: :: :::   : |  0                                  |  1  v   |
    cmp w25, w20                                           // | 10                    :v: ::^:::   : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_1                                         // |  8                    : : :: :::   : |  0                                  |  1  v   |
    sub w8, w27, w19                                       // |  9         ^          v : :: :v:   : |  0                                  |  0      |
    strb    wzr, [x23, w8, sxtw]                           // |  9         v            : v: :::  v: |  0                                  |  0      |
    add w19, w28, #1                                       // |  8                    ^ : :: ::v   : |  0                                  |  0      |
    sbfiz   x1, x19, #3, #32                               // |  9  ^                 v : :: :::   : |  0                                  |  0      |
    mov x0, x24                                            // |  9 ^                  : : :v :::   : |  0                                  |  0      |
    bl  _realloc                                           // |  9 :                  : : :  ::: ^ : |  0                                  |  0      |
    mov x24, x0                                            // |  9 v                  : : :^ :::   : |  0                                  |  0      |
    mov x0, x23                                            // |  9 ^                  : : v: :::   : |  0                                  |  0      |
    bl  _strlen                                            // |  9                    : : :: ::: ^ : |  0                                  |  0      |
    add x0, x0, #1                                         // |  9 ^                  : : :: :::   : |  0                                  |  0      |
    bl  _malloc                                            // | 10 :                  : : :: ::: ^ : |  0                                  |  0      |
    str x0, [x24, w28, sxtw #3]                            // |  9 v                  : : :v ::v   : |  0                                  |  0      |
    mov x1, x23                                            // |  8  ^                 : : v: ::    : |  0                                  |  0      |
    bl  _strcpy                                            // |  8                    : : :: ::  ^ : |  0                                  |  0      |
    mov x28, x19                                           // |  8                    v : :: ::^   : |  0                                  |  0      |
    b   LBB0_1                                             // |  8                    : : :: :::   : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    sub w8, w27, w19                                       // |  9         ^          v : :: :v:   : |  0                                  |  0      |
    strb    w26, [x23, w8, sxtw]                           // |  8         v            : v: v::   : |  0                                  |  0      |
    ldrsb   w26, [x21, x27]                                // |  7                      v :: ^v:   : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str@PAGE                                // |  6 ^                      :: : :   : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str@PAGEOFF                             // |  6 ^                      :: : :   : |  0                                  |  0      |
    mov x1, x26                                            // |  6  ^                     :: v :   : |  0                                  |  0      |
    mov w2, #11                                            // |  6   ^                    :: : :   : |  0                                  |  0      |
    bl  _memchr                                            // |  6                        :: : : ^ : |  0                                  |  0      |
    cbnz    x0, LBB0_2                                     // |  6 ^                      :: : :   : |  0                                  |  0      |
    sxtw    x8, w26                                        // |  6         ^              :: v :   : |  0                                  |  0      |
    tbnz    w8, #31, LBB0_12                               // |  6         ^              :: : :   : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    adrp    x9, __DefaultRuneLocale@GOTPAGE                // |  6          ^             :: : :   : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]           // |  6          v             :: : :   : |  0                                  |  0      |
    add x8, x9, x8, lsl #2                                 // |  7         ^v             :: : :   : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  6         v              :: : :   : |  0                                  |  0      |
    and w0, w8, #0x100                                     // |  7 ^       v              :: : :   : |  0                                  |  0      |
    b   LBB0_13                                            // |  5                        :: : :   : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    and w0, w26, #0xff                                     // |  6 ^                      :: v :   : |  0                                  |  0      |
    mov w1, #256                                           // |  5  ^                     ::   :   : |  0                                  |  0      |
    bl  ___maskrune                                        // |  5                        ::   : ^ : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    cmp w0, #0                                             // |  5 ^                      ::   :   : |  0                                  |  4 ^^^^ |
    cinc    w25, w25, ne                                   // |  5                        ::^  :   : |  0                                  |  0      |
    b   LBB0_2                                             // |  4                        ::   :   : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    mov x0, x23                                            // |  5 ^                      v:   :   : |  0                                  |  0      |
    bl  _free                                              // |  4                         :   : ^ : |  0                                  |  0      |
    ldr x8, [sp, #8]                                       // |  4         ^               :   :   v |  0                                  |  0      |
    str w28, [x8]                                          // |  4         v               :   v   : |  0                                  |  0      |
    mov x0, x24                                            // |  3 ^                       v       : |  0                                  |  0      |
    ldp x29, x30, [sp, #96]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #80]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #64]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #48]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #32]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp, #16]                                // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #112                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpLdrGot Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .loh AdrpLdrGot Lloh4, Lloh5                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "aeiouAEIOU"                                   // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
