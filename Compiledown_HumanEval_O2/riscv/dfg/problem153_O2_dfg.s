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
    blez    a3, .LBB0_2                                   // |  1                           v     |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    lw  a4, 0(a0)                                         // |  2                        v   ^    |  0                                  |
    lw  a5, 0(a1)                                         // |  2                         v   ^   |  0                                  |
    subw    a4, a4, a5                                    // |  2                            ^v   |  0                                  |
    sraiw   a5, a4, 31                                    // |  2                            v^   |  0                                  |
    xor a4, a4, a5                                        // |  2                            ^v   |  0                                  |
    subw    a4, a4, a5                                    // |  2                            ^v   |  0                                  |
    sw  a4, 0(a2)                                         // |  2                          v v    |  0                                  |
    addi    a2, a2, 4                                     // |  1                          ^      |  0                                  |
    addi    a1, a1, 4                                     // |  1                         ^       |  0                                  |
    addi    a3, a3, -1                                    // |  1                           ^     |  0                                  |
    addi    a0, a0, 4                                     // |  2                        ^  :     |  0                                  |
    bnez    a3, .LBB0_1                                   // |  1                           v     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
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
