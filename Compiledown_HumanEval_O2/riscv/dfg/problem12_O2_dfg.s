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
    mv  s0, a1                                            // |  3  :         ^            v       |  0                                  |
    mv  s1, a0                                            // |  4  :         :^          v        |  0                                  |
    call    strlen@plt                                    // |  4 ^:         ::                   |  0                                  |
    sext.w  s2, a0                                        // |  5  :         ::^         v        |  0                                  |
    mv  a0, s0                                            // |  5  :         v::         ^        |  0                                  |
    call    strlen@plt                                    // |  5 ^:         :::                  |  0                                  |
    sext.w  a0, a0                                        // |  5  :         :::         ^        |  0                                  |
    blt s2, a0, .LBB0_2                                   // |  5  :         ::v         v        |  0                                  |
    mv  s2, a0                                            // |  5  :         ::^         v        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   a0, s2, 1                                     // |  5  :         ::v         ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         :::         :        |  0                                  |
    beqz    a0, .LBB0_7                                   // |  5  :         :::         v        |  0                                  |
    blez    s2, .LBB0_6                                   // |  5  :         ::v         :        |  0                                  |
    mv  a1, s2                                            // |  6  :         ::v         :^       |  0                                  |
    mv  a2, a0                                            // |  6  :         :::         v ^      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    lbu a3, 0(s1)                                         // |  7  :         :v:         : :^     |  0                                  |
    lbu a4, 0(s0)                                         // |  6  :         v :         : : ^    |  0                                  |
    xor a3, a3, a4                                        // |  6  :           :         : :^v    |  0                                  |
    seqz    a3, a3                                        // |  5  :           :         : :^     |  0                                  |
    xori    a3, a3, 49                                    // |  5  :           :         : :^     |  0                                  |
    sb  a3, 0(a2)                                         // |  5  :           :         : vv     |  0                                  |
    addi    a2, a2, 1                                     // |  4  :           :         : ^      |  0                                  |
    addi    s0, s0, 1                                     // |  4  :         ^ :         :        |  0                                  |
    addi    a1, a1, -1                                    // |  4  :           :         :^       |  0                                  |
    addi    s1, s1, 1                                     // |  5  :          ^:         ::       |  0                                  |
    bnez    a1, .LBB0_5                                   // |  4  :           :         :v       |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    add a1, a0, s2                                        // |  4  :           v         v^       |  0                                  |
    sb  zero, 0(a1)                                       // |  2  :                      v       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
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
