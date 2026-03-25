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
    beqz    a1, .LBB0_4                                   // |  1                         v       |  0                                  |
    li  a2, 1                                             // |  1                          ^      |  0                                  |
    bge a2, a1, .LBB0_5                                   // |  2                         vv      |  0                                  |
    lw  a6, 0(a0)                                         // |  2                        v     ^  |  0                                  |
    li  a3, 0                                             // |  2                           ^  :  |  0                                  |
    addi    a4, a0, 4                                     // |  3                        v   ^ :  |  0                                  |
    addi    a5, a1, -1                                    // |  4                         v  :^:  |  0                                  |
    mv  a2, a6                                            // |  3                          ^ : v  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lw  a7, 0(a4)                                         // |  2                            v  ^ |  0                                  |
    slt a2, a7, a2                                        // |  2                          ^    v |  0                                  |
    addw    a3, a3, a2                                    // |  3                          v^   : |  0                                  |
    addi    a5, a5, -1                                    // |  2                             ^ : |  0                                  |
    addi    a4, a4, 4                                     // |  3                            ^: : |  0                                  |
    mv  a2, a7                                            // |  3                          ^  : v |  0                                  |
    bnez    a5, .LBB0_3                                   // |  1                             v   |  0                                  |
    j   .LBB0_6                                           // |  0                                 |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a0, 1                                             // |  1                        ^        |  0                                  |
    ret                                                   // |  2 v                      :        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lw  a6, 0(a0)                                         // |  2                        v     ^  |  0                                  |
    li  a3, 0                                             // |  2                           ^  :  |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   a1, a1, -1                                    // |  3                         ^ :  :  |  0                                  |
    slli    a1, a1, 2                                     // |  3                         ^ :  :  |  0                                  |
    add a0, a0, a1                                        // |  4                        ^v :  :  |  0                                  |
    lw  a0, 0(a0)                                         // |  3                        v  :  :  |  0                                  |
    slt a0, a6, a0                                        // |  3                        ^  :  v  |  0                                  |
    addw    a0, a0, a3                                    // |  2                        ^  v     |  0                                  |
    sltiu   a0, a0, 2                                     // |  1                        ^        |  0                                  |
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
