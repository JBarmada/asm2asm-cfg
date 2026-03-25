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
    blez    a1, .LBB0_7                                   // |  1                         v       |  0                                  |
    li  a3, 0                                             // |  1                           ^     |  0                                  |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    lui a4, 699051                                        // |  1                            ^    |  0                                  |
    addiw   a6, a4, -1365                                 // |  2                            v ^  |  0                                  |
    lui a4, 349525                                        // |  2                            ^ :  |  0                                  |
    addiw   a7, a4, 1365                                  // |  3                            v :^ |  0                                  |
    j   .LBB0_4                                           // |  2                              :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a4, 0(a0)                                         // |  4                        v   ^ :: |  0                                  |
    mulw    a4, a4, a4                                    // |  3                            ^ :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addw    a2, a2, a4                                    // |  4                          ^ v :: |  0                                  |
    addi    a3, a3, 1                                     // |  3                           ^  :: |  0                                  |
    addi    a0, a0, 4                                     // |  4                        ^  :  :: |  0                                  |
    beq a1, a3, .LBB0_8                                   // |  5                        :v v  :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    mulw    a4, a3, a6                                    // |  5                        :  v^ v: |  0                                  |
    bgeu    a7, a4, .LBB0_2                               // |  4                        :  :v  v |  0                                  |
    lw  a4, 0(a0)                                         // |  3                        v  :^    |  0                                  |
    andi    a5, a3, 3                                     // |  3                           v:^   |  0                                  |
    bnez    a5, .LBB0_3                                   // |  2                            :v   |  0                                  |
    mulw    a5, a4, a4                                    // |  2                            v^   |  0                                  |
    mulw    a4, a5, a4                                    // |  2                            ^v   |  0                                  |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
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
