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
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:           :                  |  0                                  |
    addiw   s4, a0, -2                                    // |  4  :           : ^       v        |  0                                  |
    blez    s4, .LBB0_6                                   // |  3  :           : v                |  0                                  |
    addi    s1, s4, 1                                     // |  4  :          ^: v                |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   s3, %pcrel_hi(.L.str)                         // |  3  :           :^                 |  0                                  |
    addi    s3, s3, %pcrel_lo(.LBB0_8)                    // |  3  :           :^                 |  0                                  |
    li  s5, 1                                             // |  4  :           :: ^               |  0                                  |
    j   .LBB0_3                                           // |  4  :           :: :               |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s1, s1, -1                                    // |  5  :          ^:: :               |  0                                  |
    bge s5, s1, .LBB0_6                                   // |  5  :          v:: v               |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add s0, s2, s1                                        // |  5  :         ^vv:                 |  0                                  |
    lbu s6, -1(s0)                                        // |  5  :         v ::  ^              |  0                                  |
    li  a2, 11                                            // |  6  :         : ::  :       ^      |  0                                  |
    mv  a0, s3                                            // |  6  :         : :v  :     ^        |  0                                  |
    mv  a1, s6                                            // |  7  :         : ::  v     :^       |  0                                  |
    call    memchr@plt                                    // |  6 ^:         : ::        :        |  0                                  |
    addiw   s4, s4, -1                                    // |  6  :         : ::^       :        |  0                                  |
    beqz    a0, .LBB0_2                                   // |  6  :         : :::       v        |  0                                  |
    lbu a1, 0(s0)                                         // |  6  :         v :::        ^       |  0                                  |
    li  a2, 11                                            // |  5  :           :::         ^      |  0                                  |
    mv  a0, s3                                            // |  5  :           :v:       ^        |  0                                  |
    call    memchr@plt                                    // |  6 ^:           :::       :        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  5  :           :::       v        |  0                                  |
    slli    a0, s4, 32                                    // |  5  :           ::v       ^        |  0                                  |
    srli    a0, a0, 32                                    // |  4  :           ::        ^        |  0                                  |
    add a0, a0, s2                                        // |  4  :           v:        ^        |  0                                  |
    lbu a1, 0(a0)                                         // |  4  :            :        v^       |  0                                  |
    li  a2, 11                                            // |  3  :            :          ^      |  0                                  |
    mv  a0, s3                                            // |  3  :            v        ^        |  0                                  |
    call    memchr@plt                                    // |  3 ^:                     :        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  2  :                     v        |  0                                  |
    j   .LBB0_7                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  s6, 0                                             // |  2  :               ^              |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
.LBB0_9:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(func0.out)                      // |  3  :               :     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_9)                    // |  3  :               :     ^        |  0                                  |
    sb  s6, 0(a0)                                         // |  3  :               v     v        |  0                                  |
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
    .type   func0.out,@object                             // |                                    |                                     |
    .section    .sbss,"aw",@nobits                        // |                                    |                                     |
func0.out:                                                // |                                    |                                     |
    .zero   2                                             // |                                    |                                     |
    .size   func0.out, 2                                  // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "AEIOUaeiou"                                  // |                                    |                                     |
    .size   .L.str, 11                                    // |                                    |                                     |
    .ident  "Debian clang version 15.0.7"                 // |                                    |                                     |
    .section    ".note.GNU-stack","",@progbits            // |                                    |                                     |
    .addrsig                                              // |                                    |                                     |
    .addrsig_sym func0.out                                // |                                    |                                     |
                                                          // +....................................+.....................................+
                                                          // Legend:
                                                          //     ^       : Register assignment (write)
                                                          //     v       : Register usage (read)
                                                          //     x       : Register usage and reassignment (R/W)
                                                          //     :       : Register in use (live)
                                                          //     <space> : Register not in use
                                                          //     #       : Number of occupied registers
