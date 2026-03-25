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
    li  t3, 0                                             // |  1        ^                        |  0                                  |
    li  t1, 0                                             // |  1      ^                          |  0                                  |
    li  a6, -10                                           // |  1                              ^  |  0                                  |
    lui a2, 838861                                        // |  2                          ^   :  |  0                                  |
    addiw   a2, a2, -819                                  // |  2                          ^   :  |  0                                  |
    slli    t2, a2, 32                                    // |  3       ^                  v   :  |  0                                  |
    li  a7, 10                                            // |  3       :                      :^ |  0                                  |
    li  t0, 99                                            // |  4     ^ :                      :: |  0                                  |
    j   .LBB0_4                                           // |  4     : :                      :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    slt a2, a4, a2                                        // |  6     : :                  ^ v :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    t3, t3, 1                                     // |  6     : :^                 :   :: |  0                                  |
    addw    t1, t1, a2                                    // |  7     :^::                 v   :: |  0                                  |
    beq t3, a1, .LBB0_8                                   // |  6     : :v                v    :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a2, t3, 2                                     // |  6     : :v                 ^   :: |  0                                  |
    add a2, a2, a0                                        // |  6     : :                v ^   :: |  0                                  |
    lw  a5, 0(a2)                                         // |  6     : :                  v  ^:: |  0                                  |
    li  a2, 1                                             // |  6     : :                  ^  ::: |  0                                  |
    bgtz    a5, .LBB0_3                                   // |  5     : :                     v:: |  0                                  |
    negw    a4, a5                                        // |  6     : :                    ^v:: |  0                                  |
    li  a2, 0                                             // |  7     : :                  ^ :::: |  0                                  |
    blt a6, a5, .LBB0_2                                   // |  6     : :                    :vv: |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  a5, a4                                            // |  5     : :                    v^ : |  0                                  |
    slli    a4, a4, 32                                    // |  5     : :                    ^: : |  0                                  |
    mulhu   a4, a4, t2                                    // |  5     : v                    ^: : |  0                                  |
    srli    a4, a4, 35                                    // |  4     :                      ^: : |  0                                  |
    mulw    a3, a4, a7                                    // |  5     :                     ^v: v |  0                                  |
    subw    a3, a5, a3                                    // |  3     :                     ^ v   |  0                                  |
    addw    a2, a2, a3                                    // |  4     :                    ^v :   |  0                                  |
    bltu    t0, a5, .LBB0_6                               // |  2     v                       v   |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  t1, 0                                             // |  1      ^                          |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, t1                                            // |  2      v                 ^        |  0                                  |
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
