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
    blez    a0, .LBB0_6                                   // |  1                        v        |  0                                  |
    li  a1, 1                                             // |  1                         ^       |  0                                  |
    beq a0, a1, .LBB0_5                                   // |  2                        vv       |  0                                  |
    li  a2, 3                                             // |  1                          ^      |  0                                  |
    li  a1, 18                                            // |  2                         ^:      |  0                                  |
    bltu    a0, a2, .LBB0_5                               // |  2                        v v      |  0                                  |
    li  a1, 18                                            // |  1                         ^       |  0                                  |
    li  a2, 2                                             // |  1                          ^      |  0                                  |
    li  a3, 10                                            // |  1                           ^     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  2                          ^:     |  0                                  |
    mulw    a1, a1, a3                                    // |  3                         ^:v     |  0                                  |
    blt a2, a0, .LBB0_4                                   // |  3                        v:v      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  2                        ^v       |  0                                  |
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
