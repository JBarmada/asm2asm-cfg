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
    .word   0x3f000000                                    // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    blez    a1, .LBB0_8                                   // |  1                         v       |  0                                  |
    li  a6, 0                                             // |  1                              ^  |  0                                  |
    addi    a7, a0, 4                                     // |  3                        v     :^ |  0                                  |
    li  t0, 1                                             // |  2     ^                        :  |  0                                  |
    j   .LBB0_3                                           // |  1                              :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t0, t0, 1                                     // |  2     ^                        :  |  0                                  |
    addi    a7, a7, 4                                     // |  3     :                        :^ |  0                                  |
    beq a6, a1, .LBB0_8                                   // |  4     :                   v    v: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, a6                                            // |  4     :                    ^   v: |  0                                  |
    addi    a6, a6, 1                                     // |  3     :                        ^: |  0                                  |
    bgeu    a6, a1, .LBB0_2                               // |  4     :                   v    v: |  0                                  |
    slli    a2, a2, 2                                     // |  3     :                    ^    : |  0                                  |
    add a5, a0, a2                                        // |  5     :                  v v  ^ : |  0                                  |
    mv  a4, a1                                            // |  5     :                   v  ^: : |  0                                  |
    mv  a2, a7                                            // |  4     :                    ^  : v |  0                                  |
    j   .LBB0_6                                           // |  2     :                       :   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addi    a4, a4, -1                                    // |  3     :                      ^:   |  0                                  |
    addi    a2, a2, 4                                     // |  4     :                    ^ ::   |  0                                  |
    beq t0, a4, .LBB0_2                                   // |  4     v                    : v:   |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    flw ft0, 0(a5)                                        // |  2                          :  v   |  1 ^                                |
    flw ft1, 0(a2)                                        // |  2                          v  :   |  2 :^                               |
    flt.s   a3, ft1, ft0                                  // |  3                          :^ :   |  2 vv                               |
    beqz    a3, .LBB0_5                                   // |  3                          :v :   |  0                                  |
    fsw ft1, 0(a5)                                        // |  2                          :  v   |  1  ^                               |
    fsw ft0, 0(a2)                                        // |  1                          v      |  1 ^                                |
    j   .LBB0_5                                           // |  0                                 |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    lui a2, 524288                                        // |  1                          ^      |  0                                  |
    addiw   a2, a2, 1                                     // |  1                          ^      |  0                                  |
    and a2, a2, a1                                        // |  2                         v^      |  0                                  |
    li  a3, 1                                             // |  2                          :^     |  0                                  |
    bne a2, a3, .LBB0_10                                  // |  2                          vv     |  0                                  |
    srliw   a1, a1, 1                                     // |  1                         ^       |  0                                  |
    slli    a1, a1, 2                                     // |  1                         ^       |  0                                  |
    add a0, a0, a1                                        // |  2                        ^v       |  0                                  |
    flw fa0, 0(a0)                                        // |  2                        v:       |  1             ^                    |
    ret                                                   // |  2 v                       :       |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    srliw   a2, a1, 31                                    // |  2                         v^      |  0                                  |
    addw    a1, a1, a2                                    // |  2                         ^v      |  0                                  |
    slli    a1, a1, 1                                     // |  1                         ^       |  0                                  |
    andi    a1, a1, -4                                    // |  1                         ^       |  0                                  |
    add a0, a0, a1                                        // |  2                        ^v       |  0                                  |
    flw ft0, 0(a0)                                        // |  1                        v        |  1 ^                                |
    flw ft1, -4(a0)                                       // |  1                        v        |  1  ^                               |
.LBB0_11:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(.LCPI0_0)                       // |  1                        ^        |  1  :                               |
    addi    a0, a0, %pcrel_lo(.LBB0_11)                   // |  1                        ^        |  1  :                               |
    flw ft2, 0(a0)                                        // |  1                        v        |  2  :^                              |
    fadd.s  ft0, ft0, ft1                                 // |  0                                 |  3 ^v:                              |
    fmul.s  fa0, ft0, ft2                                 // |  0                                 |  3 v v         ^                    |
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
