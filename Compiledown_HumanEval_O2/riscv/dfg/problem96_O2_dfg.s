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
    beqz    a1, .LBB0_13                                  // |  2  :                      v       |  0                                  |
    mv  s4, a1                                            // |  3  :             ^        v       |  0                                  |
    li  s3, 1                                             // |  3  :            ^:                |  0                                  |
    blez    a1, .LBB0_14                                  // |  3  :             :        v       |  0                                  |
    mv  s2, a0                                            // |  4  :           ^ :       v        |  0                                  |
    li  s6, 0                                             // |  4  :           : : ^              |  0                                  |
    li  s7, 0                                             // |  4  :           : :  ^             |  0                                  |
    li  s0, 0                                             // |  4  :         ^ : :                |  0                                  |
    li  s5, 2                                             // |  5  :         : : :^               |  0                                  |
    j   .LBB0_4                                           // |  5  :         : : ::               |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    s6, s6, 1                                     // |  6  :         : : ::^              |  0                                  |
    beq s6, s4, .LBB0_14                                  // |  6  :         : : v:v              |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a0, s6, 4                                     // |  6  :         : :  :v     ^        |  0                                  |
    add a0, a0, s2                                        // |  5  :         : v  :      ^        |  0                                  |
    ld  s8, 0(a0)                                         // |  5  :         :    :  ^   v        |  0                                  |
    lbu s1, 0(s8)                                         // |  6  :         :^   :  v   :        |  0                                  |
    beqz    s1, .LBB0_3                                   // |  6  :         :v   :  :   :        |  0                                  |
    call    __ctype_b_loc@plt                             // |  7 ^:         ::   :  :   :        |  0                                  |
    ld  a0, 0(a0)                                         // |  6  :         ::   :  :   v        |  0                                  |
    addi    a1, s8, 1                                     // |  7  :         ::   :  v   :^       |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    andi    a2, s1, 255                                   // |  7  :         :v   :      ::^      |  0                                  |
    slli    a2, a2, 1                                     // |  6  :         :    :      ::^      |  0                                  |
    add a2, a2, a0                                        // |  6  :         :    :      v:^      |  0                                  |
    lhu a2, 0(a2)                                         // |  5  :         :    :       :^      |  0                                  |
    andi    a3, a2, 1024                                  // |  6  :         :    :       :v^     |  0                                  |
    beqz    a3, .LBB0_13                                  // |  6  :         :    :       ::v     |  0                                  |
    andi    a3, a2, 256                                   // |  6  :         :    :       :v^     |  0                                  |
    beqz    a3, .LBB0_10                                  // |  5  :         :    :       : v     |  0                                  |
    li  s7, 1                                             // |  5  :         :    : ^     :       |  0                                  |
    andi    a2, a2, 512                                   // |  6  :         :    : :     :^      |  0                                  |
    bnez    a2, .LBB0_11                                  // |  6  :         :    : :     :v      |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    addw    a2, s7, s0                                    // |  6  :         v    : v     :^      |  0                                  |
    bne a2, s5, .LBB0_12                                  // |  5  :              v :     :v      |  0                                  |
    j   .LBB0_13                                          // |  4  :              : :     :       |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    andi    a2, a2, 512                                   // |  5  :              : :     :^      |  0                                  |
    beqz    a2, .LBB0_9                                   // |  5  :              : :     :v      |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  s0, 1                                             // |  5  :         ^    : :     :       |  0                                  |
    addw    a2, s7, s0                                    // |  6  :         v    : v     :^      |  0                                  |
    beq a2, s5, .LBB0_13                                  // |  4  :              v       :v      |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    lbu s1, 0(a1)                                         // |  3  :          ^           v       |  0                                  |
    addi    a1, a1, 1                                     // |  3  :          :           ^       |  0                                  |
    bnez    s1, .LBB0_6                                   // |  2  :          v                   |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    li  s3, 0                                             // |  2  :            ^                 |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  3  :            v        ^        |  0                                  |
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
