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
    stp x24, x23, [sp, #-64]!                              // |  3                        vv       x |  0                                  |  0      |
    stp x22, x21, [sp, #16]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #32]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #48]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #48                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    mov x19, x2                                            // |  3   v                ^            : |  0                                  |  0      |
    mov x21, x1                                            // |  4  v                 : ^          : |  0                                  |  0      |
    mov x20, x0                                            // |  5 v                  :^:          : |  0                                  |  0      |
    subs    w22, w1, #1                                    // |  6  v                 :::^         : |  0                                  |  4 ^^^^ |
    b.le    LBB0_9                                         // |  5                    ::::         : |  0                                  |  3 vv v |
    mov w8, #0                                             // |  6         ^          ::::         : |  0                                  |  0      |
    add x9, x20, #4                                        // |  6          ^         :v::         : |  0                                  |  0      |
    mov x10, x22                                           // |  7          :^        :::v         : |  0                                  |  0      |
    b   LBB0_3                                             // |  6          :         ::::         : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    add w8, w8, #1                                         // |  7         ^:         ::::         : |  0                                  |  0      |
    sub w10, w10, #1                                       // |  7          :^        ::::         : |  0                                  |  0      |
    cmp w8, w22                                            // |  7         ^:         :::v         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_9                                         // |  7         ::         ::::         : |  0                                  |  1  v   |
LBB0_3:                                                    // |                                      |                                     |         |
    mov w10, w10                                           // |  8         ::^        ::::         : |  0                                  |  0      |
    sub w11, w8, w21                                       // |  9         v::^       ::v:         : |  0                                  |  0      |
    cmn w11, #2                                            // |  7          ::^       :: :         : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_2                                         // |  6          ::        :: :         : |  0                                  |  3 vv v |
    ldr w11, [x20]                                         // |  7          ::^       :v :         : |  0                                  |  0      |
    mov x12, x10                                           // |  8          :v:^      :: :         : |  0                                  |  0      |
    mov x13, x9                                            // |  7          v : ^     :: :         : |  0                                  |  0      |
    b   LBB0_7                                             // |  6            : :     :: :         : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    stp w14, w11, [x13, #-4]                               // |  7            v vv    :: :         : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    add x13, x13, #4                                       // |  5              ^     :: :         : |  0                                  |  0      |
    subs    x12, x12, #1                                   // |  6             ^:     :: :         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_2                                         // |  5              :     :: :         : |  0                                  |  1  v   |
LBB0_7:                                                    // |                                      |                                     |         |
    ldr w14, [x13]                                         // |  6              v^    :: :         : |  0                                  |  0      |
    cmp w11, w14                                           // |  6            ^  v    :: :         : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_5                                         // |  5               :    :: :         : |  0                                  |  3 vv v |
    mov x11, x14                                           // |  6            ^  v    :: :         : |  0                                  |  0      |
    b   LBB0_6                                             // |  4                    :: :         : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    str wzr, [x3]                                          // |  6    v               :: :        v: |  0                                  |  0      |
    cmp w21, #1                                            // |  5                    ::^:         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_17                                        // |  5                    ::::         : |  0                                  |  2 v  v |
    mov w9, w21                                            // |  6          ^         ::v:         : |  0                                  |  0      |
    and x8, x9, #0x7                                       // |  6         ^v         :: :         : |  0                                  |  0      |
    cmp w21, #8                                            // |  5                    ::^:         : |  0                                  |  4 ^^^^ |
    b.hs    LBB0_26                                        // |  4                    :: :         : |  0                                  |  4 ^^v^ |
    mov w23, #0                                            // |  5                    :: :^        : |  0                                  |  0      |
    mov x10, x22                                           // |  5           ^        :: v         : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    cbz x8, LBB0_18                                        // |  6         ^ :        :: :         : |  0                                  |  0      |
    add x9, x20, x10, lsl #2                               // |  6          ^v        :v :         : |  0                                  |  0      |
    b   LBB0_15                                            // |  5          :         :: :         : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    subs    x8, x8, #1                                     // |  6         ^:         :: :         : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_18                                        // |  5          :         :: :         : |  0                                  |  1  v   |
LBB0_15:                                                   // |                                      |                                     |         |
    ldr w10, [x9], #-4                                     // |  6          v^        :: :         : |  0                                  |  0      |
    sub w10, w10, #1                                       // |  5           ^        :: :         : |  0                                  |  0      |
    cmp w10, #8                                            // |  5           ^        :: :         : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_14                                        // |  4                    :: :         : |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  5                    :: :^        : |  0                                  |  0      |
    str w23, [x3]                                          // |  6    v               :: :v        : |  0                                  |  0      |
    b   LBB0_14                                            // |  4                    :: :         : |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    mov w23, #0                                            // |  5                    :: :^        : |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    sbfiz   x0, x23, #3, #32                               // |  6 ^                  :: :v        : |  0                                  |  0      |
    bl  _malloc                                            // |  6 :                  :: :       ^ : |  0                                  |  0      |
    str x0, [x19]                                          // |  5 v                  v: :         : |  0                                  |  0      |
    cmp w21, #1                                            // |  5                    ::^:         : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_25                                        // |  4                    :: :         : |  0                                  |  2 v  v |
    cmp w23, #1                                            // |  5                    :: :^        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_25                                        // |  5                    :: ::        : |  0                                  |  2 v  v |
    mov w8, #0                                             // |  6         ^          :: ::        : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x9, l___const.func0.names@PAGE                 // |  7         :^         :: ::        : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    add x9, x9, l___const.func0.names@PAGEOFF              // |  7         :^         :: ::        : |  0                                  |  0      |
LBB0_21:                                                   // |                                      |                                     |         |
    ldr w10, [x20, x22, lsl #2]                            // |  8         ::^        :v v:        : |  0                                  |  0      |
    sub w11, w10, #1                                       // |  7         ::v^       :   :        : |  0                                  |  0      |
    cmp w11, #8                                            // |  7         :::^       :   :        : |  0                                  |  4 ^^^^ |
    b.hi    LBB0_23                                        // |  6         :::        :   :        : |  0                                  |  2  vv  |
    ldr x10, [x9, x10, lsl #3]                             // |  6         :vv        :   :        : |  0                                  |  0      |
    ldr x11, [x19]                                         // |  6         : :^       v   :        : |  0                                  |  0      |
    str x10, [x11, w8, sxtw #3]                            // |  5         v vv           :        : |  0                                  |  0      |
    add w8, w8, #1                                         // |  3         ^              :        : |  0                                  |  0      |
LBB0_23:                                                   // |                                      |                                     |         |
    subs    x22, x22, #1                                   // |  3                       ^:        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_25                                        // |  2                        :        : |  0                                  |  2 v  v |
    cmp w8, w23                                            // |  3         ^              v        : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_21                                        // |  1                                 : |  0                                  |  2 v  v |
LBB0_25:                                                   // |                                      |                                     |         |
    ldp x29, x30, [sp, #48]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #32]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #16]                                // |  5                     :^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp], #64                                // |  6                     : :^^     : v |  0                                  |  0      |
    ret                                                    // |  3                     : :       v   |  0                                  |  0      |
LBB0_26:                                                   // |                                      |                                     |         |
    mov w23, #0                                            // |  3                     : :^          |  0                                  |  0      |
    and x9, x9, #0x7ffffff8                                // |  3          ^          : :           |  0                                  |  0      |
    add x10, x20, x22, lsl #2                              // |  3           ^         v v           |  0                                  |  0      |
    sub x11, x10, #12                                      // |  3           v^          :           |  0                                  |  0      |
    mov x10, x22                                           // |  2           ^           v           |  0                                  |  0      |
    b   LBB0_28                                            // |  0                                   |  0                                  |  0      |
LBB0_27:                                                   // |                                      |                                     |         |
    sub x10, x10, #8                                       // |  1           ^                       |  0                                  |  0      |
    sub x11, x11, #32                                      // |  1            ^                      |  0                                  |  0      |
    sub x9, x9, #8                                         // |  2          ^ :                      |  0                                  |  0      |
    cbz x9, LBB0_12                                        // |  2          ^ :                      |  0                                  |  0      |
LBB0_28:                                                   // |                                      |                                     |         |
    ldr w12, [x11, #12]                                    // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_30                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_30:                                                   // |                                      |                                     |         |
    ldr w12, [x11, #8]                                     // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_32                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_32:                                                   // |                                      |                                     |         |
    ldr w12, [x11, #4]                                     // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_34                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_34:                                                   // |                                      |                                     |         |
    ldr w12, [x11]                                         // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_36                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_36:                                                   // |                                      |                                     |         |
    ldur    w12, [x11, #-4]                                // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_38                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_38:                                                   // |                                      |                                     |         |
    ldur    w12, [x11, #-8]                                // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_40                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_40:                                                   // |                                      |                                     |         |
    ldur    w12, [x11, #-12]                               // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  2            :^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  2            :^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_42                                        // |  1            :                      |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  2            :           ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  3    v       :           v          |  0                                  |  0      |
LBB0_42:                                                   // |                                      |                                     |         |
    ldur    w12, [x11, #-16]                               // |  2            v^                     |  0                                  |  0      |
    sub w12, w12, #1                                       // |  1             ^                     |  0                                  |  0      |
    cmp w12, #8                                            // |  1             ^                     |  0                                  |  4 ^^^^ |
    b.hi    LBB0_27                                        // |  0                                   |  0                                  |  2  vv  |
    add w23, w23, #1                                       // |  1                        ^          |  0                                  |  0      |
    str w23, [x3]                                          // |  2    v                   v          |  0                                  |  0      |
    b   LBB0_27                                            // |  0                                   |  0                                  |  0      |
    .loh AdrpAdd    Lloh0, Lloh1                           // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .space  1                                              // |                                      |                                     |         |
l_.str.1:                                                  // |                                      |                                     |         |
    .asciz  "One"                                          // |                                      |                                     |         |
l_.str.2:                                                  // |                                      |                                     |         |
    .asciz  "Two"                                          // |                                      |                                     |         |
l_.str.3:                                                  // |                                      |                                     |         |
    .asciz  "Three"                                        // |                                      |                                     |         |
l_.str.4:                                                  // |                                      |                                     |         |
    .asciz  "Four"                                         // |                                      |                                     |         |
l_.str.5:                                                  // |                                      |                                     |         |
    .asciz  "Five"                                         // |                                      |                                     |         |
l_.str.6:                                                  // |                                      |                                     |         |
    .asciz  "Six"                                          // |                                      |                                     |         |
l_.str.7:                                                  // |                                      |                                     |         |
    .asciz  "Seven"                                        // |                                      |                                     |         |
l_.str.8:                                                  // |                                      |                                     |         |
    .asciz  "Eight"                                        // |                                      |                                     |         |
l_.str.9:                                                  // |                                      |                                     |         |
    .asciz  "Nine"                                         // |                                      |                                     |         |
    .section    __DATA,__const                             // |                                      |                                     |         |
    .p2align    3, 0x0                                     // |                                      |                                     |         |
l___const.func0.names:                                     // |                                      |                                     |         |
    .quad   l_.str                                         // |                                      |                                     |         |
    .quad   l_.str.1                                       // |                                      |                                     |         |
    .quad   l_.str.2                                       // |                                      |                                     |         |
    .quad   l_.str.3                                       // |                                      |                                     |         |
    .quad   l_.str.4                                       // |                                      |                                     |         |
    .quad   l_.str.5                                       // |                                      |                                     |         |
    .quad   l_.str.6                                       // |                                      |                                     |         |
    .quad   l_.str.7                                       // |                                      |                                     |         |
    .quad   l_.str.8                                       // |                                      |                                     |         |
    .quad   l_.str.9                                       // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
