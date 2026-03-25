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
    addi    sp, sp, -16                                   // |  1  ^                              |  0                                  |
    sd  s0, 8(sp)                                         // |  2  v         v                    |  0                                  |
    blez    a1, .LBB0_10                                  // |  2  :                      v       |  0                                  |
    li  t3, 0                                             // |  2  :     ^                        |  0                                  |
    addi    t0, a0, 8                                     // |  4  :  ^  :               v        |  0                                  |
    li  t1, 1                                             // |  3  :   ^ :                        |  0                                  |
    li  t2, 3                                             // |  3  :    ^:                        |  0                                  |
    li  a6, 1                                             // |  3  :     :                     ^  |  0                                  |
    j   .LBB0_3                                           // |  2  :     :                        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sltu    a6, t3, a1                                    // |  4  :     v                v    ^  |  0                                  |
    addi    t1, t1, 1                                     // |  3  :   ^ :                        |  0                                  |
    addi    t0, t0, 4                                     // |  4  :  ^: :                        |  0                                  |
    addiw   t2, t2, 1                                     // |  5  :  ::^:                        |  0                                  |
    beq t3, a1, .LBB0_11                                  // |  6  :  :::v                v       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, t3                                            // |  6  :  :::v                 ^      |  0                                  |
    addi    t3, t3, 1                                     // |  5  :  :::^                        |  0                                  |
    bgeu    t3, a1, .LBB0_2                               // |  6  :  :::v                v       |  0                                  |
    slli    a2, a2, 2                                     // |  5  :  :::                  ^      |  0                                  |
    add a7, a0, a2                                        // |  7  :  :::                v v    ^ |  0                                  |
    mv  t4, t2                                            // |  6  :  ::v ^                     : |  0                                  |
    mv  t5, t0                                            // |  5  :  v:   ^                    : |  0                                  |
    mv  t6, t1                                            // |  4  :   v    ^                   : |  0                                  |
    j   .LBB0_6                                           // |  2  :                            : |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addi    t6, t6, 1                                     // |  3  :        ^                   : |  0                                  |
    addi    t5, t5, 4                                     // |  4  :       ^:                   : |  0                                  |
    addiw   t4, t4, 1                                     // |  5  :      ^::                   : |  0                                  |
    beq t6, a1, .LBB0_2                                   // |  6  :      ::v             v     : |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   a2, t6, 1                                     // |  6  :      ::v              ^    : |  0                                  |
    bge a2, a1, .LBB0_5                                   // |  7  :      :::             vv    : |  0                                  |
    lw  a2, 0(a7)                                         // |  6  :      :::              ^    v |  0                                  |
    slli    a3, t6, 2                                     // |  5  :      ::v               ^     |  0                                  |
    add a3, a3, a0                                        // |  5  :      ::             v  ^     |  0                                  |
    lw  a3, 0(a3)                                         // |  4  :      ::                v     |  0                                  |
    addw    a2, a2, a3                                    // |  5  :      ::               ^v     |  0                                  |
    mv  a3, t4                                            // |  5  :      v:               :^     |  0                                  |
    mv  a4, t5                                            // |  5  :       v               ::^    |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    lw  a5, 0(a4)                                         // |  5  :                       ::v^   |  0                                  |
    negw    s0, a5                                        // |  5  :         ^             :: v   |  0                                  |
    beq a2, s0, .LBB0_11                                  // |  4  :         v             v:     |  0                                  |
    mv  a5, a3                                            // |  3  :                        v ^   |  0                                  |
    addi    a4, a4, 4                                     // |  3  :                         ^:   |  0                                  |
    addiw   a3, a3, 1                                     // |  3  :                        ^ :   |  0                                  |
    blt a5, a1, .LBB0_8                                   // |  3  :                      v   v   |  0                                  |
    j   .LBB0_5                                           // |  1  :                              |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  a6, 0                                             // |  2  :                           ^  |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    andi    a0, a6, 1                                     // |  3  :                     ^     v  |  0                                  |
    ld  s0, 8(sp)                                         // |  2  v         ^                    |  0                                  |
    addi    sp, sp, 16                                    // |  1  ^                              |  0                                  |
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
