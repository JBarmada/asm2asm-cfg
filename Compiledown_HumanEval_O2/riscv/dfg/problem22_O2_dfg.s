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
    flw ft1, 0(a0)                                        // |  1                        v        |  1  ^                               |
    li  a2, 2                                             // |  1                          ^      |  1  :                               |
    blt a1, a2, .LBB0_7                                   // |  2                         vv      |  1  :                               |
    addi    a2, a0, 4                                     // |  2                        v ^      |  1  :                               |
    addi    a3, a1, -1                                    // |  2                         v ^     |  1  :                               |
    fmv.s   ft3, ft1                                      // |  0                                 |  2  v ^                             |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a3, a3, -1                                    // |  1                           ^     |  0                                  |
    addi    a2, a2, 4                                     // |  2                          ^:     |  0                                  |
    fmv.s   ft1, ft2                                      // |  2                          ::     |  2  ^v                              |
    fmv.s   ft3, ft0                                      // |  2                          ::     |  3 v: ^                             |
    beqz    a3, .LBB0_8                                   // |  2                          :v     |  2  : :                             |
.LBB0_3:                                                  // |                                    |                                     |
    flw ft2, 0(a2)                                        // |  1                          v      |  3  :^:                             |
    flt.s   a4, ft2, ft3                                  // |  1                            ^    |  3  :vv                             |
    fmv.s   ft0, ft2                                      // |  1                            :    |  4 ^:v:                             |
    bnez    a4, .LBB0_5                                   // |  1                            v    |  3  :::                             |
    fmv.s   ft0, ft3                                      // |  0                                 |  4 ^::v                             |
.LBB0_5:                                                  // |                                    |                                     |
    flt.s   a4, ft1, ft2                                  // |  1                            ^    |  2  vv                              |
    bnez    a4, .LBB0_2                                   // |  1                            v    |  1  :                               |
    fmv.s   ft2, ft1                                      // |  0                                 |  2  v^                              |
    j   .LBB0_2                                           // |  0                                 |  1  :                               |
.LBB0_7:                                                  // |                                    |                                     |
    fmv.s   ft0, ft1                                      // |  0                                 |  2 ^v                               |
    fmv.s   ft2, ft1                                      // |  0                                 |  3 :v^                              |
.LBB0_8:                                                  // |                                    |                                     |
    blez    a1, .LBB0_11                                  // |  1                         v       |  2 : :                              |
    fsub.s  ft1, ft2, ft0                                 // |  0                                 |  3 v^v                              |
.LBB0_10:                                                 // |                                    |                                     |
    flw ft2, 0(a0)                                        // |  1                        v        |  3 ::^                              |
    fsub.s  ft2, ft2, ft0                                 // |  0                                 |  3 v:^                              |
    fdiv.s  ft2, ft2, ft1                                 // |  0                                 |  2  v^                              |
    fsw ft2, 0(a0)                                        // |  1                        v        |  1   ^                              |
    addi    a1, a1, -1                                    // |  1                         ^       |  0                                  |
    addi    a0, a0, 4                                     // |  2                        ^:       |  0                                  |
    bnez    a1, .LBB0_10                                  // |  1                         v       |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
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
