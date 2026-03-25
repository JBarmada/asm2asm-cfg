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
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    li  a0, 8                                             // |  3  :           :         ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:           :         :        |  0                                  |
    sw  zero, 0(a0)                                       // |  3  :           :         v        |  0                                  |
    sw  zero, 4(a0)                                       // |  3  :           :         v        |  0                                  |
    blez    s2, .LBB0_9                                   // |  3  :           v         :        |  0                                  |
    li  a6, 0                                             // |  4  :           :         :     ^  |  0                                  |
    li  a7, 0                                             // |  4  :           :         :      ^ |  0                                  |
    li  a1, 1                                             // |  4  :           :         :^       |  0                                  |
    li  a3, 10                                            // |  4  :           :         :  ^     |  0                                  |
    lui a2, 419430                                        // |  5  :           :         : ^:     |  0                                  |
    addiw   a4, a2, 1639                                  // |  6  :           :         : v:^    |  0                                  |
    li  t1, 18                                            // |  6  :   ^       :         :  ::    |  0                                  |
    j   .LBB0_4                                           // |  6  :   :       :         :  ::    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   a7, a7, 1                                     // |  7  :   :       :         :  ::  ^ |  0                                  |
    sw  a7, 4(a0)                                         // |  7  :   :       :         v  ::  v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addiw   a1, t0, 1                                     // |  8  :  v:       :         :^ ::    |  0                                  |
    bge t0, s2, .LBB0_9                                   // |  8  :  v:       v         :: ::    |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  s0, 0                                             // |  7  :   :     ^           :: ::    |  0                                  |
    mv  t0, a1                                            // |  7  :  ^:                 :v ::    |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mulw    s0, s0, a3                                    // |  8  :  ::     ^           :: v:    |  0                                  |
    mul s1, a1, a4                                        // |  8  :  ::      ^          :v :v    |  0                                  |
    srli    a2, s1, 63                                    // |  8  :  ::      v          ::^:     |  0                                  |
    srai    s1, s1, 34                                    // |  7  :  ::      ^          :: :     |  0                                  |
    addw    a2, a2, s1                                    // |  8  :  ::      v          ::^:     |  0                                  |
    mulw    s1, a2, a3                                    // |  8  :  ::      ^          ::vv     |  0                                  |
    subw    s1, a1, s1                                    // |  7  :  ::      ^          :v:      |  0                                  |
    addiw   a5, a1, 9                                     // |  8  :  ::      :          :v:  ^   |  0                                  |
    addw    s0, s0, s1                                    // |  8  :  ::     ^v          : :  :   |  0                                  |
    mv  a1, a2                                            // |  8  :  ::     :           :^v  :   |  0                                  |
    bltu    t1, a5, .LBB0_5                               // |  6  :  :v     :           :    v   |  0                                  |
    bne t0, s0, .LBB0_3                                   // |  4  :  v      v           :        |  0                                  |
    andi    a1, t0, 1                                     // |  4  :  v                  :^       |  0                                  |
    bnez    a1, .LBB0_2                                   // |  3  :                     :v       |  0                                  |
    addiw   a6, a6, 1                                     // |  3  :                     :     ^  |  0                                  |
    sw  a6, 0(a0)                                         // |  3  :                     v     v  |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
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
