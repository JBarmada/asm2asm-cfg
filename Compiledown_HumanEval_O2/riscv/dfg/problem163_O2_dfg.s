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
    sw  zero, 0(a3)                                       // |  1                           v     |  0                                  |
    mv  a6, a1                                            // |  2                         v    ^  |  0                                  |
    blt a0, a1, .LBB0_2                                   // |  2                        vv       |  0                                  |
    mv  a6, a0                                            // |  2                        v     ^  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    blt a1, a0, .LBB0_5                                   // |  3                        vv    :  |  0                                  |
    mv  a1, a0                                            // |  3                        v^    :  |  0                                  |
    j   .LBB0_5                                           // |  1                              :  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addiw   a1, a1, 1                                     // |  2                         ^    :  |  0                                  |
    bge a0, a6, .LBB0_7                                   // |  3                        v:    v  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sext.w  a0, a1                                        // |  2                        ^v       |  0                                  |
    slti    a5, a0, 10                                    // |  3                        v:   ^   |  0                                  |
    xori    a5, a5, 1                                     // |  2                         :   ^   |  0                                  |
    or  a5, a5, a1                                        // |  2                         v   ^   |  0                                  |
    andi    a5, a5, 1                                     // |  2                         :   ^   |  0                                  |
    bnez    a5, .LBB0_4                                   // |  2                         :   v   |  0                                  |
    lw  a5, 0(a3)                                         // |  3                         : v ^   |  0                                  |
    addiw   a4, a5, 1                                     // |  3                         :  ^v   |  0                                  |
    sw  a4, 0(a3)                                         // |  4                         : vv:   |  0                                  |
    slli    a4, a5, 2                                     // |  3                         :  ^v   |  0                                  |
    add a4, a4, a2                                        // |  3                         :v ^    |  0                                  |
    sw  a1, 0(a4)                                         // |  2                         v  v    |  0                                  |
    j   .LBB0_4                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
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
