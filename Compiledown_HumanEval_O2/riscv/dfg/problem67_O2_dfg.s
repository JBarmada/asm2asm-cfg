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
    lbu a2, 0(a0)                                         // |  2                        v ^      |  0                                  |
    beqz    a2, .LBB0_5                                   // |  1                          v      |  0                                  |
    mv  a1, a0                                            // |  3                        v^:      |  0                                  |
    li  a0, 0                                             // |  2                        ^ :      |  0                                  |
    addi    a1, a1, 1                                     // |  2                         ^:      |  0                                  |
    li  a3, 26                                            // |  3                         ::^     |  0                                  |
    j   .LBB0_3                                           // |  3                         :::     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    andi    a4, a2, 255                                   // |  4                         :v:^    |  0                                  |
    lbu a2, 0(a1)                                         // |  4                         v^::    |  0                                  |
    addw    a0, a0, a4                                    // |  4                        ^ ::v    |  0                                  |
    addi    a1, a1, 1                                     // |  3                         ^::     |  0                                  |
    beqz    a2, .LBB0_6                                   // |  2                          v:     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addiw   a4, a2, -65                                   // |  3                          v:^    |  0                                  |
    andi    a4, a4, 255                                   // |  2                           :^    |  0                                  |
    bltu    a4, a3, .LBB0_2                               // |  2                           vv    |  0                                  |
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
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
