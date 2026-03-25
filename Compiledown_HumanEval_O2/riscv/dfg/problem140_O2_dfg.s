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
    blez    a0, .LBB0_4                                   // |  1                        v        |  0                                  |
    addiw   a0, a0, 1                                     // |  1                        ^        |  0                                  |
    slli    a0, a0, 32                                    // |  1                        ^        |  0                                  |
    srli    a1, a0, 32                                    // |  2                        v^       |  0                                  |
    li  a2, 1                                             // |  2                         :^      |  0                                  |
    li  a0, 1                                             // |  3                        ^::      |  0                                  |
    li  a3, 1                                             // |  3                         ::^     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mul a3, a3, a2                                        // |  3                         :v^     |  0                                  |
    addi    a2, a2, 1                                     // |  3                         :^:     |  0                                  |
    mul a0, a3, a0                                        // |  4                        ^::v     |  0                                  |
    bne a1, a2, .LBB0_2                                   // |  2                         vv      |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
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
