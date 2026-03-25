                                                          // +------------------------------------+-------------------------------------+
                                                          // |                GPR                 |                FLOAT                |
                                                          // |                                    |                                     |
                                                          // |    RSGTTTTTTTTSSSSSSSSSSSSAAAAAAAA |    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF |
                                                          // |    APPP012345601234567891101234567 |    TTTTTTTTTTTTAAAAAAAASSSSSSSSSSSS |
                                                          // |                         01         |    01234567891101234567012345678911 |
                                                          // |  #                                 |  #           01                  01 |
                                                          // +------------------------------------+-------------------------------------+
    .text                                                 // |                                    |                                     |
    .attribute  4, 16                                     // |                                    |                                     |
    .attribute  5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"    // |                                    |                                     |
    .file   "code.c"                                      // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    addi    sp, sp, -128                                  // |  1  ^                              |  0                                  |
    sd  ra, 120(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 112(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 104(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 96(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 88(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 80(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 72(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 64(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 56(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 48(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 40(sp)                                        // |  2  v                  v           |  0                                  |
    sd  s10, 32(sp)                                       // |  2  v                   v          |  0                                  |
    sd  s11, 24(sp)                                       // |  2  v                    v         |  0                                  |
    sd  a1, 8(sp)                                         // |  2  v                      v       |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    sb  zero, 22(sp)                                      // |  2  v          :                   |  0                                  |
    sh  zero, 20(sp)                                      // |  2  v          :                   |  0                                  |
    call    strlen@plt                                    // |  3 ^:          :                   |  0                                  |
    mv  s0, a0                                            // |  4  :         ^:          v        |  0                                  |
    sext.w  s3, a0                                        // |  5  :         :: ^        v        |  0                                  |
    addiw   a0, a0, 2                                     // |  5  :         :: :        ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         :: :        :        |  0                                  |
    mv  s2, a0                                            // |  6  :         ::^:        v        |  0                                  |
    mv  a1, s1                                            // |  6  :         :v::         ^       |  0                                  |
    call    strcpy@plt                                    // |  5 ^:         : ::                 |  0                                  |
    mv  a0, s2                                            // |  5  :         : v:        ^        |  0                                  |
    call    strlen@plt                                    // |  5 ^:         : ::                 |  0                                  |
    add a0, a0, s2                                        // |  5  :         : v:        ^        |  0                                  |
    sb  zero, 1(a0)                                       // |  5  :         : ::        v        |  0                                  |
    li  s4, 32                                            // |  6  :         : ::^       :        |  0                                  |
    lui a1, 524288                                        // |  7  :         : :::       :^       |  0                                  |
    addiw   a1, a1, -2                                    // |  7  :         : :::       :^       |  0                                  |
    sb  s4, 0(a0)                                         // |  7  :         : ::v       v:       |  0                                  |
    bltu    a1, s3, .LBB0_28                              // |  6  :         : :v:        v       |  0                                  |
    li  s8, 0                                             // |  5  :         : : :   ^            |  0                                  |
    li  s1, 0                                             // |  6  :         :^: :   :            |  0                                  |
    li  s7, 0                                             // |  7  :         ::: :  ^:            |  0                                  |
    addiw   a0, s0, 1                                     // |  7  :         v:: :   :   ^        |  0                                  |
    slli    a0, a0, 32                                    // |  6  :          :: :   :   ^        |  0                                  |
    srli    s0, a0, 32                                    // |  7  :         ^:: :   :   v        |  0                                  |
    li  s6, 111                                           // |  6  :          :: : ^ :            |  0                                  |
.LBB0_30:                                                 // |                                    |                                     |
    auipc   s5, %pcrel_hi(.L.str.2)                       // |  7  :          :: :^: :            |  0                                  |
    addi    s5, s5, %pcrel_lo(.LBB0_30)                   // |  7  :          :: :^: :            |  0                                  |
    addi    s9, sp, 20                                    // |  8  v          :: ::: :^           |  0                                  |
    li  s11, 1                                            // |  9  :          :: ::: :: ^         |  0                                  |
    mv  s3, s2                                            // | 10  :          :v^::: :: :         |  0                                  |
    j   .LBB0_7                                           // |  9  :          :: ::: :: :         |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  s7, 4                                             // | 10  :          :: :::^:: :         |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a1, s7, 2                                     // | 11  :          :: :::v:: : ^       |  0                                  |
    mv  a0, s8                                            // | 11  :          :: ::::v: :^        |  0                                  |
    call    realloc@plt                                   // | 11 ^:          :: :::: : ::        |  0                                  |
    mv  s8, a0                                            // | 11  :          :: ::::^: :v        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a0, s1, 2                                     // | 11  :          v: :::::: :^        |  0                                  |
    addiw   s1, s1, 1                                     // | 10  :          ^: :::::: :         |  0                                  |
    add a0, a0, s8                                        // | 11  :          :: ::::v: :^        |  0                                  |
    sw  s11, 0(a0)                                        // | 11  :          :: :::::: vv        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sb  zero, 20(sp)                                      // | 10  v          :: :::::: :         |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // | 11  :         ^:: :::::: :         |  0                                  |
    addi    s3, s3, 1                                     // | 12  :         :::^:::::: :         |  0                                  |
    beqz    s0, .LBB0_29                                  // | 12  :         v::::::::: :         |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lbu s10, 0(s3)                                        // | 12  :          ::v::::::^:         |  0                                  |
    bne s10, s4, .LBB0_12                                 // | 11  :          :: v:::::v:         |  0                                  |
    lhu a0, 20(sp)                                        // | 11  v          ::  :::::::^        |  0                                  |
    bne a0, s6, .LBB0_17                                  // | 11  :          ::  :v:::::v        |  0                                  |
    bne s1, s7, .LBB0_16                                  // |  9  :          v:  : v::::         |  0                                  |
    bgtz    s1, .LBB0_14                                  // |  8  :          v:  :  ::::         |  0                                  |
    li  s7, 4                                             // |  9  :          ::  : ^::::         |  0                                  |
    j   .LBB0_15                                          // |  8  :          ::  :  ::::         |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    addi    a0, sp, 20                                    // |  9  v          ::  :  ::::^        |  0                                  |
    call    strlen@plt                                    // | 10 ^:          ::  :  :::::        |  0                                  |
    bltu    s11, a0, .LBB0_6                              // |  9  :          ::  :  :::vv        |  0                                  |
    add a0, a0, s9                                        // |  8  :          ::  :  :v: ^        |  0                                  |
    sb  s10, 0(a0)                                        // |  7  :          ::  :  : v v        |  0                                  |
    sb  zero, 1(a0)                                       // |  6  :          ::  :  :   v        |  0                                  |
    j   .LBB0_6                                           // |  5  :          ::  :  :            |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    slliw   s7, s1, 1                                     // |  6  :          v:  : ^:            |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    slli    a1, s7, 2                                     // |  7  :          ::  : v:    ^       |  0                                  |
    mv  a0, s8                                            // |  7  :          ::  : :v   ^        |  0                                  |
    call    realloc@plt                                   // |  7 ^:          ::  : :    :        |  0                                  |
    mv  s8, a0                                            // |  7  :          ::  : :^   v        |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    slli    a0, s1, 2                                     // |  7  :          v:  : ::   ^        |  0                                  |
    addiw   s1, s1, 1                                     // |  6  :          ^:  : ::            |  0                                  |
    add a0, a0, s8                                        // |  7  :          ::  : :v   ^        |  0                                  |
    li  a1, 4                                             // |  8  :          ::  : ::   :^       |  0                                  |
    sw  a1, 0(a0)                                         // |  8  :          ::  : ::   vv       |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    addi    a0, sp, 20                                    // |  7  v          ::  : ::   ^        |  0                                  |
    li  a2, 3                                             // |  7  :          ::  : ::     ^      |  0                                  |
    mv  a1, s5                                            // |  7  :          ::  v ::    ^       |  0                                  |
    call    bcmp@plt                                      // |  6 ^:          ::    ::            |  0                                  |
    sext.w  a0, a0                                        // |  6  :          ::    ::   ^        |  0                                  |
    bnez    a0, .LBB0_24                                  // |  6  :          ::    ::   v        |  0                                  |
    bne s1, s7, .LBB0_23                                  // |  5  :          v:    v:            |  0                                  |
    bgtz    s7, .LBB0_21                                  // |  5  :          ::    v:            |  0                                  |
    li  s7, 4                                             // |  5  :          ::    ^:            |  0                                  |
    j   .LBB0_22                                          // |  4  :          ::     :            |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    slliw   s7, s7, 1                                     // |  5  :          ::    ^:            |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    slli    a1, s7, 2                                     // |  6  :          ::    v:    ^       |  0                                  |
    mv  a0, s8                                            // |  6  :          ::    :v   ^        |  0                                  |
    call    realloc@plt                                   // |  6 ^:          ::    :    :        |  0                                  |
    mv  s8, a0                                            // |  6  :          ::    :^   v        |  0                                  |
.LBB0_23:                                                 // |                                    |                                     |
    slli    a0, s1, 2                                     // |  6  :          v:    ::   ^        |  0                                  |
    addiw   s1, s1, 1                                     // |  5  :          ^:    ::            |  0                                  |
    add a0, a0, s8                                        // |  6  :          ::    :v   ^        |  0                                  |
    li  a1, 2                                             // |  6  :          ::    :    :^       |  0                                  |
    sw  a1, 0(a0)                                         // |  6  :          ::    :    vv       |  0                                  |
.LBB0_24:                                                 // |                                    |                                     |
.LBB0_31:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str.3)                       // |  5  :          ::    :     ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_31)                   // |  5  :          ::    :     ^       |  0                                  |
    addi    a0, sp, 20                                    // |  5  v          ::    :    ^        |  0                                  |
    li  a2, 3                                             // |  5  :          ::    :      ^      |  0                                  |
    call    bcmp@plt                                      // |  5 ^:          ::    :             |  0                                  |
    sext.w  a0, a0                                        // |  5  :          ::    :    ^        |  0                                  |
    bnez    a0, .LBB0_5                                   // |  5  :          ::    :    v        |  0                                  |
    bne s1, s7, .LBB0_4                                   // |  4  :          v:    v             |  0                                  |
    blez    s7, .LBB0_2                                   // |  3  :           :    v             |  0                                  |
    slliw   s7, s7, 1                                     // |  3  :           :    ^             |  0                                  |
    j   .LBB0_3                                           // |  2  :           :                  |  0                                  |
.LBB0_28:                                                 // |                                    |                                     |
    li  s1, 0                                             // |  3  :          ^:                  |  0                                  |
    li  s8, 0                                             // |  4  :          ::     ^            |  0                                  |
.LBB0_29:                                                 // |                                    |                                     |
    mv  a0, s2                                            // |  5  :          :v     :   ^        |  0                                  |
    call    free@plt                                      // |  4 ^:          :      :            |  0                                  |
    ld  a0, 8(sp)                                         // |  4  v          :      :   ^        |  0                                  |
    sw  s1, 0(a0)                                         // |  4  :          v      :   v        |  0                                  |
    mv  a0, s8                                            // |  3  :                 v   ^        |  0                                  |
    ld  ra, 120(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 112(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 104(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 96(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 88(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 80(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 72(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 64(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 56(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 48(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 40(sp)                                        // |  3 :v                  ^           |  0                                  |
    ld  s10, 32(sp)                                       // |  3 :v                   ^          |  0                                  |
    ld  s11, 24(sp)                                       // |  3 :v                    ^         |  0                                  |
    addi    sp, sp, 128                                   // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "o"                                           // |                                    |                                     |
    .size   .L.str.1, 2                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  "o|"                                          // |                                    |                                     |
    .size   .L.str.2, 3                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  ".|"                                          // |                                    |                                     |
    .size   .L.str.3, 3                                   // |                                    |                                     |
    .ident  "Debian clang version 15.0.7"                 // |                                    |                                     |
    .section    ".note.GNU-stack","",@progbits            // |                                    |                                     |
    .addrsig                                              // |                                    |                                     |
                                                          // +....................................+.....................................+
                                                          // Legend:
                                                          //     ^       : Register assignment (write)
                                                          //     v       : Register usage (read)
                                                          //     x       : Register usage and reassignment (R/W)
                                                          //     :       : Register in use (live)
                                                          //     <space> : Register not in use
                                                          //     #       : Number of occupied registers
