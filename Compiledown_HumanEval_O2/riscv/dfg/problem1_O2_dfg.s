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
    mv  a6, a0                                            // |  2                        v     ^  |  0                                  |
    li  a0, 10                                            // |  2                        ^     :  |  0                                  |
    blez    a1, .LBB0_8                                   // |  2                         v    :  |  0                                  |
    li  a7, 0                                             // |  2                              :^ |  0                                  |
    addi    t0, a6, 4                                     // |  3     ^                        v: |  0                                  |
    li  a4, 1                                             // |  3                            ^ :: |  0                                  |
    j   .LBB0_3                                           // |  2                              :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a4, a4, 1                                     // |  3                            ^ :: |  0                                  |
    addi    t0, t0, 4                                     // |  4     ^                      : :: |  0                                  |
    beq a7, a1, .LBB0_8                                   // |  5     :                   v  : :v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, a7                                            // |  5     :                    ^ : :v |  0                                  |
    addi    a7, a7, 1                                     // |  4     :                      : :^ |  0                                  |
    bgeu    a7, a1, .LBB0_2                               // |  5     :                   v  : :v |  0                                  |
    slli    a2, a2, 2                                     // |  4     :                    ^ : :  |  0                                  |
    add a2, a2, a6                                        // |  4     :                    ^ : v  |  0                                  |
    flw ft0, 0(a2)                                        // |  3     :                    v :    |  1 ^                                |
    mv  a2, a1                                            // |  4     :                   v^ :    |  1 :                                |
    mv  a3, t0                                            // |  3     v                     ^:    |  1 :                                |
.LBB0_5:                                                  // |                                    |                                     |
    flw ft1, 0(a3)                                        // |  2                           v:    |  2 :^                               |
    fsub.s  ft1, ft0, ft1                                 // |  1                            :    |  2 v^                               |
    fabs.s  ft1, ft1                                      // |  1                            :    |  1  ^                               |
    flt.s   a5, ft1, fa0                                  // |  2                            :^   |  2  v          v                    |
    bnez    a5, .LBB0_7                                   // |  2                            :v   |  0                                  |
    addi    a2, a2, -1                                    // |  2                          ^ :    |  0                                  |
    addi    a3, a3, 4                                     // |  3                          :^:    |  0                                  |
    bne a4, a2, .LBB0_5                                   // |  2                          v v    |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a0, 1                                             // |  1                        ^        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
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
