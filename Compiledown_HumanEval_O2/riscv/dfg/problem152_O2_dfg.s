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
    addi    sp, sp, -80                                   // |  1  ^                              |  0                                  |
    sd  ra, 72(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 64(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 56(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 48(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 40(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 32(sp)                                        // |  2  v             v                |  0                                  |
    fsd fs0, 24(sp)                                       // |  1  v                              |  1                     ^            |
    fsd fs1, 16(sp)                                       // |  1  v                              |  1                      ^           |
    fsd fs2, 8(sp)                                        // |  1  v                              |  1                       ^          |
    fsd fs3, 0(sp)                                        // |  1  v                              |  1                        ^         |
    blez    a1, .LBB0_6                                   // |  2  :                      v       |  0                                  |
    mv  s0, a1                                            // |  3  :         ^            v       |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    li  s2, 0                                             // |  2  :           ^                  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_0)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_8)                    // |  2  :                     ^        |  0                                  |
    fld fs1, 0(a0)                                        // |  2  :                     v        |  1                      ^           |
    fmv.w.x fs2, zero                                     // |  1  :                              |  2                      :^          |
    lui a0, 524288                                        // |  2  :                     ^        |  2                      ::          |
    addiw   s3, a0, 1                                     // |  3  :            ^        v        |  2                      ::          |
    li  s4, 1                                             // |  3  :            :^                |  2                      ::          |
    j   .LBB0_3                                           // |  3  :            ::                |  2                      ::          |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  4  :         ^  ::                |  2                      ::          |
    addi    s1, s1, 4                                     // |  5  :         :^ ::                |  2                      ::          |
    beqz    s0, .LBB0_7                                   // |  5  :         v: ::                |  2                      ::          |
.LBB0_3:                                                  // |                                    |                                     |
    flw fs3, 0(s1)                                        // |  4  :          v ::                |  3                      ::^         |
    fcvt.d.s    fs0, fs3                                  // |  3  :            ::                |  4                     ^::v         |
    fmv.d   fa0, fs0                                      // |  3  :            ::                |  5             ^       v:::         |
    call    round@plt                                     // |  4 ^:            ::                |  5             :       ::::         |
    fsub.d  ft0, fs0, fa0                                 // |  3  :            ::                |  6 ^           v       v:::         |
    fabs.d  ft0, ft0                                      // |  3  :            ::                |  5 ^           :        :::         |
    flt.d   a0, ft0, fs1                                  // |  4  :            ::       ^        |  5 v           :        v::         |
    flt.s   a1, fs2, fs3                                  // |  4  :            ::        ^       |  3             :         vv         |
    and a0, a0, a1                                        // |  5  :            ::       ^v       |  1             :                    |
    beqz    a0, .LBB0_2                                   // |  4  :            ::       v        |  1             :                    |
    fcvt.w.d    a0, fa0, rtz                              // |  4  :            ::       ^        |  1             v                    |
    and a1, a0, s3                                        // |  5  :            v:       v^       |  0                                  |
    bne a1, s4, .LBB0_2                                   // |  3  :             v        v       |  0                                  |
    mulw    a0, a0, a0                                    // |  2  :                     ^        |  0                                  |
    slli    a0, a0, 32                                    // |  2  :                     ^        |  0                                  |
    srli    a0, a0, 32                                    // |  2  :                     ^        |  0                                  |
    add s2, s2, a0                                        // |  3  :           ^         v        |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  s2, 0                                             // |  2  :           ^                  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    ld  ra, 72(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 64(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 56(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 48(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 40(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 32(sp)                                        // |  3 :v             ^                |  0                                  |
    fld fs0, 24(sp)                                       // |  2 :v                              |  1                     ^            |
    fld fs1, 16(sp)                                       // |  2 :v                              |  1                      ^           |
    fld fs2, 8(sp)                                        // |  2 :v                              |  1                       ^          |
    fld fs3, 0(sp)                                        // |  2 :v                              |  1                        ^         |
    addi    sp, sp, 80                                    // |  2 :^                              |  0                                  |
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
