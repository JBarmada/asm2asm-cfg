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
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    addiw   s1, a0, 1                                     // |  4  :         :^          v        |  0                                  |
    slli    a0, s1, 2                                     // |  4  :         :v          ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:         :           :        |  0                                  |
    li  a1, 1                                             // |  4  :         :           :^       |  0                                  |
    sw  a1, 0(a0)                                         // |  4  :         :           vv       |  0                                  |
    beqz    s0, .LBB0_2                                   // |  3  :         v           :        |  0                                  |
    li  a2, 3                                             // |  4  :         :           : ^      |  0                                  |
    li  a1, 2                                             // |  5  :         :           :^:      |  0                                  |
    sw  a2, 4(a0)                                         // |  5  :         :           v:v      |  0                                  |
    bge s0, a1, .LBB0_3                                   // |  4  :         v           :v       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  3 ^v                     :        |  0                                  |
    ld  s0, 16(sp)                                        // |  4 :v         ^           :        |  0                                  |
    ld  s1, 8(sp)                                         // |  4 :v          ^          :        |  0                                  |
    addi    sp, sp, 32                                    // |  4 :^          :          :        |  0                                  |
    ret                                                   // |  3 v           :          :        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a3, s1, 32                                    // |  3             v          :  ^     |  0                                  |
    srli    a3, a3, 32                                    // |  2                        :  ^     |  0                                  |
    j   .LBB0_6                                           // |  2                        :  :     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a5, a4, a0                                        // |  4                        v  :v^   |  0                                  |
    lw  a5, -8(a5)                                        // |  3                        :  : v   |  0                                  |
    addi    a1, a1, 1                                     // |  4                        :^ : :   |  0                                  |
    srliw   s1, a1, 1                                     // |  5             ^          :v : :   |  0                                  |
    addw    a2, a2, s1                                    // |  6             v          ::^: :   |  0                                  |
    addw    a2, a2, a5                                    // |  5                        ::^: v   |  0                                  |
    addiw   a2, a2, 1                                     // |  4                        ::^:     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    add a4, a4, a0                                        // |  5                        v:::^    |  0                                  |
    sw  a2, 0(a4)                                         // |  4                         :v:v    |  0                                  |
    beq a1, a3, .LBB0_2                                   // |  2                         v v     |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    andi    a5, a1, 1                                     // |  2                         v   ^   |  0                                  |
    slli    a4, a1, 2                                     // |  3                         v  ^:   |  0                                  |
    bnez    a5, .LBB0_4                                   // |  2                         :   v   |  0                                  |
    srliw   a2, a1, 1                                     // |  2                         v^      |  0                                  |
    addiw   a2, a2, 1                                     // |  1                          ^      |  0                                  |
    addi    a1, a1, 1                                     // |  1                         ^       |  0                                  |
    j   .LBB0_5                                           // |  0                                 |  0                                  |
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
