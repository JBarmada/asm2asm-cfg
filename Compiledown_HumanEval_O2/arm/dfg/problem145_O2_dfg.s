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
    sub sp, sp, #288                                       // |  1                                 ^ |  0                                  |  0      |
    stp x24, x23, [sp, #224]                               // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #240]                               // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #256]                               // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #272]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #272                                      // |  2                              ^  v |  0                                  |  0      |
    .cfi_def_cfa w29, 16                                   // |                                      |                                     |         |
    .cfi_offset w30, -8                                    // |                                      |                                     |         |
    .cfi_offset w29, -16                                   // |                                      |                                     |         |
    .cfi_offset w19, -24                                   // |                                      |                                     |         |
    .cfi_offset w20, -32                                   // |                                      |                                     |         |
    .cfi_offset w21, -40                                   // |                                      |                                     |         |
    .cfi_offset w22, -48                                   // |                                      |                                     |         |
    .cfi_offset w23, -56                                   // |                                      |                                     |         |
    .cfi_offset w24, -64                                   // |                                      |                                     |         |
    mov x19, x1                                            // |  4  v                 ^         :  : |  0                                  |  0      |
    mov x21, x0                                            // |  5 v                  : ^       :  : |  0                                  |  0      |
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  5         ^          : :       :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  5         v          : :       :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  5         v          : :       :  : |  0                                  |  0      |
    stur    x8, [x29, #-56]                                // |  5         ^          : :       v  : |  0                                  |  0      |
    ldrb    w9, [x0]                                       // |  6 v        ^         : :       :  : |  0                                  |  0      |
    cmp w9, #47                                            // |  5          ^         : :       :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_2                                         // |  5          :         : :       :  : |  0                                  |  1  v   |
    mov w22, #0                                            // |  6          :         : :^      :  : |  0                                  |  0      |
    mov x8, #0                                             // |  6         ^:         : :       :  : |  0                                  |  0      |
    b   LBB0_5                                             // |  5          :         : :       :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov x8, #0                                             // |  6         ^:         : :       :  : |  0                                  |  0      |
    add x10, x21, #1                                       // |  7         ::^        : v       :  : |  0                                  |  0      |
    add x11, sp, #115                                      // |  8         :::^       : :       :  v |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    strb    w9, [x11, x8]                                  // |  8         vv:v       : :       :  : |  0                                  |  0      |
    ldrb    w9, [x10, x8]                                  // |  7         v^v        : :       :  : |  0                                  |  0      |
    add x8, x8, #1                                         // |  5         ^          : :       :  : |  0                                  |  0      |
    cmp w9, #47                                            // |  6         :^         : :       :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_3                                         // |  5         :          : :       :  : |  0                                  |  1  v   |
    mov x22, x8                                            // |  6         v          : :^      :  : |  0                                  |  0      |
LBB0_5:                                                    // |                                      |                                     |         |
    add x9, sp, #115                                       // |  7         :^         : ::      :  v |  0                                  |  0      |
    strb    wzr, [x9, x8]                                  // |  8         vv         : ::      : v: |  0                                  |  0      |
    add x0, sp, #115                                       // |  6 ^                  : ::      :  v |  0                                  |  0      |
    bl  _atoi                                              // |  7 :                  : ::      :^ : |  0                                  |  0      |
    mov x20, x0                                            // |  7 v                  :^::      :  : |  0                                  |  0      |
    add x8, x21, w22, sxtw                                 // |  7         ^          ::vv      :  : |  0                                  |  0      |
    ldrb    w8, [x8, #1]                                   // |  7         v          ::::      :  : |  0                                  |  0      |
    cbz w8, LBB0_9                                         // |  7         ^          ::::      :  : |  0                                  |  0      |
    mov x9, #0                                             // |  8         :^         ::::      :  : |  0                                  |  0      |
    add x10, x21, w22, uxtw                                // |  9         ::^        ::vv      :  : |  0                                  |  0      |
    add x10, x10, #2                                       // |  7         ::^        ::        :  : |  0                                  |  0      |
    add x11, sp, #14                                       // |  8         :::^       ::        :  v |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    strb    w8, [x11, x9]                                  // |  8         vv:v       ::        :  : |  0                                  |  0      |
    ldrb    w8, [x10, x9]                                  // |  7         ^vv        ::        :  : |  0                                  |  0      |
    add x9, x9, #1                                         // |  5          ^         ::        :  : |  0                                  |  0      |
    cbnz    w8, LBB0_7                                     // |  6         ^:         ::        :  : |  0                                  |  0      |
    mov w8, w9                                             // |  6         ^v         ::        :  : |  0                                  |  0      |
    b   LBB0_10                                            // |  4                    ::        :  : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov x8, #0                                             // |  5         ^          ::        :  : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    add x9, sp, #14                                        // |  6         :^         ::        :  v |  0                                  |  0      |
    strb    wzr, [x9, x8]                                  // |  7         vv         ::        : v: |  0                                  |  0      |
    add x0, sp, #14                                        // |  5 ^                  ::        :  v |  0                                  |  0      |
    bl  _atoi                                              // |  6 :                  ::        :^ : |  0                                  |  0      |
    mov x21, x0                                            // |  6 v                  ::^       :  : |  0                                  |  0      |
    ldrb    w9, [x19]                                      // |  6          ^         v::       :  : |  0                                  |  0      |
    cmp w9, #47                                            // |  6          ^         :::       :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_12                                        // |  6          :         :::       :  : |  0                                  |  1  v   |
    mov w23, #0                                            // |  7          :         ::: ^     :  : |  0                                  |  0      |
    mov x8, #0                                             // |  7         ^:         :::       :  : |  0                                  |  0      |
    b   LBB0_15                                            // |  6          :         :::       :  : |  0                                  |  0      |
LBB0_12:                                                   // |                                      |                                     |         |
    mov x8, #0                                             // |  7         ^:         :::       :  : |  0                                  |  0      |
    add x10, x19, #1                                       // |  8         ::^        v::       :  : |  0                                  |  0      |
    add x11, sp, #115                                      // |  9         :::^       :::       :  v |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
    strb    w9, [x11, x8]                                  // |  9         vv:v       :::       :  : |  0                                  |  0      |
    ldrb    w9, [x10, x8]                                  // |  8         v^v        :::       :  : |  0                                  |  0      |
    add x8, x8, #1                                         // |  6         ^          :::       :  : |  0                                  |  0      |
    cmp w9, #47                                            // |  7         :^         :::       :  : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_13                                        // |  6         :          :::       :  : |  0                                  |  1  v   |
    mov x23, x8                                            // |  7         v          ::: ^     :  : |  0                                  |  0      |
LBB0_15:                                                   // |                                      |                                     |         |
    add x9, sp, #115                                       // |  8         :^         ::: :     :  v |  0                                  |  0      |
    strb    wzr, [x9, x8]                                  // |  9         vv         ::: :     : v: |  0                                  |  0      |
    add x0, sp, #115                                       // |  7 ^                  ::: :     :  v |  0                                  |  0      |
    bl  _atoi                                              // |  8 :                  ::: :     :^ : |  0                                  |  0      |
    mov x22, x0                                            // |  8 v                  :::^:     :  : |  0                                  |  0      |
    add x8, x19, w23, sxtw                                 // |  8         ^          v:::v     :  : |  0                                  |  0      |
    ldrb    w8, [x8, #1]                                   // |  8         v          :::::     :  : |  0                                  |  0      |
    cbz w8, LBB0_19                                        // |  8         ^          :::::     :  : |  0                                  |  0      |
    mov x9, #0                                             // |  9         :^         :::::     :  : |  0                                  |  0      |
    add x10, x19, w23, uxtw                                // | 10         ::^        v:::v     :  : |  0                                  |  0      |
    add x10, x10, #2                                       // |  8         ::^         :::      :  : |  0                                  |  0      |
    add x11, sp, #14                                       // |  9         :::^        :::      :  v |  0                                  |  0      |
LBB0_17:                                                   // |                                      |                                     |         |
    strb    w8, [x11, x9]                                  // |  9         vv:v        :::      :  : |  0                                  |  0      |
    ldrb    w8, [x10, x9]                                  // |  8         ^vv         :::      :  : |  0                                  |  0      |
    add x9, x9, #1                                         // |  6          ^          :::      :  : |  0                                  |  0      |
    cbnz    w8, LBB0_17                                    // |  7         ^:          :::      :  : |  0                                  |  0      |
    mov w8, w9                                             // |  7         ^v          :::      :  : |  0                                  |  0      |
    b   LBB0_20                                            // |  5                     :::      :  : |  0                                  |  0      |
LBB0_19:                                                   // |                                      |                                     |         |
    mov x8, #0                                             // |  6         ^           :::      :  : |  0                                  |  0      |
LBB0_20:                                                   // |                                      |                                     |         |
    add x9, sp, #14                                        // |  7         :^          :::      :  v |  0                                  |  0      |
    strb    wzr, [x9, x8]                                  // |  8         vv          :::      : v: |  0                                  |  0      |
    add x0, sp, #14                                        // |  6 ^                   :::      :  v |  0                                  |  0      |
    bl  _atoi                                              // |  7 :                   :::      :^ : |  0                                  |  0      |
    mul w8, w22, w20                                       // |  7 :       ^           v:v      :  : |  0                                  |  0      |
    mul w9, w0, w21                                        // |  6 v       :^           v       :  : |  0                                  |  0      |
    sdiv    w10, w8, w9                                    // |  5         vv^                  :  : |  0                                  |  0      |
    msub    w8, w10, w9, w8                                // |  5         ^vv                  :  : |  0                                  |  0      |
    cmp w8, #0                                             // |  3         ^                    :  : |  0                                  |  4 ^^^^ |
    cset    w0, eq                                         // |  3 ^                            :  : |  0                                  |  1  v   |
    ldur    x8, [x29, #-56]                                // |  3         ^                    v  : |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  3         :^                      : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  3         :v                      : |  0                                  |  0      |
Lloh5:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  3         :v                      : |  0                                  |  0      |
    cmp x9, x8                                             // |  3         v^                      : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_22                                        // |  1                                 : |  0                                  |  1  v   |
    ldp x29, x30, [sp, #272]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #256]                               // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #240]                               // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #224]                               // |  4                        ^^     : v |  0                                  |  0      |
    add sp, sp, #288                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_22:                                                   // |                                      |                                     |         |
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
