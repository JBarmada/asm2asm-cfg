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
    blez    a1, .LBB0_15                                  // |  1                         v       |  0                                  |
    li  a3, 0                                             // |  1                           ^     |  0                                  |
    li  t0, 0                                             // |  1     ^                           |  0                                  |
    li  a7, 2                                             // |  1                               ^ |  0                                  |
    li  a6, 4                                             // |  2                              ^: |  0                                  |
    j   .LBB0_4                                           // |  2                              :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  t0, a2                                            // |  4     ^                    v   :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a3, a3, 1                                     // |  4     :                     ^  :: |  0                                  |
    beq a3, a1, .LBB0_11                                  // |  5     :                   v v  :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a2, a3, 2                                     // |  5     :                    ^v  :: |  0                                  |
    add a2, a2, a0                                        // |  5     :                  v ^   :: |  0                                  |
    lw  a2, 0(a2)                                         // |  4     :                    v   :: |  0                                  |
    blt a2, a7, .LBB0_3                                   // |  4     :                    v   :v |  0                                  |
    bltu    a2, a6, .LBB0_9                               // |  3     :                    v   v  |  0                                  |
    li  a4, 2                                             // |  3     :                    : ^    |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    remw    a5, a2, a4                                    // |  4     :                    v v^   |  0                                  |
    beqz    a5, .LBB0_3                                   // |  3     :                    :  v   |  0                                  |
    addiw   a4, a4, 1                                     // |  3     :                    : ^    |  0                                  |
    mulw    a5, a4, a4                                    // |  4     :                    : v^   |  0                                  |
    bge a2, a5, .LBB0_7                                   // |  3     :                    v  v   |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    blt t0, a2, .LBB0_2                                   // |  2     v                    v      |  0                                  |
    mv  a2, t0                                            // |  2     v                    ^      |  0                                  |
    j   .LBB0_2                                           // |  1     :                           |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  2     :                  ^        |  0                                  |
    blez    t0, .LBB0_14                                  // |  1     v                           |  0                                  |
    lui a1, 838861                                        // |  2     :                   ^       |  0                                  |
    addiw   a1, a1, -819                                  // |  2     :                   ^       |  0                                  |
    slli    a1, a1, 32                                    // |  2     :                   ^       |  0                                  |
    li  a2, 10                                            // |  3     :                   :^      |  0                                  |
    li  a3, 9                                             // |  4     :                   ::^     |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    mv  a4, t0                                            // |  5     v                   :::^    |  0                                  |
    slli    a5, t0, 32                                    // |  6     v                   ::::^   |  0                                  |
    mulhu   a5, a5, a1                                    // |  5                         v:::^   |  0                                  |
    srli    t0, a5, 35                                    // |  5     ^                    :::v   |  0                                  |
    mulw    a5, t0, a2                                    // |  5     v                    v::^   |  0                                  |
    subw    a5, a4, a5                                    // |  3                           :v^   |  0                                  |
    addw    a0, a0, a5                                    // |  4                        ^  ::v   |  0                                  |
    bltu    a3, a4, .LBB0_13                              // |  2                           vv    |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
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
