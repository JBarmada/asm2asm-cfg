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
    beqz    a1, .LBB0_8                                   // |  1                         v       |  0                                  |
    li  a2, 2                                             // |  1                          ^      |  0                                  |
    blt a1, a2, .LBB0_9                                   // |  2                         vv      |  0                                  |
    lw  t2, 0(a0)                                         // |  2       ^                v        |  0                                  |
    lw  a3, 4(a0)                                         // |  3       :                v  ^     |  0                                  |
    li  t1, 1                                             // |  3      ^:                   :     |  0                                  |
    blt a3, t2, .LBB0_10                                  // |  2       v                   v     |  0                                  |
    li  a4, 0                                             // |  3       :                   :^    |  0                                  |
    li  a2, -1                                            // |  4       :                  ^::    |  0                                  |
    srli    t0, a2, 32                                    // |  5     ^ :                  v::    |  0                                  |
    addi    a5, a0, 8                                     // |  6     : :                v  ::^   |  0                                  |
    addi    a6, a1, -2                                    // |  7     : :                 v :::^  |  0                                  |
    li  a7, 1                                             // |  7     : :                   ::::^ |  0                                  |
    li  t1, 1                                             // |  8     :^:                   ::::: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    mv  t4, a3                                            // |  8     : : ^                 v:::: |  0                                  |
    addi    t3, a4, 1                                     // |  8     : :^:                  v::: |  0                                  |
    sltu    a3, a7, t3                                    // |  9     : :v:                 ^:::v |  0                                  |
    xor a2, t4, t2                                        // |  9     : v:v                ^::::  |  0                                  |
    seqz    a2, a2                                        // |  9     : :::                ^::::  |  0                                  |
    and a2, a2, a3                                        // |  9     : :::                ^v:::  |  0                                  |
    beqz    a2, .LBB0_6                                   // |  8     : :::                v :::  |  0                                  |
    add a2, a4, t0                                        // |  8     v :::                ^ v::  |  0                                  |
    and a2, a2, t0                                        // |  8     v :::                ^ :::  |  0                                  |
    slli    a2, a2, 2                                     // |  7       :::                ^ :::  |  0                                  |
    add a2, a2, a0                                        // |  8       :::              v ^ :::  |  0                                  |
    lw  a2, 0(a2)                                         // |  7       :::                v :::  |  0                                  |
    beq t2, a2, .LBB0_10                                  // |  7       v::                v :::  |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    a2, a4, 2                                     // |  6        ::                ^ v::  |  0                                  |
    sltu    t1, a2, a1                                    // |  8      ^ ::               vv :::  |  0                                  |
    beq a6, a4, .LBB0_10                                  // |  5        ::                  v:v  |  0                                  |
    lw  a3, 0(a5)                                         // |  4        ::                 ^ v   |  0                                  |
    addi    a5, a5, 4                                     // |  4        ::                 : ^   |  0                                  |
    mv  a4, t3                                            // |  4        v:                 :^    |  0                                  |
    mv  t2, t4                                            // |  3       ^ v                 :     |  0                                  |
    bge a3, t4, .LBB0_4                                   // |  2         v                 v     |  0                                  |
    j   .LBB0_10                                          // |  0                                 |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a0, 1                                             // |  1                        ^        |  0                                  |
    andi    a0, a0, 1                                     // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  t1, 0                                             // |  1      ^                          |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    xori    a0, t1, 1                                     // |  2      v                 ^        |  0                                  |
    andi    a0, a0, 1                                     // |  1                        ^        |  0                                  |
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
