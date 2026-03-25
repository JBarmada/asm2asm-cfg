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
    sub sp, sp, #48                                        // |  1                                 ^ |  0                                  |  0      |
    stp x20, x19, [sp, #16]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #32]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #32                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x3, l_.str@PAGE                                // |  2    ^                            : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x3, x3, l_.str@PAGEOFF                             // |  2    ^                            : |  0                                  |  0      |
    str x0, [sp]                                           // |  2 v                               v |  0                                  |  0      |
    add x20, sp, #10                                       // |  2                     ^           v |  0                                  |  0      |
    add x0, sp, #10                                        // |  3 ^                   :           v |  0                                  |  0      |
    mov w1, #0                                             // |  3  ^                  :           : |  0                                  |  0      |
    mov w2, #6                                             // |  3   ^                 :           : |  0                                  |  0      |
    bl  ___sprintf_chk                                     // |  3                     :         ^ : |  0                                  |  0      |
    ldrb    w8, [sp, #10]                                  // |  3         ^           :           v |  0                                  |  0      |
    cbz w8, LBB0_15                                        // |  3         ^           :           : |  0                                  |  0      |
    mov w19, #0                                            // |  3                    ^:           : |  0                                  |  0      |
    add x9, x20, #1                                        // |  4          ^         :v           : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w8, w19, w8, sxtb                                  // |  4         ^:         v            : |  0                                  |  0      |
    sub w19, w8, #48                                       // |  4         v:         ^            : |  0                                  |  0      |
    ldrb    w8, [x9], #1                                   // |  3         ^v                      : |  0                                  |  0      |
    cbnz    w8, LBB0_2                                     // |  2         ^                       : |  0                                  |  0      |
    mov w0, #33                                            // |  2 ^                               : |  0                                  |  0      |
    bl  _malloc                                            // |  3 :                             ^ : |  0                                  |  0      |
    cbz w19, LBB0_16                                       // |  3 :                  ^            : |  0                                  |  0      |
    cmp w19, #1                                            // |  3 :                  ^            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_18                                        // |  3 :                  :            : |  0                                  |  2 v  v |
    mov x8, #0                                             // |  4 :       ^          :            : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    mov w9, #48                                            // |  5 :       :^         :            : |  0                                  |  0      |
    bfxil   w9, w19, #0, #1                                // |  5 :       :^         v            : |  0                                  |  0      |
    strb    w9, [x0, x8]                                   // |  5 v       vv         :            : |  0                                  |  0      |
    add x8, x8, #1                                         // |  4 :       ^          :            : |  0                                  |  0      |
    lsr w9, w19, #1                                        // |  5 :       :^         v            : |  0                                  |  0      |
    cmp w19, #2                                            // |  5 :       ::         ^            : |  0                                  |  4 ^^^^ |
    mov x19, x9                                            // |  5 :       :v         ^            : |  0                                  |  1   :  |
    b.hs    LBB0_6                                         // |  3 :       :                       : |  0                                  |  4 ^^v^ |
    add x10, x0, x8                                        // |  4 v       v ^                     : |  0                                  |  0      |
    strb    wzr, [x10], #-3                                // |  4 :         v                    v: |  0                                  |  0      |
    cmp x8, #1                                             // |  4 :       ^ :                     : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_17                                        // |  4 :       : :                     : |  0                                  |  1  v   |
    mov x12, #0                                            // |  5 :       : : ^                   : |  0                                  |  0      |
    lsr x13, x8, #1                                        // |  5 :       v :  ^                  : |  0                                  |  0      |
    sub x14, x13, #1                                       // |  6 :       : :  v^                 : |  0                                  |  0      |
    mov x9, #-6148914691236517206                          // |  7 :       :^:  ::                 : |  0                                  |  0      |
    movk    x9, #43691                                     // |  7 :       :^:  ::                 : |  0                                  |  0      |
    umulh   x9, x14, x9                                    // |  7 :       :^:  :v                 : |  0                                  |  0      |
    lsr x9, x9, #2                                         // |  7 :       :^:  ::                 : |  0                                  |  0      |
    mov w11, #6                                            // |  7 :       : :^ ::                 : |  0                                  |  0      |
    msub    x9, x9, x11, x14                               // |  8 :       :^:v :v                 : |  0                                  |  0      |
    add x11, x9, #1                                        // |  7 :       :v:^ :                  : |  0                                  |  0      |
    cmp x11, #6                                            // |  6 :       : :^ :                  : |  0                                  |  4 ^^^^ |
    csinc   x9, xzr, x9, eq                                // |  7 :       :^:  :                 v: |  0                                  |  1  v   |
    cmp x14, #5                                            // |  7 :       :::  :^                 : |  0                                  |  4 ^^^^ |
    b.lo    LBB0_12                                        // |  6 :       :::  :                  : |  0                                  |  1   v  |
    add x12, x0, #2                                        // |  7 v       ::: ^:                  : |  0                                  |  0      |
    sub x14, x13, x9                                       // |  8 :       :v: :v^                 : |  0                                  |  0      |
    mov w13, #5                                            // |  6 :       : : :^                  : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    sub x15, x13, #5                                       // |  7 :       : : :v ^                : |  0                                  |  0      |
    ldurb   w16, [x12, #-2]                                // |  6 :       : : v   ^               : |  0                                  |  0      |
    ldrb    w17, [x10, #2]                                 // |  7 :       : v :   :^              : |  0                                  |  0      |
    sturb   w17, [x12, #-2]                                // |  7 :       : : v   :^              : |  0                                  |  0      |
    strb    w16, [x10, #2]                                 // |  6 :       : v :   v               : |  0                                  |  0      |
    eor x15, x15, #0xfffffffffffffffe                      // |  6 :       : : :  ^                : |  0                                  |  0      |
    add x15, x0, x15                                       // |  6 v       : : :  ^                : |  0                                  |  0      |
    ldrb    w16, [x15, x8]                                 // |  7 :       v : :  v^               : |  0                                  |  0      |
    ldurb   w17, [x12, #-1]                                // |  7 :       : : v  : ^              : |  0                                  |  0      |
    sturb   w16, [x12, #-1]                                // |  8 :       : : v  :^:              : |  0                                  |  0      |
    strb    w17, [x15, x8]                                 // |  7 :       v : :  v v              : |  0                                  |  0      |
    ldrb    w15, [x12]                                     // |  5 :         : v  ^                : |  0                                  |  0      |
    ldrb    w16, [x10]                                     // |  6 :         v :  :^               : |  0                                  |  0      |
    strb    w16, [x12]                                     // |  6 :         : v  :v               : |  0                                  |  0      |
    strb    w15, [x10]                                     // |  5 :         v :  v                : |  0                                  |  0      |
    ldrb    w15, [x12, #1]                                 // |  5 :         : v  ^                : |  0                                  |  0      |
    ldurb   w16, [x10, #-1]                                // |  5 :         v :   ^               : |  0                                  |  0      |
    strb    w16, [x12, #1]                                 // |  5 :         : v   v               : |  0                                  |  0      |
    sturb   w15, [x10, #-1]                                // |  5 :         v :  ^                : |  0                                  |  0      |
    ldrb    w15, [x12, #2]                                 // |  5 :         : v  ^                : |  0                                  |  0      |
    ldurb   w16, [x10, #-2]                                // |  5 :         v :   ^               : |  0                                  |  0      |
    strb    w16, [x12, #2]                                 // |  5 :         : v   v               : |  0                                  |  0      |
    sturb   w15, [x10, #-2]                                // |  5 :         v :  ^                : |  0                                  |  0      |
    ldrb    w15, [x12, #3]                                 // |  5 :         : v  ^                : |  0                                  |  0      |
    ldurb   w16, [x10, #-3]                                // |  5 :         v :   ^               : |  0                                  |  0      |
    strb    w16, [x12, #3]                                 // |  5 :         : v   v               : |  0                                  |  0      |
    sturb   w15, [x10, #-3]                                // |  4 :         v    ^                : |  0                                  |  0      |
    add x13, x13, #6                                       // |  3 :            ^                  : |  0                                  |  0      |
    sub x10, x10, #6                                       // |  4 :         ^  :                  : |  0                                  |  0      |
    add x12, x12, #6                                       // |  4 :           ^:                  : |  0                                  |  0      |
    sub x14, x14, #6                                       // |  4 :            :^                 : |  0                                  |  0      |
    cbnz    x14, LBB0_10                                   // |  4 :            :^                 : |  0                                  |  0      |
    sub x12, x13, #5                                       // |  4 :           ^v                  : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    cmp x11, #6                                            // |  4 :          ^:                   : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_17                                        // |  3 :           :                   : |  0                                  |  1  v   |
    sub x10, x0, x12                                       // |  4 v         ^ v                   : |  0                                  |  0      |
    add x8, x10, x8                                        // |  5 :       ^ v :                   : |  0                                  |  0      |
    sub x8, x8, #1                                         // |  4 :       ^   :                   : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    ldrb    w10, [x0, x12]                                 // |  5 v       : ^ v                   : |  0                                  |  0      |
    ldrb    w11, [x8]                                      // |  6 :       v :^:                   : |  0                                  |  0      |
    strb    w11, [x0, x12]                                 // |  6 v       : :vv                   : |  0                                  |  0      |
    strb    w10, [x8], #-1                                 // |  3         v v                     : |  0                                  |  0      |
    add x12, x12, #1                                       // |  2             ^                   : |  0                                  |  0      |
    subs    x9, x9, #1                                     // |  2          ^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_14                                        // |  1                                 : |  0                                  |  1  v   |
    b   LBB0_17                                            // |  1                                 : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov w0, #33                                            // |  2 ^                               : |  0                                  |  0      |
    bl  _malloc                                            // |  3 :                             ^ : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    mov w8, #48                                            // |  3 :       ^                       : |  0                                  |  0      |
    strb    w8, [x0]                                       // |  3 v       v                       : |  0                                  |  0      |
    mov w8, #1                                             // |  3 :       ^                       : |  0                                  |  0      |
    strb    wzr, [x0, x8]                                  // |  4 v       v                      v: |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  4 :                            ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  5 :                  ^^         : v |  0                                  |  0      |
    add sp, sp, #48                                        // |  3 :                             : ^ |  0                                  |  0      |
    ret                                                    // |  2 :                             v   |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    strb    wzr, [x0, xzr]                                 // |  2 v                              v  |  0                                  |  0      |
    b   LBB0_17                                            // |  0                                   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
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
