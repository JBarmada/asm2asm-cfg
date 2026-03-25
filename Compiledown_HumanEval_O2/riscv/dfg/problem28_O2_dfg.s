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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:           :                  |  0                                  |
    sext.w  a1, a0                                        // |  4  :           :         v^       |  0                                  |
    blez    a1, .LBB0_7                                   // |  3  :           :          v       |  0                                  |
    slli    a0, a0, 32                                    // |  4  :           :         ^:       |  0                                  |
    srli    a0, a0, 32                                    // |  4  :           :         ^:       |  0                                  |
    li  a2, 25                                            // |  4  :           :          :^      |  0                                  |
    li  a3, 26                                            // |  5  :           :          ::^     |  0                                  |
    mv  a4, s2                                            // |  6  :           v          :::^    |  0                                  |
    j   .LBB0_4                                           // |  6  :           :          ::::    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a5, a5, -32                                   // |  7  :           :          ::::^   |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    sb  a5, 0(a4)                                         // |  7  :           :          :::vv   |  0                                  |
    addi    a4, a4, 1                                     // |  6  :           :          :::^    |  0                                  |
    addi    a0, a0, -1                                    // |  6  :           :         ^:::     |  0                                  |
    addi    s1, s1, 1                                     // |  7  :          ^:         ::::     |  0                                  |
    beqz    a0, .LBB0_7                                   // |  7  :          ::         v:::     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lbu a5, 0(s1)                                         // |  7  :          v:          ::: ^   |  0                                  |
    addiw   s0, a5, -97                                   // |  7  :         ^ :          ::: v   |  0                                  |
    andi    s0, s0, 255                                   // |  7  :         ^ :          ::: :   |  0                                  |
    bgeu    a2, s0, .LBB0_2                               // |  7  :         v :          :v: :   |  0                                  |
    addiw   s0, a5, -65                                   // |  6  :         ^ :          : : v   |  0                                  |
    andi    s0, s0, 255                                   // |  5  :         ^ :          : :     |  0                                  |
    bgeu    s0, a3, .LBB0_3                               // |  5  :         v :          : v     |  0                                  |
    addi    a5, a5, 32                                    // |  4  :           :          :   ^   |  0                                  |
    j   .LBB0_3                                           // |  3  :           :          :       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    add a0, s2, a1                                        // |  4  :           v         ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  2  :                     v        |  0                                  |
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
