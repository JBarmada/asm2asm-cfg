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
    addi    sp, sp, -1104                                 // |  1  ^                              |  0                                  |
    sd  ra, 1096(sp)                                      // |  2 vv                              |  0                                  |
    sd  s0, 1088(sp)                                      // |  2  v         v                    |  0                                  |
    sd  s1, 1080(sp)                                      // |  2  v          v                   |  0                                  |
    sd  s2, 1072(sp)                                      // |  2  v           v                  |  0                                  |
    sd  s3, 1064(sp)                                      // |  2  v            v                 |  0                                  |
    sd  s4, 1056(sp)                                      // |  2  v             v                |  0                                  |
    sd  s5, 1048(sp)                                      // |  2  v              v               |  0                                  |
    sd  s6, 1040(sp)                                      // |  2  v               v              |  0                                  |
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    addi    a0, sp, 16                                    // |  3  v           :         ^        |  0                                  |
    li  a2, 1024                                          // |  4  :           :         : ^      |  0                                  |
    addi    s3, sp, 16                                    // |  4  v           :^        :        |  0                                  |
    li  a1, 0                                             // |  5  :           ::        :^       |  0                                  |
    call    memset@plt                                    // |  5 ^:           ::        :        |  0                                  |
    lbu s1, 0(s2)                                         // |  5  :          ^v:        :        |  0                                  |
    beqz    s1, .LBB0_6                                   // |  5  :          v::        :        |  0                                  |
    call    __ctype_tolower_loc@plt                       // |  5 ^:           ::        :        |  0                                  |
    ld  s5, 0(a0)                                         // |  5  :           :: ^      v        |  0                                  |
    li  s4, 0                                             // |  5  :           ::^:               |  0                                  |
    addi    s0, s2, 1                                     // |  5  :         ^ v: :               |  0                                  |
    li  s2, 1                                             // |  5  :         : ^: :               |  0                                  |
    j   .LBB0_3                                           // |  5  :         : :: :               |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu s1, 0(s0)                                         // |  6  :         v^:: :               |  0                                  |
    addi    s0, s0, 1                                     // |  6  :         ^::: :               |  0                                  |
    beqz    s1, .LBB0_7                                   // |  5  :          v:: :               |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    andi    a0, s1, 255                                   // |  6  :          v:: :      ^        |  0                                  |
    slli    a0, a0, 2                                     // |  5  :           :: :      ^        |  0                                  |
    add a0, a0, s5                                        // |  5  :           :: v      ^        |  0                                  |
    lbu s1, 0(a0)                                         // |  5  :          ^::        v        |  0                                  |
    slli    a0, s1, 2                                     // |  5  :          v::        ^        |  0                                  |
    add s6, s3, a0                                        // |  6  :          ::v  ^     v        |  0                                  |
    lw  a0, 0(s6)                                         // |  5  :          ::   v     ^        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  5  :          ::   :     v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  6 ^:          ::   :     :        |  0                                  |
    ld  a0, 0(a0)                                         // |  5  :          ::   :     v        |  0                                  |
    slli    a1, s1, 1                                     // |  5  :          v:   :      ^       |  0                                  |
    add a0, a0, a1                                        // |  5  :           :   :     ^v       |  0                                  |
    lbu a0, 1(a0)                                         // |  4  :           :   :     ^        |  0                                  |
    andi    a0, a0, 4                                     // |  4  :           :   :     ^        |  0                                  |
    beqz    a0, .LBB0_2                                   // |  4  :           :   :     v        |  0                                  |
    sw  s2, 0(s6)                                         // |  3  :           v   v              |  0                                  |
    addiw   s4, s4, 1                                     // |  2  :             ^                |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  s4, 0                                             // |  2  :             ^                |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, s4                                            // |  3  :             v       ^        |  0                                  |
    ld  ra, 1096(sp)                                      // |  2 ^v                              |  0                                  |
    ld  s0, 1088(sp)                                      // |  3 :v         ^                    |  0                                  |
    ld  s1, 1080(sp)                                      // |  3 :v          ^                   |  0                                  |
    ld  s2, 1072(sp)                                      // |  3 :v           ^                  |  0                                  |
    ld  s3, 1064(sp)                                      // |  3 :v            ^                 |  0                                  |
    ld  s4, 1056(sp)                                      // |  3 :v             ^                |  0                                  |
    ld  s5, 1048(sp)                                      // |  3 :v              ^               |  0                                  |
    ld  s6, 1040(sp)                                      // |  3 :v               ^              |  0                                  |
    addi    sp, sp, 1104                                  // |  2 :^                              |  0                                  |
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
