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
    sub sp, sp, #160                                       // |  1                                 ^ |  0                                  |  0      |
    stp x28, x27, [sp, #64]                                // |  3                            vv   v |  0                                  |  0      |
    stp x26, x25, [sp, #80]                                // |  3                          vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #96]                                // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #112]                               // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #128]                               // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #144]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #144                                      // |  2                              ^  v |  0                                  |  0      |
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
    .cfi_offset w27, -88                                   // |                                      |                                     |         |
    .cfi_offset w28, -96                                   // |                                      |                                     |         |
    mov x20, x0                                            // |  3 v                   ^           : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  3         ^           :           : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  3         v           :           : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  3         v           :           : |  0                                  |  0      |
    str x8, [sp, #56]                                      // |  3         v           :           v |  0                                  |  0      |
    bl  _strlen                                            // |  3                     :         ^ : |  0                                  |  0      |
    mov x21, x0                                            // |  4 v                   :^          : |  0                                  |  0      |
    add w8, w21, #2                                        // |  4         ^           :v          : |  0                                  |  0      |
    sxtw    x0, w8                                         // |  4 ^       v           :           : |  0                                  |  0      |
    bl  _malloc                                            // |  5 :       :           :         ^ : |  0                                  |  0      |
    mov x19, x0                                            // |  5 v       :          ^:           : |  0                                  |  0      |
    tbnz    w21, #31, LBB0_17                              // |  5         :          ::^          : |  0                                  |  0      |
    mov x23, #0                                            // |  5         :          ::  ^        : |  0                                  |  0      |
    mov w22, #0                                            // |  5         :          :: ^         : |  0                                  |  0      |
    mov w26, #0                                            // |  5         :          ::     ^     : |  0                                  |  0      |
    add w21, w21, #1                                       // |  6         :          ::^    :     : |  0                                  |  0      |
    add x24, sp, #5                                        // |  7         :          :::  ^ :     v |  0                                  |  0      |
    add x25, x24, #1                                       // |  8         :          :::  v^:     : |  0                                  |  0      |
    mov w27, #32                                           // |  9         :          :::  :::^    : |  0                                  |  0      |
    b   LBB0_4                                             // |  9         :          :::  ::::    : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    strb    w8, [x24, w26, sxtw]                           // |  9         v          :::  v:v:    : |  0                                  |  0      |
    add w26, w26, #1                                       // |  8                    :::  ::^:    : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x23, x23, #1                                       // |  9                    ::: ^::::    : |  0                                  |  0      |
    cmp x23, x21                                           // |  9                    ::v ^::::    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_18                                        // |  8                    ::  :::::    : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    ldrb    w8, [x20, x23]                                 // |  9         ^          :v  v::::    : |  0                                  |  0      |
    orr w9, w8, #0x20                                      // |  8         v^         :    ::::    : |  0                                  |  0      |
    cmp w9, #32                                            // |  7          ^         :    ::::    : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  6                    :    ::::    : |  0                                  |  1  v   |
    subs    w8, w26, #1                                    // |  7         ^          :    ::v:    : |  0                                  |  4 ^^^^ |
    b.le    LBB0_12                                        // |  7         :          :    ::::    : |  0                                  |  3 vv v |
    mov x9, #0                                             // |  8         :^         :    ::::    : |  0                                  |  0      |
    mov w10, w26                                           // |  8         : ^        :    ::v:    : |  0                                  |  0      |
    sub x10, x10, #1                                       // |  7         : ^        :    :: :    : |  0                                  |  0      |
    mov x11, x25                                           // |  7         :  ^       :    :v :    : |  0                                  |  0      |
    b   LBB0_8                                             // |  5         :          :    :  :    : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    add x11, x11, #1                                       // |  6         :  ^       :    :  :    : |  0                                  |  0      |
    sub x10, x10, #1                                       // |  7         : ^:       :    :  :    : |  0                                  |  0      |
    cmp x9, x8                                             // |  8         v^::       :    :  :    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_12                                        // |  7          :::       :    :  :    : |  0                                  |  1  v   |
LBB0_8:                                                    // |                                      |                                     |         |
    mov x12, x9                                            // |  8          v::^      :    :  :    : |  0                                  |  0      |
    add x9, x9, #1                                         // |  8          ^:::      :    :  :    : |  0                                  |  0      |
    mov x13, x10                                           // |  8           v::^     :    :  :    : |  0                                  |  0      |
    mov x14, x11                                           // |  7            v: ^    :    :  :    : |  0                                  |  0      |
    b   LBB0_10                                            // |  5             :      :    :  :    : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    add x14, x14, #1                                       // |  6             : ^    :    :  :    : |  0                                  |  0      |
    subs    x13, x13, #1                                   // |  7             :^:    :    :  :    : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_7                                         // |  6             : :    :    :  :    : |  0                                  |  1  v   |
LBB0_10:                                                   // |                                      |                                     |         |
    ldrsb   w15, [x24, x12]                                // |  7             v :^   :    v  :    : |  0                                  |  0      |
    ldrsb   w16, [x14]                                     // |  7             : v ^  :    :  :    : |  0                                  |  0      |
    cmp w15, w16                                           // |  8             : :^v  :    :  :    : |  0                                  |  4 ^^^^ |
    b.le    LBB0_9                                         // |  8             : :::  :    :  :    : |  0                                  |  3 vv v |
    strb    w16, [x24, x12]                                // |  8             v ::v  :    v  :    : |  0                                  |  0      |
    strb    w15, [x14]                                     // |  5               vv   :       :    : |  0                                  |  0      |
    b   LBB0_9                                             // |  3                    :       :    : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    cmp w22, #1                                            // |  4                    :  ^    :    : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_14                                        // |  4                    :  :    :    : |  0                                  |  2 v  v |
    strb    w27, [x19, w22, uxtw]                          // |  4                    v  v    v    : |  0                                  |  0      |
    add w8, w22, #1                                        // |  4         ^          :  v         : |  0                                  |  0      |
    mov x22, x8                                            // |  4         v          :  ^         : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    cmp w26, #1                                            // |  4                    :  :   ^     : |  0                                  |  4 ^^^^ |
    b.ge    LBB0_16                                        // |  3                    :  :         : |  0                                  |  2 v  v |
    mov w26, #0                                            // |  4                    :  :   ^     : |  0                                  |  0      |
    b   LBB0_3                                             // |  4                    :  :   :     : |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    add x0, x19, w22, sxtw                                 // |  5 ^                  v  v   :     : |  0                                  |  0      |
    mov w2, w26                                            // |  4   ^                :      v     : |  0                                  |  0      |
    add x1, sp, #5                                         // |  4  ^                 :      :     v |  0                                  |  0      |
    bl  _memcpy                                            // |  4                    :      :   ^ : |  0                                  |  0      |
    add w22, w22, w26                                      // |  4                    :  ^   v     : |  0                                  |  0      |
    mov w26, #0                                            // |  4                    :  :   ^     : |  0                                  |  0      |
    b   LBB0_3                                             // |  3                    :  :         : |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    mov x8, #0                                             // |  4         ^          :  :         : |  0                                  |  0      |
    b   LBB0_19                                            // |  3                    :  :         : |  0                                  |  0      |
LBB0_18:                                                   // |                                      |                                     |         |
    sxtw    x8, w22                                        // |  4         ^          :  v         : |  0                                  |  0      |
LBB0_19:                                                   // |                                      |                                     |         |
    strb    wzr, [x19, x8]                                 // |  4         v          v           v: |  0                                  |  0      |
    ldr x8, [sp, #56]                                      // |  3         ^          :            v |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  4         :^         :            : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  4         :v         :            : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  4         :v         :            : |  0                                  |  0      |
    cmp x9, x8                                             // |  4         v^         :            : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_21                                        // |  2                    :            : |  0                                  |  1  v   |
    mov x0, x19                                            // |  3 ^                  v            : |  0                                  |  0      |
    ldp x29, x30, [sp, #144]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #128]                               // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #112]                               // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #96]                                // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #80]                                // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp, #64]                                // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #160                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_21:                                                   // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh3, Lloh4, Lloh5                // |                                      |                                     |         |
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
