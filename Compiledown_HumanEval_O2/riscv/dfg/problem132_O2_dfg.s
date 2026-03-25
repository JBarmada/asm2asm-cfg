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
    blez    a0, .LBB0_10                                  // |  1                        v        |  0                                  |
    li  t0, 0                                             // |  1     ^                           |  0                                  |
    li  a1, 1                                             // |  1                         ^       |  0                                  |
    lui a2, 838861                                        // |  1                          ^      |  0                                  |
    addiw   a2, a2, -819                                  // |  1                          ^      |  0                                  |
    slli    t1, a2, 32                                    // |  2      ^                   v      |  0                                  |
    li  a6, 10                                            // |  2      :                       ^  |  0                                  |
    li  a7, 9                                             // |  3      :                       :^ |  0                                  |
    j   .LBB0_3                                           // |  3      :                       :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sext.w  a2, a0                                        // |  5      :                 v ^   :: |  0                                  |
    mulw    a1, a3, a1                                    // |  6      :                  ^:v  :: |  0                                  |
    mv  a0, a4                                            // |  7      :                 ^:: v :: |  0                                  |
    bgeu    a7, a2, .LBB0_7                               // |  6      :                 ::v   :v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a2, a0, 32                                    // |  5      :                 v:^   :  |  0                                  |
    mulhu   a2, a2, t1                                    // |  5      v                 ::^   :  |  0                                  |
    srli    a4, a2, 35                                    // |  5                        ::v ^ :  |  0                                  |
    mulw    a2, a4, a6                                    // |  5                        ::^ v v  |  0                                  |
    subw    a5, a0, a2                                    // |  4                        v:v  ^   |  0                                  |
    andi    a2, a5, 1                                     // |  3                         :^  v   |  0                                  |
    li  a3, 1                                             // |  4                         ::^ :   |  0                                  |
    beqz    a2, .LBB0_5                                   // |  3                         :v  :   |  0                                  |
    mv  a3, a5                                            // |  4                         ::^ v   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    beqz    a2, .LBB0_2                                   // |  2                         :v      |  0                                  |
    li  t0, 1                                             // |  2     ^                   :       |  0                                  |
    j   .LBB0_2                                           // |  2     :                   :       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  3     :                  ^:       |  0                                  |
    beqz    t0, .LBB0_9                                   // |  2     v                   :       |  0                                  |
    mv  a0, a1                                            // |  2                        ^v       |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  1                        ^        |  0                                  |
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
