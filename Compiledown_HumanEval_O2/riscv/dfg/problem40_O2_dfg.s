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
    li  a3, 2                                             // |  1                           ^     |  0                                  |
    li  a7, 1                                             // |  1                               ^ |  0                                  |
    li  a6, 4                                             // |  2                              ^: |  0                                  |
    j   .LBB0_3                                           // |  2                              :: |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    snez    a3, a3                                        // |  3                           ^  :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addw    a2, a2, a3                                    // |  4                          ^v  :: |  0                                  |
    addw    a3, a1, a7                                    // |  5                         v:^  :v |  0                                  |
    mv  a7, a1                                            // |  5                         v::  :^ |  0                                  |
    beq a2, a0, .LBB0_8                                   // |  4                        v v:  :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    bge a2, a0, .LBB0_9                                   // |  4                        v v:  :  |  0                                  |
    mv  a1, a3                                            // |  3                         ^ v  :  |  0                                  |
    li  a3, 1                                             // |  3                         : ^  :  |  0                                  |
    blt a1, a6, .LBB0_2                                   // |  2                         v    v  |  0                                  |
    li  a5, 2                                             // |  2                         :   ^   |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    remw    a3, a1, a5                                    // |  3                         v ^ v   |  0                                  |
    beqz    a3, .LBB0_1                                   // |  2                         : v     |  0                                  |
    addiw   a5, a5, 1                                     // |  2                         :   ^   |  0                                  |
    mulw    a4, a5, a5                                    // |  3                         :  ^v   |  0                                  |
    bge a1, a4, .LBB0_6                                   // |  2                         v  v    |  0                                  |
    j   .LBB0_1                                           // |  1                         :       |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  2                        ^v       |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
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
