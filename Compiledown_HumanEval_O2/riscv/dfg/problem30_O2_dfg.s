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
    addi    sp, sp, -64                                   // |  1  ^                              |  0                                  |
    sd  ra, 56(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 48(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 40(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 32(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 24(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 16(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 8(sp)                                         // |  2  v              v               |  0                                  |
    sd  s6, 0(sp)                                         // |  2  v               v              |  0                                  |
    mv  s2, a3                                            // |  3  :           ^            v     |  0                                  |
    mv  s3, a2                                            // |  4  :           :^          v      |  0                                  |
    mv  s0, a1                                            // |  5  :         ^ ::         v       |  0                                  |
    mv  s1, a0                                            // |  6  :         :^::        v        |  0                                  |
    mv  a0, a2                                            // |  6  :         : ::        ^ v      |  0                                  |
    call    strlen@plt                                    // |  6 ^:         : ::        :        |  0                                  |
    mv  s5, a0                                            // |  6  :         : :: ^      v        |  0                                  |
    slli    a0, s0, 3                                     // |  5  :         v ::        ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         : ::        :        |  0                                  |
    sd  a0, 0(s2)                                         // |  5  :         : v:        v        |  0                                  |
    li  s4, 0                                             // |  5  :         : ::^                |  0                                  |
    blez    s0, .LBB0_5                                   // |  5  :         v :::                |  0                                  |
    sext.w  s5, s5                                        // |  5  :           :::^               |  0                                  |
    j   .LBB0_3                                           // |  5  :           ::::               |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  6  :         ^ ::::               |  0                                  |
    addi    s1, s1, 8                                     // |  7  :         :^::::               |  0                                  |
    beqz    s0, .LBB0_5                                   // |  7  :         v:::::               |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    ld  s6, 0(s1)                                         // |  7  :          v::::^              |  0                                  |
    mv  a0, s6                                            // |  7  :           ::::v     ^        |  0                                  |
    mv  a1, s3                                            // |  8  :           :v:::     :^       |  0                                  |
    mv  a2, s5                                            // |  7  :           : :v:     : ^      |  0                                  |
    call    strncmp@plt                                   // |  6 ^:           : : :     :        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  5  :           : : :     v        |  0                                  |
    ld  a0, 0(s2)                                         // |  5  :           v : :     ^        |  0                                  |
    slli    a1, s4, 3                                     // |  4  :             v :      ^       |  0                                  |
    addiw   s4, s4, 1                                     // |  4  :             ^ :      :       |  0                                  |
    add a0, a0, a1                                        // |  5  :             : :     ^v       |  0                                  |
    sd  s6, 0(a0)                                         // |  4  :             : v     v        |  0                                  |
    j   .LBB0_2                                           // |  2  :             :                |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, s4                                            // |  3  :             v       ^        |  0                                  |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  3 :v              ^               |  0                                  |
    ld  s6, 0(sp)                                         // |  3 :v               ^              |  0                                  |
    addi    sp, sp, 64                                    // |  2 :^                              |  0                                  |
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
