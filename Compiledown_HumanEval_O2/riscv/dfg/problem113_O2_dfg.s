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
    mv  s4, a1                                            // |  5  :           ::^        v       |  0                                  |
    mv  s6, a0                                            // |  6  :           ::: ^     v        |  0                                  |
    call    strlen@plt                                    // |  6 ^:           ::: :              |  0                                  |
    addiw   a0, a0, 1                                     // |  6  :           ::: :     ^        |  0                                  |
    call    malloc@plt                                    // |  7 ^:           ::: :     :        |  0                                  |
    lbu a3, 0(s6)                                         // |  7  :           ::: v     :  ^     |  0                                  |
    mv  s5, a0                                            // |  8  :           :::^:     v  :     |  0                                  |
    beqz    a3, .LBB0_7                                   // |  7  :           :::::        v     |  0                                  |
    lbu s0, 0(s4)                                         // |  8  :         ^ ::v::        :     |  0                                  |
    li  a2, 0                                             // |  9  :         : :::::       ^:     |  0                                  |
    li  a1, 0                                             // |  9  :         : :::::      ^ :     |  0                                  |
    addi    a4, s4, 1                                     // | 10  :         : ::v::      : :^    |  0                                  |
    j   .LBB0_4                                           // |  9  :         : :: ::      : ::    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    add a0, s5, a1                                        // | 10  :         : :: v:     ^v ::    |  0                                  |
    addiw   a1, a1, 1                                     // | 10  :         : :: ::     :^ ::    |  0                                  |
    sb  a3, 0(a0)                                         // |  9  :         : :: ::     v  v:    |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a2, a2, 1                                     // |  8  :         : :: ::       ^ :    |  0                                  |
    add a0, s6, a2                                        // |  9  :         : :: :v     ^ v :    |  0                                  |
    lbu a3, 0(a0)                                         // |  8  :         : :: :      v  ^:    |  0                                  |
    beqz    a3, .LBB0_8                                   // |  7  :         : :: :         v:    |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    mv  a5, a4                                            // |  8  :         : :: :         :v^   |  0                                  |
    mv  a0, s0                                            // |  8  :         v :: :      ^  : :   |  0                                  |
    beqz    s0, .LBB0_2                                   // |  7  :         v :: :         : :   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    andi    a0, a0, 255                                   // |  7  :           :: :      ^  : :   |  0                                  |
    andi    s1, a3, 255                                   // |  8  :          ^:: :      :  v :   |  0                                  |
    beq s1, a0, .LBB0_3                                   // |  7  :          v:: :      v    :   |  0                                  |
    lbu a0, 0(a5)                                         // |  6  :           :: :      ^    v   |  0                                  |
    addi    a5, a5, 1                                     // |  6  :           :: :      :    ^   |  0                                  |
    bnez    a0, .LBB0_5                                   // |  5  :           :: :      v        |  0                                  |
    j   .LBB0_2                                           // |  4  :           :: :               |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  5  :           :: :       ^       |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    add a0, s5, a1                                        // |  6  :           :: v      ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :           :: :      v        |  0                                  |
    mv  a0, s5                                            // |  5  :           :: v      ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:           :: :      :        |  0                                  |
    sext.w  a1, a0                                        // |  6  :           :: :      v^       |  0                                  |
    li  a2, 2                                             // |  7  :           :: :      ::^      |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str)                         // |  8  :          ^:: :      :::      |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_14)                   // |  8  :          ^:: :      :::      |  0                                  |
    blt a1, a2, .LBB0_13                                  // |  7  :           :: :      :vv      |  0                                  |
    li  a1, -1                                            // |  6  :           :: :      :^       |  0                                  |
    slli    a1, a1, 32                                    // |  6  :           :: :      :^       |  0                                  |
    srliw   a2, a0, 1                                     // |  7  :           :: :      v:^      |  0                                  |
    slli    a0, a0, 32                                    // |  6  :           :: :      ^:       |  0                                  |
    add a3, a0, a1                                        // |  7  :           :: :      vv ^     |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str.1)                       // |  7  :           :: :      ^: :     |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_15)                   // |  7  :           :: :      ^: :     |  0                                  |
    mv  a4, s5                                            // |  8  :           :: v      :: :^    |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    lbu a5, 0(a4)                                         // |  9  :           :: :      :: :v^   |  0                                  |
    srai    s0, a3, 32                                    // |  9  :         ^ :: :      :: v :   |  0                                  |
    add s0, s0, s5                                        // |  8  :         ^ :: v      ::   :   |  0                                  |
    lbu s0, 0(s0)                                         // |  8  :         ^ :: :      ::   :   |  0                                  |
    bne a5, s0, .LBB0_12                                  // |  8  :         v :: :      ::   v   |  0                                  |
    add a3, a3, a1                                        // |  7  :           :: :      :v ^     |  0                                  |
    addi    a2, a2, -1                                    // |  6  :           :: :      : ^      |  0                                  |
    addi    a4, a4, 1                                     // |  7  :           :: :      : : ^    |  0                                  |
    bnez    a2, .LBB0_10                                  // |  6  :           :: :      : v      |  0                                  |
    j   .LBB0_13                                          // |  5  :           :: :      :        |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    mv  s1, a0                                            // |  6  :          ^:: :      v        |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  6  :          ::v :      ^        |  0                                  |
    mv  a1, s5                                            // |  5  :          ::  v       ^       |  0                                  |
    call    strcpy@plt                                    // |  5 ^:          ::  :               |  0                                  |
    mv  a0, s2                                            // |  5  :          :v  :      ^        |  0                                  |
    mv  a1, s1                                            // |  4  :          v   :       ^       |  0                                  |
    call    strcpy@plt                                    // |  3 ^:              :               |  0                                  |
    mv  a0, s5                                            // |  3  :              v      ^        |  0                                  |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  2  v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  2  v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  2  v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  2  v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  2  v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  2  v              ^               |  0                                  |
    ld  s6, 0(sp)                                         // |  2  v               ^              |  0                                  |
    addi    sp, sp, 64                                    // |  1  ^                              |  0                                  |
    tail    free@plt                                      // |  0                                 |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "True"                                        // |                                    |                                     |
    .size   .L.str, 5                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "False"                                       // |                                    |                                     |
    .size   .L.str.1, 6                                   // |                                    |                                     |
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
