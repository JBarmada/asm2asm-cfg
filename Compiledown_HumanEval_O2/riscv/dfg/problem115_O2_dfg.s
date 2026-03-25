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
    ld  a3, 0(a0)                                         // |  2                        v  ^     |  0                                  |
    li  a2, 2                                             // |  2                          ^:     |  0                                  |
    blt a1, a2, .LBB0_7                                   // |  3                         vv:     |  0                                  |
    addi    a2, a0, 8                                     // |  3                        v ^:     |  0                                  |
    addi    a1, a1, -1                                    // |  2                         ^ :     |  0                                  |
    mv  a4, a3                                            // |  2                           v^    |  0                                  |
    j   .LBB0_3                                           // |  1                            :    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  2                         ^  :    |  0                                  |
    addi    a2, a2, 8                                     // |  3                         :^ :    |  0                                  |
    mv  a3, a0                                            // |  5                        v::^:    |  0                                  |
    beqz    a1, .LBB0_8                                   // |  4                         v:::    |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    ld  a0, 0(a2)                                         // |  4                        ^ v::    |  0                                  |
    bltz    a4, .LBB0_5                                   // |  3                        :  :v    |  0                                  |
    mv  a4, a0                                            // |  3                        v  :^    |  0                                  |
    mv  a0, a4                                            // |  3                        ^  :v    |  0                                  |
    blt a4, a3, .LBB0_2                                   // |  3                        :  vv    |  0                                  |
    j   .LBB0_6                                           // |  2                        :  :     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    add a4, a4, a0                                        // |  3                        v  :^    |  0                                  |
    mv  a0, a4                                            // |  3                        ^  :v    |  0                                  |
    blt a4, a3, .LBB0_2                                   // |  2                           vv    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  a0, a3                                            // |  2                        ^  v     |  0                                  |
    j   .LBB0_2                                           // |  1                           :     |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, a3                                            // |  2                        ^  v     |  0                                  |
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
