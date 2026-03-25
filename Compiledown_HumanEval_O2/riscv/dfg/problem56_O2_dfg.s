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
    addi    sp, sp, -2032                                 // |  1  ^                              |  0                                  |
    sd  ra, 2024(sp)                                      // |  2 vv                              |  0                                  |
    sd  s0, 2016(sp)                                      // |  2  v         v                    |  0                                  |
    sd  s1, 2008(sp)                                      // |  2  v          v                   |  0                                  |
    addi    sp, sp, -2000                                 // |  1  ^                              |  0                                  |
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    lui a0, 1                                             // |  3  :         :           ^        |  0                                  |
    addiw   a2, a0, -96                                   // |  4  :         :           v ^      |  0                                  |
    addi    a0, sp, 8                                     // |  3  v         :           ^        |  0                                  |
    addi    s1, sp, 8                                     // |  3  v         :^                   |  0                                  |
    li  a1, 0                                             // |  4  :         ::           ^       |  0                                  |
    call    memset@plt                                    // |  4 ^:         ::                   |  0                                  |
    li  a0, 1                                             // |  4  :         ::          ^        |  0                                  |
    li  a1, 2                                             // |  5  :         ::          :^       |  0                                  |
    sw  a0, 12(sp)                                        // |  5  v         ::          v:       |  0                                  |
    blt s0, a1, .LBB0_3                                   // |  4  :         v:           v       |  0                                  |
    addiw   a1, s0, 1                                     // |  4  :         v:           ^       |  0                                  |
    slli    a1, a1, 32                                    // |  4  :         ::           ^       |  0                                  |
    srli    a2, a1, 32                                    // |  5  :         ::           v^      |  0                                  |
    addi    a1, sp, 16                                    // |  4  v         ::           ^       |  0                                  |
    addi    a2, a2, -2                                    // |  4            ::           :^      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a3, -8(a1)                                        // |  4            ::           v ^     |  0                                  |
    addw    a0, a0, a3                                    // |  5            ::          ^: v     |  0                                  |
    sw  a0, 0(a1)                                         // |  4            ::          vv       |  0                                  |
    addi    a2, a2, -1                                    // |  3            ::            ^      |  0                                  |
    addi    a1, a1, 4                                     // |  4            ::           ^:      |  0                                  |
    bnez    a2, .LBB0_2                                   // |  3            ::            v      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, s0, 2                                     // |  3            v:          ^        |  0                                  |
    add a0, a0, s1                                        // |  2             v          ^        |  0                                  |
    lw  a0, 0(a0)                                         // |  1                        v        |  0                                  |
    addi    sp, sp, 2000                                  // |  1  ^                              |  0                                  |
    ld  ra, 2024(sp)                                      // |  2 ^v                              |  0                                  |
    ld  s0, 2016(sp)                                      // |  3 :v         ^                    |  0                                  |
    ld  s1, 2008(sp)                                      // |  3 :v          ^                   |  0                                  |
    addi    sp, sp, 2032                                  // |  2 :^                              |  0                                  |
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
