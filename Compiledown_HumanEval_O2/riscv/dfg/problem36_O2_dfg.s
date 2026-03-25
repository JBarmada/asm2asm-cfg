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
    .section    .sdata,"aw",@progbits                     // |                                    |                                     |
    .p2align    2                                         // |                                    |                                     |
.LCPI0_0:                                                 // |                                    |                                     |
    .word   0xc61c4000                                    // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
.LBB0_7:                                                  // |                                    |                                     |
    auipc   a2, %pcrel_hi(.LCPI0_0)                       // |  1                          ^      |  0                                  |
    addi    a2, a2, %pcrel_lo(.LBB0_7)                    // |  1                          ^      |  0                                  |
    blez    a1, .LBB0_5                                   // |  2                         v:      |  0                                  |
    flw ft0, 0(a2)                                        // |  1                          v      |  1 ^                                |
    j   .LBB0_3                                           // |  0                                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a1, a1, -1                                    // |  1                         ^       |  0                                  |
    addi    a0, a0, 4                                     // |  2                        ^:       |  0                                  |
    fmv.s   ft0, fa0                                      // |  2                        ::       |  2 ^           v                    |
    beqz    a1, .LBB0_6                                   // |  2                        :v       |  1 :                                |
.LBB0_3:                                                  // |                                    |                                     |
    flw fa0, 0(a0)                                        // |  1                        v        |  2 :           ^                    |
    flt.s   a2, ft0, fa0                                  // |  1                          ^      |  2 v           v                    |
    bnez    a2, .LBB0_2                                   // |  1                          v      |  1 :                                |
    fmv.s   fa0, ft0                                      // |  1                          :      |  2 v           ^                    |
    j   .LBB0_2                                           // |  1                          :      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    flw fa0, 0(a2)                                        // |  1                          v      |  1             ^                    |
.LBB0_6:                                                  // |                                    |                                     |
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
