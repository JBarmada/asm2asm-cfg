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
    li  a1, 0                                             // |  1                         ^       |  0                                  |
    li  a2, 60                                            // |  1                          ^      |  0                                  |
    j   .LBB0_3                                           // |  1                          :      |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    addiw   a1, a1, 1                                     // |  2                         ^:      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a3, a3, -62                                   // |  2                          :^     |  0                                  |
    seqz    a3, a3                                        // |  2                          :^     |  0                                  |
    subw    a1, a1, a3                                    // |  3                         ^:v     |  0                                  |
    addi    a0, a0, 1                                     // |  3                        ^::      |  0                                  |
    bltz    a1, .LBB0_6                                   // |  3                        :v:      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lbu a3, 0(a0)                                         // |  4                        v::^     |  0                                  |
    beq a3, a2, .LBB0_1                                   // |  3                         :vv     |  0                                  |
    bnez    a3, .LBB0_2                                   // |  2                         : v     |  0                                  |
    seqz    a0, a1                                        // |  2                        ^v       |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
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
