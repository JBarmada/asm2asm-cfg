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
    blez    a1, .LBB0_7                                   // |  1                         v       |  0                                  |
    li  t1, 0                                             // |  1      ^                          |  0                                  |
    li  a7, 0                                             // |  1                               ^ |  0                                  |
    li  a6, 11                                            // |  1                              ^  |  0                                  |
    lui a2, 838861                                        // |  2                          ^   :  |  0                                  |
    addiw   a2, a2, -819                                  // |  2                          ^   :  |  0                                  |
    slli    a5, a2, 32                                    // |  3                          v  ^:  |  0                                  |
    li  a4, 99                                            // |  3                            ^::  |  0                                  |
    j   .LBB0_3                                           // |  3                            :::  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t1, t1, 1                                     // |  4      ^                     :::  |  0                                  |
    beq t1, a1, .LBB0_8                                   // |  5      v                  v  :::  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a2, t1, 2                                     // |  5      v                   ^ :::  |  0                                  |
    add a2, a2, a0                                        // |  5                        v ^ :::  |  0                                  |
    lw  t0, 0(a2)                                         // |  5     ^                    v :::  |  0                                  |
    blt t0, a6, .LBB0_2                                   // |  4     v                      ::v  |  0                                  |
    mv  a2, t0                                            // |  4     v                    ^ ::   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a3, a2                                            // |  5     :                    v^::   |  0                                  |
    slli    a2, a2, 32                                    // |  5     :                    ^:::   |  0                                  |
    mulhu   a2, a2, a5                                    // |  5     :                    ^::v   |  0                                  |
    srli    a2, a2, 35                                    // |  4     :                    ^::    |  0                                  |
    bltu    a4, a3, .LBB0_5                               // |  3     :                     vv    |  0                                  |
    and a2, a2, t0                                        // |  2     v                    ^      |  0                                  |
    andi    a2, a2, 1                                     // |  1                          ^      |  0                                  |
    addw    a7, a7, a2                                    // |  2                          v    ^ |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a7, 0                                             // |  1                               ^ |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, a7                                            // |  2                        ^      v |  0                                  |
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
