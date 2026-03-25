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
    .word   0xbf800000                                    // |                                    |                                     |
.LCPI0_1:                                                 // |                                    |                                     |
    .word   0x3f000000                                    // |                                    |                                     |
.LCPI0_2:                                                 // |                                    |                                     |
    .word   0x42c80000                                    // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    addi    sp, sp, -16                                   // |  1  ^                              |  0                                  |
    sd  ra, 8(sp)                                         // |  2 vv                              |  0                                  |
    fsd fs0, 0(sp)                                        // |  1  v                              |  1                     ^            |
    fadd.s  ft0, fa0, fa1                                 // |  1  :                              |  3 ^           vv                   |
    fle.s   a0, ft0, fa2                                  // |  2  :                     ^        |  2 v             v                  |
    fadd.s  ft1, fa0, fa2                                 // |  1  :                              |  3  ^          v v                  |
    fle.s   a1, ft1, fa1                                  // |  2  :                      ^       |  2  v           v                   |
    or  a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    fadd.s  ft1, fa1, fa2                                 // |  1  :                              |  3  ^           vv                  |
    fle.s   a1, ft1, fa0                                  // |  2  :                      ^       |  2  v          v                    |
    or  a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    bnez    a0, .LBB0_3                                   // |  2  :                     v        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_1)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_6)                    // |  2  :                     ^        |  0                                  |
    flw ft1, 0(a0)                                        // |  2  :                     v        |  1  ^                               |
    fadd.s  ft0, ft0, fa2                                 // |  1  :                              |  3 ^:            v                  |
    fmul.s  ft0, ft0, ft1                                 // |  1  :                              |  2 ^v                               |
    fsub.s  ft1, ft0, fa0                                 // |  1  :                              |  3 v^          v                    |
    fmul.s  ft1, ft0, ft1                                 // |  1  :                              |  2 v^                               |
    fsub.s  ft2, ft0, fa1                                 // |  1  :                              |  3 v ^          v                   |
    fmul.s  ft1, ft2, ft1                                 // |  1  :                              |  2  ^v                              |
    fsub.s  ft0, ft0, fa2                                 // |  1  :                              |  3 ^:            v                  |
    fmul.s  ft0, ft0, ft1                                 // |  1  :                              |  2 ^v                               |
    fsqrt.s fa0, ft0                                      // |  1  :                              |  2 v           ^                    |
    feq.s   a0, fa0, fa0                                  // |  2  :                     ^        |  2 :           v                    |
    beqz    a0, .LBB0_5                                   // |  2  :                     v        |  1 :                                |
.LBB0_2:                                                  // |                                    |                                     |
.LBB0_7:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_2)                       // |  2  :                     ^        |  1 :                                |
    addi    a0, a0, %pcrel_lo(.LBB0_7)                    // |  2  :                     ^        |  1 :                                |
    flw fs0, 0(a0)                                        // |  2  :                     v        |  2 :                   ^            |
    fmul.s  fa0, fa0, fs0                                 // |  1  :                              |  3 :           ^       v            |
    call    roundf@plt                                    // |  2 ^:                              |  2 :                   :            |
    fdiv.s  fa0, fa0, fs0                                 // |  1  :                              |  3 :           ^       v            |
    j   .LBB0_4                                           // |  1  :                              |  1 :                                |
.LBB0_3:                                                  // |                                    |                                     |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_0)                       // |  2  :                     ^        |  1 :                                |
    addi    a0, a0, %pcrel_lo(.LBB0_8)                    // |  2  :                     ^        |  1 :                                |
    flw fa0, 0(a0)                                        // |  2  :                     v        |  2 :           ^                    |
.LBB0_4:                                                  // |                                    |                                     |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  1 :                                |
    fld fs0, 0(sp)                                        // |  2 :v                              |  2 :                   ^            |
    addi    sp, sp, 16                                    // |  2 :^                              |  1 :                                |
    ret                                                   // |  1 v                               |  1 :                                |
.LBB0_5:                                                  // |                                    |                                     |
    fmv.s   fa0, ft0                                      // |  0                                 |  2 v           ^                    |
    call    sqrtf@plt                                     // |  1 ^                               |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
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
