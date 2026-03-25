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
    blez    a1, .LBB0_6                                   // |  1                         v       |  0                                  |
    lw  a2, 0(a0)                                         // |  2                        v ^      |  0                                  |
    bltz    a2, .LBB0_7                                   // |  1                          v      |  0                                  |
    addi    a0, a0, 4                                     // |  1                        ^        |  0                                  |
    li  a4, 1                                             // |  2                        :   ^    |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, a4                                            // |  3                        :  ^v    |  0                                  |
    beq a1, a4, .LBB0_5                                   // |  4                        :v :v    |  0                                  |
    lw  a4, 0(a0)                                         // |  3                        v  :^    |  0                                  |
    addw    a2, a2, a4                                    // |  3                          ^:v    |  0                                  |
    addi    a4, a3, 1                                     // |  3                          :v^    |  0                                  |
    addi    a0, a0, 4                                     // |  3                        ^ ::     |  0                                  |
    bgez    a2, .LBB0_3                                   // |  2                          v:     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sltu    a0, a3, a1                                    // |  3                        ^v v     |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a0, 1                                             // |  1                        ^        |  0                                  |
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
