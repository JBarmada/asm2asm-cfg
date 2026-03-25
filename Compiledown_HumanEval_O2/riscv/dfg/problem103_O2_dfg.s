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
    mv  a2, a0                                            // |  2                        v ^      |  0                                  |
    li  a0, -1                                            // |  2                        ^ :      |  0                                  |
    blt a1, a2, .LBB0_3                                   // |  2                         vv      |  0                                  |
    xor a3, a1, a2                                        // |  3                         vv^     |  0                                  |
    lui a2, 524288                                        // |  1                          ^      |  0                                  |
    addiw   a2, a2, 1                                     // |  1                          ^      |  0                                  |
    and a2, a2, a1                                        // |  2                         v^      |  0                                  |
    xori    a4, a2, 1                                     // |  2                          v ^    |  0                                  |
    or  a3, a3, a4                                        // |  3                          :^v    |  0                                  |
    beqz    a3, .LBB0_3                                   // |  2                          :v     |  0                                  |
    addi    a0, a2, -1                                    // |  2                        ^ v      |  0                                  |
    seqz    a0, a0                                        // |  1                        ^        |  0                                  |
    subw    a0, a1, a0                                    // |  2                        ^v       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
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
