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
    cmp w0, w2                                             // |  2 ^ v                               |  0                                  |  4 ^^^^ |
    csel    w8, w0, w2, gt                                 // |  3 v v     ^                         |  0                                  |  3 vv v |
    cmp w1, w3                                             // |  2  ^ v                              |  0                                  |  4 ^^^^ |
    csel    w9, w1, w3, lt                                 // |  3  v v     ^                        |  0                                  |  2 v  v |
    sub w8, w9, w8                                         // |  2         ^v                        |  0                                  |  0      |
    cmp w8, #2                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.ge    LBB0_2                                         // |  0                                   |  0                                  |  2 v  v |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str@PAGE                                // |  1 ^                                 |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str@PAGEOFF                             // |  1 ^                                 |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    cmp w8, #4                                             // |  1         ^                         |  0                                  |  4 ^^^^ |
    b.hs    LBB0_4                                         // |  1         :                         |  0                                  |  4 ^^v^ |
Lloh2:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str.1@PAGE                              // |  2 ^       :                         |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str.1@PAGEOFF                           // |  2 ^       :                         |  0                                  |  0      |
    ret                                                    // |  2         :                     v   |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov w10, #3                                            // |  2         : ^                       |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    adrp    x9, l_.str@PAGE                                // |  3         :^:                       |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    add x9, x9, l_.str@PAGEOFF                             // |  3         :^:                       |  0                                  |  0      |
Lloh6:                                                     // |                                      |                                     |         |
    adrp    x0, l_.str.1@PAGE                              // |  4 ^       :::                       |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    add x0, x0, l_.str.1@PAGEOFF                           // |  4 ^       :::                       |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    sub w11, w10, #1                                       // |  4         ::v^                      |  0                                  |  0      |
    udiv    w12, w8, w11                                   // |  5         v::v^                     |  0                                  |  0      |
    msub    w11, w12, w11, w8                              // |  5         v::^v                     |  0                                  |  0      |
    cbz w11, LBB0_8                                        // |  4         :::^                      |  0                                  |  0      |
    mul w11, w10, w10                                      // |  4         ::v^                      |  0                                  |  0      |
    add w10, w10, #1                                       // |  3         ::^                       |  0                                  |  0      |
    cmp w11, w8                                            // |  3         v: ^                      |  0                                  |  4 ^^^^ |
    b.le    LBB0_5                                         // |  1          :                        |  0                                  |  3 vv v |
    ret                                                    // |  2          :                    v   |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov x0, x9                                             // |  2 ^        v                        |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh2, Lloh3                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh6, Lloh7                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh4, Lloh5                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "NO"                                           // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "YES"                                          // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
