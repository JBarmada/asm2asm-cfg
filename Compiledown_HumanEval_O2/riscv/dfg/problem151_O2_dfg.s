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
    mv  a6, a2                                            // |  2                          v   ^  |  0                                  |
    slti    a3, a0, 2                                     // |  2                        v  ^     |  0                                  |
    li  a5, 4                                             // |  2                           : ^   |  0                                  |
    xori    a4, a3, 1                                     // |  3                           v^:   |  0                                  |
    bge a0, a5, .LBB0_5                                   // |  3                        v   :v   |  0                                  |
    mv  a5, a4                                            // |  2                            v^   |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    beqz    a5, .LBB0_4                                   // |  1                             v   |  0                                  |
    mv  a6, a1                                            // |  3                         v   :^  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    mv  a0, a6                                            // |  3                        ^    :v  |  0                                  |
    ret                                                   // |  3 v                      :    :   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a3, 2                                             // |  3                        :  ^ :   |  0                                  |
    j   .LBB0_7                                           // |  2                        :    :   |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   a3, a3, 1                                     // |  3                        :  ^ :   |  0                                  |
    mulw    a2, a3, a3                                    // |  4                        : ^v :   |  0                                  |
    mv  a4, a5                                            // |  5                        : ::^v   |  0                                  |
    blt a0, a2, .LBB0_2                                   // |  4                        v v::    |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    remw    a2, a0, a3                                    // |  4                        v ^v:    |  0                                  |
    li  a5, 0                                             // |  3                          : :^   |  0                                  |
    beqz    a2, .LBB0_6                                   // |  2                          v :    |  0                                  |
    mv  a5, a4                                            // |  2                            v^   |  0                                  |
    j   .LBB0_6                                           // |  0                                 |  0                                  |
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
