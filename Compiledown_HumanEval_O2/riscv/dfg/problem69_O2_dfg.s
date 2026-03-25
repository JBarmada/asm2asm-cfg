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
    blez    a1, .LBB0_9                                   // |  1                         v       |  0                                  |
    mv  a6, a2                                            // |  2                          v   ^  |  0                                  |
    li  a4, 0                                             // |  2                            ^ :  |  0                                  |
    li  a7, -1                                            // |  2                              :^ |  0                                  |
    lui a2, 524288                                        // |  2                          ^   :  |  0                                  |
    addiw   t0, a2, -1                                    // |  3     ^                    v   :  |  0                                  |
    j   .LBB0_4                                           // |  1                              :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  t0, a5                                            // |  3     ^                       v:  |  0                                  |
    mv  a7, a3                                            // |  4     :                     v  :^ |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a4, a4, 1                                     // |  4     :                      ^ :: |  0                                  |
    addi    a0, a0, 4                                     // |  5     :                  ^   : :: |  0                                  |
    beq a1, a4, .LBB0_7                                   // |  6     :                  :v  v :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lw  a5, 0(a0)                                         // |  6     :                  v   :^:: |  0                                  |
    andi    a3, a5, 1                                     // |  6     :                     ^:v:: |  0                                  |
    bnez    a3, .LBB0_3                                   // |  6     :                     v:::: |  0                                  |
    slt a3, a5, t0                                        // |  6     v                     ^:v:: |  0                                  |
    sext.w  a2, a7                                        // |  6     :                    ^:: :v |  0                                  |
    addi    a2, a2, 1                                     // |  6     :                    ^:: :: |  0                                  |
    seqz    a2, a2                                        // |  6     :                    ^:: :: |  0                                  |
    or  a2, a2, a3                                        // |  6     :                    ^v: :: |  0                                  |
    mv  a3, a4                                            // |  6     :                    :^v :: |  0                                  |
    bnez    a2, .LBB0_2                                   // |  4     :                    v   :: |  0                                  |
    mv  a5, t0                                            // |  4     v                       ^:: |  0                                  |
    mv  a3, a7                                            // |  4     :                     ^  :v |  0                                  |
    j   .LBB0_2                                           // |  3     :                        :: |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    sext.w  a0, a7                                        // |  4     :                  ^     :v |  0                                  |
    li  a1, -1                                            // |  5     :                  :^    :: |  0                                  |
    beq a0, a1, .LBB0_9                                   // |  5     :                  vv    :: |  0                                  |
    sw  t0, 0(a6)                                         // |  3     v                        v: |  0                                  |
    sw  a7, 4(a6)                                         // |  2                              vv |  0                                  |
    mv  a0, a6                                            // |  2                        ^     v  |  0                                  |
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
