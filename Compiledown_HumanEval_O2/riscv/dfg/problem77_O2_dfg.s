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
    blez    a0, .LBB0_4                                   // |  1                        v        |  0                                  |
    li  a4, 0                                             // |  1                            ^    |  0                                  |
    li  a6, 1                                             // |  2                            : ^  |  0                                  |
    li  a3, 1                                             // |  2                           ^:    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    beq a3, a0, .LBB0_5                                   // |  3                        v  v:    |  0                                  |
    mulw    a3, a3, a1                                    // |  3                         v ^:    |  0                                  |
    sltiu   a5, a4, 99                                    // |  3                           :v^   |  0                                  |
    addiw   a4, a4, 1                                     // |  3                           :^:   |  0                                  |
    slt a2, a0, a3                                        // |  4                        v ^v :   |  0                                  |
    xori    a2, a2, 1                                     // |  2                          ^  :   |  0                                  |
    and a2, a2, a5                                        // |  2                          ^  v   |  0                                  |
    bnez    a2, .LBB0_2                                   // |  1                          v      |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a6, 0                                             // |  1                              ^  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, a6                                            // |  2                        ^     v  |  0                                  |
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
