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
    addi    sp, sp, -64                                   // |  1  ^                              |  0                                  |
    sd  ra, 56(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 48(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 40(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 32(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 24(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 16(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 8(sp)                                         // |  2  v              v               |  0                                  |
    sd  s6, 0(sp)                                         // |  2  v               v              |  0                                  |
    mv  s2, a4                                            // |  3  :           ^             v    |  0                                  |
    mv  s4, a3                                            // |  4  :           : ^          v     |  0                                  |
    mv  s3, a2                                            // |  5  :           :^:         v      |  0                                  |
    mv  s6, a1                                            // |  6  :           ::: ^      v       |  0                                  |
    mv  s5, a0                                            // |  7  :           :::^:     v        |  0                                  |
    slli    a0, a1, 2                                     // |  8  :           :::::     ^v       |  0                                  |
    call    malloc@plt                                    // |  8 ^:           :::::     :        |  0                                  |
    blez    s6, .LBB0_21                                  // |  7  :           ::::v     :        |  0                                  |
    li  a2, 0                                             // |  8  :           :::::     : ^      |  0                                  |
    li  a3, 0                                             // |  8  :           :::::     :  ^     |  0                                  |
    slli    a1, s4, 32                                    // |  9  :           ::v::     :^ :     |  0                                  |
    srli    a6, a1, 32                                    // | 10  :           :::::     :v :  ^  |  0                                  |
    j   .LBB0_4                                           // |  9  :           :::::     :  :  :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    slli    a1, a3, 2                                     // | 10  :           :::::     :^ v  :  |  0                                  |
    addiw   a3, a3, 1                                     // |  9  :           :::::     :  ^  :  |  0                                  |
    add a1, a1, a0                                        // | 10  :           :::::     v^ :  :  |  0                                  |
    sw  a4, 0(a1)                                         // | 11  :           :::::     :v :v :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a2, a2, 1                                     // | 10  :           :::::     : ^:  :  |  0                                  |
    beq a2, s6, .LBB0_12                                  // | 10  :           ::::v     : v:  :  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a4, a2, 2                                     // | 10  :           ::::      : v:^ :  |  0                                  |
    blez    a3, .LBB0_8                                   // |  9  :           ::::      :  v: :  |  0                                  |
    add a1, s5, a4                                        // | 10  :           :::v      :^ :v :  |  0                                  |
    lw  a5, 0(a1)                                         // | 11  :           ::::      :v ::^:  |  0                                  |
    mv  a1, a3                                            // | 11  :           ::::      :^ v:::  |  0                                  |
    mv  s1, a0                                            // | 11  :          ^::::      v  ::::  |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lw  s0, 0(s1)                                         // | 12  :         ^v::::      :  ::::  |  0                                  |
    beq s0, a5, .LBB0_3                                   // | 11  :         v ::::      :  ::v:  |  0                                  |
    addi    a1, a1, -1                                    // | 11  :         : ::::      :^ :: :  |  0                                  |
    addi    s1, s1, 4                                     // | 12  :         :^::::      :: :: :  |  0                                  |
    bnez    a1, .LBB0_6                                   // | 11  :         : ::::      :v :: :  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    blez    s4, .LBB0_3                                   // | 10  :         : ::v:      :  :: :  |  0                                  |
    add a1, s5, a4                                        // | 10  :         : :: v      :^ :v :  |  0                                  |
    lw  a4, 0(a1)                                         // |  9  :         : ::        :v :^ :  |  0                                  |
    mv  a5, a6                                            // |  9  :         : ::        :  ::^v  |  0                                  |
    mv  a1, s3                                            // |  8  :         : :v        :^ ::    |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    lw  s1, 0(a1)                                         // |  8  :         :^:         :v ::    |  0                                  |
    beq a4, s1, .LBB0_2                                   // |  7  :         :v:         :  :v    |  0                                  |
    addi    a5, a5, -1                                    // |  6  :         : :         :  : ^   |  0                                  |
    addi    a1, a1, 4                                     // |  7  :         : :         :^ : :   |  0                                  |
    bnez    a5, .LBB0_10                                  // |  6  :         : :         :  : v   |  0                                  |
    j   .LBB0_3                                           // |  5  :         : :         :  :     |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    li  a1, 2                                             // |  6  :         : :         :^ :     |  0                                  |
    blt a3, a1, .LBB0_22                                  // |  6  :         : :         :v v     |  0                                  |
    li  a2, 0                                             // |  6  :         : :         : ^:     |  0                                  |
    addiw   a7, a3, -1                                    // |  6  :         : :         :  v   ^ |  0                                  |
    addi    a6, a0, 4                                     // |  7  :         : :         v  :  ^: |  0                                  |
    mv  a5, a7                                            // |  8  :         : :         :  : ^:v |  0                                  |
    j   .LBB0_15                                          // |  7  :         : :         :  :  :: |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  8  :         : :         : ^:  :: |  0                                  |
    addiw   a5, a5, -1                                    // |  9  :         : :         : :: ^:: |  0                                  |
    bge a2, a7, .LBB0_22                                  // |  9  :         : :         : v: ::v |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    not a1, a2                                            // |  9  :         : :         :^v: ::  |  0                                  |
    addw    a1, a1, a3                                    // |  8  :         : :         :^ v ::  |  0                                  |
    blez    a1, .LBB0_14                                  // |  7  :         : :         :v   ::  |  0                                  |
    lw  a1, 0(a0)                                         // |  7  :         : :         v^   ::  |  0                                  |
    slli    a4, a5, 32                                    // |  7  :         : :          :  ^v:  |  0                                  |
    srli    s1, a4, 32                                    // |  7  :         :^:          :  v :  |  0                                  |
    mv  a4, a6                                            // |  6  :         : :          :  ^ v  |  0                                  |
    j   .LBB0_19                                          // |  5  :         : :          :  :    |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    sw  s0, -4(a4)                                        // |  5  :         v :          :  v    |  0                                  |
    sw  a1, 0(a4)                                         // |  4  :           :          v  v    |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    addi    s1, s1, -1                                    // |  4  :          ^:          :       |  0                                  |
    addi    a4, a4, 4                                     // |  5  :          ::          :  ^    |  0                                  |
    beqz    s1, .LBB0_14                                  // |  5  :          v:          :  :    |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    lw  s0, 0(a4)                                         // |  5  :         ^ :          :  v    |  0                                  |
    blt s0, a1, .LBB0_17                                  // |  4  :         v :          v       |  0                                  |
    mv  a1, s0                                            // |  4  :         v :          ^       |  0                                  |
    j   .LBB0_18                                          // |  2  :           :                  |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    li  a3, 0                                             // |  3  :           :            ^     |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    sw  a3, 0(s2)                                         // |  3  :           v            v     |  0                                  |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  3 :v              ^               |  0                                  |
    ld  s6, 0(sp)                                         // |  3 :v               ^              |  0                                  |
    addi    sp, sp, 64                                    // |  2 :^                              |  0                                  |
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
