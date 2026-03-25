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
    li  a3, 2                                             // |  1                           ^     |  0                                  |
    li  a2, -1                                            // |  2                          ^:     |  0                                  |
    blt a1, a3, .LBB0_9                                   // |  2                         v v     |  0                                  |
    lui a2, 524288                                        // |  1                          ^      |  0                                  |
    addiw   a6, a2, -1                                    // |  2                          v   ^  |  0                                  |
    mv  a2, a6                                            // |  2                          ^   v  |  0                                  |
    j   .LBB0_3                                           // |  2                          :   :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  3                         ^:   :  |  0                                  |
    addi    a0, a0, 4                                     // |  4                        ^::   :  |  0                                  |
    beqz    a1, .LBB0_7                                   // |  4                        :v:   :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lw  a4, 0(a0)                                         // |  4                        v : ^ :  |  0                                  |
    slt a5, a4, a6                                        // |  4                          : v^v  |  0                                  |
    xori    a5, a5, 1                                     // |  3                          : :^   |  0                                  |
    xor a3, a4, a2                                        // |  4                          v^v:   |  0                                  |
    seqz    a3, a3                                        // |  4                          :^::   |  0                                  |
    or  a3, a3, a5                                        // |  4                          :^:v   |  0                                  |
    bnez    a3, .LBB0_5                                   // |  3                          :v:    |  0                                  |
    mv  a6, a4                                            // |  3                          : v ^  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    bge a4, a2, .LBB0_2                                   // |  2                          v v    |  0                                  |
    mv  a6, a2                                            // |  3                          v : ^  |  0                                  |
    mv  a2, a4                                            // |  3                          ^ v :  |  0                                  |
    j   .LBB0_2                                           // |  1                              :  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lui a0, 524288                                        // |  2                        ^     :  |  0                                  |
    addiw   a0, a0, -1                                    // |  2                        ^     :  |  0                                  |
    li  a2, -1                                            // |  3                        : ^   :  |  0                                  |
    beq a6, a0, .LBB0_9                                   // |  2                        v     v  |  0                                  |
    mv  a2, a6                                            // |  2                          ^   v  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
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
