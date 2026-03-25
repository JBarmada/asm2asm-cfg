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
    blez    a1, .LBB0_6                                   // |  2  :                      v       |  0                                  |
    mv  s0, a1                                            // |  3  :         ^            v       |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    slli    a0, a1, 2                                     // |  4  :          :          ^v       |  0                                  |
    call    malloc@plt                                    // |  4 ^:          :          :        |  0                                  |
    beqz    a0, .LBB0_7                                   // |  3  :          :          v        |  0                                  |
    lw  a2, 0(s1)                                         // |  4  :          v          : ^      |  0                                  |
    li  a1, 0                                             // |  4  :          :          :^       |  0                                  |
    j   .LBB0_4                                           // |  4  :          :          ::       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a2, a0, a1                                        // |  5  :          :          vv^      |  0                                  |
    sw  a3, 0(a2)                                         // |  4  :          :            vv     |  0                                  |
    addi    s0, s0, -1                                    // |  3  :         ^:                   |  0                                  |
    addi    a1, a1, 4                                     // |  4  :         ::           ^       |  0                                  |
    mv  a2, a3                                            // |  6  :         ::           :^v     |  0                                  |
    beqz    s0, .LBB0_7                                   // |  5  :         v:           ::      |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a3, s1, a1                                        // |  5  :          v           v:^     |  0                                  |
    lw  a3, 0(a3)                                         // |  3  :                       :v     |  0                                  |
    blt a2, a3, .LBB0_3                                   // |  3  :                       vv     |  0                                  |
    mv  a3, a2                                            // |  3  :                       v^     |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  2  :                     ^        |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
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
