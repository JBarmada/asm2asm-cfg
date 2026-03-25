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
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:           :                  |  0                                  |
    beqz    a0, .LBB0_3                                   // |  3  :           :         v        |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    li  s0, 0                                             // |  3  :         ^ :                  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    auipc   s3, %pcrel_hi(.L.str)                         // |  3  :           :^                 |  0                                  |
    addi    s3, s3, %pcrel_lo(.LBB0_5)                    // |  3  :           :^                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu a1, 0(s2)                                         // |  4  :           v:         ^       |  0                                  |
    li  a2, 7                                             // |  3  :            :          ^      |  0                                  |
    mv  a0, s3                                            // |  3  :            v        ^        |  0                                  |
    call    memchr@plt                                    // |  2 ^:                              |  0                                  |
    snez    a0, a0                                        // |  2  :                     ^        |  0                                  |
    addw    s0, s0, a0                                    // |  3  :         ^           v        |  0                                  |
    addi    s1, s1, -1                                    // |  2  :          ^                   |  0                                  |
    addi    s2, s2, 1                                     // |  3  :          :^                  |  0                                  |
    bnez    s1, .LBB0_2                                   // |  2  :          v                   |  0                                  |
    j   .LBB0_4                                           // |  1  :                              |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    li  s0, 0                                             // |  2  :         ^                    |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    mv  a0, s0                                            // |  3  :         v           ^        |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "2357BD"                                      // |                                    |                                     |
    .size   .L.str, 7                                     // |                                    |                                     |
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
