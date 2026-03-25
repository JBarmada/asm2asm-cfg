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
    mv  s1, a1                                            // |  4  :         :^           v       |  0                                  |
    mv  s2, a0                                            // |  5  :         ::^         v        |  0                                  |
    bgtz    a1, .LBB0_2                                   // |  5  :         :::          v       |  0                                  |
    li  a0, 0                                             // |  5  :         :::         ^        |  0                                  |
    j   .LBB0_3                                           // |  4  :         :::                  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    slliw   a0, s1, 1                                     // |  5  :         :v:         ^        |  0                                  |
    addiw   a0, a0, -1                                    // |  5  :         :::         ^        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    sw  a0, 0(a3)                                         // |  6  :         :::         v  v     |  0                                  |
    slli    a0, a0, 2                                     // |  5  :         :::         ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         :::         :        |  0                                  |
    blez    s1, .LBB0_7                                   // |  5  :         :v:         :        |  0                                  |
    lw  a1, 0(s2)                                         // |  6  :         ::v         :^       |  0                                  |
    li  a2, 1                                             // |  7  :         :::         ::^      |  0                                  |
    sw  a1, 0(a0)                                         // |  7  :         :::         vv:      |  0                                  |
    beq s1, a2, .LBB0_7                                   // |  6  :         :v:         : v      |  0                                  |
    slli    a1, s1, 32                                    // |  6  :         :v:         :^       |  0                                  |
    srli    a2, a1, 32                                    // |  6  :         : :         :v^      |  0                                  |
    addi    a1, s2, 4                                     // |  5  :         : v         :^       |  0                                  |
    addi    a2, a2, -1                                    // |  5  :         :           ::^      |  0                                  |
    addi    a3, a0, 8                                     // |  5  :         :           v: ^     |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    sw  s0, -4(a3)                                        // |  4  :         v            : v     |  0                                  |
    lw  a4, 0(a1)                                         // |  4  :                      v :^    |  0                                  |
    sw  a4, 0(a3)                                         // |  3  :                        vv    |  0                                  |
    addi    a1, a1, 4                                     // |  2  :                      ^       |  0                                  |
    addi    a2, a2, -1                                    // |  2  :                       ^      |  0                                  |
    addi    a3, a3, 8                                     // |  3  :                       :^     |  0                                  |
    bnez    a2, .LBB0_6                                   // |  2  :                       v      |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
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
