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
    addi    sp, sp, -112                                  // |  1  ^                              |  0                                  |
    sd  ra, 104(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 96(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 88(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 80(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 72(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 64(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 56(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 48(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 40(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 32(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 24(sp)                                        // |  2  v                  v           |  0                                  |
    sd  s10, 16(sp)                                       // |  2  v                   v          |  0                                  |
    sd  s11, 8(sp)                                        // |  2  v                    v         |  0                                  |
    mv  s2, a4                                            // |  3  :           ^             v    |  0                                  |
    mv  s7, a3                                            // |  4  :           :    ^       v     |  0                                  |
    mv  s3, a2                                            // |  5  :           :^   :      v      |  0                                  |
    mv  s4, a1                                            // |  6  :           ::^  :     v       |  0                                  |
    mv  s5, a0                                            // |  7  :           :::^ :    v        |  0                                  |
    li  a0, 800                                           // |  7  :           :::: :    ^        |  0                                  |
    call    malloc@plt                                    // |  8 ^:           :::: :    :        |  0                                  |
    mv  s6, a0                                            // |  8  :           ::::^:    v        |  0                                  |
    blez    s4, .LBB0_8                                   // |  7  :           ::v:::             |  0                                  |
    li  s9, 0                                             // |  8  :           :::::: ^           |  0                                  |
    li  s11, 0                                            // |  8  :           ::::::   ^         |  0                                  |
    li  s8, 1                                             // |  9  :           ::::::^  :         |  0                                  |
    j   .LBB0_3                                           // |  9  :           :::::::  :         |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s9, s9, 1                                     // | 10  :           :::::::^ :         |  0                                  |
    beq s9, s4, .LBB0_9                                   // | 10  :           ::v::::v :         |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, s9, 2                                     // | 10  :           :: ::::v :^        |  0                                  |
    add a0, a0, s3                                        // | 10  :           :v ::::: :^        |  0                                  |
    lw  s1, 0(a0)                                         // | 10  :          ^:  ::::: :v        |  0                                  |
    blez    s1, .LBB0_2                                   // |  9  :          v:  ::::: :         |  0                                  |
    slli    a0, s9, 3                                     // | 10  :          ::  ::::v :^        |  0                                  |
    add a0, a0, s5                                        // | 10  :          ::  v:::: :^        |  0                                  |
    ld  s10, 0(a0)                                        // | 10  :          ::   ::::^:v        |  0                                  |
    addi    s0, s1, 1                                     // | 10  :         ^v:   ::::::         |  0                                  |
    j   .LBB0_6                                           // |  8  :           :   ::::::         |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  9  :         ^ :   ::::::         |  0                                  |
    bge s8, s0, .LBB0_2                                   // |  9  :         v :   ::v:::         |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   s1, s1, -1                                    // |  8  :          ^:   :: :::         |  0                                  |
    slli    a0, s1, 32                                    // |  9  :          v:   :: :::^        |  0                                  |
    srli    a0, a0, 30                                    // |  9  :          ::   :: :::^        |  0                                  |
    add a0, a0, s10                                       // |  9  :          ::   :: :v:^        |  0                                  |
    lw  a0, 0(a0)                                         // |  8  :          ::   :: : :v        |  0                                  |
    bne a0, s7, .LBB0_5                                   // |  8  :          ::   :v : :v        |  0                                  |
    li  a0, 8                                             // |  7  :          ::   :  : :^        |  0                                  |
    call    malloc@plt                                    // |  8 ^:          ::   :  : ::        |  0                                  |
    slli    a1, s11, 3                                    // |  8  :          ::   :  : v:^       |  0                                  |
    add a1, a1, s6                                        // |  7  :          ::   v  :  :^       |  0                                  |
    sd  a0, 0(a1)                                         // |  7  :          ::   :  :  vv       |  0                                  |
    sw  s9, 0(a0)                                         // |  6  :          ::   :  v  v        |  0                                  |
    sw  s1, 4(a0)                                         // |  5  :          v:   :     v        |  0                                  |
    addiw   s11, s11, 1                                   // |  4  :           :   :    ^         |  0                                  |
    j   .LBB0_5                                           // |  3  :           :   :              |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  s11, 0                                            // |  4  :           :   :    ^         |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    sw  s11, 0(s2)                                        // |  4  :           v   :    v         |  0                                  |
    mv  a0, s6                                            // |  3  :               v     ^        |  0                                  |
    ld  ra, 104(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 96(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 88(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 80(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 72(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 64(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 56(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 48(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 40(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 32(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 24(sp)                                        // |  3 :v                  ^           |  0                                  |
    ld  s10, 16(sp)                                       // |  3 :v                   ^          |  0                                  |
    ld  s11, 8(sp)                                        // |  3 :v                    ^         |  0                                  |
    addi    sp, sp, 112                                   // |  2 :^                              |  0                                  |
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
