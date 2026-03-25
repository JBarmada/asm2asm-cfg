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
    blez    a0, .LBB0_7                                   // |  2  :                     v        |  0                                  |
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    li  s1, 2                                             // |  3  :          ^:                  |  0                                  |
    li  a0, 1                                             // |  3  :           :         ^        |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    auipc   s3, %pcrel_hi(.L.str)                         // |  4  :           :^        :        |  0                                  |
    addi    s3, s3, %pcrel_lo(.LBB0_11)                   // |  4  :           :^        :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  s0, a0                                            // |  5  :         ^ ::        v        |  0                                  |
    li  a0, 0                                             // |  5  :         : ::        ^        |  0                                  |
    li  a1, 0                                             // |  6  :         : ::        :^       |  0                                  |
    mv  a2, s3                                            // |  6  :         : :v        : ^      |  0                                  |
    mv  a3, s0                                            // |  5  :         v :         :  ^     |  0                                  |
    call    snprintf@plt                                  // |  5 ^:         : :         :        |  0                                  |
    addw    s1, s1, a0                                    // |  5  :         :^:         v        |  0                                  |
    addiw   a0, s0, 1                                     // |  5  :         v::         ^        |  0                                  |
    blt s0, s2, .LBB0_2                                   // |  4  :         v:v                  |  0                                  |
    mv  a0, s1                                            // |  4  :          v:         ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:           :         :        |  0                                  |
    beqz    a0, .LBB0_9                                   // |  3  :           :         v        |  0                                  |
    mv  s3, a0                                            // |  4  :           :^        v        |  0                                  |
    sb  zero, 1(a0)                                       // |  4  :           ::        v        |  0                                  |
    li  a0, 48                                            // |  4  :           ::        ^        |  0                                  |
    sb  a0, 0(s3)                                         // |  4  :           :v        v        |  0                                  |
    blez    s2, .LBB0_10                                  // |  3  :           v:                 |  0                                  |
    addi    s0, s3, 1                                     // |  4  :         ^ :v                 |  0                                  |
    li  a0, 1                                             // |  4  :         : :         ^        |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    auipc   s4, %pcrel_hi(.L.str)                         // |  5  :         : : ^       :        |  0                                  |
    addi    s4, s4, %pcrel_lo(.LBB0_12)                   // |  5  :         : : ^       :        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  s1, a0                                            // |  6  :         :^: :       v        |  0                                  |
    mv  a0, s0                                            // |  6  :         v:: :       ^        |  0                                  |
    mv  a1, s4                                            // |  6  :          :: v       :^       |  0                                  |
    mv  a2, s1                                            // |  5  :          v:         : ^      |  0                                  |
    call    sprintf@plt                                   // |  5 ^:          ::         :        |  0                                  |
    add s0, s0, a0                                        // |  5  :         ^::         v        |  0                                  |
    addiw   a0, s1, 1                                     // |  4  :          v:         ^        |  0                                  |
    blt s1, s2, .LBB0_6                                   // |  3  :          vv                  |  0                                  |
    j   .LBB0_10                                          // |  1  :                              |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a0, 2                                             // |  2  :                     ^        |  0                                  |
    call    malloc@plt                                    // |  3 ^:                     :        |  0                                  |
    beqz    a0, .LBB0_9                                   // |  2  :                     v        |  0                                  |
    mv  s3, a0                                            // |  3  :            ^        v        |  0                                  |
    sb  zero, 1(a0)                                       // |  3  :            :        v        |  0                                  |
    li  a0, 48                                            // |  3  :            :        ^        |  0                                  |
    sb  a0, 0(s3)                                         // |  3  :            v        v        |  0                                  |
    j   .LBB0_10                                          // |  1  :                              |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  s3, 0                                             // |  2  :            ^                 |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  3  :            v        ^        |  0                                  |
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
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  " %d"                                         // |                                    |                                     |
    .size   .L.str, 4                                     // |                                    |                                     |
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
