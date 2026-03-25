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
    mv  s5, a2                                            // |  3  :              ^        v      |  0                                  |
    mv  a2, a1                                            // |  4  :              :       v^      |  0                                  |
    li  s2, 1                                             // |  4  :           ^  :        :      |  0                                  |
    sw  s2, 0(s5)                                         // |  4  :           v  v        :      |  0                                  |
    sw  s2, 0(a1)                                         // |  5  :           v  :       v:      |  0                                  |
    beq a0, s2, .LBB0_7                                   // |  5  :           v  :      v :      |  0                                  |
    mv  s1, a0                                            // |  6  :          ^:  :      v :      |  0                                  |
    li  s3, 10                                            // |  6  :          ::^ :        :      |  0                                  |
    lui a0, 524288                                        // |  7  :          ::: :      ^ :      |  0                                  |
    addiw   s4, a0, 1                                     // |  8  :          :::^:      v :      |  0                                  |
    j   .LBB0_3                                           // |  7  :          :::::        :      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    srliw   a0, s1, 31                                    // |  8  :          v::::      ^ :      |  0                                  |
    addw    a0, a0, s1                                    // |  8  :          v::::      ^ :      |  0                                  |
    sraiw   s1, a0, 1                                     // |  8  :          ^::::      v :      |  0                                  |
    beq s1, s2, .LBB0_7                                   // |  7  :          vv:::        :      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    and a0, s1, s4                                        // |  8  :          v::v:      ^ :      |  0                                  |
    sext.w  a0, a0                                        // |  7  :          ::: :      ^ :      |  0                                  |
    bne a0, s2, .LBB0_2                                   // |  7  :          :v: :      v :      |  0                                  |
    lw  a1, 0(s5)                                         // |  7  :          ::: v       ^:      |  0                                  |
    blt a1, s3, .LBB0_6                                   // |  7  :          ::v :       v:      |  0                                  |
    slliw   s3, s3, 1                                     // |  6  :          ::^ :        :      |  0                                  |
    slli    a1, s3, 2                                     // |  7  :          ::v :       ^:      |  0                                  |
    mv  a0, a2                                            // |  6  :          ::  :      ^ v      |  0                                  |
    call    realloc@plt                                   // |  6 ^:          ::  :      :        |  0                                  |
    lw  a1, 0(s5)                                         // |  6  :          ::  v      :^       |  0                                  |
    mv  a2, a0                                            // |  7  :          ::  :      v:^      |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addiw   a0, a1, 1                                     // |  7  :          ::  :      ^v:      |  0                                  |
    sw  a0, 0(s5)                                         // |  7  :          ::  v      v::      |  0                                  |
    slli    a0, a1, 2                                     // |  7  :          ::  :      ^v:      |  0                                  |
    add a0, a0, a2                                        // |  6  :          ::  :      ^ v      |  0                                  |
    sw  s1, 0(a0)                                         // |  6  :          v:  :      v :      |  0                                  |
    slliw   a0, s1, 1                                     // |  6  :          v:  :      ^ :      |  0                                  |
    addw    a0, a0, s1                                    // |  6  :          v:  :      ^ :      |  0                                  |
    addiw   s1, a0, 1                                     // |  6  :          ^:  :      v :      |  0                                  |
    bne s1, s2, .LBB0_3                                   // |  5  :          vv  :        :      |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lw  a0, 0(s5)                                         // |  5  :          :   v      ^ :      |  0                                  |
    li  a1, 2                                             // |  6  :          :   :      :^:      |  0                                  |
    blt a0, a1, .LBB0_15                                  // |  6  :          :   :      vv:      |  0                                  |
    li  a6, 0                                             // |  5  :          :   :        :   ^  |  0                                  |
    li  a0, -1                                            // |  5  :          :   :      ^ :      |  0                                  |
    srli    a1, a0, 32                                    // |  6  :          :   :      v^:      |  0                                  |
    addi    a7, a2, 4                                     // |  6  :          :   :       :v    ^ |  0                                  |
    li  a4, 1                                             // |  6  :          :   :       :: ^    |  0                                  |
    li  a5, 1                                             // |  7  :          :   :       :: :^   |  0                                  |
    j   .LBB0_11                                          // |  6  :          :   :       :: :    |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    addiw   a0, a0, 1                                     // |  7  :          :   :      ^:: :    |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    slli    a0, a0, 2                                     // |  7  :          :   :      ^:: :    |  0                                  |
    add a0, a0, a2                                        // |  7  :          :   :      ^:v :    |  0                                  |
    sw  s1, 0(a0)                                         // |  7  :          v   :      v:: :    |  0                                  |
    lw  a0, 0(s5)                                         // |  6  :              v      ^:: :    |  0                                  |
    addi    a5, a5, 1                                     // |  6  :                     ::: :^   |  0                                  |
    addi    a6, a6, 1                                     // |  7  :                     ::: ::^  |  0                                  |
    addi    a7, a7, 4                                     // |  8  :                     ::: :::^ |  0                                  |
    bge a5, a0, .LBB0_15                                  // |  8  :                     v:: :v:: |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    slli    a0, a5, 2                                     // |  8  :                     ^:: :v:: |  0                                  |
    add a0, a0, a2                                        // |  7  :                     ^:v : :: |  0                                  |
    lw  s1, 0(a0)                                         // |  8  :          ^          v:: : :: |  0                                  |
    mv  a3, a7                                            // |  8  :          :           ::^: :v |  0                                  |
    mv  a0, a6                                            // |  8  :          :          ^:::: v  |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    add s0, a1, a0                                        // |  8  :         ^:          vv:::    |  0                                  |
    addi    s0, s0, 1                                     // |  8  :         ^:          :::::    |  0                                  |
    and s0, s0, a1                                        // |  8  :         ^:          :v:::    |  0                                  |
    slli    s0, s0, 2                                     // |  7  :         ^:          : :::    |  0                                  |
    add s0, s0, a2                                        // |  7  :         ^:          : v::    |  0                                  |
    lw  s0, 0(s0)                                         // |  6  :         v:          :  ::    |  0                                  |
    bge s1, s0, .LBB0_9                                   // |  6  :         vv          :  ::    |  0                                  |
    sw  s0, 0(a3)                                         // |  5  :         v           :  v:    |  0                                  |
    addi    s0, a0, 1                                     // |  4  :         ^           v   :    |  0                                  |
    addi    a0, a0, -1                                    // |  4  :         :           ^   :    |  0                                  |
    addi    a3, a3, -4                                    // |  4  :         :              ^:    |  0                                  |
    blt a4, s0, .LBB0_12                                  // |  3  :         v               v    |  0                                  |
    li  a0, 0                                             // |  2  :                     ^        |  0                                  |
    j   .LBB0_10                                          // |  1  :                              |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
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
