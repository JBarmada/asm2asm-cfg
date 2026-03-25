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
    .p2align    3                                         // |                                    |                                     |
.LCPI0_0:                                                 // |                                    |                                     |
    .quad   0x3f1a36e2eb1c432d                            // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    fmul.s  ft0, fa1, fa1                                 // |  0                                 |  2 ^            v                   |
    fmadd.s ft1, fa0, fa0, ft0                            // |  0                                 |  3 v^          v                    |
.LBB0_5:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_0)                       // |  1                        ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_5)                    // |  1                        ^        |  0                                  |
    fld ft0, 0(a0)                                        // |  1                        v        |  1 ^                                |
    fnmsub.s    ft1, fa2, fa2, ft1                        // |  0                                 |  3 :^            v                  |
    fabs.s  ft1, ft1                                      // |  0                                 |  2 :^                               |
    fcvt.d.s    ft1, ft1                                  // |  0                                 |  2 :^                               |
    flt.d   a1, ft1, ft0                                  // |  1                         ^       |  2 vv                               |
    li  a0, 1                                             // |  2                        ^:       |  1 :                                |
    bnez    a1, .LBB0_4                                   // |  1                         v       |  1 :                                |
    fmul.s  ft1, fa2, fa2                                 // |  0                                 |  3 :^            v                  |
    fmadd.s ft2, fa0, fa0, ft1                            // |  0                                 |  4 :v^         v                    |
    fnmsub.s    ft2, fa1, fa1, ft2                        // |  0                                 |  3 : ^          v                   |
    fabs.s  ft2, ft2                                      // |  0                                 |  2 : ^                              |
    fcvt.d.s    ft2, ft2                                  // |  0                                 |  2 : ^                              |
    flt.d   a1, ft2, ft0                                  // |  1                         ^       |  2 v v                              |
    bnez    a1, .LBB0_4                                   // |  1                         v       |  1 :                                |
    fmadd.s ft1, fa1, fa1, ft1                            // |  0                                 |  3 :^           v                   |
    fnmsub.s    ft1, fa0, fa0, ft1                        // |  0                                 |  3 :^          v                    |
    fabs.s  ft1, ft1                                      // |  0                                 |  2 :^                               |
    fcvt.d.s    ft1, ft1                                  // |  0                                 |  2 :^                               |
    flt.d   a1, ft1, ft0                                  // |  1                         ^       |  2 vv                               |
    bnez    a1, .LBB0_4                                   // |  1                         v       |  0                                  |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
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
