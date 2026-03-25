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
    bge a0, a1, .LBB0_2                                   // |  2                        vv       |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    sext.w  a0, a0                                        // |  1                        ^        |  0                                  |
    ret                                                   // |  2 v                      :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  a1, 2                                             // |  2                        :^       |  0                                  |
    j   .LBB0_4                                           // |  1                        :        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addiw   a1, a1, 1                                     // |  2                        :^       |  0                                  |
    mulw    a2, a1, a1                                    // |  3                        :v^      |  0                                  |
    sext.w  a3, a0                                        // |  4                        v::^     |  0                                  |
    blt a3, a2, .LBB0_1                                   // |  4                        ::vv     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    remw    a2, a0, a1                                    // |  3                        vv^      |  0                                  |
    sext.w  a3, a0                                        // |  3                        v: ^     |  0                                  |
    snez    a2, a2                                        // |  2                         :^      |  0                                  |
    slt a3, a1, a3                                        // |  2                         v ^     |  0                                  |
    xori    a3, a3, 1                                     // |  2                         : ^     |  0                                  |
    or  a2, a2, a3                                        // |  3                         :^v     |  0                                  |
    bnez    a2, .LBB0_3                                   // |  2                         :v      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    divw    a0, a0, a1                                    // |  2                        ^v       |  0                                  |
    remw    a2, a0, a1                                    // |  3                        vv^      |  0                                  |
    seqz    a2, a2                                        // |  3                        ::^      |  0                                  |
    slt a3, a1, a0                                        // |  3                        vv ^     |  0                                  |
    and a2, a2, a3                                        // |  2                          ^v     |  0                                  |
    bnez    a2, .LBB0_5                                   // |  1                          v      |  0                                  |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
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
