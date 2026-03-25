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
    li  a4, 0                                             // |  1                            ^    |  0                                  |
    li  a3, 1                                             // |  1                           ^     |  0                                  |
    blez    a1, .LBB0_2                                   // |  1                         v       |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    lw  a5, 0(a0)                                         // |  2                        v    ^   |  0                                  |
    addw    a4, a4, a5                                    // |  2                            ^v   |  0                                  |
    mulw    a3, a5, a3                                    // |  3                           ^:v   |  0                                  |
    addi    a1, a1, -1                                    // |  3                         ^ ::    |  0                                  |
    addi    a0, a0, 4                                     // |  4                        ^: ::    |  0                                  |
    bnez    a1, .LBB0_1                                   // |  3                         v ::    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sw  a4, 0(a2)                                         // |  3                          v:v    |  0                                  |
    sw  a3, 4(a2)                                         // |  2                          vv     |  0                                  |
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
