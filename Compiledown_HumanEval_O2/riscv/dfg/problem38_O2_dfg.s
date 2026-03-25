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
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s0, a2                                            // |  3  :         ^             v      |  0                                  |
    mv  s2, a1                                            // |  4  :         : ^          v       |  0                                  |
    mv  s1, a0                                            // |  5  :         :^:         v        |  0                                  |
    srliw   a0, a1, 31                                    // |  6  :         :::         ^v       |  0                                  |
    addw    a0, a0, a1                                    // |  6  :         :::         ^v       |  0                                  |
    slli    a0, a0, 1                                     // |  5  :         :::         ^        |  0                                  |
    andi    a0, a0, -4                                    // |  5  :         :::         ^        |  0                                  |
    addi    a0, a0, 4                                     // |  5  :         :::         ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         :::         :        |  0                                  |
    blez    s2, .LBB0_10                                  // |  5  :         ::v         :        |  0                                  |
    li  a3, 0                                             // |  6  :         :::         :  ^     |  0                                  |
    addiw   a6, s2, -1                                    // |  7  :         ::v         :  :  ^  |  0                                  |
    srliw   a7, a6, 1                                     // |  8  :         :::         :  :  v^ |  0                                  |
    slli    a4, a7, 2                                     // |  9  :         :::         :  :^ :v |  0                                  |
    addi    a4, a4, 4                                     // |  9  :         :::         :  :^ :: |  0                                  |
    mv  a5, s1                                            // | 10  :         :v:         :  ::^:: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    flw ft0, 0(a5)                                        // | 10  :         :::         :  ::v:: |  1 ^                                |
    add a2, a0, a3                                        // | 10  :         :::         v ^v: :: |  0                                  |
    fsw ft0, 0(a2)                                        // |  9  :         :::         : v : :: |  1 ^                                |
    addi    a3, a3, 4                                     // |  9  :         :::         :  ^: :: |  0                                  |
    addi    a5, a5, 8                                     // | 10  :         :::         :  ::^:: |  0                                  |
    bne a4, a3, .LBB0_2                                   // |  9  :         :::         :  vv :: |  0                                  |
    li  a3, 2                                             // |  8  :         :::         :  ^  :: |  0                                  |
    bgeu    a6, a3, .LBB0_11                              // |  8  :         :::         :  v  v: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    blez    s2, .LBB0_10                                  // |  6  :         ::v         :      : |  0                                  |
    li  a1, 0                                             // |  7  :         :::         :^     : |  0                                  |
    j   .LBB0_8                                           // |  6  :         :::         :      : |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  a2, s1                                            // |  7  :         :v:         : ^    : |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    flw ft0, 0(a2)                                        // |  6  :         : :         : v    : |  1 ^                                |
    fsw ft0, 0(s0)                                        // |  5  :         v :         :      : |  1 ^                                |
    addi    a1, a1, 1                                     // |  5  :           :         :^     : |  0                                  |
    addi    s0, s0, 4                                     // |  6  :         ^ :         ::     : |  0                                  |
    addi    s1, s1, 4                                     // |  6  :          ^:         ::     : |  0                                  |
    beq s2, a1, .LBB0_10                                  // |  5  :           v         :v     : |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    andi    a2, a1, 1                                     // |  5  :                     :v^    : |  0                                  |
    bnez    a2, .LBB0_6                                   // |  5  :                     ::v    : |  0                                  |
    srliw   a2, a1, 1                                     // |  5  :                     :v^    : |  0                                  |
    slli    a2, a2, 2                                     // |  4  :                     : ^    : |  0                                  |
    add a2, a2, a0                                        // |  4  :                     v ^    : |  0                                  |
    j   .LBB0_7                                           // |  3  :                     :      : |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  4 ^v                     :      : |  0                                  |
    ld  s0, 16(sp)                                        // |  4  v         ^           :      : |  0                                  |
    ld  s1, 8(sp)                                         // |  4  v          ^          :      : |  0                                  |
    ld  s2, 0(sp)                                         // |  4  v           ^         :      : |  0                                  |
    addi    sp, sp, 32                                    // |  3  ^                     :      : |  0                                  |
    tail    free@plt                                      // |  2                        :      : |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a2, 0                                             // |  3                        : ^    : |  0                                  |
    addi    a6, a0, 4                                     // |  3                        v     ^: |  0                                  |
    mv  a4, a7                                            // |  4                        :   ^ :v |  0                                  |
    j   .LBB0_13                                          // |  3                        :     :: |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  4                        : ^   :: |  0                                  |
    addiw   a4, a4, -1                                    // |  5                        : : ^ :: |  0                                  |
    bgeu    a2, a7, .LBB0_4                               // |  5                        : v : :v |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    bgeu    a2, a7, .LBB0_12                              // |  5                        : v : :v |  0                                  |
    flw ft0, 0(a0)                                        // |  3                        v   : :  |  1 ^                                |
    slli    a3, a4, 32                                    // |  3                           ^v :  |  0                                  |
    srli    a5, a3, 32                                    // |  3                           v ^:  |  0                                  |
    mv  a3, a6                                            // |  2                           ^  v  |  0                                  |
    j   .LBB0_17                                          // |  1                           :     |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    fsw ft1, -4(a3)                                       // |  1                           v     |  1  ^                               |
    fsw ft0, 0(a3)                                        // |  1                           v     |  1 ^                                |
.LBB0_16:                                                 // |                                    |                                     |
    addi    a5, a5, -1                                    // |  1                             ^   |  1 :                                |
    addi    a3, a3, 4                                     // |  2                           ^ :   |  1 :                                |
    beqz    a5, .LBB0_12                                  // |  2                           : v   |  1 :                                |
.LBB0_17:                                                 // |                                    |                                     |
    flw ft1, 0(a3)                                        // |  1                           v     |  2 :^                               |
    flt.s   a1, ft1, ft0                                  // |  1                         ^       |  2 vv                               |
    bnez    a1, .LBB0_15                                  // |  1                         v       |  1  :                               |
    fmv.s   ft0, ft1                                      // |  0                                 |  2 ^v                               |
    j   .LBB0_16                                          // |  0                                 |  0                                  |
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
