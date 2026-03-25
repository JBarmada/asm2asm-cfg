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
    addiw   a7, a1, -1                                    // |  3                         v :   ^ |  0                                  |
    blt a1, a3, .LBB0_8                                   // |  3                         v v   : |  0                                  |
    li  t0, 0                                             // |  2     ^                         : |  0                                  |
    slli    a3, a7, 32                                    // |  3     :                     ^   v |  0                                  |
    srli    a6, a3, 32                                    // |  4     :                     v  ^: |  0                                  |
    addi    t1, a0, 4                                     // |  5     :^                 v     :: |  0                                  |
    li  t2, 1                                             // |  4     : ^                      :: |  0                                  |
    j   .LBB0_3                                           // |  3     :                        :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t2, t2, 1                                     // |  4     : ^                      :: |  0                                  |
    addi    t1, t1, 4                                     // |  5     :^:                      :: |  0                                  |
    beq t0, a6, .LBB0_8                                   // |  5     v::                      v: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, t0                                            // |  5     v::                   ^   : |  0                                  |
    addi    t0, t0, 1                                     // |  4     ^::                       : |  0                                  |
    bgeu    t0, a1, .LBB0_2                               // |  5     v::                 v     : |  0                                  |
    slli    a3, a3, 2                                     // |  5     :::                   ^   : |  0                                  |
    add t3, a0, a3                                        // |  7     :::^               v  v   : |  0                                  |
    mv  a5, a1                                            // |  7     ::::                v   ^ : |  0                                  |
    mv  a4, t1                                            // |  6     :v::                   ^  : |  0                                  |
    j   .LBB0_6                                           // |  4     : ::                      : |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addi    a5, a5, -1                                    // |  5     : ::                    ^ : |  0                                  |
    addi    a4, a4, 4                                     // |  6     : ::                   ^: : |  0                                  |
    beq t2, a5, .LBB0_2                                   // |  6     : v:                   :v : |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lw  t4, 0(t3)                                         // |  5     :  v^                  :  : |  0                                  |
    lw  a3, 0(a4)                                         // |  6     :  ::                 ^v  : |  0                                  |
    bge a3, t4, .LBB0_5                                   // |  6     :  :v                 v:  : |  0                                  |
    sw  a3, 0(t3)                                         // |  6     :  v:                 v:  : |  0                                  |
    sw  t4, 0(a4)                                         // |  4     :   v                  v  : |  0                                  |
    j   .LBB0_5                                           // |  2     :                         : |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    blez    a1, .LBB0_13                                  // |  3     :                   v     : |  0                                  |
    li  a3, 0                                             // |  3     :                     ^   : |  0                                  |
    li  a6, -1                                            // |  3     :                        ^: |  0                                  |
    mv  a4, a0                                            // |  5     :                  v   ^ :: |  0                                  |
    j   .LBB0_11                                          // |  3     :                        :: |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    a4, a4, 4                                     // |  4     :                      ^ :: |  0                                  |
    mv  a3, t0                                            // |  5     v                     ^: :: |  0                                  |
    bge a6, a7, .LBB0_13                                  // |  4                           :: vv |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    addi    a6, a6, 1                                     // |  4                           :: ^: |  0                                  |
    slli    a5, a7, 32                                    // |  5                           ::^:v |  0                                  |
    srli    t1, a5, 32                                    // |  6      ^                    ::v:: |  0                                  |
    lw  a5, 0(a4)                                         // |  6      :                    :v^:: |  0                                  |
    addiw   t0, a3, 1                                     // |  6     ^:                    v ::: |  0                                  |
    slli    a1, a3, 2                                     // |  7     ::                  ^ v ::: |  0                                  |
    add a1, a1, a2                                        // |  8     ::                  ^v: ::: |  0                                  |
    sw  a5, 0(a1)                                         // |  7     ::                  v : v:: |  0                                  |
    beq a6, t1, .LBB0_10                                  // |  5     :v                    :  v: |  0                                  |
    slli    a1, a7, 2                                     // |  4     :                   ^ :   v |  0                                  |
    addiw   a7, a7, -1                                    // |  3     :                     :   ^ |  0                                  |
    add a1, a1, a0                                        // |  4     :                  v^ :     |  0                                  |
    lw  a1, 0(a1)                                         // |  3     :                   v :     |  0                                  |
    slli    a5, t0, 2                                     // |  4     v                   : : ^   |  0                                  |
    addiw   t0, a3, 2                                     // |  4     ^                   : v :   |  0                                  |
    add a3, a2, a5                                        // |  4                         :v^ v   |  0                                  |
    sw  a1, 0(a3)                                         // |  2                         v v     |  0                                  |
    j   .LBB0_10                                          // |  0                                 |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
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
