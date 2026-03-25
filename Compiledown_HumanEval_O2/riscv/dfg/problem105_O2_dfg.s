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
    mv  s2, a3                                            // |  3  :           ^            v     |  0                                  |
    mv  s3, a2                                            // |  4  :           :^          v      |  0                                  |
    mv  s5, a1                                            // |  5  :           :: ^       v       |  0                                  |
    mv  s4, a0                                            // |  6  :           ::^:      v        |  0                                  |
    slli    a0, a1, 2                                     // |  7  :           ::::      ^v       |  0                                  |
    call    malloc@plt                                    // |  7 ^:           ::::      :        |  0                                  |
    sd  a0, 0(s3)                                         // |  6  :           :v::      v        |  0                                  |
    sw  zero, 0(s2)                                       // |  5  :           v ::      :        |  0                                  |
    blez    s5, .LBB0_17                                  // |  5  :           : :v      :        |  0                                  |
    li  t0, 0                                             // |  6  :  ^        : ::      :        |  0                                  |
    li  a2, 0                                             // |  7  :  :        : ::      : ^      |  0                                  |
    lui a3, 838861                                        // |  7  :  :        : ::      :  ^     |  0                                  |
    addiw   a3, a3, -819                                  // |  7  :  :        : ::      :  ^     |  0                                  |
    slli    a3, a3, 32                                    // |  7  :  :        : ::      :  ^     |  0                                  |
    j   .LBB0_3                                           // |  7  :  :        : ::      :  :     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a2, a2, 1                                     // |  8  :  :        : ::      : ^:     |  0                                  |
    beq a2, s5, .LBB0_8                                   // |  8  :  :        : :v      : v:     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a4, a2, 2                                     // |  8  :  :        : :       : v:^    |  0                                  |
    add a4, a4, s4                                        // |  7  :  :        : v       :  :^    |  0                                  |
    lw  s0, 0(a4)                                         // |  7  :  :      ^ :         :  :v    |  0                                  |
    seqz    a5, s0                                        // |  7  :  :      v :         :  : ^   |  0                                  |
    blez    s0, .LBB0_6                                   // |  6  :  :      v :         :  :     |  0                                  |
    mv  a4, s0                                            // |  7  :  :      v :         :  :^    |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    andi    s1, a4, 1                                     // |  8  :  :      :^:         :  :v    |  0                                  |
    seqz    s1, s1                                        // |  8  :  :      :^:         :  ::    |  0                                  |
    or  a5, a5, s1                                        // |  9  :  :      :v:         :  ::^   |  0                                  |
    slli    s1, a4, 32                                    // |  9  :  :      :^:         :  :v:   |  0                                  |
    mulhu   s1, s1, a3                                    // |  8  :  :      :^:         :  v :   |  0                                  |
    sltiu   a4, a4, 10                                    // |  7  :  :      : :         :   ^:   |  0                                  |
    srli    s1, s1, 35                                    // |  7  :  :      :^:         :    :   |  0                                  |
    xori    a4, a4, 1                                     // |  8  :  :      :::         :   ^:   |  0                                  |
    xori    a1, a5, 1                                     // |  9  :  :      :::         :^  :v   |  0                                  |
    and a1, a1, a4                                        // |  9  :  :      :::         :^  v:   |  0                                  |
    mv  a4, s1                                            // |  9  :  :      :v:         ::  ^:   |  0                                  |
    bnez    a1, .LBB0_5                                   // |  7  :  :      : :         :v   :   |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    andi    a1, a5, 1                                     // |  7  :  :      : :         :^   v   |  0                                  |
    bnez    a1, .LBB0_2                                   // |  6  :  :      : :         :v       |  0                                  |
    slli    a1, t0, 2                                     // |  6  :  v      : :         :^       |  0                                  |
    add a1, a1, a0                                        // |  5  :         : :         v^       |  0                                  |
    sw  s0, 0(a1)                                         // |  5  :         v :         :v       |  0                                  |
    addiw   t0, t0, 1                                     // |  5  :  ^      : :         :        |  0                                  |
    sw  t0, 0(s2)                                         // |  5  :  v      : v         :        |  0                                  |
    j   .LBB0_2                                           // |  4  :  :      :           :        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a2, 2                                             // |  5  :  :      :           : ^      |  0                                  |
    blt t0, a2, .LBB0_17                                  // |  5  :  v      :           : v      |  0                                  |
    li  a2, 0                                             // |  5  :  :      :           : ^      |  0                                  |
    addiw   a7, t0, -1                                    // |  5  :  v      :           :      ^ |  0                                  |
    addi    a6, a0, 4                                     // |  6  :  :      :           v     ^: |  0                                  |
    mv  a5, a7                                            // |  7  :  :      :           :    ^:v |  0                                  |
    j   .LBB0_11                                          // |  6  :  :      :           :     :: |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  7  :  :      :           : ^   :: |  0                                  |
    addiw   a5, a5, -1                                    // |  8  :  :      :           : :  ^:: |  0                                  |
    bge a2, a7, .LBB0_17                                  // |  8  :  :      :           : v  ::v |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    not a1, a2                                            // |  8  :  :      :           :^v  ::  |  0                                  |
    addw    a1, t0, a1                                    // |  7  :  v      :           :^   ::  |  0                                  |
    blez    a1, .LBB0_10                                  // |  6  :         :           :v   ::  |  0                                  |
    lw  a3, 0(a0)                                         // |  6  :         :           v  ^ ::  |  0                                  |
    slli    a1, a5, 32                                    // |  6  :         :            ^ : v:  |  0                                  |
    srli    s1, a1, 32                                    // |  6  :         :^           v :  :  |  0                                  |
    mv  a4, a6                                            // |  5  :         :              :^ v  |  0                                  |
    j   .LBB0_15                                          // |  4  :         :              ::    |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    sw  s0, -4(a4)                                        // |  4  :         v              :v    |  0                                  |
    sw  a3, 0(a4)                                         // |  3  :                        vv    |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    addi    s1, s1, -1                                    // |  3  :          ^             :     |  0                                  |
    addi    a4, a4, 4                                     // |  4  :          :             :^    |  0                                  |
    beqz    s1, .LBB0_10                                  // |  4  :          v             ::    |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    lw  s0, 0(a4)                                         // |  4  :         ^              :v    |  0                                  |
    blt s0, a3, .LBB0_13                                  // |  3  :         v              v     |  0                                  |
    mv  a3, s0                                            // |  3  :         v              ^     |  0                                  |
    j   .LBB0_14                                          // |  1  :                              |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
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
