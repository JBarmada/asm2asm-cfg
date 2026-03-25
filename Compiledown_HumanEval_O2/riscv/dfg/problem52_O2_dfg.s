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
    mv  s3, a0                                            // |  3  :            ^        v        |  0                                  |
    lbu s0, 0(a0)                                         // |  4  :         ^  :        v        |  0                                  |
    beqz    s0, .LBB0_5                                   // |  3  :         v  :                 |  0                                  |
    addi    s1, s3, 1                                     // |  3  :          ^ v                 |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  4  :          :^:                 |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_6)                    // |  4  :          :^:                 |  0                                  |
    j   .LBB0_3                                           // |  4  :          :::                 |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu s0, 0(s1)                                         // |  5  :         ^v::                 |  0                                  |
    addi    s1, s1, 1                                     // |  5  :         :^::                 |  0                                  |
    beqz    s0, .LBB0_5                                   // |  4  :         v ::                 |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    andi    a1, s0, 255                                   // |  5  :         v ::         ^       |  0                                  |
    li  a2, 11                                            // |  5  :         : ::          ^      |  0                                  |
    mv  a0, s2                                            // |  5  :         : v:        ^        |  0                                  |
    call    memchr@plt                                    // |  5 ^:         :  :        :        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  4  :         :  :        v        |  0                                  |
    addi    a0, s3, 1                                     // |  4  :         :  v        ^        |  0                                  |
    sb  s0, 0(s3)                                         // |  4  :         v  v        :        |  0                                  |
    mv  s3, a0                                            // |  3  :            ^        v        |  0                                  |
    j   .LBB0_2                                           // |  2  :            :                 |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sb  zero, 0(s3)                                       // |  2  :            v                 |  0                                  |
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
    .asciz  "AEIOUaeiou"                                  // |                                    |                                     |
    .size   .L.str, 11                                    // |                                    |                                     |
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
