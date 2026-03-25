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
    stp x26, x25, [sp, #-80]!                              // |  3                          vv     x |  0                                  |  0      |
    stp x24, x23, [sp, #16]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #32]                                // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #48]                                // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #64]                                // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #64                                       // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    .cfi_offset w25, -72                                   // |                                      |                                     |         |
    .cfi_offset w26, -80                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  3  v                 ^            : |  0                                  |  0      |
    ldrb    w20, [x0]                                      // |  4 v                  :^           : |  0                                  |  0      |
    cbz w20, LBB0_11                                       // |  3                    :^           : |  0                                  |  0      |
    mov x23, #0                                            // |  3                    :   ^        : |  0                                  |  0      |
    add x22, x0, #1                                        // |  5 v                  :  ^:        : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x24, __DefaultRuneLocale@GOTPAGE               // |  5                    :  ::^       : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x24, [x24, __DefaultRuneLocale@GOTPAGEOFF]         // |  5                    :  ::v       : |  0                                  |  0      |
    mov w25, #1                                            // |  6                    :  :::^      : |  0                                  |  0      |
    mov x26, #4503668347895824                             // |  7                    :  ::::^     : |  0                                  |  0      |
    movk    x26, #16657                                    // |  7                    :  ::::^     : |  0                                  |  0      |
    movk    x26, #16657, lsl #32                           // |  7                    :  ::::^     : |  0                                  |  0      |
    b   LBB0_6                                             // |  7                    :  :::::     : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov x0, x21                                            // |  9 ^                  : v:::::     : |  0                                  |  0      |
    mov w1, #4096                                          // |  8  ^                 :  :::::     : |  0                                  |  0      |
    bl  ___maskrune                                        // |  8                    :  :::::   ^ : |  0                                  |  0      |
    cbz w0, LBB0_9                                         // |  8 ^                  :  :::::     : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    mov x0, x21                                            // |  9 ^                  : v:::::     : |  0                                  |  0      |
    bl  ___toupper                                         // |  9 :                  :  :::::   ^ : |  0                                  |  0      |
LBB0_4:                                                    // |                                      |                                     |         |
    mov x20, x0                                            // |  9 v                  :^ :::::     : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    and w8, w20, #0xff                                     // |  9         ^          :v :::::     : |  0                                  |  0      |
    sub w8, w8, #65                                        // |  9         ^          :: :::::     : |  0                                  |  0      |
    lsl x9, x25, x8                                        // | 10         v^         :: :::v:     : |  0                                  |  0      |
    tst x9, x26                                            // |  8          ^         :: ::: v     : |  0                                  |  4 ^^^^ |
    add w9, w20, #2                                        // |  7          ^         :v :::       : |  0                                  |  1  :   |
    csel    w9, w9, w20, ne                                // |  7          ^         :v :::       : |  0                                  |  1  v   |
    cmp w8, #52                                            // |  8         ^:         :: :::       : |  0                                  |  4 ^^^^ |
    csel    w8, w20, w9, hi                                // |  8         ^v         :v :::       : |  0                                  |  2  vv  |
    strb    w8, [x19, x23]                                 // |  6         v          v  :v:       : |  0                                  |  0      |
    add x8, x23, #1                                        // |  6         ^          :  :v:       : |  0                                  |  0      |
    ldrb    w20, [x22, x23]                                // |  7         :          :^ vv:       : |  0                                  |  0      |
    mov x23, x8                                            // |  5         v          :   ^:       : |  0                                  |  0      |
    cbz w20, LBB0_12                                       // |  4                    :^   :       : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    sxtb    w21, w20                                       // |  5                    :v^  :       : |  0                                  |  0      |
    tbnz    w20, #7, LBB0_2                                // |  5                    :^:  :       : |  0                                  |  0      |
    add x8, x24, w21, uxtw #2                              // |  5         ^          : v  v       : |  0                                  |  0      |
    ldr w8, [x8, #60]                                      // |  4         v          : :          : |  0                                  |  0      |
    tbnz    w8, #12, LBB0_3                                // |  4         ^          : :          : |  0                                  |  0      |
    and w0, w8, #0x8000                                    // |  5 ^       v          : :          : |  0                                  |  0      |
    cbnz    w0, LBB0_10                                    // |  4 ^                  : :          : |  0                                  |  0      |
    b   LBB0_5                                             // |  3                    : :          : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x0, x21                                            // |  4 ^                  : v          : |  0                                  |  0      |
    mov w1, #32768                                         // |  4  ^                 : :          : |  0                                  |  0      |
    bl  ___maskrune                                        // |  4                    : :        ^ : |  0                                  |  0      |
    cbz w0, LBB0_5                                         // |  4 ^                  : :          : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    mov x0, x21                                            // |  4 ^                  : v          : |  0                                  |  0      |
    bl  ___tolower                                         // |  3                    :          ^ : |  0                                  |  0      |
    b   LBB0_4                                             // |  2                    :            : |  0                                  |  0      |
LBB0_11:                                                   // |                                      |                                     |         |
    mov x8, #0                                             // |  3         ^          :            : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    strb    wzr, [x19, x8]                                 // |  4         v          v           v: |  0                                  |  0      |
    ldp x29, x30, [sp, #64]                                // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #48]                                // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #32]                                // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #16]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp], #80                                // |  4                          ^^   : v |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
    .loh AdrpLdrGot Lloh0, Lloh1                           // |                                      |                                     |         |
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
