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
    addi    sp, sp, -48                                   // |  1  ^                              |  0                                  |
    sd  ra, 40(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 32(sp)                                        // |  2  v         v                    |  0                                  |
    fsd fs0, 24(sp)                                       // |  1  v                              |  1                     ^            |
    fsd fs1, 16(sp)                                       // |  1  v                              |  1                      ^           |
    fsd fs2, 8(sp)                                        // |  1  v                              |  1                       ^          |
    fmv.s   fs0, fa2                                      // |  1  :                              |  2               v     ^            |
    fmv.s   fs2, fa1                                      // |  1  :                              |  3              v      : ^          |
    fmv.s   fs1, fa0                                      // |  1  :                              |  4             v       :^:          |
    call    roundf@plt                                    // |  2 ^:                              |  3                     :::          |
    feq.s   a0, fa0, fs1                                  // |  2  :                     ^        |  4             v       :v:          |
    xori    s0, a0, 1                                     // |  3  :         ^           v        |  3                     :::          |
    fmv.s   fa0, fs2                                      // |  1  :                              |  4             ^       ::v          |
    call    roundf@plt                                    // |  2 ^:                              |  4             :       :::          |
    feq.s   a0, fa0, fs2                                  // |  2  :                     ^        |  4             v       ::v          |
    xori    a0, a0, 1                                     // |  2  :                     ^        |  3                     :::          |
    or  s0, s0, a0                                        // |  3  :         ^           v        |  3                     :::          |
    fmv.s   fa0, fs0                                      // |  2  :         :                    |  4             ^       v::          |
    call    roundf@plt                                    // |  3 ^:         :                    |  4             :       :::          |
    feq.s   a0, fa0, fs0                                  // |  3  :         :           ^        |  4             v       v::          |
    xori    a0, a0, 1                                     // |  3  :         :           ^        |  3                     :::          |
    or  a1, s0, a0                                        // |  4  :         v           v^       |  3                     :::          |
    li  a0, 0                                             // |  3  :                     ^:       |  3                     :::          |
    bnez    a1, .LBB0_2                                   // |  2  :                      v       |  3                     :::          |
    fadd.s  ft0, fs1, fs2                                 // |  1  :                              |  4 ^                   :vv          |
    feq.s   a0, ft0, fs0                                  // |  2  :                     ^        |  4 v                   v::          |
    fadd.s  ft0, fs1, fs0                                 // |  1  :                              |  4 ^                   vv:          |
    feq.s   a1, ft0, fs2                                  // |  2  :                      ^       |  4 v                   ::v          |
    or  a0, a0, a1                                        // |  3  :                     ^v       |  3                     :::          |
    fadd.s  ft0, fs2, fs0                                 // |  1  :                              |  4 ^                   v:v          |
    feq.s   a1, ft0, fs1                                  // |  2  :                      ^       |  2 v                    v           |
    or  a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    fld fs0, 24(sp)                                       // |  2 :v                              |  1                     ^            |
    fld fs1, 16(sp)                                       // |  2 :v                              |  1                      ^           |
    fld fs2, 8(sp)                                        // |  2 :v                              |  1                       ^          |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
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
