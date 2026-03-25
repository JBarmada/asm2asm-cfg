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
    li  a3, 2                                             // |  1                           ^     |  0                                  |
    li  a2, 1                                             // |  2                          ^:     |  0                                  |
    blt a1, a3, .LBB0_8                                   // |  2                         v v     |  0                                  |
    flw ft0, 0(a0)                                        // |  1                        v        |  1 ^                                |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    li  a5, 0                                             // |  1                             ^   |  0                                  |
    addi    a0, a0, 4                                     // |  1                        ^        |  0                                  |
    addi    a1, a1, -1                                    // |  1                         ^       |  0                                  |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  1                         ^       |  0                                  |
    addi    a0, a0, 4                                     // |  2                        ^:       |  0                                  |
    fmv.s   ft0, ft1                                      // |  2                        ::       |  2 ^v                               |
    mv  a2, a6                                            // |  4                        ::^   v  |  1 :                                |
    mv  a5, a4                                            // |  5                        ::: v^   |  1 :                                |
    beqz    a1, .LBB0_7                                   // |  4                        :v:  :   |  1 :                                |
.LBB0_3:                                                  // |                                    |                                     |
    flw ft1, 0(a0)                                        // |  3                        v :  :   |  2 :^                               |
    flt.s   a3, ft0, ft1                                  // |  3                          :^ :   |  2 vv                               |
    li  a6, 1                                             // |  4                          :: :^  |  2 ::                               |
    li  a4, 1                                             // |  4                          ::^:   |  2 ::                               |
    bnez    a3, .LBB0_5                                   // |  3                          :v :   |  2 ::                               |
    mv  a4, a5                                            // |  3                          : ^v   |  2 ::                               |
.LBB0_5:                                                  // |                                    |                                     |
    flt.s   a3, ft1, ft0                                  // |  3                          :^:    |  2 vv                               |
    bnez    a3, .LBB0_2                                   // |  3                          :v:    |  0                                  |
    mv  a6, a2                                            // |  3                          v : ^  |  0                                  |
    j   .LBB0_2                                           // |  2                            : :  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addw    a0, a6, a4                                    // |  3                        ^   v v  |  0                                  |
    addi    a0, a0, -2                                    // |  1                        ^        |  0                                  |
    snez    a2, a0                                        // |  2                        v ^      |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
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
