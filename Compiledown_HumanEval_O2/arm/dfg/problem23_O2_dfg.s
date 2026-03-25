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
    sub sp, sp, #64                                        // |  1                                 ^ |  0                                  |  0      |
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
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    ldrb    w8, [x0]                                       // |  4 v       ^          :            : |  0                                  |  0      |
    cbz w8, LBB0_14                                        // |  3         ^          :            : |  0                                  |  0      |
    mov x20, x0                                            // |  4 v                  :^           : |  0                                  |  0      |
    mov w21, #0                                            // |  3                    : ^          : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x22, _func0.out@PAGE                           // |  4                    : :^         : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x22, x22, _func0.out@PAGEOFF                       // |  4                    : :^         : |  0                                  |  0      |
    b   LBB0_3                                             // |  4                    : ::         : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    str x9, [sp, #8]                                       // |  5          v         : ::         v |  0                                  |  0      |
    mov x20, x9                                            // |  6          v         :^::         : |  0                                  |  0      |
    cbz w8, LBB0_15                                        // |  6         ^          ::::         : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    sxtb    w9, w8                                         // |  7         v^         ::::         : |  0                                  |  0      |
    sub w9, w9, #48                                        // |  6          ^         ::::         : |  0                                  |  0      |
    cmp w9, #10                                            // |  6          ^         ::::         : |  0                                  |  4 ^^^^ |
    b.lo    LBB0_8                                         // |  5                    ::::         : |  0                                  |  1   v  |
LBB0_4:                                                    // |                                      |                                     |         |
    ands    w8, w8, #0xff                                  // |  6         ^          ::::         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_15                                        // |  5                    ::::         : |  0                                  |  1  v   |
    cmp w8, #45                                            // |  6         ^          ::::         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  5                    ::::         : |  0                                  |  1  v   |
    ldrb    w8, [x20, #1]!                                 // |  6         ^          :x::         : |  0                                  |  0      |
    sxtb    w9, w8                                         // |  7         v^         ::::         : |  0                                  |  0      |
    sub w9, w9, #48                                        // |  6          ^         ::::         : |  0                                  |  0      |
    cmp w9, #9                                             // |  6          ^         ::::         : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_4                                         // |  5                    ::::         : |  0                                  |  2  vv  |
    tst w8, #0xff                                          // |  6         ^          ::::         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_15                                        // |  5                    ::::         : |  0                                  |  1  v   |
LBB0_8:                                                    // |                                      |                                     |         |
    add x1, sp, #8                                         // |  6  ^                 ::::         v |  0                                  |  0      |
    mov x0, x20                                            // |  6 ^                  :v::         : |  0                                  |  0      |
    mov w2, #10                                            // |  6 : ^                : ::         : |  0                                  |  0      |
    bl  _strtol                                            // |  6 :                  : ::       ^ : |  0                                  |  0      |
    ldr x9, [sp, #8]                                       // |  6 :        ^         : ::         v |  0                                  |  0      |
    cmp x20, x9                                            // |  7 :        v         :^::         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_12                                        // |  6 :        :         : ::         : |  0                                  |  1  v   |
    ldrb    w8, [x9]                                       // |  7 :       ^v         : ::         : |  0                                  |  0      |
    cmp w8, #44                                            // |  7 :       ^:         : ::         : |  0                                  |  4 ^^^^ |
    ccmp    w8, #0, #4, ne                                 // |  7 :       ^:         : ::         : |  0                                  |  4 ^v^^ |
    b.ne    LBB0_12                                        // |  6 :        :         : ::         : |  0                                  |  1  v   |
    str w0, [x22, w21, sxtw #2]                            // |  6 v        :         : vv         : |  0                                  |  0      |
    add w21, w21, #1                                       // |  4          :         : ^          : |  0                                  |  0      |
    ldrb    w8, [x9]                                       // |  4         ^v         :            : |  0                                  |  0      |
    mov x20, x9                                            // |  4          v         :^           : |  0                                  |  0      |
    cbnz    w8, LBB0_3                                     // |  3         ^          :            : |  0                                  |  0      |
    b   LBB0_15                                            // |  2                    :            : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    add x9, x9, #1                                         // |  3          ^         :            : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    ldrb    w8, [x9]                                       // |  4         ^v         :            : |  0                                  |  0      |
    cbz w8, LBB0_2                                         // |  3         ^          :            : |  0                                  |  0      |
    cmp w8, #44                                            // |  3         ^          :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  2                    :            : |  0                                  |  1  v   |
    b   LBB0_2                                             // |  2                    :            : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    mov w21, #0                                            // |  3                    : ^          : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    str w21, [x19]                                         // |  3                    v v          : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x0, _func0.out@PAGE                            // |  2 ^                               : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x0, x0, _func0.out@PAGEOFF                         // |  2 ^                               : |  0                                  |  0      |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  4                      ^^       : v |  0                                  |  0      |
    add sp, sp, #64                                        // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
.zerofill __DATA,__bss,_func0.out,1024,2                   // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
