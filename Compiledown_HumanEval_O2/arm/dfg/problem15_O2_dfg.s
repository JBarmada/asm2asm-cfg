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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    mov x21, x0                                            // |  4 v                  : ^          : |  0                                  |  0      |
    bl  _strlen                                            // |  4                    : :        ^ : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^:          : |  0                                  |  0      |
    sbfiz   x0, x0, #3, #32                                // |  5 ^                  :::          : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                  :::        ^ : |  0                                  |  0      |
    mov x22, x0                                            // |  6 v                  :::^         : |  0                                  |  0      |
    mov x8, #4294967296                                    // |  6         ^          ::::         : |  0                                  |  0      |
    add x8, x8, x20, lsl #32                               // |  6         ^          :v::         : |  0                                  |  0      |
    asr x0, x8, #32                                        // |  6 ^       v          : ::         : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                  : ::       ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  6 v                  : ::^        : |  0                                  |  0      |
    strb    wzr, [x0]                                      // |  7 v                  : :::       v: |  0                                  |  0      |
    cmp w20, #1                                            // |  6                    :^:::        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  6                    :::::        : |  0                                  |  2 v  v |
    and x25, x20, #0x7fffffff                              // |  7                    :v::: ^      : |  0                                  |  0      |
    mov x26, x22                                           // |  7                    :::v:  ^     : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov x0, x23                                            // |  8 ^                  ::::v  :     : |  0                                  |  0      |
    bl  _strlen                                            // |  9 :                  :::::  :   ^ : |  0                                  |  0      |
    mov x24, x0                                            // |  9 v                  :::::^ :     : |  0                                  |  0      |
    add x1, x0, #2                                         // | 10 v^                 :::::: :     : |  0                                  |  0      |
    mov x0, x23                                            // |  9 ^                  ::::v: :     : |  0                                  |  0      |
    bl  _realloc                                           // |  9 :                  :::: : :   ^ : |  0                                  |  0      |
    mov x23, x0                                            // |  9 v                  ::::^: :     : |  0                                  |  0      |
    ldrb    w8, [x21], #1                                  // | 10 :       ^          ::v::: :     : |  0                                  |  0      |
    add x9, x0, x24                                        // | 10 v       :^         :: ::v :     : |  0                                  |  0      |
    strb    w8, [x9]                                       // |  8         vv         :: ::  :     : |  0                                  |  0      |
    strb    wzr, [x9, #1]                                  // |  8          v         :: ::  :    v: |  0                                  |  0      |
    bl  _strlen                                            // |  7                    :: ::  :   ^ : |  0                                  |  0      |
    add x0, x0, #1                                         // |  7 ^                  :: ::  :     : |  0                                  |  0      |
    bl  _malloc                                            // |  8 :                  :: ::  :   ^ : |  0                                  |  0      |
    str x0, [x26], #8                                      // |  7 v                  :: ::  v     : |  0                                  |  0      |
    mov x1, x23                                            // |  6  ^                 :: :v        : |  0                                  |  0      |
    bl  _strcpy                                            // |  6                    :: ::      ^ : |  0                                  |  0      |
    subs    x25, x25, #1                                   // |  6                    :: :: ^      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  5                    :: ::        : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x0, x23                                            // |  6 ^                  :: :v        : |  0                                  |  0      |
    bl  _free                                              // |  5                    :: :       ^ : |  0                                  |  0      |
    str w20, [x19]                                         // |  4                    vv :         : |  0                                  |  0      |
    mov x0, x22                                            // |  3 ^                     v         : |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  4                          ^^   : v |  0                                  |  0      |
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
