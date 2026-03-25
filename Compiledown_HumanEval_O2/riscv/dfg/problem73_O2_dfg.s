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
    srliw   a3, a1, 31                                    // |  2                         v ^     |  0                                  |
    addw    a3, a3, a1                                    // |  2                         v ^     |  0                                  |
    li  a4, 2                                             // |  2                           :^    |  0                                  |
    sraiw   a6, a3, 1                                     // |  3                           v: ^  |  0                                  |
    blt a1, a4, .LBB0_4                                   // |  3                         v  v :  |  0                                  |
    li  a5, 0                                             // |  2                             ^:  |  0                                  |
    li  t0, 0                                             // |  3     ^                       ::  |  0                                  |
    slli    a3, a6, 32                                    // |  3                           ^ :v  |  0                                  |
    srli    a7, a3, 32                                    // |  4                           v ::^ |  0                                  |
    mv  t1, a0                                            // |  5      ^                 v    ::: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a4, 0(t1)                                         // |  5      v                     ^::: |  0                                  |
    not a3, a5                                            // |  5                           ^:v:: |  0                                  |
    addw    a3, a3, a1                                    // |  5                         v ^: :: |  0                                  |
    slli    a3, a3, 2                                     // |  4                           ^: :: |  0                                  |
    add a3, a3, a0                                        // |  5                        v  ^: :: |  0                                  |
    lw  a3, 0(a3)                                         // |  4                           v: :: |  0                                  |
    bne a4, a3, .LBB0_8                                   // |  4                           vv :: |  0                                  |
    slliw   a3, a4, 1                                     // |  4                           ^v :: |  0                                  |
    addw    t0, t0, a3                                    // |  4     ^                     v  :: |  0                                  |
    addi    a5, a5, 1                                     // |  3                             ^:: |  0                                  |
    addi    t1, t1, 4                                     // |  4      ^                      ::: |  0                                  |
    bne a7, a5, .LBB0_2                                   // |  3                             v:v |  0                                  |
    j   .LBB0_5                                           // |  1                              :  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  t0, 0                                             // |  2     ^                        :  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lui a3, 524288                                        // |  2                           ^  :  |  0                                  |
    addiw   a3, a3, 1                                     // |  2                           ^  :  |  0                                  |
    and a1, a1, a3                                        // |  3                         ^ v  :  |  0                                  |
    li  a3, 1                                             // |  3                         : ^  :  |  0                                  |
    bne a1, a3, .LBB0_7                                   // |  3                         v v  :  |  0                                  |
    slli    a1, a6, 2                                     // |  2                         ^    v  |  0                                  |
    add a0, a0, a1                                        // |  2                        ^v       |  0                                  |
    lw  a0, 0(a0)                                         // |  1                        v        |  0                                  |
    addw    t0, a0, t0                                    // |  2     ^                  v        |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    slt a0, a2, t0                                        // |  3     v                  ^ v      |  0                                  |
    xori    a0, a0, 1                                     // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
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
