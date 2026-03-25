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
    lbu a5, 0(a0)                                         // |  2                        v    ^   |  0                                  |
    beqz    a5, .LBB0_3                                   // |  1                             v   |  0                                  |
    li  a4, 0                                             // |  2                            ^:   |  0                                  |
    addi    a7, a0, 1                                     // |  4                        v   :: ^ |  0                                  |
    lui a2, 5                                             // |  4                          ^ :: : |  0                                  |
    addiw   a2, a2, -315                                  // |  4                          ^ :: : |  0                                  |
    li  a6, 26                                            // |  5                          : ::^: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    andi    a3, a5, 255                                   // |  6                          :^:v:: |  0                                  |
    addi    a3, a3, -93                                   // |  5                          :^: :: |  0                                  |
    mul a5, a3, a2                                        // |  6                          vv:^:: |  0                                  |
    srliw   a0, a5, 31                                    // |  6                        ^  ::v:: |  0                                  |
    srli    a5, a5, 19                                    // |  5                           ::^:: |  0                                  |
    addw    a0, a0, a5                                    // |  6                        ^  ::v:: |  0                                  |
    mulw    a0, a0, a6                                    // |  5                        ^  :: v: |  0                                  |
    subw    a0, a3, a0                                    // |  4                        ^  v:  : |  0                                  |
    addiw   a0, a0, 97                                    // |  3                        ^   :  : |  0                                  |
    add a3, a1, a4                                        // |  5                        :v ^v  : |  0                                  |
    sb  a0, 0(a3)                                         // |  4                        v  v:  : |  0                                  |
    add a0, a7, a4                                        // |  3                        ^   v  v |  0                                  |
    lbu a5, 0(a0)                                         // |  3                        v   :^   |  0                                  |
    addi    a3, a4, 1                                     // |  3                           ^v:   |  0                                  |
    mv  a4, a3                                            // |  3                           v^:   |  0                                  |
    bnez    a5, .LBB0_2                                   // |  1                             v   |  0                                  |
    j   .LBB0_4                                           // |  0                                 |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    li  a3, 0                                             // |  1                           ^     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a0, a1, a3                                        // |  3                        ^v v     |  0                                  |
    sb  zero, 0(a0)                                       // |  1                        v        |  0                                  |
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
