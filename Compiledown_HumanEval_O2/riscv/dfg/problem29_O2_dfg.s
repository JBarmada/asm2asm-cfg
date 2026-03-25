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
    addi    sp, sp, -48                                   // |  1  ^                              |  0                                  |
    sd  ra, 40(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 32(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 24(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 16(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 8(sp)                                         // |  2  v            v                 |  0                                  |
    sd  s4, 0(sp)                                         // |  2  v             v                |  0                                  |
    blez    a1, .LBB0_6                                   // |  2  :                      v       |  0                                  |
    mv  s4, a1                                            // |  3  :             ^        v       |  0                                  |
    mv  s3, a0                                            // |  4  :            ^:       v        |  0                                  |
    li  s2, 0                                             // |  4  :           ^::                |  0                                  |
    mv  s0, a1                                            // |  5  :         ^  ::        v       |  0                                  |
    mv  s1, a0                                            // |  5  :          ^ ::       v        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    ld  a0, 0(s1)                                         // |  5  :          v ::       ^        |  0                                  |
    call    strlen@plt                                    // |  5 ^:            ::       :        |  0                                  |
    addw    s2, s2, a0                                    // |  5  :           ^::       v        |  0                                  |
    addi    s0, s0, -1                                    // |  5  :         ^ :::                |  0                                  |
    addi    s1, s1, 8                                     // |  6  :         :^:::                |  0                                  |
    bnez    s0, .LBB0_2                                   // |  5  :         v :::                |  0                                  |
    addiw   a0, s2, 1                                     // |  5  :           v::       ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:            ::       :        |  0                                  |
    beqz    a0, .LBB0_8                                   // |  4  :            ::       v        |  0                                  |
    mv  s2, a0                                            // |  5  :           ^::       v        |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :           :::       v        |  0                                  |
    blez    s4, .LBB0_9                                   // |  4  :           ::v                |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    ld  a1, 0(s3)                                         // |  4  :           :v         ^       |  0                                  |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    call    strcat@plt                                    // |  2 ^:                              |  0                                  |
    addi    s4, s4, -1                                    // |  2  :             ^                |  0                                  |
    addi    s3, s3, 8                                     // |  3  :            ^:                |  0                                  |
    bnez    s4, .LBB0_5                                   // |  2  :             v                |  0                                  |
    j   .LBB0_9                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a0, 1                                             // |  2  :                     ^        |  0                                  |
    call    malloc@plt                                    // |  3 ^:                     :        |  0                                  |
    beqz    a0, .LBB0_8                                   // |  2  :                     v        |  0                                  |
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    sb  zero, 0(a0)                                       // |  2  :                     v        |  0                                  |
    j   .LBB0_9                                           // |  1  :                              |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  s2, 0                                             // |  2  :           ^                  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    ld  s4, 0(sp)                                         // |  3 :v             ^                |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
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
