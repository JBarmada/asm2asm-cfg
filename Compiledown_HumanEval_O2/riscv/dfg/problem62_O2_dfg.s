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
    addi    sp, sp, -16                                   // |  1  ^                              |  0                                  |
    sd  ra, 8(sp)                                         // |  2 vv                              |  0                                  |
    sd  s0, 0(sp)                                         // |  2  v         v                    |  0                                  |
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:         :                    |  0                                  |
    beqz    a0, .LBB0_7                                   // |  3  :         :           v        |  0                                  |
    lbu a1, 0(s0)                                         // |  3  :         v            ^       |  0                                  |
    addi    a2, a1, -40                                   // |  4  :         :            v^      |  0                                  |
    seqz    a2, a2                                        // |  3  :         :             ^      |  0                                  |
    addi    a1, a1, -41                                   // |  4  :         :            ^:      |  0                                  |
    seqz    a1, a1                                        // |  4  :         :            ^:      |  0                                  |
    sub a1, a2, a1                                        // |  4  :         :            ^v      |  0                                  |
    bltz    a1, .LBB0_8                                   // |  3  :         :            v       |  0                                  |
    li  a3, 1                                             // |  3  :         :              ^     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a2, a3                                            // |  4  :         :             ^v     |  0                                  |
    beq a0, a3, .LBB0_6                                   // |  5  :         :           v :v     |  0                                  |
    add a3, s0, a2                                        // |  4  :         v             v^     |  0                                  |
    lbu a3, 0(a3)                                         // |  3  :                       :^     |  0                                  |
    addi    a4, a3, -40                                   // |  4  :                       :v^    |  0                                  |
    seqz    a4, a4                                        // |  3  :                       : ^    |  0                                  |
    addw    a1, a1, a4                                    // |  4  :                      ^: v    |  0                                  |
    addi    a3, a3, -41                                   // |  3  :                       :^     |  0                                  |
    seqz    a3, a3                                        // |  3  :                       :^     |  0                                  |
    subw    a1, a1, a3                                    // |  4  :                      ^:v     |  0                                  |
    addi    a3, a2, 1                                     // |  4  :                      :v^     |  0                                  |
    bgez    a1, .LBB0_3                                   // |  3  :                      v:      |  0                                  |
    li  a1, 1                                             // |  3  :                      ^:      |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    sltu    a0, a2, a0                                    // |  3  :                     ^ v      |  0                                  |
    xori    a0, a0, 1                                     // |  2  :                     ^        |  0                                  |
    j   .LBB0_9                                           // |  1  :                              |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  2  :                      ^       |  0                                  |
    li  a0, 1                                             // |  2  :                     ^        |  0                                  |
    j   .LBB0_9                                           // |  1  :                              |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  2  :                     ^        |  0                                  |
    li  a1, 1                                             // |  2  :                      ^       |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    sext.w  a1, a1                                        // |  2  :                      ^       |  0                                  |
    seqz    a1, a1                                        // |  2  :                      ^       |  0                                  |
    and a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  0                                  |
    ld  s0, 0(sp)                                         // |  3 :v         ^                    |  0                                  |
    addi    sp, sp, 16                                    // |  2 :^                              |  0                                  |
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
