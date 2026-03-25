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
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    mv  s7, a1                                            // |  4  :           :    ^     v       |  0                                  |
    mv  s6, a0                                            // |  5  :           :   ^:    v        |  0                                  |
    slli    a0, a1, 2                                     // |  6  :           :   ::    ^v       |  0                                  |
    call    malloc@plt                                    // |  6 ^:           :   ::    :        |  0                                  |
    mv  s3, a0                                            // |  6  :           :^  ::    v        |  0                                  |
    li  a1, 4                                             // |  6  :           ::  ::     ^       |  0                                  |
    mv  a0, s7                                            // |  6  :           ::  :v    ^        |  0                                  |
    call    calloc@plt                                    // |  7 ^:           ::  ::    :        |  0                                  |
    mv  s4, a0                                            // |  7  :           ::^ ::    v        |  0                                  |
    li  a1, 4                                             // |  7  :           ::: ::     ^       |  0                                  |
    mv  a0, s7                                            // |  7  :           ::: :v    ^        |  0                                  |
    call    calloc@plt                                    // |  8 ^:           ::: ::    :        |  0                                  |
    mv  s5, a0                                            // |  8  :           :::^::    v        |  0                                  |
    li  a1, 0                                             // |  8  :           ::::::     ^       |  0                                  |
    blez    s7, .LBB0_22                                  // |  7  :           :::::v             |  0                                  |
    li  s1, 0                                             // |  8  :          ^::::::             |  0                                  |
    li  a0, 0                                             // |  9  :          :::::::    ^        |  0                                  |
    j   .LBB0_5                                           // |  9  :          :::::::    :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   a2, s1, 1                                     // | 10  :          v::::::    : ^      |  0                                  |
    mv  a4, s1                                            // | 11  :          v::::::    : : ^    |  0                                  |
    mv  a5, s4                                            // | 11  :           ::v:::    : : :^   |  0                                  |
    mv  s1, a2                                            // | 12  :          ^::::::    : v ::   |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a2, a4, 2                                     // | 12  :          :::::::    : ^ v:   |  0                                  |
    add a2, a2, a5                                        // | 11  :          :::::::    : ^  v   |  0                                  |
    sw  a3, 0(a2)                                         // | 11  :          :::::::    : vv     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addi    a1, a1, 1                                     // | 10  :          :::::::    :^       |  0                                  |
    beq a1, s7, .LBB0_14                                  // | 10  :          ::::::v    :v       |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    slli    a3, a1, 2                                     // | 11  :          :::::::    :v ^     |  0                                  |
    add a3, a3, s6                                        // | 10  :          :::::v:    :  ^     |  0                                  |
    lw  a3, 0(a3)                                         // | 10  :          :::::::    :  v     |  0                                  |
    blez    a0, .LBB0_9                                   // | 10  :          :::::::    v  :     |  0                                  |
    mv  a4, a0                                            // | 11  :          :::::::    v  :^    |  0                                  |
    mv  a5, s5                                            // | 11  :          ::::v::    :  : ^   |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lw  s0, 0(a5)                                         // | 12  :         ^:::::::    :  : v   |  0                                  |
    beq s0, a3, .LBB0_4                                   // | 11  :         v:::::::    :  v     |  0                                  |
    addi    a4, a4, -1                                    // | 11  :          :::::::    :  :^    |  0                                  |
    addi    a5, a5, 4                                     // | 12  :          :::::::    :  ::^   |  0                                  |
    bnez    a4, .LBB0_7                                   // | 11  :          :::::::    :  :v    |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    blez    s1, .LBB0_2                                   // | 10  :          v::::::    :  :     |  0                                  |
    mv  a4, s1                                            // | 11  :          v::::::    :  :^    |  0                                  |
    mv  a5, s4                                            // | 10  :           ::v:::    :  : ^   |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    lw  s0, 0(a5)                                         // | 11  :         ^ ::::::    :  : v   |  0                                  |
    beq s0, a3, .LBB0_13                                  // | 10  :         v ::::::    :  v     |  0                                  |
    addi    a4, a4, -1                                    // |  9  :           ::::::    :   ^    |  0                                  |
    addi    a5, a5, 4                                     // | 10  :           ::::::    :   :^   |  0                                  |
    bnez    a4, .LBB0_11                                  // |  9  :           ::::::    :   v    |  0                                  |
    j   .LBB0_2                                           // |  8  :           ::::::    :        |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    addiw   s0, a0, 1                                     // |  9  :         ^ ::::::    v        |  0                                  |
    mv  a4, a0                                            // | 10  :         : ::::::    v   ^    |  0                                  |
    mv  a5, s5                                            // | 10  :         : :::v::        :^   |  0                                  |
    mv  a0, s0                                            // | 10  :         v ::::::    ^   :    |  0                                  |
    j   .LBB0_3                                           // |  9  :           ::::::    :   :    |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    blez    s7, .LBB0_21                                  // |  9  :           :::::v    :   :    |  0                                  |
    li  a2, 0                                             // | 10  :           ::::::    : ^ :    |  0                                  |
    li  a1, 0                                             // | 10  :           ::::::    :^  :    |  0                                  |
    slli    a3, a0, 32                                    // | 11  :           ::::::    v: ^:    |  0                                  |
    srli    a3, a3, 32                                    // | 11  :           ::::::    :: ^:    |  0                                  |
    j   .LBB0_18                                          // | 11  :           ::::::    :: ::    |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    slli    a5, a1, 2                                     // | 12  :           ::::::    :v ::^   |  0                                  |
    addiw   a1, a1, 1                                     // | 11  :           ::::::    :^ ::    |  0                                  |
    add a5, a5, s3                                        // | 11  :           :v::::    :  ::^   |  0                                  |
    sw  a4, 0(a5)                                         // | 11  :           ::::::    :  :vv   |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    addi    a2, a2, 1                                     // | 10  :           ::::::    : ^:     |  0                                  |
    beq a2, s7, .LBB0_22                                  // | 10  :           :::::v    : v:     |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    slli    a4, a2, 2                                     // | 10  :           :::::     : v:^    |  0                                  |
    add a4, a4, s6                                        // |  9  :           ::::v     :  :^    |  0                                  |
    lw  a4, 0(a4)                                         // |  8  :           ::::      :  :v    |  0                                  |
    mv  a5, a3                                            // |  9  :           ::::      :  v:^   |  0                                  |
    mv  s0, s5                                            // |  8  :         ^ :::v      :   :    |  0                                  |
    blez    a0, .LBB0_16                                  // |  8  :         : ::::      v   :    |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    lw  s1, 0(s0)                                         // |  8  :         v^::::          :    |  0                                  |
    beq s1, a4, .LBB0_17                                  // |  7  :          v::::          v    |  0                                  |
    addi    a5, a5, -1                                    // |  6  :           ::::           ^   |  0                                  |
    addi    s0, s0, 4                                     // |  7  :         ^ ::::           :   |  0                                  |
    bnez    a5, .LBB0_19                                  // |  6  :           ::::           v   |  0                                  |
    j   .LBB0_16                                          // |  5  :           ::::               |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    li  a1, 0                                             // |  6  :           ::::       ^       |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    sw  a1, 0(s2)                                         // |  6  :           v:::       v       |  0                                  |
    mv  a0, s4                                            // |  5  :            :v:      ^        |  0                                  |
    call    free@plt                                      // |  4 ^:            : :               |  0                                  |
    mv  a0, s5                                            // |  4  :            : v      ^        |  0                                  |
    call    free@plt                                      // |  3 ^:            :                 |  0                                  |
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
