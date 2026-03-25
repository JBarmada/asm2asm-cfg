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
    blez    a0, .LBB0_6                                   // |  1                        v        |  0                                  |
    li  t5, 0                                             // |  1          ^                      |  0                                  |
    li  a1, 0                                             // |  1                         ^       |  0                                  |
    lui a2, 762601                                        // |  1                          ^      |  0                                  |
    addiw   a6, a2, -1117                                 // |  2                          v   ^  |  0                                  |
    lui a2, 95325                                         // |  2                          ^   :  |  0                                  |
    addiw   a7, a2, 372                                   // |  3                          v   :^ |  0                                  |
    lui a2, 806597                                        // |  3                          ^   :: |  0                                  |
    addiw   t0, a2, -315                                  // |  4     ^                    v   :: |  0                                  |
    lui a2, 80660                                         // |  4     :                    ^   :: |  0                                  |
    addiw   t1, a2, -1261                                 // |  5     :^                   v   :: |  0                                  |
    lui a2, 838861                                        // |  5     ::                   ^   :: |  0                                  |
    addiw   a2, a2, -819                                  // |  5     ::                   ^   :: |  0                                  |
    slli    a4, a2, 32                                    // |  6     ::                   v ^ :: |  0                                  |
    li  t2, 10                                            // |  6     ::^                    : :: |  0                                  |
    li  t4, 9                                             // |  7     ::: ^                  : :: |  0                                  |
    j   .LBB0_3                                           // |  7     ::: :                  : :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   t5, t5, 1                                     // |  8     ::: :^                 : :: |  0                                  |
    bge t5, a0, .LBB0_7                                   // |  9     ::: :v             v   : :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mulw    a2, t5, a6                                    // |  9     ::: :v               ^ : v: |  0                                  |
    sltu    t3, a7, a2                                    // |  9     :::^::               v :  v |  0                                  |
    mulw    a2, t5, t0                                    // |  7     v:: :v               ^ :    |  0                                  |
    sltu    a2, t1, a2                                    // |  6      v: ::               ^ :    |  0                                  |
    and t3, t3, a2                                        // |  6       :^::               v :    |  0                                  |
    seqz    a2, t5                                        // |  6       :::v               ^ :    |  0                                  |
    or  a2, t3, a2                                        // |  6       :v::               ^ :    |  0                                  |
    bnez    a2, .LBB0_2                                   // |  5       : ::               v :    |  0                                  |
    mv  a2, t5                                            // |  5       : :v               ^ :    |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a3, a2                                            // |  5       : :                v^:    |  0                                  |
    slli    a2, a2, 32                                    // |  5       : :                ^::    |  0                                  |
    mulhu   a2, a2, a4                                    // |  5       : :                ^:v    |  0                                  |
    srli    a2, a2, 35                                    // |  4       : :                ^:     |  0                                  |
    mulw    a5, a2, t2                                    // |  5       v :                v: ^   |  0                                  |
    subw    a5, a3, a5                                    // |  3         :                 v ^   |  0                                  |
    addi    a5, a5, -7                                    // |  3         :                 : ^   |  0                                  |
    seqz    a5, a5                                        // |  3         :                 : ^   |  0                                  |
    addw    a1, a1, a5                                    // |  4         :               ^ : v   |  0                                  |
    bltu    t4, a3, .LBB0_5                               // |  2         v                 v     |  0                                  |
    j   .LBB0_2                                           // |  0                                 |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  1                         ^       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  2                        ^v       |  0                                  |
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
