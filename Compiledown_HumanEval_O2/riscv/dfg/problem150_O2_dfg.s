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
    addi    sp, sp, -96                                   // |  1  ^                              |  0                                  |
    sd  ra, 88(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 80(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 72(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 64(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 56(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 48(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 40(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 32(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 24(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 16(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 8(sp)                                         // |  2  v                  v           |  0                                  |
    sd  s10, 0(sp)                                        // |  2  v                   v          |  0                                  |
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    sw  zero, 0(a2)                                       // |  3  :           :           v      |  0                                  |
    blez    a1, .LBB0_16                                  // |  3  :           :          v       |  0                                  |
    mv  s3, a2                                            // |  4  :           :^          v      |  0                                  |
    mv  s0, a1                                            // |  5  :         ^ ::         v       |  0                                  |
    li  s4, 0                                             // |  4  :           ::^                |  0                                  |
    mv  s1, s2                                            // |  5  :          ^v::                |  0                                  |
    j   .LBB0_3                                           // |  4  :           :::                |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  5  :         ^ :::                |  0                                  |
    addi    s1, s1, 8                                     // |  6  :         :^:::                |  0                                  |
    beqz    s0, .LBB0_5                                   // |  6  :         v::::                |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    ld  s5, 0(s1)                                         // |  6  :          v:::^               |  0                                  |
    mv  a0, s5                                            // |  6  :           :::v      ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:           ::::               |  0                                  |
    andi    a0, a0, 1                                     // |  6  :           ::::      ^        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  6  :           ::::      v        |  0                                  |
    slli    a0, s4, 3                                     // |  6  :           ::v:      ^        |  0                                  |
    add a0, a0, s2                                        // |  5  :           v: :      ^        |  0                                  |
    sd  s5, 0(a0)                                         // |  5  :           :: v      v        |  0                                  |
    addiw   s4, s4, 1                                     // |  4  :           ::^                |  0                                  |
    sw  s4, 0(s3)                                         // |  4  :           :vv                |  0                                  |
    j   .LBB0_2                                           // |  3  :           : :                |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a0, 2                                             // |  4  :           : :       ^        |  0                                  |
    blt s4, a0, .LBB0_17                                  // |  4  :           : v       v        |  0                                  |
    li  s5, 0                                             // |  4  :           : :^               |  0                                  |
    addiw   s6, s4, -1                                    // |  4  :           : v ^              |  0                                  |
    addi    s7, s2, 8                                     // |  5  :           v : :^             |  0                                  |
    mv  s8, s6                                            // |  6  :           : : v:^            |  0                                  |
    j   .LBB0_8                                           // |  5  :           : : ::             |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addiw   s5, s5, 1                                     // |  6  :           : :^::             |  0                                  |
    addiw   s8, s8, -1                                    // |  7  :           : ::::^            |  0                                  |
    bge s5, s6, .LBB0_17                                  // |  7  :           : :vv::            |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    not a0, s5                                            // |  7  :           : :v ::   ^        |  0                                  |
    addw    a0, s4, a0                                    // |  6  :           : v  ::   ^        |  0                                  |
    blez    a0, .LBB0_7                                   // |  5  :           :    ::   v        |  0                                  |
    ld  s3, 0(s2)                                         // |  5  :           v^   ::            |  0                                  |
    slli    a0, s8, 32                                    // |  6  :           ::   :v   ^        |  0                                  |
    srli    s0, a0, 32                                    // |  6  :         ^ ::   :    v        |  0                                  |
    mv  s1, s7                                            // |  5  :          ^::   v             |  0                                  |
    j   .LBB0_12                                          // |  4  :          :::                 |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    sd  s9, -8(s1)                                        // |  5  :          v::     v           |  0                                  |
    sd  s3, 0(s1)                                         // |  4  :          v:v                 |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    addi    s0, s0, -1                                    // |  4  :         ^ ::                 |  0                                  |
    addi    s1, s1, 8                                     // |  5  :         :^::                 |  0                                  |
    beqz    s0, .LBB0_7                                   // |  5  :         v:::                 |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  5  :          ::v        ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:          :::        :        |  0                                  |
    ld  s9, 0(s1)                                         // |  6  :          v::     ^  :        |  0                                  |
    mv  s10, a0                                           // |  6  :           ::     :^ v        |  0                                  |
    mv  a0, s9                                            // |  6  :           ::     v: ^        |  0                                  |
    call    strlen@plt                                    // |  7 ^:           ::     :: :        |  0                                  |
    bltu    a0, s10, .LBB0_10                             // |  6  :           ::     :v v        |  0                                  |
    bne s10, a0, .LBB0_15                                 // |  6  :           ::     :v v        |  0                                  |
    mv  a0, s3                                            // |  5  :           :v     :  ^        |  0                                  |
    mv  a1, s9                                            // |  5  :           :      v  :^       |  0                                  |
    call    strcmp@plt                                    // |  5 ^:           :      :  :        |  0                                  |
    bgtz    a0, .LBB0_10                                  // |  4  :           :      :  v        |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    mv  s3, s9                                            // |  4  :           :^     v           |  0                                  |
    j   .LBB0_11                                          // |  2  :           :                  |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    li  s4, 0                                             // |  3  :           : ^                |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    slli    s0, s4, 3                                     // |  4  :         ^ : v                |  0                                  |
    mv  a0, s0                                            // |  5  :         v : :       ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         : : :       :        |  0                                  |
    mv  s1, a0                                            // |  6  :         :^: :       v        |  0                                  |
    blez    s4, .LBB0_19                                  // |  5  :         ::: v                |  0                                  |
    mv  a0, s1                                            // |  5  :         :v:         ^        |  0                                  |
    mv  a1, s2                                            // |  5  :         ::v          ^       |  0                                  |
    mv  a2, s0                                            // |  4  :         v:            ^      |  0                                  |
    call    memcpy@plt                                    // |  3 ^:          :                   |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  3  :          v          ^        |  0                                  |
    ld  ra, 88(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 80(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 72(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 64(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 56(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 48(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 40(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 32(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 24(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 16(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 8(sp)                                         // |  3 :v                  ^           |  0                                  |
    ld  s10, 0(sp)                                        // |  3 :v                   ^          |  0                                  |
    addi    sp, sp, 96                                    // |  2 :^                              |  0                                  |
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
