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
    sub sp, sp, #368                                       // |  1                                 ^ |  0                                  |  0      |
    stp x28, x27, [sp, #272]                               // |  3                            vv   v |  0                                  |  0      |
    stp x26, x25, [sp, #288]                               // |  3                          vv     v |  0                                  |  0      |
    stp x24, x23, [sp, #304]                               // |  3                        vv       v |  0                                  |  0      |
    stp x22, x21, [sp, #320]                               // |  3                      vv         v |  0                                  |  0      |
    stp x20, x19, [sp, #336]                               // |  3                    vv           v |  0                                  |  0      |
    stp x29, x30, [sp, #352]                               // |  3                              vv v |  0                                  |  0      |
    add x29, sp, #352                                      // |  2                              ^  v |  0                                  |  0      |
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
Lloh0:                                                     // |                                      |                                     |         |
    adrp    x8, ___stack_chk_guard@GOTPAGE                 // |  3         ^                    :  : |  0                                  |  0      |
Lloh1:                                                     // |                                      |                                     |         |
    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]            // |  3         v                    :  : |  0                                  |  0      |
Lloh2:                                                     // |                                      |                                     |         |
    ldr x8, [x8]                                           // |  3         v                    :  : |  0                                  |  0      |
    stur    x8, [x29, #-96]                                // |  3         ^                    v  : |  0                                  |  0      |
    cmp w1, #1                                             // |  3  ^                           :  : |  0                                  |  4 ^^^^ |
    b.lt    LBB0_13                                        // |  3  :                           :  : |  0                                  |  2 v  v |
    mov x19, x0                                            // |  5 v:                 ^         :  : |  0                                  |  0      |
    mov x22, #0                                            // |  5  :                 :  ^      :  : |  0                                  |  0      |
    mov w24, #0                                            // |  5  :                 :    ^    :  : |  0                                  |  0      |
    mov w23, w1                                            // |  5  v                 :   ^     :  : |  0                                  |  0      |
    mov x25, sp                                            // |  5                    :   : ^   :  v |  0                                  |  0      |
Lloh3:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  6                    :^  : :   :  : |  0                                  |  0      |
Lloh4:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  6                    :^  : :   :  : |  0                                  |  0      |
    b   LBB0_4                                             // |  5                    :   : :   :  : |  0                                  |  0      |
LBB0_2:                                                    // |                                      |                                     |         |
    mov x24, x26                                           // |  7                    :   :^:v  :  : |  0                                  |  0      |
    mov x20, x21                                           // |  8                    :^v :::   :  : |  0                                  |  0      |
LBB0_3:                                                    // |                                      |                                     |         |
    add x22, x22, #1                                       // |  8                    :: ^:::   :  : |  0                                  |  0      |
    cmp x22, x23                                           // |  8                    :: ^v::   :  : |  0                                  |  4 ^^^^ |
    b.eq    LBB0_14                                        // |  7                    :: : ::   :  : |  0                                  |  1  v   |
LBB0_4:                                                    // |                                      |                                     |         |
    movi.2d v0, #0000000000000000                          // |  7                    :: : ::   :  : |  1 ^                                |  0      |
    stp q0, q0, [sp, #224]                                 // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #192]                                 // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #160]                                 // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #128]                                 // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #96]                                  // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #64]                                  // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp, #32]                                  // |  7                    :: : ::   :  v |  1 v                                |  0      |
    stp q0, q0, [sp]                                       // |  7                    :: : ::   :  v |  1 v                                |  0      |
    ldr x21, [x19, x22, lsl #3]                            // |  8                    v:^v ::   :  : |  0                                  |  0      |
    ldrb    w28, [x21]                                     // |  7                     :v  ::  ^:  : |  0                                  |  0      |
    cbz w28, LBB0_9                                        // |  7                     ::  ::  ^:  : |  0                                  |  0      |
    mov w26, #0                                            // |  7                     ::  ::^  :  : |  0                                  |  0      |
    add x27, x21, #1                                       // |  7                     :v  :: ^ :  : |  0                                  |  0      |
    b   LBB0_7                                             // |  7                     ::  :: : :  : |  0                                  |  0      |
LBB0_6:                                                    // |                                      |                                     |         |
    ldrb    w28, [x27], #1                                 // |  8                     ::  :: v^:  : |  0                                  |  0      |
    cbz w28, LBB0_10                                       // |  7                     ::  ::  ^:  : |  0                                  |  0      |
LBB0_7:                                                    // |                                      |                                     |         |
    sxtb    w1, w28                                        // |  8  ^                  ::  ::  v:  : |  0                                  |  0      |
    mov x0, sp                                             // |  8 ^                   ::  ::  ::  v |  0                                  |  0      |
    bl  _strchr                                            // |  8                     ::  ::  ::^ : |  0                                  |  0      |
    cbnz    x0, LBB0_6                                     // |  8 ^                   ::  ::  ::  : |  0                                  |  0      |
    mov x0, sp                                             // |  8 ^                   ::  ::  ::  v |  0                                  |  0      |
    bl  _strlen                                            // |  9 :                   ::  ::  ::^ : |  0                                  |  0      |
    strb    w28, [x25, w0, sxtw]                           // |  8 v                   ::  :v  v:  : |  0                                  |  0      |
    add w8, w0, #1                                         // |  8 v       ^           ::  ::   :  : |  0                                  |  0      |
    strb    wzr, [x25, w8, sxtw]                           // |  8         v           ::  :v   : v: |  0                                  |  0      |
    add w26, w26, #1                                       // |  6                     ::  : ^  :  : |  0                                  |  0      |
    b   LBB0_6                                             // |  5                     ::  :    :  : |  0                                  |  0      |
LBB0_9:                                                    // |                                      |                                     |         |
    mov w26, #0                                            // |  6                     ::  : ^  :  : |  0                                  |  0      |
LBB0_10:                                                   // |                                      |                                     |         |
    cmp w26, w24                                           // |  6                     ::  v ^  :  : |  0                                  |  4 ^^^^ |
    b.gt    LBB0_2                                         // |  4                     ::       :  : |  0                                  |  3 vv v |
    b.ne    LBB0_3                                         // |  4                     ::       :  : |  0                                  |  1  v   |
    mov x0, x21                                            // |  5 ^                   :v       :  : |  0                                  |  0      |
    mov x1, x20                                            // |  4  ^                  v        :  : |  0                                  |  0      |
    bl  _strcmp                                            // |  3                              :^ : |  0                                  |  0      |
    tbnz    w0, #31, LBB0_2                                // |  3 ^                            :  : |  0                                  |  0      |
    b   LBB0_3                                             // |  2                              :  : |  0                                  |  0      |
LBB0_13:                                                   // |                                      |                                     |         |
Lloh5:                                                     // |                                      |                                     |         |
    adrp    x20, l_.str@PAGE                               // |  3                     ^        :  : |  0                                  |  0      |
Lloh6:                                                     // |                                      |                                     |         |
    add x20, x20, l_.str@PAGEOFF                           // |  3                     ^        :  : |  0                                  |  0      |
LBB0_14:                                                   // |                                      |                                     |         |
    ldur    x8, [x29, #-96]                                // |  4         ^           :        v  : |  0                                  |  0      |
Lloh7:                                                     // |                                      |                                     |         |
    adrp    x9, ___stack_chk_guard@GOTPAGE                 // |  4         :^          :           : |  0                                  |  0      |
Lloh8:                                                     // |                                      |                                     |         |
    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]            // |  4         :v          :           : |  0                                  |  0      |
Lloh9:                                                     // |                                      |                                     |         |
    ldr x9, [x9]                                           // |  4         :v          :           : |  0                                  |  0      |
    cmp x9, x8                                             // |  4         v^          :           : |  0                                  |  4 ^^^^ |
    b.ne    LBB0_16                                        // |  2                     :           : |  0                                  |  1  v   |
    mov x0, x20                                            // |  3 ^                   v           : |  0                                  |  0      |
    ldp x29, x30, [sp, #352]                               // |  3                              ^^ v |  0                                  |  0      |
    ldp x20, x19, [sp, #336]                               // |  4                    ^^         : v |  0                                  |  0      |
    ldp x22, x21, [sp, #320]                               // |  4                      ^^       : v |  0                                  |  0      |
    ldp x24, x23, [sp, #304]                               // |  4                        ^^     : v |  0                                  |  0      |
    ldp x26, x25, [sp, #288]                               // |  4                          ^^   : v |  0                                  |  0      |
    ldp x28, x27, [sp, #272]                               // |  4                            ^^ : v |  0                                  |  0      |
    add sp, sp, #368                                       // |  2                               : ^ |  0                                  |  0      |
    ret                                                    // |  1                               v   |  0                                  |  0      |
LBB0_16:                                                   // |                                      |                                     |         |
    bl  ___stack_chk_fail                                  // |  1                               ^   |  0                                  |  0      |
    .loh AdrpLdrGotLdr  Lloh0, Lloh1, Lloh2                // |                                      |                                     |         |
    .loh AdrpAdd    Lloh3, Lloh4                           // |                                      |                                     |         |
    .loh AdrpAdd    Lloh5, Lloh6                           // |                                      |                                     |         |
    .loh AdrpLdrGotLdr  Lloh7, Lloh8, Lloh9                // |                                      |                                     |         |
    .cfi_endproc                                           // |                                      |                                     |         |
    .section    __TEXT,__cstring,cstring_literals          // |                                      |                                     |         |
l_.str:                                                    // |                                      |                                     |         |
    .space  1                                              // |                                      |                                     |         |
.subsections_via_symbols                                   // |                                      |                                     |         |
                                                           // +......................................+.....................................+.........+
                                                           // Legend:
                                                           //     ^       : Register assignment (write)
                                                           //     v       : Register usage (read)
                                                           //     x       : Register usage and reassignment (R/W)
                                                           //     :       : Register in use (live)
                                                           //     <space> : Register not in use
                                                           //     #       : Number of occupied registers
