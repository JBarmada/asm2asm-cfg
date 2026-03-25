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
    sh  zero, 24(sp)                                      // |  1  v                              |  0                                  |
    sd  zero, 16(sp)                                      // |  1  v                              |  0                                  |
    sh  zero, 8(sp)                                       // |  1  v                              |  0                                  |
    sd  zero, 0(sp)                                       // |  1  v                              |  0                                  |
    lbu s0, 0(a0)                                         // |  3  :         ^           v        |  0                                  |
    mv  s2, a1                                            // |  4  :         : ^          v       |  0                                  |
    beqz    s0, .LBB0_10                                  // |  3  :         v :                  |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  4 ^:          ::                  |  0                                  |
    li  a5, 0                                             // |  4  :          ::              ^   |  0                                  |
    li  a2, 0                                             // |  4  :          ::           ^      |  0                                  |
    ld  a0, 0(a0)                                         // |  4  :          ::         v        |  0                                  |
    addi    a1, s1, 1                                     // |  4  :          v:          ^       |  0                                  |
    addi    a6, sp, 16                                    // |  5  v          ::          :    ^  |  0                                  |
    mv  a3, sp                                            // |  6  v          ::          : ^  :  |  0                                  |
    j   .LBB0_4                                           // |  6  :          ::          : :  :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a2, a4                                            // |  8  :          ::          :^:v :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lbu s0, 0(a1)                                         // |  8  :         ^::          v::  :  |  0                                  |
    addi    a1, a1, 1                                     // |  8  :         :::          ^::  :  |  0                                  |
    mv  a5, s1                                            // |  8  :         :v:           :: ^:  |  0                                  |
    beqz    s0, .LBB0_10                                  // |  7  :         v :           :: ::  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    andi    a4, s0, 255                                   // |  8  :         v :           ::^::  |  0                                  |
    slli    a4, a4, 1                                     // |  7  :           :           ::^::  |  0                                  |
    add a4, a4, a0                                        // |  8  :           :         v ::^::  |  0                                  |
    lbu a4, 1(a4)                                         // |  7  :           :           ::^::  |  0                                  |
    andi    a4, a4, 8                                     // |  7  :           :           ::^::  |  0                                  |
    bnez    a4, .LBB0_7                                   // |  7  :           :           ::v::  |  0                                  |
    li  s1, 0                                             // |  7  :          ^:           :: ::  |  0                                  |
    seqz    a4, a2                                        // |  7  :           :           v:^::  |  0                                  |
    sgtz    s0, a5                                        // |  8  :         ^ :           :::v:  |  0                                  |
    and s0, s0, a4                                        // |  8  :         ^ :           ::v::  |  0                                  |
    li  a4, 1                                             // |  8  :         : :           ::^::  |  0                                  |
    bnez    s0, .LBB0_2                                   // |  7  :         v :           :: ::  |  0                                  |
    mv  a4, a2                                            // |  8  :         : :           v:^::  |  0                                  |
    mv  s1, a5                                            // |  8  :         :^:           :: v:  |  0                                  |
    j   .LBB0_2                                           // |  7  :         : :           :: ::  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addiw   s1, a5, 1                                     // |  8  :         :^:           :: v:  |  0                                  |
    beqz    a2, .LBB0_9                                   // |  7  :         : :           v: ::  |  0                                  |
    add a2, a3, a5                                        // |  7  :         : :           ^v v:  |  0                                  |
    sb  s0, 0(a2)                                         // |  6  :         v :           v  ::  |  0                                  |
    li  a2, 1                                             // |  6  :         : :           ^  ::  |  0                                  |
    j   .LBB0_3                                           // |  5  :         : :              ::  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    add a4, a6, a5                                        // |  6  :         : :             ^vv  |  0                                  |
    sb  s0, 0(a4)                                         // |  4  :         v :             v    |  0                                  |
    j   .LBB0_3                                           // |  2  :           :                  |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    a0, sp, 16                                    // |  3  v           :         ^        |  0                                  |
    li  a2, 10                                            // |  4  :           :         : ^      |  0                                  |
    li  a1, 0                                             // |  4  :           :         :^       |  0                                  |
    call    strtol@plt                                    // |  4 ^:           :         :        |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    mv  a0, sp                                            // |  4  v          ::         ^        |  0                                  |
    li  a2, 10                                            // |  4  :          ::           ^      |  0                                  |
    li  a1, 0                                             // |  4  :          ::          ^       |  0                                  |
    call    strtol@plt                                    // |  4 ^:          ::                  |  0                                  |
    addw    a0, a0, s1                                    // |  4  :          v:         ^        |  0                                  |
    subw    a0, s2, a0                                    // |  3  :           v         ^        |  0                                  |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
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
