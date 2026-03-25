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
    blez    a1, .LBB0_17                                  // |  1                         v       |  0                                  |
    li  a6, 0                                             // |  1                              ^  |  0                                  |
    li  t5, 1                                             // |  2          ^                   :  |  0                                  |
    li  t6, 2                                             // |  3          :^                  :  |  0                                  |
    li  a7, 1                                             // |  4          ::                  :^ |  0                                  |
    j   .LBB0_3                                           // |  3          ::                  :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a7, a7, 1                                     // |  4          ::                  :^ |  0                                  |
    beq a6, a1, .LBB0_17                                  // |  5          ::             v    v: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, a6                                            // |  5          ::              ^   v: |  0                                  |
    addi    a6, a6, 1                                     // |  4          ::                  ^: |  0                                  |
    bgeu    a6, a1, .LBB0_2                               // |  5          ::             v    v: |  0                                  |
    slli    a2, a2, 2                                     // |  4          ::              ^    : |  0                                  |
    add t0, a0, a2                                        // |  6     ^    ::            v v    : |  0                                  |
    mv  t4, a7                                            // |  5     :   ^::                   v |  0                                  |
    j   .LBB0_7                                           // |  3     :    ::                     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sw  t3, 0(t0)                                         // |  4     v  v ::                     |  0                                  |
    sw  t1, 0(t2)                                         // |  5     :vv  ::                     |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    t4, t4, 1                                     // |  4     :   ^::                     |  0                                  |
    beq t4, a1, .LBB0_2                                   // |  5     :   v::             v       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lw  t1, 0(t0)                                         // |  5     v^  :::                     |  0                                  |
    blez    t1, .LBB0_10                                  // |  4      v  :::                     |  0                                  |
    li  a4, 0                                             // |  5      :  :::                ^    |  0                                  |
    mv  a5, t1                                            // |  5      v  :::                 ^   |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    mv  a2, a5                                            // |  6      :  :::              ^  v   |  0                                  |
    andi    a5, a5, 1                                     // |  6      :  :::              :  ^   |  0                                  |
    addw    a4, a4, a5                                    // |  7      :  :::              : ^v   |  0                                  |
    srliw   a5, a2, 1                                     // |  6      :  :::              v  ^   |  0                                  |
    bgeu    a2, t6, .LBB0_9                               // |  5      :  ::v              v      |  0                                  |
    j   .LBB0_11                                          // |  3      :  ::                      |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  a4, 0                                             // |  4      :  ::                 ^    |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    slli    a2, t4, 2                                     // |  5      :  v:               ^ :    |  0                                  |
    add t2, a0, a2                                        // |  6      :^  :             v v :    |  0                                  |
    lw  t3, 0(t2)                                         // |  5      :v^ :                 :    |  0                                  |
    blez    t3, .LBB0_15                                  // |  4      : v :                 :    |  0                                  |
    li  a5, 0                                             // |  5      : : :                 :^   |  0                                  |
    mv  a3, t3                                            // |  5      : v :                ^:    |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    mv  a2, a3                                            // |  6      : : :               ^v:    |  0                                  |
    andi    a3, a3, 1                                     // |  6      : : :               :^:    |  0                                  |
    addw    a5, a5, a3                                    // |  7      : : :               :v:^   |  0                                  |
    srliw   a3, a2, 1                                     // |  7      : : :               v^::   |  0                                  |
    bltu    t5, a2, .LBB0_13                              // |  6      : : v               v ::   |  0                                  |
    bltu    a5, a4, .LBB0_5                               // |  4      : :                   vv   |  0                                  |
    j   .LBB0_16                                          // |  3      : :                   :    |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    li  a5, 0                                             // |  4      : :                   :^   |  0                                  |
    bltu    a5, a4, .LBB0_5                               // |  4      : :                   vv   |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    xor a2, a5, a4                                        // |  5      : :                 ^ vv   |  0                                  |
    seqz    a2, a2                                        // |  3      : :                 ^      |  0                                  |
    slt a3, t3, t1                                        // |  3      v v                  ^     |  0                                  |
    and a2, a2, a3                                        // |  2                          ^v     |  0                                  |
    bnez    a2, .LBB0_5                                   // |  1                          v      |  0                                  |
    j   .LBB0_6                                           // |  0                                 |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
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
