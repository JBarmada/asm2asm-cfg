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
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    slli    a0, a0, 2                                     // |  4  :          ::         ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:          ::         :        |  0                                  |
    li  a1, 3                                             // |  5  :          ::         :^       |  0                                  |
    sw  zero, 0(s2)                                       // |  5  :          :v         ::       |  0                                  |
    blt s1, a1, .LBB0_9                                   // |  5  :          v:         :v       |  0                                  |
    li  a1, 0                                             // |  5  :          ::         :^       |  0                                  |
    li  a2, 2                                             // |  6  :          ::         ::^      |  0                                  |
    j   .LBB0_4                                           // |  6  :          ::         :::      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    slli    a3, a1, 2                                     // |  7  :          ::         :v:^     |  0                                  |
    add a3, a3, a0                                        // |  6  :          ::         v :^     |  0                                  |
    sw  a2, 0(a3)                                         // |  6  :          ::         : vv     |  0                                  |
    addiw   a1, a1, 1                                     // |  5  :          ::         :^       |  0                                  |
    sw  a1, 0(s2)                                         // |  5  :          :v         :v       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  5  :          :          ::^      |  0                                  |
    bge a2, s1, .LBB0_9                                   // |  5  :          v          ::v      |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    blez    a1, .LBB0_2                                   // |  4  :                     :v:      |  0                                  |
    mv  a3, a1                                            // |  5  :                     :v:^     |  0                                  |
    mv  a4, a0                                            // |  4  :                     v : ^    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lw  a5, 0(a4)                                         // |  4  :                       : v^   |  0                                  |
    mulw    s0, a5, a5                                    // |  4  :         ^             :  v   |  0                                  |
    bltu    a2, s0, .LBB0_2                               // |  3  :         v             v      |  0                                  |
    remw    a5, a2, a5                                    // |  3  :                       v  ^   |  0                                  |
    beqz    a5, .LBB0_3                                   // |  2  :                          v   |  0                                  |
    addi    a3, a3, -1                                    // |  2  :                        ^     |  0                                  |
    addi    a4, a4, 4                                     // |  3  :                        :^    |  0                                  |
    bnez    a3, .LBB0_6                                   // |  2  :                        v     |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
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
