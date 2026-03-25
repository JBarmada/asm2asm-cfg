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
    blez    a1, .LBB0_11                                  // |  1                         v       |  0                                  |
    li  a7, 0                                             // |  1                               ^ |  0                                  |
    li  a6, 0                                             // |  1                              ^  |  0                                  |
    j   .LBB0_4                                           // |  1                              :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a7, a5                                            // |  3                             v:^ |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  3                         ^    :: |  0                                  |
    addi    a0, a0, 4                                     // |  4                        ^:    :: |  0                                  |
    beqz    a1, .LBB0_12                                  // |  4                        :v    :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lw  a5, 0(a0)                                         // |  4                        v    ^:: |  0                                  |
    bltz    a5, .LBB0_8                                   // |  3                             v:: |  0                                  |
    beqz    a5, .LBB0_3                                   // |  3                             v:: |  0                                  |
    seqz    a3, a7                                        // |  4                           ^ ::v |  0                                  |
    slt a4, a5, a7                                        // |  4                            ^v:v |  0                                  |
    or  a3, a3, a4                                        // |  4                           ^v :: |  0                                  |
    bnez    a3, .LBB0_2                                   // |  3                           v  :: |  0                                  |
    mv  a5, a7                                            // |  3                             ^:v |  0                                  |
    j   .LBB0_2                                           // |  2                             ::  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    seqz    a4, a6                                        // |  3                            ^:v  |  0                                  |
    slt a3, a6, a5                                        // |  4                           ^:vv  |  0                                  |
    or  a3, a3, a4                                        // |  3                           ^v :  |  0                                  |
    bnez    a3, .LBB0_10                                  // |  2                           v  :  |  0                                  |
    mv  a5, a6                                            // |  2                             ^v  |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    mv  a6, a5                                            // |  2                             v^  |  0                                  |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a6, 0                                             // |  1                              ^  |  0                                  |
    li  a7, 0                                             // |  2                              :^ |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    sw  a6, 0(a2)                                         // |  3                          v   v: |  0                                  |
    sw  a7, 4(a2)                                         // |  2                          v    v |  0                                  |
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
