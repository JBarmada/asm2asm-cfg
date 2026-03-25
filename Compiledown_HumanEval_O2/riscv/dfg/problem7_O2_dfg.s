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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    li  a2, 0                                             // |  3  :           :           ^      |  0                                  |
    li  s6, 0                                             // |  4  :           :   ^       :      |  0                                  |
    li  s3, 0                                             // |  5  :           :^  :       :      |  0                                  |
    li  a0, 0                                             // |  6  :           ::  :     ^ :      |  0                                  |
    li  s5, 40                                            // |  7  :           :: ^:     : :      |  0                                  |
    li  s4, 41                                            // |  8  :           ::^::     : :      |  0                                  |
    j   .LBB0_3                                           // |  8  :           :::::     : :      |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    addiw   a1, a2, -1                                    // |  9  :           :::::     :^v      |  0                                  |
    beqz    a1, .LBB0_9                                   // |  8  :           :::::     :v       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s1, s1, 1                                     // |  9  :          ^:::::     ::       |  0                                  |
    mv  a2, a1                                            // | 10  :          ::::::     :v^      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lbu a1, 0(s1)                                         // | 10  :          v:::::     :^:      |  0                                  |
    beq a1, s5, .LBB0_7                                   // |  9  :           :::v:     :v:      |  0                                  |
    beq a1, s4, .LBB0_1                                   // |  8  :           ::v :     :v:      |  0                                  |
    beqz    a1, .LBB0_10                                  // |  7  :           ::  :     :v:      |  0                                  |
    mv  a1, a2                                            // |  7  :           ::  :     :^v      |  0                                  |
    j   .LBB0_2                                           // |  6  :           ::  :     : :      |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addiw   a1, a2, 1                                     // |  7  :           ::  :     :^v      |  0                                  |
    blt a2, s6, .LBB0_2                                   // |  7  :           ::  v     ::v      |  0                                  |
    mv  s6, a1                                            // |  6  :           ::  ^     :v       |  0                                  |
    j   .LBB0_2                                           // |  5  :           ::  :     :        |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    addiw   s0, s3, 1                                     // |  6  :         ^ :v  :     :        |  0                                  |
    slli    a1, s0, 2                                     // |  7  :         v ::  :     :^       |  0                                  |
    call    realloc@plt                                   // |  7 ^:         : ::  :     :        |  0                                  |
    li  a1, 0                                             // |  7  :         : ::  :     :^       |  0                                  |
    slli    a2, s3, 2                                     // |  7  :         : :v  :     : ^      |  0                                  |
    add a2, a2, a0                                        // |  6  :         : :   :     v ^      |  0                                  |
    sw  s6, 0(a2)                                         // |  5  :         : :   v       v      |  0                                  |
    mv  s3, s0                                            // |  4  :         v :^                 |  0                                  |
    li  s6, 0                                             // |  4  :           ::  ^              |  0                                  |
    j   .LBB0_2                                           // |  3  :           ::                 |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    sw  s3, 0(s2)                                         // |  3  :           vv                 |  0                                  |
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
