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
    blez    a1, .LBB0_7                                   // |  2  :                      v       |  0                                  |
    mv  s5, a1                                            // |  3  :              ^       v       |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    li  s0, 0                                             // |  2  :         ^                    |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    auipc   s4, %pcrel_hi(.L.str)                         // |  2  :             ^                |  0                                  |
    addi    s4, s4, %pcrel_lo(.LBB0_9)                    // |  2  :             ^                |  0                                  |
    li  s3, 0                                             // |  2  :            ^                 |  0                                  |
    j   .LBB0_3                                           // |  2  :            :                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s5, s5, -1                                    // |  3  :            : ^               |  0                                  |
    addi    s1, s1, 8                                     // |  4  :          ^ : :               |  0                                  |
    mv  s4, s2                                            // |  6  :          :v:^:               |  0                                  |
    mv  s0, s3                                            // |  6  :         ^: v::               |  0                                  |
    beqz    s5, .LBB0_8                                   // |  5  :         ::  :v               |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    ld  s2, 0(s1)                                         // |  5  :         :v^ :                |  0                                  |
    mv  a0, s2                                            // |  5  :         : v :       ^        |  0                                  |
    call    strlen@plt                                    // |  4 ^:         :   :                |  0                                  |
    sext.w  a0, a0                                        // |  4  :         :   :       ^        |  0                                  |
    blt a0, s0, .LBB0_5                                   // |  4  :         v   :       v        |  0                                  |
    mv  s3, a0                                            // |  5  :         :  ^:       v        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    blt s0, a0, .LBB0_2                                   // |  4  :         v   :       v        |  0                                  |
    mv  s2, s4                                            // |  3  :           ^ v                |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
.LBB0_10:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  2  :           ^                  |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_10)                   // |  2  :           ^                  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
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
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .zero   1                                             // |                                    |                                     |
    .size   .L.str, 1                                     // |                                    |                                     |
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
