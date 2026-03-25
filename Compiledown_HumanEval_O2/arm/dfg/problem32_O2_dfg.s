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
    cmp x0, #2                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  0                                   |  0                                  |  2 v  v |
    mov w0, #0                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp x0, #4                                             // |  1 ^                                 |  0                                  |  4 ^^^^ |
    b.hs    LBB0_4                                         // |  0                                   |  0                                  |  4 ^^v^ |
    mov w0, #1                                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  2 :                             v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w9, #3                                             // |  2 :        ^                        |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    sub x8, x9, #1                                         // |  3 :       ^v                        |  0                                  |  0      |
    udiv    x10, x0, x8                                    // |  4 v       v:^                       |  0                                  |  0      |
    msub    x8, x10, x8, x0                                // |  4 v       ^:v                       |  0                                  |  0      |
    cmp x8, #0                                             // |  3 :       ^:                        |  0                                  |  4 ^^^^ |
    cset    w8, ne                                         // |  3 :       ^:                        |  0                                  |  1  v   |
    mul x10, x9, x9                                        // |  4 :       :v^                       |  0                                  |  1  :   |
    add x9, x9, #1                                         // |  3 :       :^                        |  0                                  |  1  :   |
    ccmp    x10, x0, #0, ne                                // |  3 v       : ^                       |  0                                  |  4 ^v^^ |
    b.le    LBB0_5                                         // |  1         :                         |  0                                  |  3 vv v |
    mov x0, x8                                             // |  2 ^       v                         |  0                                  |  0      |
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
