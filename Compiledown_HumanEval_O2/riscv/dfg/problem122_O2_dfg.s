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
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    blez    a1, .LBB0_5                                   // |  1                         v       |  0                                  |
    addiw   a1, a1, -1                                    // |  1                         ^       |  0                                  |
    srliw   a1, a1, 1                                     // |  1                         ^       |  0                                  |
    addi    a1, a1, 1                                     // |  1                         ^       |  0                                  |
    lui a3, 524288                                        // |  1                           ^     |  0                                  |
    addiw   a3, a3, 1                                     // |  1                           ^     |  0                                  |
    li  a6, 1                                             // |  2                           :  ^  |  0                                  |
    j   .LBB0_3                                           // |  2                           :  :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  3                         ^ :  :  |  0                                  |
    addi    a0, a0, 8                                     // |  4                        ^: :  :  |  0                                  |
    beqz    a1, .LBB0_5                                   // |  4                        :v :  :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lw  a5, 0(a0)                                         // |  4                        v  : ^:  |  0                                  |
    and a4, a5, a3                                        // |  4                           v^v:  |  0                                  |
    bne a4, a6, .LBB0_2                                   // |  3                            v:v  |  0                                  |
    addw    a2, a2, a5                                    // |  2                          ^  v   |  0                                  |
    j   .LBB0_2                                           // |  1                          :      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
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
