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
    addi    sp, sp, -48                                   // |  1  ^                              |  0                                  |
    blez    a0, .LBB0_7                                   // |  2  :                     v        |  0                                  |
    li  a3, 0                                             // |  2  :                        ^     |  0                                  |
    li  a4, 1                                             // |  3  :                        :^    |  0                                  |
    addi    a6, sp, 15                                    // |  4  v                        :: ^  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a7, a4                                            // |  5  :                        :v :^ |  0                                  |
    divw    a5, a0, a1                                    // |  7  :                     vv : ^:: |  0                                  |
    mulw    a4, a5, a1                                    // |  7  :                      v :^v:: |  0                                  |
    subw    a0, a0, a4                                    // |  7  :                     ^  :v::: |  0                                  |
    addiw   a0, a0, 48                                    // |  6  :                     ^  : ::: |  0                                  |
    add a4, a6, a3                                        // |  7  :                     :  v^:v: |  0                                  |
    addi    a3, a3, 1                                     // |  6  :                     :  ^:: : |  0                                  |
    sb  a0, 0(a4)                                         // |  6  :                     v  :v: : |  0                                  |
    addiw   a4, a7, 1                                     // |  5  :                        :^: v |  0                                  |
    mv  a0, a5                                            // |  5  :                     ^  : v : |  0                                  |
    bgtz    a5, .LBB0_2                                   // |  4  :                        : v : |  0                                  |
    sext.w  a0, a3                                        // |  4  :                     ^  v   : |  0                                  |
    blez    a0, .LBB0_7                                   // |  4  :                     v  :   : |  0                                  |
    slli    a0, a7, 32                                    // |  4  :                     ^  :   v |  0                                  |
    srli    a0, a0, 32                                    // |  3  :                     ^  :     |  0                                  |
    addi    a6, sp, 15                                    // |  3  v                        :  ^  |  0                                  |
    mv  a4, a2                                            // |  4                          v:^ :  |  0                                  |
    mv  a5, a3                                            // |  4                           v:^:  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addiw   a5, a5, -1                                    // |  4                           ::^:  |  0                                  |
    slli    a1, a5, 32                                    // |  5                         ^ ::v:  |  0                                  |
    srli    a1, a1, 32                                    // |  4                         ^ :: :  |  0                                  |
    add a1, a1, a6                                        // |  4                         ^ :: v  |  0                                  |
    lb  a1, 0(a1)                                         // |  3                         v ::    |  0                                  |
    sb  a1, 0(a4)                                         // |  3                         v :v    |  0                                  |
    addi    a0, a0, -1                                    // |  2                        ^  :     |  0                                  |
    addi    a4, a4, 1                                     // |  3                        :  :^    |  0                                  |
    bnez    a0, .LBB0_5                                   // |  2                        v  :     |  0                                  |
    slli    a0, a3, 32                                    // |  2                        ^  v     |  0                                  |
    srli    a0, a0, 32                                    // |  1                        ^        |  0                                  |
    j   .LBB0_8                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    add a0, a0, a2                                        // |  2                        ^ v      |  0                                  |
    sb  zero, 0(a0)                                       // |  1                        v        |  0                                  |
    addi    sp, sp, 48                                    // |  1  ^                              |  0                                  |
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
