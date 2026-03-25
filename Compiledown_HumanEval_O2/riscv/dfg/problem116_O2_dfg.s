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
    blez    a1, .LBB0_9                                   // |  1                         v       |  0                                  |
    li  t1, 0                                             // |  1      ^                          |  0                                  |
    li  t0, 0                                             // |  1     ^                           |  0                                  |
    addiw   a6, a3, -1                                    // |  2                           v  ^  |  0                                  |
    slli    a4, a2, 32                                    // |  3                          v ^ :  |  0                                  |
    srli    a7, a4, 32                                    // |  3                            v :^ |  0                                  |
    j   .LBB0_3                                           // |  2                              :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t1, t1, 1                                     // |  3      ^                       :: |  0                                  |
    beq t1, a1, .LBB0_8                                   // |  4      v                  v    :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    blez    a2, .LBB0_2                                   // |  4      :                   v   :: |  0                                  |
    slli    a4, t1, 3                                     // |  4      v                     ^ :: |  0                                  |
    add a4, a4, a0                                        // |  4                        v   ^ :: |  0                                  |
    ld  t3, 0(a4)                                         // |  4        ^                   v :: |  0                                  |
    li  t2, 0                                             // |  4       ^:                     :: |  0                                  |
    mv  a5, a7                                            // |  4        :                    ^:v |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lw  a4, 0(t3)                                         // |  3        v                   ^ :  |  0                                  |
    addw    t2, a4, t2                                    // |  3       ^                    v :  |  0                                  |
    addi    a5, a5, -1                                    // |  3       :                     ^:  |  0                                  |
    addi    t3, t3, 4                                     // |  4       :^                    ::  |  0                                  |
    bnez    a5, .LBB0_5                                   // |  3       :                     v:  |  0                                  |
    blez    t2, .LBB0_2                                   // |  2       v                      :  |  0                                  |
    addw    a4, a6, t2                                    // |  3       v                    ^ v  |  0                                  |
    divw    a4, a4, a3                                    // |  2                           v^    |  0                                  |
    addw    t0, a4, t0                                    // |  2     ^                      v    |  0                                  |
    j   .LBB0_2                                           // |  1     :                           |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, t0                                            // |  2     v                  ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
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
