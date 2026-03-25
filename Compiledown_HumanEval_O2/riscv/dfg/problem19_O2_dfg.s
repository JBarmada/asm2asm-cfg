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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s5, a0                                            // |  4  :           :  ^      v        |  0                                  |
    call    strlen@plt                                    // |  4 ^:           :  :               |  0                                  |
    mv  s4, a0                                            // |  5  :           : ^:      v        |  0                                  |
    sext.w  s0, a0                                        // |  6  :         ^ : ::      v        |  0                                  |
    mv  a0, s2                                            // |  6  :         : v ::      ^        |  0                                  |
    call    strlen@plt                                    // |  7 ^:         : : ::      :        |  0                                  |
    seqz    a1, s0                                        // |  7  :         v : ::      :^       |  0                                  |
    sext.w  s3, a0                                        // |  7  :         : :^::      v        |  0                                  |
    slt a2, s0, s3                                        // |  7  :         v :v::        ^      |  0                                  |
    or  a1, a1, a2                                        // |  7  :           ::::       ^v      |  0                                  |
    li  s0, 0                                             // |  7  :         ^ ::::       :       |  0                                  |
    bnez    a1, .LBB0_3                                   // |  6  :           ::::       v       |  0                                  |
    li  s0, 0                                             // |  6  :         ^ ::::               |  0                                  |
    subw    a0, s4, a0                                    // |  6  :           ::v:      ^        |  0                                  |
    addiw   a0, a0, 1                                     // |  5  :           :: :      ^        |  0                                  |
    slli    a0, a0, 32                                    // |  5  :           :: :      ^        |  0                                  |
    srli    s1, a0, 32                                    // |  6  :          ^:: :      v        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a0, s5                                            // |  5  :           :: v      ^        |  0                                  |
    mv  a1, s2                                            // |  4  :           v:         ^       |  0                                  |
    mv  a2, s3                                            // |  3  :            v          ^      |  0                                  |
    call    strncmp@plt                                   // |  2 ^:                              |  0                                  |
    seqz    a0, a0                                        // |  2  :                     ^        |  0                                  |
    addw    s0, s0, a0                                    // |  3  :         ^           v        |  0                                  |
    addi    s1, s1, -1                                    // |  3  :         :^                   |  0                                  |
    addi    s5, s5, 1                                     // |  4  :         ::   ^               |  0                                  |
    bnez    s1, .LBB0_2                                   // |  3  :         :v                   |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a0, s0                                            // |  3  :         v           ^        |  0                                  |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  3 :v              ^               |  0                                  |
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
