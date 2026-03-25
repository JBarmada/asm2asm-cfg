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
    mov x20, x0                                            // |  3 v                   ^           : |  0                                  |  0      |
    mov w0, #64                                            // |  2 ^                               : |  0                                  |  0      |
    bl  _malloc                                            // |  2                               ^ : |  0                                  |  0      |
    cbz x0, LBB0_4                                         // |  2 ^                               : |  0                                  |  0      |
    mov x19, x0                                            // |  3 v                  ^            : |  0                                  |  0      |
    strb    wzr, [x0, #63]                                 // |  4 v                  :           v: |  0                                  |  0      |
    cbz w20, LBB0_5                                        // |  3                    :^           : |  0                                  |  0      |
    mov w8, #62                                            // |  3         ^          :            : |  0                                  |  0      |
    cmp w20, #1                                            // |  4         :          :^           : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_6                                         // |  4         :          ::           : |  0                                  |  2 v  v |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w9, #48                                            // |  5         :^         ::           : |  0                                  |  0      |
    bfxil   w9, w20, #0, #1                                // |  5         :^         :v           : |  0                                  |  0      |
    strb    w9, [x19, x8]                                  // |  5         vv         v:           : |  0                                  |  0      |
    sub x8, x8, #1                                         // |  4         ^          ::           : |  0                                  |  0      |
    lsr w9, w20, #1                                        // |  4          ^         :v           : |  0                                  |  0      |
    cmp w20, #1                                            // |  4          :         :^           : |  0                                  |  4 ^^^^ |
    mov x20, x9                                            // |  4          v         :^           : |  0                                  |  2  ::  |
    b.hi    LBB0_3                                         // |  2                    :            : |  0                                  |  2  vv  |
    b   LBB0_6                                             // |  2                    :            : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x20, #0                                            // |  3                    :^           : |  0                                  |  0      |
    b   LBB0_9                                             // |  2                    :            : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    mov w8, #48                                            // |  3         ^          :            : |  0                                  |  0      |
    strb    w8, [x19, #62]                                 // |  3         v          v            : |  0                                  |  0      |
    mov w8, #61                                            // |  3         ^          :            : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x21, x19, w8, sxtw                                 // |  4         v          v ^          : |  0                                  |  0      |
    mov w22, #25188                                        // |  4                    : :^         : |  0                                  |  0      |
    strh    w22, [x21, #-1]!                               // |  4                    : xv         : |  0                                  |  0      |
    mov w9, #66                                            // |  5          ^         : ::         : |  0                                  |  0      |
    sub w8, w9, w8                                         // |  6         ^v         : ::         : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  6 ^       v          : ::         : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                  : ::       ^ : |  0                                  |  0      |
    mov x20, x0                                            // |  6 v                  :^::         : |  0                                  |  0      |
    cbz x0, LBB0_8                                         // |  6 ^                  ::::         : |  0                                  |  0      |
    mov x0, x20                                            // |  6 ^                  :v::         : |  0                                  |  0      |
    mov x1, x21                                            // |  7 :^                 ::v:         : |  0                                  |  0      |
    bl  _strcpy                                            // |  6 :                  :: :       ^ : |  0                                  |  0      |
    bl  _strlen                                            // |  6 :                  :: :       ^ : |  0                                  |  0      |
    add x8, x20, x0                                        // |  6 v       ^          :v :         : |  0                                  |  0      |
    strh    w22, [x8]                                      // |  5         v          :: v         : |  0                                  |  0      |
    strb    wzr, [x8, #2]                                  // |  5         v          ::          v: |  0                                  |  0      |
LBB0_8:                                                    // |                                      |                                     |         |
    mov x0, x19                                            // |  4 ^                  v:           : |  0                                  |  0      |
    bl  _free                                              // |  3                     :         ^ : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #32]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #16]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp], #48                                // |  4                      ^^       : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .asciz  "db"                                           // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
