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
    addi    sp, sp, -48                                   // |  1  ^                              |  0                                  |
    sd  ra, 40(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 32(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 24(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 16(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 8(sp)                                         // |  2  v            v                 |  0                                  |
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    mv  s1, a1                                            // |  4  :          ^:          v       |  0                                  |
    mv  s3, a0                                            // |  5  :          ::^        v        |  0                                  |
    slli    a0, a1, 2                                     // |  6  :          :::        ^v       |  0                                  |
    call    malloc@plt                                    // |  6 ^:          :::        :        |  0                                  |
    blez    s1, .LBB0_16                                  // |  5  :          v::        :        |  0                                  |
    li  a2, 0                                             // |  6  :          :::        : ^      |  0                                  |
    li  t0, 0                                             // |  6  :  ^       :::        :        |  0                                  |
    j   .LBB0_4                                           // |  6  :  :       :::        :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    slli    a1, t0, 2                                     // |  7  :  v       :::        :^       |  0                                  |
    addiw   t0, t0, 1                                     // |  6  :  ^       :::        :        |  0                                  |
    add a1, a1, a0                                        // |  7  :  :       :::        v^       |  0                                  |
    sw  a3, 0(a1)                                         // |  8  :  :       :::        :v v     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a2, a2, 1                                     // |  7  :  :       :::        : ^      |  0                                  |
    beq a2, s1, .LBB0_8                                   // |  7  :  :       v::        : v      |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    a1, a2, 2                                     // |  7  :  :        ::        :^v      |  0                                  |
    add a1, a1, s3                                        // |  6  :  :        :v        :^       |  0                                  |
    lw  a3, 0(a1)                                         // |  6  :  :        :         :v ^     |  0                                  |
    blez    t0, .LBB0_2                                   // |  5  :  v        :         :  :     |  0                                  |
    mv  a1, t0                                            // |  6  :  v        :         :^ :     |  0                                  |
    mv  a4, a0                                            // |  6  :  :        :         v  :^    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lw  a5, 0(a4)                                         // |  7  :  :        :         :  :v^   |  0                                  |
    beq a3, a5, .LBB0_3                                   // |  6  :  :        :         :  v v   |  0                                  |
    addi    a1, a1, -1                                    // |  5  :  :        :         :^       |  0                                  |
    addi    a4, a4, 4                                     // |  6  :  :        :         ::  ^    |  0                                  |
    bnez    a1, .LBB0_6                                   // |  5  :  :        :         :v       |  0                                  |
    j   .LBB0_2                                           // |  4  :  :        :         :        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a1, 2                                             // |  5  :  :        :         :^       |  0                                  |
    blt t0, a1, .LBB0_17                                  // |  5  :  v        :         :v       |  0                                  |
    li  a7, 0                                             // |  5  :  :        :         :      ^ |  0                                  |
    addiw   a1, t0, -1                                    // |  6  :  v        :         :^     : |  0                                  |
    slli    a1, a1, 32                                    // |  6  :  :        :         :^     : |  0                                  |
    srli    a6, a1, 32                                    // |  7  :  :        :         :v    ^: |  0                                  |
    addi    a2, a0, 4                                     // |  7  :  :        :         v ^   :: |  0                                  |
    li  a5, 1                                             // |  7  :  :        :         :    ^:: |  0                                  |
    j   .LBB0_11                                          // |  6  :  :        :         :     :: |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    a5, a5, 1                                     // |  7  :  :        :         :    ^:: |  0                                  |
    addi    a2, a2, 4                                     // |  8  :  :        :         : ^  ::: |  0                                  |
    beq a7, a6, .LBB0_17                                  // |  8  :  :        :         : :  :vv |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    mv  a1, a7                                            // |  8  :  :        :         :^:  : v |  0                                  |
    addi    a7, a7, 1                                     // |  7  :  :        :         : :  : ^ |  0                                  |
    bgeu    a7, t0, .LBB0_10                              // |  7  :  v        :         : :  : v |  0                                  |
    slli    a1, a1, 2                                     // |  7  :  :        :         :^:  :   |  0                                  |
    add s1, a0, a1                                        // |  8  :  :       ^:         vv:  :   |  0                                  |
    mv  a1, t0                                            // |  7  :  v       ::          ^:  :   |  0                                  |
    mv  a3, a2                                            // |  6  :          ::           v^ :   |  0                                  |
    j   .LBB0_14                                          // |  4  :          ::              :   |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    addi    a1, a1, -1                                    // |  5  :          ::          ^   :   |  0                                  |
    addi    a3, a3, 4                                     // |  6  :          ::          : ^ :   |  0                                  |
    beq a5, a1, .LBB0_10                                  // |  6  :          ::          v : v   |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    lw  a4, 0(s1)                                         // |  5  :          v:            :^    |  0                                  |
    lw  s0, 0(a3)                                         // |  6  :         ^::            v:    |  0                                  |
    bge s0, a4, .LBB0_13                                  // |  6  :         v::            :v    |  0                                  |
    sw  s0, 0(s1)                                         // |  6  :         vv:            ::    |  0                                  |
    sw  a4, 0(a3)                                         // |  4  :           :            vv    |  0                                  |
    j   .LBB0_13                                          // |  2  :           :                  |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    li  t0, 0                                             // |  3  :  ^        :                  |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    sw  t0, 0(s2)                                         // |  3  :  v        v                  |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
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
