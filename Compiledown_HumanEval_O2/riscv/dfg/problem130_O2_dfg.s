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
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    blez    a1, .LBB0_25                                  // |  3  :           :          v       |  0                                  |
    li  a7, 0                                             // |  3  :           :                ^ |  0                                  |
    li  a6, 1                                             // |  3  :           :               ^  |  0                                  |
    j   .LBB0_3                                           // |  3  :           :               :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a7, a7, 1                                     // |  4  :           :               :^ |  0                                  |
    beq a7, a1, .LBB0_9                                   // |  5  :           :          v    :v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a2, a7, 3                                     // |  5  :           :           ^   :v |  0                                  |
    add a2, a2, a0                                        // |  6  :           :         v ^   :: |  0                                  |
    ld  s0, 0(a2)                                         // |  6  :         ^ :           v   :: |  0                                  |
    li  s1, 0                                             // |  5  :          ^:               :: |  0                                  |
    j   .LBB0_5                                           // |  4  :           :               :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    sext.w  t1, a5                                        // |  6  :   ^       :              v:: |  0                                  |
    sext.w  t0, a4                                        // |  7  :  ^:       :             v :: |  0                                  |
    addi    s1, s1, 1                                     // |  7  :  ::      ^:               :: |  0                                  |
    addi    s0, s0, 4                                     // |  8  :  ::     ^::               :: |  0                                  |
    beq a1, s1, .LBB0_2                                   // |  9  :  ::     :v:          v    :: |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lw  a2, 0(s0)                                         // |  9  :  ::     v::           ^   :: |  0                                  |
    mv  a5, a7                                            // |  9  :  ::      ::           :  ^:v |  0                                  |
    beq a2, a6, .LBB0_7                                   // |  7  :  ::      ::           v   v  |  0                                  |
    mv  a5, t1                                            // |  8  :  :v      ::           :  ^:  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a4, s1                                            // |  8  :  ::      v:           : ^ :  |  0                                  |
    beq a2, a6, .LBB0_4                                   // |  6  :  ::       :           v   v  |  0                                  |
    mv  a4, t0                                            // |  5  :  v:       :             ^    |  0                                  |
    j   .LBB0_4                                           // |  4  :  ::       :                  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    mulw    s1, a1, a1                                    // |  6  :  ::      ^:          v       |  0                                  |
    slli    a5, t0, 2                                     // |  6  :  v:      ::              ^   |  0                                  |
    blez    t1, .LBB0_13                                  // |  6  :  :v      ::              :   |  0                                  |
    addiw   a2, t1, -1                                    // |  7  :  :v      ::           ^  :   |  0                                  |
    slli    a2, a2, 32                                    // |  7  :  ::      ::           ^  :   |  0                                  |
    srli    a2, a2, 29                                    // |  7  :  ::      ::           ^  :   |  0                                  |
    add a2, a2, a0                                        // |  8  :  ::      ::         v ^  :   |  0                                  |
    ld  a2, 0(a2)                                         // |  7  :  ::      ::           v  :   |  0                                  |
    add a2, a2, a5                                        // |  7  :  ::      ::           ^  v   |  0                                  |
    lw  a2, 0(a2)                                         // |  7  :  ::      ::           v  :   |  0                                  |
    blt a2, s1, .LBB0_12                                  // |  7  :  ::      v:           v  :   |  0                                  |
    mv  a2, s1                                            // |  7  :  ::      v:           ^  :   |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    mv  s1, a2                                            // |  7  :  ::      ^:           v  :   |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    addiw   a1, a1, -1                                    // |  7  :  ::      ::          ^   :   |  0                                  |
    bge t1, a1, .LBB0_17                                  // |  7  :  :v      ::          v   :   |  0                                  |
    addiw   a2, t1, 1                                     // |  8  :  :v      ::          :^  :   |  0                                  |
    slli    a2, a2, 3                                     // |  8  :  ::      ::          :^  :   |  0                                  |
    add a2, a2, a0                                        // |  9  :  ::      ::         v:^  :   |  0                                  |
    ld  a2, 0(a2)                                         // |  8  :  ::      ::          :v  :   |  0                                  |
    add a2, a2, a5                                        // |  8  :  ::      ::          :^  v   |  0                                  |
    lw  a2, 0(a2)                                         // |  7  :  ::      ::          :v      |  0                                  |
    blt a2, s1, .LBB0_16                                  // |  7  :  ::      v:          :v      |  0                                  |
    mv  a2, s1                                            // |  7  :  ::      v:          :^      |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    mv  s1, a2                                            // |  7  :  ::      ^:          :v      |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    slli    a4, t1, 3                                     // |  7  :  :v      ::          :  ^    |  0                                  |
    blez    t0, .LBB0_21                                  // |  6  :  v       ::          :  :    |  0                                  |
    add a2, a0, a4                                        // |  8  :  :       ::         v:^ v    |  0                                  |
    ld  a2, 0(a2)                                         // |  7  :  :       ::          :v :    |  0                                  |
    addiw   a5, t0, -1                                    // |  7  :  v       ::          :  :^   |  0                                  |
    slli    a5, a5, 32                                    // |  7  :  :       ::          :  :^   |  0                                  |
    srli    a5, a5, 30                                    // |  7  :  :       ::          :  :^   |  0                                  |
    add a2, a2, a5                                        // |  8  :  :       ::          :^ :v   |  0                                  |
    lw  a2, 0(a2)                                         // |  7  :  :       ::          :v :    |  0                                  |
    blt a2, s1, .LBB0_20                                  // |  7  :  :       v:          :v :    |  0                                  |
    mv  a2, s1                                            // |  7  :  :       v:          :^ :    |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
    mv  s1, a2                                            // |  7  :  :       ^:          :v :    |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    bge t0, a1, .LBB0_26                                  // |  6  :  v       ::          v  :    |  0                                  |
    add a0, a0, a4                                        // |  6  :  :       ::         ^   v    |  0                                  |
    ld  a0, 0(a0)                                         // |  5  :  :       ::         v        |  0                                  |
    addiw   a1, t0, 1                                     // |  5  :  v       ::          ^       |  0                                  |
    slli    a1, a1, 2                                     // |  4  :          ::          ^       |  0                                  |
    add a0, a0, a1                                        // |  5  :          ::         ^v       |  0                                  |
    lw  a0, 0(a0)                                         // |  5  :          ::         v:       |  0                                  |
    blt a0, s1, .LBB0_24                                  // |  5  :          v:         v:       |  0                                  |
    mv  a0, s1                                            // |  5  :          v:         ^:       |  0                                  |
.LBB0_24:                                                 // |                                    |                                     |
    mv  s1, a0                                            // |  5  :          ^:         v:       |  0                                  |
    j   .LBB0_26                                          // |  3  :           :          :       |  0                                  |
.LBB0_25:                                                 // |                                    |                                     |
    mulw    s1, a1, a1                                    // |  4  :          ^:          v       |  0                                  |
.LBB0_26:                                                 // |                                    |                                     |
    sw  s2, 0(a3)                                         // |  4  :          :v            v     |  0                                  |
    slli    a0, s2, 2                                     // |  4  :          :v         ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:          ::         :        |  0                                  |
    blez    s2, .LBB0_31                                  // |  4  :          :v         :        |  0                                  |
    li  a1, 0                                             // |  5  :          ::         :^       |  0                                  |
    mv  a2, a0                                            // |  5  :          ::         v ^      |  0                                  |
    j   .LBB0_29                                          // |  4  :          ::           :      |  0                                  |
.LBB0_28:                                                 // |                                    |                                     |
    sw  a3, 0(a2)                                         // |  5  :          ::           vv     |  0                                  |
    addi    a1, a1, 1                                     // |  4  :          ::          ^       |  0                                  |
    addi    a2, a2, 4                                     // |  5  :          ::          :^      |  0                                  |
    beq s2, a1, .LBB0_31                                  // |  4  :          :v          v       |  0                                  |
.LBB0_29:                                                 // |                                    |                                     |
    andi    a4, a1, 1                                     // |  4  :          :           v  ^    |  0                                  |
    li  a3, 1                                             // |  4  :          :             ^:    |  0                                  |
    beqz    a4, .LBB0_28                                  // |  3  :          :              v    |  0                                  |
    mv  a3, s1                                            // |  3  :          v             ^     |  0                                  |
    j   .LBB0_28                                          // |  1  :                              |  0                                  |
.LBB0_31:                                                 // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
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
