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
    .quad   0x3fe0000000000000                            // |                                    |                                     |
.LCPI0_1:                                                 // |                                    |                                     |
    .quad   0xbfe0000000000000                            // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    addi    sp, sp, -16                                   // |  1  ^                              |  0                                  |
    sd  ra, 8(sp)                                         // |  2 vv                              |  0                                  |
    li  a1, 0                                             // |  2  :                      ^       |  0                                  |
    call    strtod@plt                                    // |  2 ^:                              |  0                                  |
    fmv.d.x ft0, zero                                     // |  1  :                              |  1 ^                                |
    flt.d   a0, fa0, ft0                                  // |  2  :                     ^        |  2 v           v                    |
    beqz    a0, .LBB0_2                                   // |  2  :                     v        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_1)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_4)                    // |  2  :                     ^        |  0                                  |
    fld ft0, 0(a0)                                        // |  2  :                     v        |  1 ^                                |
    fadd.d  fa0, fa0, ft0                                 // |  1  :                              |  2 v           ^                    |
    call    ceil@plt                                      // |  2 ^:                              |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
.LBB0_5:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_0)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_5)                    // |  2  :                     ^        |  0                                  |
    fld ft0, 0(a0)                                        // |  2  :                     v        |  1 ^                                |
    fadd.d  fa0, fa0, ft0                                 // |  1  :                              |  2 v           ^                    |
    call    floor@plt                                     // |  2 ^:                              |  1             :                    |
.LBB0_3:                                                  // |                                    |                                     |
    fcvt.w.d    a0, fa0, rtz                              // |  2  :                     ^        |  1             v                    |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  0                                  |
    addi    sp, sp, 16                                    // |  2 :^                              |  0                                  |
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
