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
    sub sp, sp, #32                                        // |  1                                 ^ |  0                                  |  0      |
    stp x29, x30, [sp, #16]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #16                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    cmp w2, #1                                             // |  2   ^                             : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                         // |  2   :                             : |  0                                  |  2 v  v |
    mov x9, #0                                             // |  3   :      ^                      : |  0                                  |  0      |
    mov x8, #0                                             // |  3   :     ^                       : |  0                                  |  0      |
    mov w10, #-1000                                        // |  3   :       ^                     : |  0                                  |  0      |
    mov w11, w2                                            // |  4   v       :^                    : |  0                                  |  0      |
    b   LBB0_4                                             // |  3           ::                    : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov w13, #0                                            // |  4           :: ^                  : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    cmp w13, w10                                           // |  4           v: ^                  : |  0                                  |  4 ^^^^ |
    csel    w10, w13, w10, gt                              // |  4           ^: v                  : |  0                                  |  3 vv v |
    csel    x8, x12, x8, gt                                // |  4         ^  :v                   : |  0                                  |  3 vv v |
    add x9, x9, #1                                         // |  3          ^ :                    : |  0                                  |  0      |
    cmp x9, x11                                            // |  3          ^ v                    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_8                                         // |  2          :                      : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldr x12, [x1, x9, lsl #3]                              // |  4  v       v  ^                   : |  0                                  |  0      |
    ldrb    w15, [x12]                                     // |  3             v  ^                : |  0                                  |  0      |
    cbz w15, LBB0_2                                        // |  3             :  ^                : |  0                                  |  0      |
    mov w13, #0                                            // |  4             :^ :                : |  0                                  |  0      |
    add x14, x12, #1                                       // |  4             v ^:                : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    sub w16, w15, #65                                      // |  4               :v^               : |  0                                  |  0      |
    cmp w16, #26                                           // |  3               : ^               : |  0                                  |  4 ^^^^ |
    cinc    w13, w13, lo                                   // |  3              ^:                 : |  0                                  |  0      |
    sub w15, w15, #97                                      // |  3               :^                : |  0                                  |  0      |
    cmp w15, #26                                           // |  3               :^                : |  0                                  |  4 ^^^^ |
    cset    w15, lo                                        // |  3               :^                : |  0                                  |  1   v  |
    sub w13, w13, w15                                      // |  4              ^:v                : |  0                                  |  0      |
    ldrb    w15, [x14], #1                                 // |  3               v^                : |  0                                  |  0      |
    cbnz    w15, LBB0_6                                    // |  2                ^                : |  0                                  |  0      |
    b   LBB0_3                                             // |  1                                 : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    mov x8, #0                                             // |  2         ^                       : |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    stp x0, x8, [sp]                                       // |  3 v       v                       v |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x1, l_.str@PAGE                                // |  2  ^                              : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x1, x1, l_.str@PAGEOFF                             // |  2  ^                              : |  0                                  |  0      |
    mov x0, x3                                             // |  3 ^  v                            : |  0                                  |  0      |
    bl  _sprintf                                           // |  2                               ^ : |  0                                  |  0      |
    ldp x29, x30, [sp, #16]                                // |  3                              ^^ v |  0                                  |  0      |
    add sp, sp, #32                                        // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "%s.%s"                                        // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
