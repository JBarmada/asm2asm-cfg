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
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    mv  s1, a1                                            // |  4  :          ^:          v       |  0                                  |
    mv  s0, a0                                            // |  5  :         ^::         v        |  0                                  |
    slli    a0, a1, 2                                     // |  5  :          ::         ^v       |  0                                  |
    call    malloc@plt                                    // |  5 ^:          ::         :        |  0                                  |
    sw  zero, 0(s2)                                       // |  4  :          :v         :        |  0                                  |
    blez    s1, .LBB0_5                                   // |  4  :          v:         :        |  0                                  |
    li  a1, 0                                             // |  4  :           :         :^       |  0                                  |
    fmv.w.x ft0, zero                                     // |  4  :           :         ::       |  1 ^                                |
    j   .LBB0_3                                           // |  4  :           :         ::       |  1 :                                |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s1, s1, -1                                    // |  5  :          ^:         ::       |  1 :                                |
    addi    s0, s0, 4                                     // |  6  :         ^::         ::       |  1 :                                |
    beqz    s1, .LBB0_5                                   // |  6  :         :v:         ::       |  1 :                                |
.LBB0_3:                                                  // |                                    |                                     |
    flw ft1, 0(s0)                                        // |  5  :         v :         ::       |  2 :^                               |
    flt.s   a2, ft0, ft1                                  // |  5  :           :         ::^      |  2 vv                               |
    beqz    a2, .LBB0_2                                   // |  5  :           :         ::v      |  0                                  |
    slli    a2, a1, 2                                     // |  5  :           :         :v^      |  0                                  |
    addiw   a1, a1, 1                                     // |  4  :           :         :^       |  0                                  |
    sw  a1, 0(s2)                                         // |  4  :           v         :v       |  0                                  |
    add a2, a2, a0                                        // |  3  :                     v ^      |  0                                  |
    fsw ft1, 0(a2)                                        // |  2  :                       v      |  1  ^                               |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
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
