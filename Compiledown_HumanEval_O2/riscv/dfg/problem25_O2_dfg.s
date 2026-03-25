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
    li  a1, 4                                             // |  1                         ^       |  0                                  |
    blt a0, a1, .LBB0_4                                   // |  2                        vv       |  0                                  |
    li  a2, 2                                             // |  1                          ^      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    divw    a1, a0, a2                                    // |  3                        v^v      |  0                                  |
    mulw    a3, a1, a2                                    // |  3                         vv^     |  0                                  |
    subw    a3, a0, a3                                    // |  2                        v  ^     |  0                                  |
    beqz    a3, .LBB0_5                                   // |  1                           v     |  0                                  |
    addiw   a2, a2, 1                                     // |  1                          ^      |  0                                  |
    mulw    a1, a2, a2                                    // |  2                         ^v      |  0                                  |
    bge a0, a1, .LBB0_2                                   // |  2                        vv       |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a1, 1                                             // |  1                         ^       |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  2                        ^v       |  0                                  |
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
