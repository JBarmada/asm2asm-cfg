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
    addi    sp, sp, -80                                   // |  1  ^                              |  0                                  |
    sd  ra, 72(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 64(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 56(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 48(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 40(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 32(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 24(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 16(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 8(sp)                                         // |  2  v                v             |  0                                  |
    sd  s8, 0(sp)                                         // |  2  v                 v            |  0                                  |
    mv  s5, a0                                            // |  3  :              ^      v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:              :               |  0                                  |
    mv  s2, a0                                            // |  4  :           ^  :      v        |  0                                  |
    sext.w  s4, a0                                        // |  5  :           : ^:      v        |  0                                  |
    slli    s3, a0, 32                                    // |  6  :           :^::      v        |  0                                  |
    blez    s4, .LBB0_10                                  // |  5  :           ::v:               |  0                                  |
    call    __ctype_b_loc@plt                             // |  6 ^:           ::::               |  0                                  |
    mv  s6, a0                                            // |  7  :           ::::^     v        |  0                                  |
    li  s7, 0                                             // |  7  :           :::::^             |  0                                  |
    srli    s1, s3, 32                                    // |  7  :          ^:v:::              |  0                                  |
    mv  s0, s5                                            // |  7  :         ^ :::v:              |  0                                  |
    j   .LBB0_4                                           // |  6  :           :::::              |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   s7, s7, 1                                     // |  7  :           :::::^             |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    s1, s1, -1                                    // |  7  :          ^:::::              |  0                                  |
    addi    s0, s0, 1                                     // |  8  :         ^::::::              |  0                                  |
    beqz    s1, .LBB0_11                                  // |  8  :         :v:::::              |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lbu s8, 0(s0)                                         // |  8  :         v ::::: ^            |  0                                  |
    ld  a0, 0(s6)                                         // |  9  :         : ::::v :   ^        |  0                                  |
    slli    a1, s8, 1                                     // |  8  :         : ::::  v    ^       |  0                                  |
    add a0, a0, a1                                        // |  9  :         : ::::  :   ^v       |  0                                  |
    lhu a0, 0(a0)                                         // |  8  :         : ::::  :   ^        |  0                                  |
    andi    a1, a0, 1024                                  // |  9  :         : ::::  :   v^       |  0                                  |
    beqz    a1, .LBB0_2                                   // |  9  :         : ::::  :   :v       |  0                                  |
    andi    a1, a0, 256                                   // |  9  :         : ::::  :   v^       |  0                                  |
    bnez    a1, .LBB0_8                                   // |  8  :         : ::::  :    v       |  0                                  |
    andi    a0, a0, 512                                   // |  8  :         : ::::  :   ^        |  0                                  |
    beqz    a0, .LBB0_3                                   // |  8  :         : ::::  :   v        |  0                                  |
    call    __ctype_toupper_loc@plt                       // |  9 ^:         : ::::  :   :        |  0                                  |
    j   .LBB0_9                                           // |  8  :         : ::::  :   :        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    call    __ctype_tolower_loc@plt                       // |  9 ^:         : ::::  :   :        |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    ld  a0, 0(a0)                                         // |  8  :         : ::::  :   v        |  0                                  |
    slli    a1, s8, 2                                     // |  8  :         : ::::  v    ^       |  0                                  |
    add a0, a0, a1                                        // |  8  :         : ::::      ^v       |  0                                  |
    lb  a0, 0(a0)                                         // |  7  :         : ::::      v        |  0                                  |
    sb  a0, 0(s0)                                         // |  7  :         v ::::      v        |  0                                  |
    j   .LBB0_3                                           // |  5  :           ::::               |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  s7, 0                                             // |  6  :           :::: ^             |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    xor a0, s7, s4                                        // |  7  :           ::v: v    ^        |  0                                  |
    snez    a0, a0                                        // |  6  :           ::::      ^        |  0                                  |
    slti    a1, s4, 2                                     // |  6  :           ::v:       ^       |  0                                  |
    or  a0, a0, a1                                        // |  6  :           :: :      ^v       |  0                                  |
    bnez    a0, .LBB0_14                                  // |  5  :           :: :      v        |  0                                  |
    li  a0, -1                                            // |  5  :           :: :      ^        |  0                                  |
    slli    a0, a0, 32                                    // |  5  :           :: :      ^        |  0                                  |
    srliw   a1, s2, 1                                     // |  6  :           v: :      :^       |  0                                  |
    add a2, s3, a0                                        // |  5  :            v :      v ^      |  0                                  |
    mv  a3, s5                                            // |  5  :              v      : :^     |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    srai    a4, a2, 32                                    // |  6  :              :      : v:^    |  0                                  |
    add a4, a4, s5                                        // |  5  :              v      :  :^    |  0                                  |
    lb  a5, 0(a4)                                         // |  6  :              :      :  :v^   |  0                                  |
    lb  s1, 0(a3)                                         // |  7  :          ^   :      :  v::   |  0                                  |
    sb  a5, 0(a3)                                         // |  7  :          :   :      :  v:v   |  0                                  |
    sb  s1, 0(a4)                                         // |  5  :          v   :      :   v    |  0                                  |
    add a2, a2, a0                                        // |  4  :              :      v ^      |  0                                  |
    addi    a1, a1, -1                                    // |  3  :              :       ^       |  0                                  |
    addi    a3, a3, 1                                     // |  4  :              :       : ^     |  0                                  |
    bnez    a1, .LBB0_13                                  // |  3  :              :       v       |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a0, s5                                            // |  3  :              v      ^        |  0                                  |
    ld  ra, 72(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 64(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 56(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 48(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 40(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 32(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 24(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 16(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 8(sp)                                         // |  3 :v                ^             |  0                                  |
    ld  s8, 0(sp)                                         // |  3 :v                 ^            |  0                                  |
    addi    sp, sp, 80                                    // |  2 :^                              |  0                                  |
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
