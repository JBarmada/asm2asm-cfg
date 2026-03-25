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
    addi    sp, sp, -160                                  // |  1  ^                              |  0                                  |
    sd  ra, 152(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 144(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 136(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 128(sp)                                       // |  2  v           v                  |  0                                  |
    sd  s3, 120(sp)                                       // |  2  v            v                 |  0                                  |
    sd  s4, 112(sp)                                       // |  2  v             v                |  0                                  |
    sd  s5, 104(sp)                                       // |  2  v              v               |  0                                  |
    sd  s6, 96(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 88(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 80(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 72(sp)                                        // |  2  v                  v           |  0                                  |
    sd  s10, 64(sp)                                       // |  2  v                   v          |  0                                  |
    sd  s11, 56(sp)                                       // |  2  v                    v         |  0                                  |
    mv  s4, a0                                            // |  3  :             ^       v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:             :                |  0                                  |
    mv  s3, a0                                            // |  4  :            ^:       v        |  0                                  |
    addiw   a0, a0, 2                                     // |  4  :            ::       ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:            ::       :        |  0                                  |
    slli    a1, s3, 32                                    // |  5  :            v:       :^       |  0                                  |
    mv  s2, a0                                            // |  6  :           ^::       v:       |  0                                  |
    li  s5, 0                                             // |  6  :           :::^       :       |  0                                  |
    bltz    a1, .LBB0_18                                  // |  5  :           :::        v       |  0                                  |
    li  s10, 0                                            // |  6  :           :::     ^  :       |  0                                  |
    li  s5, 0                                             // |  6  :           :::^       :       |  0                                  |
    li  s11, 0                                            // |  7  :           ::::     ^ :       |  0                                  |
    addiw   a0, s3, 1                                     // |  8  :           :v::     :^:       |  0                                  |
    slli    a0, a0, 32                                    // |  7  :           : ::     :^:       |  0                                  |
    srli    s3, a0, 32                                    // |  8  :           :^::     :v:       |  0                                  |
    addi    s6, sp, 6                                     // |  8  v           ::::^    : :       |  0                                  |
    li  s7, 32                                            // |  9  :           :::::^   : :       |  0                                  |
    li  s8, 2                                             // | 10  :           ::::::^  : :       |  0                                  |
    addi    s9, sp, 5                                     // | 11  v           :::::::^ : :       |  0                                  |
    j   .LBB0_4                                           // | 11  :           :::::::: : :       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   a0, s11, 1                                    // | 12  :           :::::::: v^:       |  0                                  |
    add a2, s9, s11                                       // | 13  :           :::::::v v::^      |  0                                  |
    sb  a1, 0(a2)                                         // | 12  :           ::::::::  :vv      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    s10, s10, 1                                   // | 11  :           ::::::::^ :        |  0                                  |
    mv  s11, a0                                           // | 12  :           :::::::::^v        |  0                                  |
    beq s10, s3, .LBB0_18                                 // | 11  :           :v::::::v:         |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a0, s4, s10                                       // | 11  :           : v:::::v:^        |  0                                  |
    lbu a1, 0(a0)                                         // | 10  :           :  ::::: :v^       |  0                                  |
    ori a0, a1, 32                                        // | 10  :           :  ::::: :^v       |  0                                  |
    bne a0, s7, .LBB0_2                                   // |  9  :           :  ::v:: :v        |  0                                  |
    blt s11, s8, .LBB0_13                                 // |  8  :           :  :::v: v         |  0                                  |
    li  a1, 0                                             // |  8  :           :  ::: : : ^       |  0                                  |
    addiw   a0, s11, -1                                   // |  9  :           :  ::: : v^:       |  0                                  |
    slli    a0, a0, 32                                    // |  9  :           :  ::: : :^:       |  0                                  |
    srli    a6, a0, 32                                    // | 10  :           :  ::: : :v:    ^  |  0                                  |
    li  a2, 1                                             // | 10  :           :  ::: : : :^   :  |  0                                  |
    mv  s0, s6                                            // | 10  :         ^ :  :v: : : :    :  |  0                                  |
    j   .LBB0_8                                           // |  8  :           :  : : : : :    :  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addi    a2, a2, 1                                     // |  9  :           :  : : : : :^   :  |  0                                  |
    addi    s0, s0, 1                                     // | 10  :         ^ :  : : : : ::   :  |  0                                  |
    beq a1, a6, .LBB0_13                                  // | 10  :         : :  : : : : v:   v  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a3, a1                                            // | 10  :         : :  : : : : v:^     |  0                                  |
    addi    a1, a1, 1                                     // | 10  :         : :  : : : : ^::     |  0                                  |
    bgeu    a1, s11, .LBB0_7                              // | 10  :         : :  : : : v v::     |  0                                  |
    add a4, s9, a3                                        // | 10  :         : :  : : v :  :v^    |  0                                  |
    mv  a5, s11                                           // |  9  :         : :  : :   v  : :^   |  0                                  |
    mv  a3, s0                                            // |  9  :         v :  : :   :  :^:    |  0                                  |
    j   .LBB0_11                                          // |  7  :           :  : :   :  : :    |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    a5, a5, -1                                    // |  8  :           :  : :   :  : :^   |  0                                  |
    addi    a3, a3, 1                                     // |  9  :           :  : :   :  :^::   |  0                                  |
    beq a2, a5, .LBB0_7                                   // |  9  :           :  : :   :  v::v   |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    lbu a0, 0(a4)                                         // |  8  :           :  : :   :^  :v    |  0                                  |
    lbu s1, 0(a3)                                         // |  9  :          ^:  : :   ::  v:    |  0                                  |
    bgeu    s1, a0, .LBB0_10                              // |  9  :          v:  : :   :v  ::    |  0                                  |
    sb  s1, 0(a4)                                         // |  9  :          v:  : :   ::  :v    |  0                                  |
    sb  a0, 0(a3)                                         // |  7  :           :  : :   :v  v     |  0                                  |
    j   .LBB0_10                                          // |  5  :           :  : :   :         |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    blez    s5, .LBB0_15                                  // |  5  :           :  v :   :         |  0                                  |
    add a0, s2, s5                                        // |  6  :           v  v :   :^        |  0                                  |
    addiw   s5, s5, 1                                     // |  6  :           :  ^ :   ::        |  0                                  |
    sb  s7, 0(a0)                                         // |  6  :           :  : v   :v        |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    bgtz    s11, .LBB0_17                                 // |  4  :           :  :     v         |  0                                  |
    li  a0, 0                                             // |  5  :           :  :     :^        |  0                                  |
    j   .LBB0_3                                           // |  4  :           :  :     :         |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    add a0, s2, s5                                        // |  5  :           v  v     :^        |  0                                  |
    addi    a1, sp, 5                                     // |  4  v           :        : ^       |  0                                  |
    mv  a2, s11                                           // |  4  :           :        v  ^      |  0                                  |
    call    memcpy@plt                                    // |  4 ^:           :        :         |  0                                  |
    li  a0, 0                                             // |  4  :           :        :^        |  0                                  |
    addw    s5, s5, s11                                   // |  4  :           :  ^     v         |  0                                  |
    j   .LBB0_3                                           // |  3  :           :  :               |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    add a0, s2, s5                                        // |  4  :           v  v      ^        |  0                                  |
    sb  zero, 0(a0)                                       // |  3  :           :         v        |  0                                  |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    ld  ra, 152(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 144(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 136(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 128(sp)                                       // |  3 :v           ^                  |  0                                  |
    ld  s3, 120(sp)                                       // |  3 :v            ^                 |  0                                  |
    ld  s4, 112(sp)                                       // |  3 :v             ^                |  0                                  |
    ld  s5, 104(sp)                                       // |  3 :v              ^               |  0                                  |
    ld  s6, 96(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 88(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 80(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 72(sp)                                        // |  3 :v                  ^           |  0                                  |
    ld  s10, 64(sp)                                       // |  3 :v                   ^          |  0                                  |
    ld  s11, 56(sp)                                       // |  3 :v                    ^         |  0                                  |
    addi    sp, sp, 160                                   // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
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
