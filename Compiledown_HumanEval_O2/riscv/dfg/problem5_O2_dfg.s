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
    fmv.w.x ft1, zero                                     // |  0                                 |  1  ^                               |
    mv  a2, a1                                            // |  2                         v^      |  0                                  |
    mv  a3, a0                                            // |  2                        v  ^     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    flw ft0, 0(a3)                                        // |  1                           v     |  1 ^                                |
    fadd.s  ft1, ft1, ft0                                 // |  0                                 |  2 v^                               |
    addi    a2, a2, -1                                    // |  1                          ^      |  1  :                               |
    addi    a3, a3, 4                                     // |  2                          :^     |  1  :                               |
    bnez    a2, .LBB0_2                                   // |  1                          v      |  1  :                               |
    fcvt.s.w    ft0, a1                                   // |  1                         v       |  2 ^:                               |
    blez    a1, .LBB0_8                                   // |  1                         v       |  2 ::                               |
    fdiv.s  ft2, ft1, ft0                                 // |  0                                 |  3 vv^                              |
    fmv.w.x ft1, zero                                     // |  0                                 |  3 :^:                              |
.LBB0_5:                                                  // |                                    |                                     |
    flw ft3, 0(a0)                                        // |  1                        v        |  3 : :^                             |
    fsub.s  ft3, ft3, ft2                                 // |  0                                 |  3 : v^                             |
    fabs.s  ft3, ft3                                      // |  0                                 |  2 :  ^                             |
    fadd.s  ft1, ft1, ft3                                 // |  0                                 |  3 :^ v                             |
    addi    a1, a1, -1                                    // |  1                         ^       |  2 ::                               |
    addi    a0, a0, 4                                     // |  2                        ^:       |  2 ::                               |
    bnez    a1, .LBB0_5                                   // |  1                         v       |  2 ::                               |
    fdiv.s  fa0, ft1, ft0                                 // |  1                         :       |  3 vv          ^                    |
    ret                                                   // |  2 v                       :       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    fcvt.s.w    ft0, a1                                   // |  1                         v       |  1 ^                                |
.LBB0_8:                                                  // |                                    |                                     |
    fmv.w.x ft1, zero                                     // |  0                                 |  2 :^                               |
    fdiv.s  fa0, ft1, ft0                                 // |  0                                 |  3 vv          ^                    |
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
