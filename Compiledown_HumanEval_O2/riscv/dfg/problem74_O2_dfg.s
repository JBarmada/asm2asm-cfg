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
    li  a2, 2                                             // |  1                          ^      |  0                                  |
    blt a1, a2, .LBB0_4                                   // |  2                         vv      |  0                                  |
    li  a3, 0                                             // |  1                           ^     |  0                                  |
    li  a2, 0                                             // |  2                          ^:     |  0                                  |
    srliw   a6, a1, 1                                     // |  3                         v :  ^  |  0                                  |
    mv  a5, a0                                            // |  4                        v  : ^:  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a7, 0(a5)                                         // |  4                           : v:^ |  0                                  |
    not a4, a3                                            // |  4                           v^ :: |  0                                  |
    addw    a4, a4, a1                                    // |  4                         v  ^ :: |  0                                  |
    slli    a4, a4, 2                                     // |  3                            ^ :: |  0                                  |
    add a4, a4, a0                                        // |  4                        v   ^ :: |  0                                  |
    lw  a4, 0(a4)                                         // |  3                            v :: |  0                                  |
    xor a4, a7, a4                                        // |  3                            ^ :v |  0                                  |
    snez    a4, a4                                        // |  2                            ^ :  |  0                                  |
    addw    a2, a2, a4                                    // |  3                          ^ v :  |  0                                  |
    addi    a3, a3, 1                                     // |  3                          :^  :  |  0                                  |
    addi    a5, a5, 4                                     // |  4                          :: ^:  |  0                                  |
    bne a6, a3, .LBB0_2                                   // |  3                          :v  v  |  0                                  |
    mv  a0, a2                                            // |  2                        ^ v      |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    mv  a0, a2                                            // |  2                        ^ v      |  0                                  |
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
