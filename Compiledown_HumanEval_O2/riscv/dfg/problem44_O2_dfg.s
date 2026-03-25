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
    blez    a1, .LBB0_8                                   // |  1                         v       |  0                                  |
    li  a7, 0                                             // |  1                               ^ |  0                                  |
    addi    t0, a0, 4                                     // |  3     ^                  v      : |  0                                  |
    li  t1, 1                                             // |  2      ^                        : |  0                                  |
    li  a6, 1                                             // |  2                              ^: |  0                                  |
    j   .LBB0_3                                           // |  1                               : |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sltu    a6, a7, a1                                    // |  3                         v    ^v |  0                                  |
    addi    t1, t1, 1                                     // |  3      ^                       :: |  0                                  |
    addi    t0, t0, 4                                     // |  4     ^:                       :: |  0                                  |
    beq a7, a1, .LBB0_7                                   // |  5     ::                  v    :v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, a7                                            // |  5     ::                   ^   :v |  0                                  |
    addi    a7, a7, 1                                     // |  4     ::                       :^ |  0                                  |
    bgeu    a7, a1, .LBB0_2                               // |  5     ::                  v    :v |  0                                  |
    slli    a2, a2, 2                                     // |  4     ::                   ^   :  |  0                                  |
    add a2, a2, a0                                        // |  5     ::                 v ^   :  |  0                                  |
    lw  a2, 0(a2)                                         // |  4     ::                   v   :  |  0                                  |
    mv  a5, a1                                            // |  6     ::                  v:  ^:  |  0                                  |
    mv  a3, t0                                            // |  5     v:                   :^  :  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lw  a4, 0(a3)                                         // |  5      :                   :v^ :  |  0                                  |
    negw    a4, a4                                        // |  4      :                   : ^ :  |  0                                  |
    beq a2, a4, .LBB0_7                                   // |  4      :                   v v :  |  0                                  |
    addi    a5, a5, -1                                    // |  3      :                      ^:  |  0                                  |
    addi    a3, a3, 4                                     // |  4      :                    ^ ::  |  0                                  |
    bne t1, a5, .LBB0_5                                   // |  3      v                      v:  |  0                                  |
    j   .LBB0_2                                           // |  1                              :  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    andi    a0, a6, 1                                     // |  2                        ^     v  |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    andi    a0, zero, 1                                   // |  1                        ^        |  0                                  |
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
