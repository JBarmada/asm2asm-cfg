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
    .word   0x7f7fffff                                    // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    flw ft1, 0(a0)                                        // |  1                        v        |  1  ^                               |
    fsw ft1, 0(a2)                                        // |  1                          v      |  1  ^                               |
    flw ft0, 4(a0)                                        // |  1                        v        |  1 ^                                |
    fsw ft0, 4(a2)                                        // |  1                          v      |  1 ^                                |
    blez    a1, .LBB0_8                                   // |  1                         v       |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    auipc   a3, %pcrel_hi(.LCPI0_0)                       // |  1                           ^     |  0                                  |
    addi    a3, a3, %pcrel_lo(.LBB0_11)                   // |  1                           ^     |  0                                  |
    flw ft2, 0(a3)                                        // |  1                           v     |  1   ^                              |
    li  a6, 0                                             // |  1                              ^  |  1   :                              |
    addi    a7, a0, 4                                     // |  3                        v     :^ |  1   :                              |
    li  t0, 1                                             // |  2     ^                        :  |  1   :                              |
    j   .LBB0_3                                           // |  1                              :  |  1   :                              |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t0, t0, 1                                     // |  2     ^                        :  |  1   :                              |
    addi    a7, a7, 4                                     // |  3     :                        :^ |  1   :                              |
    beq a6, a1, .LBB0_8                                   // |  4     :                   v    v: |  1   :                              |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, a6                                            // |  4     :                     ^  v: |  1   :                              |
    addi    a6, a6, 1                                     // |  3     :                        ^: |  1   :                              |
    bgeu    a6, a1, .LBB0_2                               // |  4     :                   v    v: |  1   :                              |
    slli    a3, a3, 2                                     // |  3     :                     ^   : |  1   :                              |
    add t1, a0, a3                                        // |  5     :^                 v  v   : |  1   :                              |
    mv  a3, a1                                            // |  5     ::                  v ^   : |  1   :                              |
    mv  a4, a7                                            // |  4     ::                     ^  v |  1   :                              |
    j   .LBB0_6                                           // |  2     ::                          |  1   :                              |
.LBB0_5:                                                  // |                                    |                                     |
    addi    a3, a3, -1                                    // |  3     ::                    ^     |  1   :                              |
    addi    a4, a4, 4                                     // |  4     ::                    :^    |  1   :                              |
    beq t0, a3, .LBB0_2                                   // |  4     v:                    v:    |  1   :                              |
.LBB0_6:                                                  // |                                    |                                     |
    flw ft3, 0(t1)                                        // |  2      v                     :    |  2   :^                             |
    flw ft4, 0(a4)                                        // |  1                            v    |  3   ::^                            |
    fsub.s  ft4, ft3, ft4                                 // |  1                            :    |  3   :v^                            |
    fabs.s  ft4, ft4                                      // |  1                            :    |  2   : ^                            |
    flt.s   a5, ft4, ft2                                  // |  2                            :^   |  2   v v                            |
    beqz    a5, .LBB0_5                                   // |  2                            :v   |  1     :                            |
    fsw ft3, 0(a2)                                        // |  2                          v :    |  2    ^:                            |
    flw ft0, 0(a4)                                        // |  1                            v    |  3 ^  ::                            |
    fsw ft0, 4(a2)                                        // |  1                          v      |  3 ^  ::                            |
    fmv.s   ft1, ft3                                      // |  0                                 |  4 :^ v:                            |
    fmv.s   ft2, ft4                                      // |  0                                 |  4 ::^ v                            |
    j   .LBB0_5                                           // |  0                                 |  2 ::                               |
.LBB0_8:                                                  // |                                    |                                     |
    flt.s   a0, ft0, ft1                                  // |  1                        ^        |  2 vv                               |
    beqz    a0, .LBB0_10                                  // |  1                        v        |  0                                  |
    fsw ft0, 0(a2)                                        // |  1                          v      |  1 ^                                |
    fsw ft1, 4(a2)                                        // |  1                          v      |  1  ^                               |
.LBB0_10:                                                 // |                                    |                                     |
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
