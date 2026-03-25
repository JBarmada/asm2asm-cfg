                                                           // +--------------------------------------+-------------------------------------+---------+
                                                           // |                 GPR                  |                VECTOR               |  FLAGS  |
                                                           // |                                      |                                     |         |
                                                           // |    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXS |    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV |    NZCV |
                                                           // |    0123456789111111111122222222223ZP |    01234567891111111111222222222233 |         |
                                                           // |  #           012345678901234567890R  |  #           0123456789012345678901 |  #      |
                                                           // +--------------------------------------+-------------------------------------+---------+
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .build_version macos, 15, 0 sdk_version 26, 2          // |                                      |                                     |         |
    .section    __TEXT,__literal16,16byte_literals         // |                                      |                                     |         |
    .p2align    4, 0x0                                     // |                                      |                                     |         |
lCPI0_0:                                                   // |                                      |                                     |         |
    .long   18                                             // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
    .long   1                                              // |                                      |                                     |         |
    .section    __TEXT,__text,regular,pure_instructions    // |                                      |                                     |         |
    .globl  _func0                                         // |                                      |                                     |         |
    .p2align    2                                          // |                                      |                                     |         |
_func0:                                                    // |                                      |                                     |         |
    .cfi_startproc                                         // |                                      |                                     |         |
    cmp w0, #1                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.lt    LBB0_3                                         // |  0                                   |  0                                  |  3 v: v |
    b.ne    LBB0_4                                         // |  0                                   |  0                                  |  1  v   |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w8, #0                                             // |  1         ^                         |  0                                  |  0      |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    cmp w0, #3                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.lo    LBB0_7                                         // |  1 :                                 |  0                                  |  1   v  |
    sub w9, w0, #2                                         // |  2 v        ^                        |  0                                  |  0      |
    cmp w9, #4                                             // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.hs    LBB0_8                                         // |  0                                   |  0                                  |  4 ^^v^ |
    mov w8, #18                                            // |  1         ^                         |  0                                  |  0      |
    mov w11, #2                                            // |  1            ^                      |  0                                  |  0      |
    b   LBB0_19                                            // |  0                                   |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov w0, #18                                            // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    cmp w9, #16                                            // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.hs    LBB0_10                                        // |  1          :                        |  0                                  |  4 ^^v^ |
    mov w10, #0                                            // |  2          :^                       |  0                                  |  0      |
    mov w8, #18                                            // |  2         ^:                        |  0                                  |  0      |
    b   LBB0_14                                            // |  1          :                        |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    and w10, w9, #0xfffffff0                               // |  2          v^                       |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, lCPI0_0@PAGE                               // |  2         ^ :                       |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr q0, [x8, lCPI0_0@PAGEOFF]                          // |  2         v :                       |  1 ^                                |  0      |
    movi.4s v1, #1                                         // |  1           :                       |  1  ^                               |  4 ^^^^ |
    movi.4s v2, #10                                        // |  1           :                       |  1   ^                              |  4 ^^^^ |
    mov x8, x10                                            // |  2         ^ v                       |  1   :                              |  0      |
    movi.4s v3, #1                                         // |  1           :                       |  2   :^                             |  4 ^^^^ |
    movi.4s v4, #1                                         // |  1           :                       |  2   : ^                            |  4 ^^^^ |
LBB0_11:                                                   // |                                      |                                     |         |
    mul.4s  v0, v0, v2                                     // |  1           :                       |  2 ^ v                              |  4 ^^^^ |
    mul.4s  v1, v1, v2                                     // |  1           :                       |  3 :^v                              |  4 ^^^^ |
    mul.4s  v3, v3, v2                                     // |  1           :                       |  4 ::v^                             |  4 ^^^^ |
    mul.4s  v4, v4, v2                                     // |  1           :                       |  5 ::v:^                            |  4 ^^^^ |
    subs    w8, w8, #16                                    // |  2         ^ :                       |  4 :: ::                            |  4 ^^^^ |
    b.ne    LBB0_11                                        // |  1           :                       |  4 :: ::                            |  1  v   |
    uzp2.4s v2, v3, v4                                     // |  1           :                       |  5 ::^vv                            |  4 ^^^^ |
    uzp1.4s v3, v3, v4                                     // |  1           :                       |  5 :::^v                            |  4 ^^^^ |
    uzp1.4s v4, v0, v1                                     // |  1           :                       |  5 vv::^                            |  4 ^^^^ |
    uzp2.4s v0, v0, v1                                     // |  1           :                       |  5 ^v:::                            |  4 ^^^^ |
    mul.4s  v0, v0, v4                                     // |  1           :                       |  4 ^ ::v                            |  4 ^^^^ |
    mul.4s  v1, v2, v3                                     // |  1           :                       |  3  ^vv                             |  4 ^^^^ |
    mul.4s  v0, v1, v0                                     // |  1           :                       |  2 ^v                               |  4 ^^^^ |
    ext.16b v1, v0, v0, #8                                 // |  1           :                       |  2 v^                               |  0      |
    mul.2s  v0, v0, v1                                     // |  1           :                       |  2 ^v                               |  4 ^^^^ |
    mov.s   w8, v0[1]                                      // |  2         ^ :                       |  1 v                                |  4 ^^^^ |
    fmov    w11, s0                                        // |  2           :^                      |  1 v                                |  0      |
    mul w8, w11, w8                                        // |  3         ^ :v                      |  0                                  |  0      |
    cmp w9, w10                                            // |  3         :^v                       |  0                                  |  4 ^^^^ |
    b.eq    LBB0_17                                        // |  2         : :                       |  0                                  |  1  v   |
    tst w9, #0xc                                           // |  3         :^:                       |  0                                  |  4 ^^^^ |
    b.eq    LBB0_18                                        // |  3         :::                       |  0                                  |  1  v   |
LBB0_14:                                                   // |                                      |                                     |         |
    and w12, w9, #0xfffffffc                               // |  4         :v: ^                     |  0                                  |  0      |
    orr w11, w12, #0x2                                     // |  4         : :^v                     |  0                                  |  0      |
    movi.4s v0, #1                                         // |  3         : : :                     |  1 ^                                |  4 ^^^^ |
    mov.s   v0[0], w8                                      // |  3         v : :                     |  1 ^                                |  4 ^^^^ |
    sub w8, w10, w12                                       // |  3         ^ v v                     |  0                                  |  0      |
    movi.4s v1, #10                                        // |  1             :                     |  1  ^                               |  4 ^^^^ |
LBB0_15:                                                   // |                                      |                                     |         |
    mul.4s  v0, v0, v1                                     // |  1             :                     |  2 ^v                               |  4 ^^^^ |
    adds    w8, w8, #4                                     // |  2         ^   :                     |  1 :                                |  4 ^^^^ |
    b.ne    LBB0_15                                        // |  1             :                     |  1 :                                |  1  v   |
    ext.16b v1, v0, v0, #8                                 // |  1             :                     |  2 v^                               |  0      |
    mul.2s  v0, v0, v1                                     // |  1             :                     |  2 ^v                               |  4 ^^^^ |
    mov.s   w8, v0[1]                                      // |  2         ^   :                     |  1 v                                |  4 ^^^^ |
    fmov    w10, s0                                        // |  2           ^ :                     |  1 v                                |  0      |
    mul w8, w10, w8                                        // |  3         ^ v :                     |  0                                  |  0      |
    cmp w9, w12                                            // |  4         :^: v                     |  0                                  |  4 ^^^^ |
    b.ne    LBB0_19                                        // |  2         : :                       |  0                                  |  1  v   |
LBB0_17:                                                   // |                                      |                                     |         |
    mov x0, x8                                             // |  3 ^       v :                       |  0                                  |  0      |
    ret                                                    // |  3 :         :                   v   |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    orr w11, w10, #0x2                                     // |  3 :         v^                      |  0                                  |  0      |
LBB0_19:                                                   // |                                      |                                     |         |
    sub w9, w0, w11                                        // |  3 v        ^ v                      |  0                                  |  0      |
LBB0_20:                                                   // |                                      |                                     |         |
    add w8, w8, w8, lsl #2                                 // |  1         ^                         |  0                                  |  0      |
    lsl w8, w8, #1                                         // |  1         ^                         |  0                                  |  0      |
    subs    w9, w9, #1                                     // |  1          ^                        |  0                                  |  4 ^^^^ |
    b.ne    LBB0_20                                        // |  0                                   |  0                                  |  1  v   |
    b   LBB0_17                                            // |  0                                   |  0                                  |  0      |
    .loh AdrpLdr    Lloh0, Lloh1                           // |                                      |                                     |         |
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
