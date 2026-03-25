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
    stp x22, x21, [sp, #-48]!                              // |  3                      vv         x |  0                                  |  0      |
    stp x20, x19, [sp, #16]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #32]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #32                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    mov x22, x2                                            // |  3   v                   ^         : |  0                                  |  0      |
    str w1, [x3]                                           // |  4  v v                  :         : |  0                                  |  0      |
    cbz w1, LBB0_13                                        // |  3  ^                    :         : |  0                                  |  0      |
    mov x20, x1                                            // |  4  v                  ^ :         : |  0                                  |  0      |
    mov x21, x0                                            // |  5 v                   :^:         : |  0                                  |  0      |
    sbfiz   x0, x20, #2, #32                               // |  5 ^                   v::         : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                   :::       ^ : |  0                                  |  0      |
    str x0, [x22]                                          // |  5 v                   ::v         : |  0                                  |  0      |
    cbz x0, LBB0_15                                        // |  4 ^                   ::          : |  0                                  |  0      |
    mov x19, x0                                            // |  5 v                  ^::          : |  0                                  |  0      |
    subs    w22, w20, #1                                   // |  5                    :v:^         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_4                                         // |  5                    ::::         : |  0                                  |  2 v  v |
    mov x8, x20                                            // |  6         ^          :v::         : |  0                                  |  0      |
    ubfiz   x2, x8, #2, #32                                // |  6   ^     v          : ::         : |  0                                  |  0      |
    mov x0, x19                                            // |  5 ^                  v ::         : |  0                                  |  0      |
    mov x1, x21                                            // |  5  ^                 : v:         : |  0                                  |  0      |
    bl  _memcpy                                            // |  5                    : ::       ^ : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    cmp w20, #1                                            // |  5                    :^::         : |  0                                  |  4 ^^^^ |
    b.le    LBB0_14                                        // |  5                    ::::         : |  0                                  |  3 vv v |
    mov x8, #0                                             // |  6         ^          ::::         : |  0                                  |  0      |
    ldr w9, [x21, w22, sxtw #2]                            // |  6          ^         ::vv         : |  0                                  |  0      |
    ldr w10, [x21]                                         // |  6           ^        ::v:         : |  0                                  |  0      |
    add w9, w9, w10                                        // |  6          ^v        :: :         : |  0                                  |  0      |
    and w9, w9, #0x80000001                                // |  5          ^         :: :         : |  0                                  |  0      |
    mov w11, w20                                           // |  5            ^       :v :         : |  0                                  |  0      |
    add x10, x19, #4                                       // |  4           ^        v  :         : |  0                                  |  0      |
    sub x11, x11, #1                                       // |  4            ^       :  :         : |  0                                  |  0      |
    b   LBB0_7                                             // |  3                    :  :         : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x10, x10, #4                                       // |  4           ^        :  :         : |  0                                  |  0      |
    sub x11, x11, #1                                       // |  5           :^       :  :         : |  0                                  |  0      |
    cmp x8, x22                                            // |  6         ^ ::       :  v         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_14                                        // |  6         : ::       :  :         : |  0                                  |  1  v   |
LBB0_7:                                                    // |                                      |                                     |         |
    mov x12, x8                                            // |  7         v ::^      :  :         : |  0                                  |  0      |
    add x8, x8, #1                                         // |  7         ^ :::      :  :         : |  0                                  |  0      |
    mov x13, x11                                           // |  7           :v:^     :  :         : |  0                                  |  0      |
    mov x14, x10                                           // |  6           v : ^    :  :         : |  0                                  |  0      |
    b   LBB0_10                                            // |  5             : :    :  :         : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    str w16, [x19, x12, lsl #2]                            // |  6             v : v  v  :         : |  0                                  |  0      |
    str w15, [x14]                                         // |  6             : vv   :  :         : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    add x14, x14, #4                                       // |  5             : ^    :  :         : |  0                                  |  0      |
    subs    x13, x13, #1                                   // |  6             :^:    :  :         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  5             : :    :  :         : |  0                                  |  1  v   |
LBB0_10:                                                   // |                                      |                                     |         |
    ldr w15, [x19, x12, lsl #2]                            // |  6             v :^   v  :         : |  0                                  |  0      |
    ldr w16, [x14]                                         // |  4               v ^     :         : |  0                                  |  0      |
    cmp w9, #1                                             // |  4          ^      :     :         : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_12                                        // |  3                 :     :         : |  0                                  |  1  v   |
    cmp w15, w16                                           // |  4                ^v     :         : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_8                                         // |  3                 :     :         : |  0                                  |  3 vv v |
    b   LBB0_9                                             // |  3                 :     :         : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    cmp w15, w16                                           // |  4                ^v     :         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_8                                         // |  2                       :         : |  0                                  |  2 v  v |
    b   LBB0_9                                             // |  2                       :         : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    str xzr, [x22]                                         // |  3                       v        v: |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    bl  _exit                                              // |  1                               ^   |  0                                  |  0      |
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
