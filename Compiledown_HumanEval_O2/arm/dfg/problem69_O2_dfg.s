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
    cmp w1, #1                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.lt    LBB0_11                                        // |  1  :                                |  0                                  |  2 v  v |
    mov w10, w1                                            // |  2  v        ^                       |  0                                  |  0      |
    and x8, x10, #0x7                                      // |  2         ^ v                       |  0                                  |  0      |
    cmp w1, #8                                             // |  1  ^                                |  0                                  |  4 ^^^^ |
    b.hs    LBB0_3                                         // |  0                                   |  0                                  |  4 ^^v^ |
    mov x9, #0                                             // |  1          ^                        |  0                                  |  0      |
    mov w12, #2147483647                                   // |  1             ^                     |  0                                  |  0      |
    mov w13, #-1                                           // |  1              ^                    |  0                                  |  0      |
    b   LBB0_5                                             // |  0                                   |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x9, #0                                             // |  1          ^                        |  0                                  |  0      |
    and x10, x10, #0x7ffffff8                              // |  2          :^                       |  0                                  |  0      |
    add x11, x0, #16                                       // |  3 v        : ^                      |  0                                  |  0      |
    mov w12, #2147483647                                   // |  3          : :^                     |  0                                  |  0      |
    mov w13, #-1                                           // |  4          : ::^                    |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    ldp w14, w15, [x11, #-16]                              // |  5          : v: ^^                  |  0                                  |  0      |
    cmp w14, w12                                           // |  4          : :v ^                   |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^:                   |  0                                  |  1  :   |
    csel    w16, w14, w12, eq                              // |  6          : :v:v ^                 |  0                                  |  1  v   |
    csel    w17, w9, w13, eq                               // |  5          v : v  :^                |  0                                  |  1  v   |
    tst w14, #0x1                                          // |  5          : :  ^ ::                |  0                                  |  4 ^^^^ |
    csel    w12, w12, w16, ne                              // |  5          : :^   v:                |  0                                  |  1  v   |
    csel    w13, w13, w17, ne                              // |  5          : ::^   v                |  0                                  |  1  v   |
    cmp w15, w12                                           // |  4          : :v  ^                  |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^ :                  |  0                                  |  1  :   |
    csel    w14, w15, w12, eq                              // |  6          : :v:^v                  |  0                                  |  1  v   |
    csinc   w16, w13, w9, ne                               // |  5          v : v: ^                 |  0                                  |  1  v   |
    tst w15, #0x1                                          // |  5          : :  :^:                 |  0                                  |  4 ^^^^ |
    csel    w12, w12, w14, ne                              // |  5          : :^ v :                 |  0                                  |  1  v   |
    csel    w13, w13, w16, ne                              // |  5          : ::^  v                 |  0                                  |  1  v   |
    ldp w14, w15, [x11, #-8]                               // |  5          : v: ^^                  |  0                                  |  0      |
    cmp w14, w12                                           // |  4          : :v ^                   |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^:                   |  0                                  |  1  :   |
    csel    w16, w14, w12, eq                              // |  6          : :v:v ^                 |  0                                  |  1  v   |
    add w17, w9, #2                                        // |  5          v : :  :^                |  0                                  |  1  :   |
    csel    w17, w17, w13, eq                              // |  5          : : v  :^                |  0                                  |  1  v   |
    tst w14, #0x1                                          // |  5          : :  ^ ::                |  0                                  |  4 ^^^^ |
    csel    w12, w12, w16, ne                              // |  5          : :^   v:                |  0                                  |  1  v   |
    csel    w13, w13, w17, ne                              // |  5          : ::^   v                |  0                                  |  1  v   |
    cmp w15, w12                                           // |  4          : :v  ^                  |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^ :                  |  0                                  |  1  :   |
    csel    w14, w15, w12, eq                              // |  6          : :v:^v                  |  0                                  |  1  v   |
    add w16, w9, #3                                        // |  5          v : :: ^                 |  0                                  |  1  :   |
    csel    w16, w16, w13, eq                              // |  5          : : v: ^                 |  0                                  |  1  v   |
    tst w15, #0x1                                          // |  5          : :  :^:                 |  0                                  |  4 ^^^^ |
    csel    w12, w12, w14, ne                              // |  5          : :^ v :                 |  0                                  |  1  v   |
    csel    w13, w13, w16, ne                              // |  5          : ::^  v                 |  0                                  |  1  v   |
    ldp w14, w15, [x11]                                    // |  5          : v: ^^                  |  0                                  |  0      |
    cmp w14, w12                                           // |  4          : :v ^                   |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^:                   |  0                                  |  1  :   |
    csel    w16, w14, w12, eq                              // |  6          : :v:v ^                 |  0                                  |  1  v   |
    add w17, w9, #4                                        // |  5          v : :  :^                |  0                                  |  1  :   |
    csel    w17, w17, w13, eq                              // |  5          : : v  :^                |  0                                  |  1  v   |
    tst w14, #0x1                                          // |  5          : :  ^ ::                |  0                                  |  4 ^^^^ |
    csel    w12, w12, w16, ne                              // |  5          : :^   v:                |  0                                  |  1  v   |
    csel    w13, w13, w17, ne                              // |  5          : ::^   v                |  0                                  |  1  v   |
    cmp w15, w12                                           // |  4          : :v  ^                  |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  5          : ::^ :                  |  0                                  |  1  :   |
    csel    w14, w15, w12, eq                              // |  6          : :v:^v                  |  0                                  |  1  v   |
    add w16, w9, #5                                        // |  5          v : :: ^                 |  0                                  |  1  :   |
    csel    w16, w16, w13, eq                              // |  5          : : v: ^                 |  0                                  |  1  v   |
    tst w15, #0x1                                          // |  5          : :  :^:                 |  0                                  |  4 ^^^^ |
    csel    w12, w12, w14, ne                              // |  5          : :^ v :                 |  0                                  |  1  v   |
    csel    w13, w13, w16, ne                              // |  5          : ::^  v                 |  0                                  |  1  v   |
    ldp w14, w15, [x11, #8]                                // |  5          : v: ^^                  |  0                                  |  0      |
    cmp w14, w12                                           // |  3          :  v ^                   |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  4          :  :^:                   |  0                                  |  1  :   |
    csel    w16, w14, w12, eq                              // |  5          :  v:v ^                 |  0                                  |  1  v   |
    add w17, w9, #6                                        // |  4          v   :  :^                |  0                                  |  1  :   |
    csel    w17, w17, w13, eq                              // |  4          :   v  :^                |  0                                  |  1  v   |
    tst w14, #0x1                                          // |  4          :    ^ ::                |  0                                  |  4 ^^^^ |
    csel    w12, w12, w16, ne                              // |  4          :  ^   v:                |  0                                  |  1  v   |
    csel    w13, w13, w17, ne                              // |  4          :  :^   v                |  0                                  |  1  v   |
    cmp w15, w12                                           // |  3          :  v  ^                  |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  4          :  :^ :                  |  0                                  |  1  :   |
    csel    w14, w15, w12, eq                              // |  5          :  v:^v                  |  0                                  |  1  v   |
    add w16, w9, #7                                        // |  4          v   :: ^                 |  0                                  |  1  :   |
    csel    w16, w16, w13, eq                              // |  3              v: ^                 |  0                                  |  1  v   |
    tst w15, #0x1                                          // |  3               :^:                 |  0                                  |  4 ^^^^ |
    csel    w12, w12, w14, ne                              // |  3             ^ v :                 |  0                                  |  1  v   |
    csel    w13, w13, w16, ne                              // |  3             :^  v                 |  0                                  |  1  v   |
    add x9, x9, #8                                         // |  2          ^  :                     |  0                                  |  0      |
    add x11, x11, #32                                      // |  3          : ^:                     |  0                                  |  0      |
    cmp x10, x9                                            // |  3          v^ :                     |  0                                  |  4 ^^^^ |
    b.ne    LBB0_4                                         // |  1             :                     |  0                                  |  1  v   |
LBB0_5:                                                    // |                                      |                                     |         |
    cbnz    x8, LBB0_9                                     // |  2         ^   :                     |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    cmn w13, #1                                            // |  2             :^                    |  0                                  |  4 ^^^^ |
    b.eq    LBB0_11                                        // |  2             ::                    |  0                                  |  1  v   |
    stp w12, w13, [x2]                                     // |  3   v         vv                    |  0                                  |  0      |
    mov x0, x2                                             // |  3 ^ v         :                     |  0                                  |  0      |
    ret                                                    // |  3 :           :                 v   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    add x9, x9, #1                                         // |  3 :        ^  :                     |  0                                  |  0      |
    subs    x8, x8, #1                                     // |  4 :       ^:  :                     |  0                                  |  4 ^^^^ |
    b.eq    LBB0_6                                         // |  3 :        :  :                     |  0                                  |  1  v   |
LBB0_9:                                                    // |                                      |                                     |         |
    ldr w10, [x0, x9, lsl #2]                              // |  4 v        v^ :                     |  0                                  |  0      |
    tbnz    w10, #0, LBB0_8                                // |  3          :^ :                     |  0                                  |  0      |
    cmp w10, w12                                           // |  3          :^ v                     |  0                                  |  4 ^^^^ |
    ccmn    w13, #1, #4, ge                                // |  3          ::  ^                    |  0                                  |  1  :   |
    csel    w12, w10, w12, eq                              // |  3          :v ^                     |  0                                  |  1  v   |
    csel    w13, w9, w13, eq                               // |  2          v   ^                    |  0                                  |  1  v   |
    b   LBB0_8                                             // |  0                                   |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    mov x0, #0                                             // |  1 ^                                 |  0                                  |  0      |
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
