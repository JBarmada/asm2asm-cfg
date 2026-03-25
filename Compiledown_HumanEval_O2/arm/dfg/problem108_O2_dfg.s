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
    stp x20, x19, [sp, #-32]!                              // |  3                    vv           x |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    mov w0, #8                                             // |  2 ^                               : |  0                                  |  0      |
    bl  _malloc                                            // |  3 :                             ^ : |  0                                  |  0      |
    str xzr, [x0]                                          // |  3 v                              v: |  0                                  |  0      |
    cmp w19, #1                                            // |  3 :                  ^            : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_9                                         // |  3 :                  :            : |  0                                  |  2 v  v |
    mov w8, #0                                             // |  4 :       ^          :            : |  0                                  |  0      |
    mov w9, #0                                             // |  4 :        ^         :            : |  0                                  |  0      |
    mov w10, #1                                            // |  4 :         ^        :            : |  0                                  |  0      |
    mov w11, #10                                           // |  5 :         :^       :            : |  0                                  |  0      |
    mov w12, #26215                                        // |  6 :         ::^      :            : |  0                                  |  0      |
    movk    w12, #26214, lsl #16                           // |  6 :         ::^      :            : |  0                                  |  0      |
    b   LBB0_4                                             // |  6 :         :::      :            : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w9, w9, #1                                         // |  7 :        ^:::      :            : |  0                                  |  0      |
    str w9, [x0, #4]                                       // |  7 v        v:::      :            : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add w13, w10, #1                                       // |  7 :         v::^     :            : |  0                                  |  0      |
    cmp w10, w19                                           // |  7 :         ^:::     v            : |  0                                  |  4 ^^^^ |
    mov x10, x13                                           // |  6 :         ^::v                  : |  0                                  |  1  :   |
    b.eq    LBB0_9                                         // |  5 :         :::                   : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w13, #0                                            // |  6 :         :::^                  : |  0                                  |  0      |
    mov x14, x10                                           // |  6 :         v:: ^                 : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    smull   x15, w14, w12                                  // |  6 :          :v v^                : |  0                                  |  0      |
    lsr x16, x15, #63                                      // |  6 :          :  :v^               : |  0                                  |  0      |
    asr x15, x15, #34                                      // |  6 :          :  :^:               : |  0                                  |  0      |
    add w15, w15, w16                                      // |  6 :          :  :^v               : |  0                                  |  0      |
    msub    w16, w15, w11, w14                             // |  6 :          v  vv^               : |  0                                  |  0      |
    madd    w13, w13, w11, w16                             // |  7 :          v ^::v               : |  0                                  |  0      |
    add w16, w14, #9                                       // |  6 :            :v:^               : |  0                                  |  0      |
    mov x14, x15                                           // |  5 :            :^v                : |  0                                  |  0      |
    cmp w16, #18                                           // |  4 :            :  ^               : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_5                                         // |  3 :            :                  : |  0                                  |  2  vv  |
    cmp w10, w13                                           // |  4 :         ^  v                  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  2 :                               : |  0                                  |  1  v   |
    tbnz    w10, #0, LBB0_2                                // |  3 :         ^                     : |  0                                  |  0      |
    add w8, w8, #1                                         // |  3 :       ^                       : |  0                                  |  0      |
    str w8, [x0]                                           // |  3 v       v                       : |  0                                  |  0      |
    b   LBB0_3                                             // |  1                                 : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp], #32                                // |  4                    ^^         : v |  0                                  |  0      |
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
