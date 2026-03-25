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
    beqz    a1, .LBB0_10                                  // |  1                         v       |  0                                  |
    blez    a1, .LBB0_11                                  // |  1                         v       |  0                                  |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    li  a3, 1                                             // |  1                           ^     |  0                                  |
    j   .LBB0_5                                           // |  0                                 |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, a5                                            // |  2                           ^ v   |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    sraiw   a5, a4, 31                                    // |  3                           :v^   |  0                                  |
    xor a4, a4, a5                                        // |  3                           :^v   |  0                                  |
    subw    a4, a4, a5                                    // |  3                           :^v   |  0                                  |
    addw    a2, a2, a4                                    // |  3                          ^:v    |  0                                  |
    addi    a1, a1, -1                                    // |  3                         ^::     |  0                                  |
    addi    a0, a0, 4                                     // |  4                        ^:::     |  0                                  |
    beqz    a1, .LBB0_9                                   // |  4                        :v::     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lw  a4, 0(a0)                                         // |  4                        v ::^    |  0                                  |
    li  a5, 0                                             // |  4                          :::^   |  0                                  |
    beqz    a4, .LBB0_7                                   // |  3                          ::v    |  0                                  |
    mv  a5, a3                                            // |  4                          :v:^   |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    bgez    a4, .LBB0_3                                   // |  3                          : v:   |  0                                  |
    negw    a3, a5                                        // |  3                          :^ v   |  0                                  |
    j   .LBB0_4                                           // |  2                          ::     |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    mulw    a0, a3, a2                                    // |  3                        ^ vv     |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    lui a0, 1048568                                       // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
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
