                                                                                 // +--------------------------------------+-------------------------------------+---------+
                                                                                 // |                 GPR                  |                VECTOR               |  FLAGS  |
                                                                                 // |                                      |                                     |         |
                                                                                 // |    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXS |    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV |    NZCV |
                                                                                 // |    0123456789111111111122222222223ZP |    01234567891111111111222222222233 |         |
                                                                                 // |  #           012345678901234567890R  |  #           0123456789012345678901 |  #      |
                                                                                 // +--------------------------------------+-------------------------------------+---------+
    .section    __TEXT,__text,regular,pure_instructions                          // |                                      |                                     |         |
    .build_version macos, 15, 0 sdk_version 26, 2                                // |                                      |                                     |         |
    .globl  _func0                                                               // |                                      |                                     |         |
    .p2align    2                                                                // |                                      |                                     |         |
_func0:                                                                          // |                                      |                                     |         |
    .cfi_startproc                                                               // |                                      |                                     |         |
    sub sp, sp, #96                                                              // |  1                                 ^ |  0                                  |  0      |
    stp x24, x23, [sp, #32]                                                      // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #48]                                                      // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #64]                                                      // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #80]                                                      // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #80                                                             // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                                         // |                                      |                                     |         |
    .cfi_offset w30, -8                                                          // |                                      |                                     |         |
    .cfi_offset w29, -16                                                         // |                                      |                                     |         |
    .cfi_offset w19, -24                                                         // |                                      |                                     |         |
    .cfi_offset w20, -32                                                         // |                                      |                                     |         |
    .cfi_offset w21, -40                                                         // |                                      |                                     |         |
    .cfi_offset w22, -48                                                         // |                                      |                                     |         |
    .cfi_offset w23, -56                                                         // |                                      |                                     |         |
    .cfi_offset w24, -64                                                         // |                                      |                                     |         |
    mov x21, x1                                                                  // |  3  v                   ^          : |  0                                  |  0      |
    mov x19, x0                                                                  // |  4 v                  ^ :          : |  0                                  |  0      |
    sbfiz   x0, x21, #3, #32                                                     // |  4 ^                  : v          : |  0                                  |  0      |
    bl  _malloc                                                                  // |  4 :                  :          ^ : |  0                                  |  0      |
    mov x20, x0                                                                  // |  4 v                  :^           : |  0                                  |  0      |
    cmp w21, #1                                                                  // |  4                    ::^          : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_7                                                               // |  4                    :::          : |  0                                  |  2 v  v |
    mov x22, #0                                                                  // |  5                    :::^         : |  0                                  |  0      |
    mov w23, w21                                                                 // |  6                    ::v:^        : |  0                                  |  0      |
Lloh0:                                                                           // |                                      |                                     |         |
    adrp    x21, l_.str@PAGE                                                     // |  6                    ::^::        : |  0                                  |  0      |
Lloh1:                                                                           // |                                      |                                     |         |
    add x21, x21, l_.str@PAGEOFF                                                 // |  6                    ::^::        : |  0                                  |  0      |
    b   LBB0_4                                                                   // |  6                    :::::        : |  0                                  |  0      |
LBB0_2:                                                                          // |                                      |                                     |         |
    mov w24, #0                                                                  // |  7                    :::::^       : |  0                                  |  0      |
LBB0_3:                                                                          // |                                      |                                     |         |
    mov w0, #100                                                                 // |  8 ^                  ::::::       : |  0                                  |  0      |
    bl  _malloc                                                                  // |  9 :                  ::::::     ^ : |  0                                  |  0      |
    str x0, [x20, x22, lsl #3]                                                   // |  8 v                  :v:v::       : |  0                                  |  0      |
    stp x24, x24, [sp, #8]                                                       // |  6                    ::: :v       v |  0                                  |  0      |
    str x24, [sp]                                                                // |  6                    ::: :v       v |  0                                  |  0      |
    mov w1, #0                                                                   // |  6  ^                 ::: :        : |  0                                  |  0      |
    mov w2, #100                                                                 // |  6   ^                ::: :        : |  0                                  |  0      |
    mov x3, x21                                                                  // |  6    ^               ::v :        : |  0                                  |  0      |
    bl  ___sprintf_chk                                                           // |  5                    ::  :      ^ : |  0                                  |  0      |
    add x22, x22, #1                                                             // |  5                    :: ^:        : |  0                                  |  0      |
    cmp x22, x23                                                                 // |  5                    :: ^v        : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                                               // |  4                    :: :         : |  0                                  |  1  v   |
LBB0_4:                                                                          // |                                      |                                     |         |
    ldr x9, [x19, x22, lsl #3]                                                   // |  5          ^         v: v         : |  0                                  |  0      |
    ldrb    w8, [x9]                                                             // |  4         ^v          :           : |  0                                  |  0      |
    cbz w8, LBB0_2                                                               // |  3         ^           :           : |  0                                  |  0      |
    mov w24, #0                                                                  // |  4         :           :   ^       : |  0                                  |  0      |
    add x9, x9, #1                                                               // |  4         :^          :           : |  0                                  |  0      |
LBB0_6:                                                                          // |                                      |                                     |         |
    sub w10, w8, #48                                                             // |  5         v:^         :           : |  0                                  |  0      |
    cmp w10, #10                                                                 // |  4          :^         :           : |  0                                  |  4 ^^^^ |
    cset    w10, lo                                                              // |  4          :^         :           : |  0                                  |  1   v  |
    and w8, w10, w8                                                              // |  5         ^:v         :           : |  0                                  |  0      |
    add w24, w24, w8                                                             // |  5         v:          :   ^       : |  0                                  |  0      |
    ldrb    w8, [x9], #1                                                         // |  4         ^v          :           : |  0                                  |  0      |
    cbnz    w8, LBB0_6                                                           // |  3         ^           :           : |  0                                  |  0      |
    b   LBB0_3                                                                   // |  2                     :           : |  0                                  |  0      |
LBB0_7:                                                                          // |                                      |                                     |         |
    mov x0, x20                                                                  // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #80]                                                      // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #64]                                                      // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #48]                                                      // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #32]                                                      // |  4                        ^^     : v |  0                                  |  0      |
    add sp, sp, #96                                                              // |  2                               : ^ |  0                                  |  0      |
    ret                                                                          // |  1                               v   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                                                 // |                                      |                                     |         |
    .cfi_endproc                                                                 // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals                                // |                                      |                                     |         |
l_.str:                                                                          // |                                      |                                     |         |
    .asciz  "the number of odd elements %d in the string %d of the %d input."    // |                                      |                                     |         |
.subsections_via_symbols                                                         // |                                      |                                     |         |
                                                                                 // +......................................+.....................................+.........+
                                                                                 // Legend:
                                                                                 //     ^       : Register assignment (write)
                                                                                 //     v       : Register usage (read)
                                                                                 //     x       : Register usage and reassignment (R/W)
                                                                                 //     :       : Register in use (live)
                                                                                 //     <space> : Register not in use
                                                                                 //     #       : Number of occupied registers
