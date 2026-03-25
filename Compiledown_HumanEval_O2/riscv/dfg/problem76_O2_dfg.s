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
    li  a1, 2                                             // |  1                         ^       |  0                                  |
    bge a0, a1, .LBB0_2                                   // |  2                        vv       |  0                                  |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
    ret                                                   // |  2 v                      :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  a1, 4                                             // |  2                        :^       |  0                                  |
    bgeu    a0, a1, .LBB0_5                               // |  2                        vv       |  0                                  |
    li  a1, 0                                             // |  1                         ^       |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    sext.w  a0, a0                                        // |  2                        ^:       |  0                                  |
    slti    a0, a0, 2                                     // |  2                        ^:       |  0                                  |
    xori    a0, a0, 1                                     // |  2                        ^:       |  0                                  |
    addw    a0, a0, a1                                    // |  2                        ^v       |  0                                  |
    addi    a0, a0, -3                                    // |  1                        ^        |  0                                  |
    seqz    a0, a0                                        // |  1                        ^        |  0                                  |
    ret                                                   // |  2 v                      :        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  2                        :^       |  0                                  |
    li  a2, 2                                             // |  2                        : ^      |  0                                  |
    j   .LBB0_7                                           // |  1                        :        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  2                        : ^      |  0                                  |
    mulw    a3, a2, a2                                    // |  3                        : v^     |  0                                  |
    sext.w  a4, a0                                        // |  4                        v ::^    |  0                                  |
    blt a4, a3, .LBB0_4                                   // |  4                        : :vv    |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    remw    a3, a0, a2                                    // |  3                        v v^     |  0                                  |
    bnez    a3, .LBB0_6                                   // |  2                          :v     |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    divw    a0, a0, a2                                    // |  2                        ^ v      |  0                                  |
    remw    a3, a0, a2                                    // |  3                        v v^     |  0                                  |
    addiw   a1, a1, 1                                     // |  2                         ^ :     |  0                                  |
    beqz    a3, .LBB0_8                                   // |  1                           v     |  0                                  |
    j   .LBB0_6                                           // |  0                                 |  0                                  |
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
