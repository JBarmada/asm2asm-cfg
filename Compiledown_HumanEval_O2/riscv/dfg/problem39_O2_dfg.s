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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s4, a0                                            // |  4  :           : ^       v        |  0                                  |
    call    strlen@plt                                    // |  4 ^:           : :                |  0                                  |
    sext.w  s5, a0                                        // |  5  :           : :^      v        |  0                                  |
    blez    s5, .LBB0_10                                  // |  4  :           : :v               |  0                                  |
    mv  s3, a0                                            // |  6  :           :^::      v        |  0                                  |
    li  s1, 0                                             // |  6  :          ^::::               |  0                                  |
    addiw   a0, a0, 2                                     // |  6  :           ::::      ^        |  0                                  |
    lui a1, 699051                                        // |  6  :           ::::       ^       |  0                                  |
    addiw   a1, a1, -1365                                 // |  6  :           ::::       ^       |  0                                  |
    slli    a1, a1, 32                                    // |  6  :           ::::       ^       |  0                                  |
    slli    a0, a0, 32                                    // |  7  :           ::::      ^:       |  0                                  |
    mulhu   a0, a0, a1                                    // |  7  :           ::::      ^v       |  0                                  |
    srli    s0, a0, 33                                    // |  7  :         ^ ::::      v        |  0                                  |
    addi    s8, sp, 4                                     // |  6  v           ::::  ^            |  0                                  |
    j   .LBB0_4                                           // |  6  :           ::::  :            |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lb  a0, 5(sp)                                         // |  7  v           ::::  :   ^        |  0                                  |
    lb  a1, 4(sp)                                         // |  8  v           ::::  :   :^       |  0                                  |
    sb  a0, 4(sp)                                         // |  8  v           ::::  :   v:       |  0                                  |
    lb  a0, 6(sp)                                         // |  8  v           ::::  :   ^:       |  0                                  |
    sb  a0, 5(sp)                                         // |  8  v           ::::  :   v:       |  0                                  |
    sb  a1, 6(sp)                                         // |  7  v           ::::  :    v       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a1, sp, 4                                     // |  7  v           ::::  :    ^       |  0                                  |
    mv  a0, s6                                            // |  8  :           ::::v :   ^        |  0                                  |
    mv  a2, s7                                            // |  8  :           :::: v:     ^      |  0                                  |
    call    strncpy@plt                                   // |  7 ^:           ::::  :            |  0                                  |
    addi    s0, s0, -1                                    // |  7  :         ^ ::::  :            |  0                                  |
    addi    s1, s1, 3                                     // |  8  :         :^::::  :            |  0                                  |
    beqz    s0, .LBB0_10                                  // |  8  :         v:::::  :            |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addiw   a0, s1, 3                                     // |  8  :          v::::  :   ^        |  0                                  |
    li  s9, 3                                             // |  9  :          :::::  :^  :        |  0                                  |
    blt s5, a0, .LBB0_6                                   // |  9  :          ::::v  ::  v        |  0                                  |
    li  s7, 3                                             // |  8  :          ::::  ^::           |  0                                  |
    j   .LBB0_7                                           // |  7  :          ::::   ::           |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    subw    s7, s3, s1                                    // |  8  :          v:v:  ^::           |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    add s6, s4, s1                                        // |  8  :          v: v ^:::           |  0                                  |
    addi    a0, sp, 4                                     // |  7  v           :   ::::  ^        |  0                                  |
    mv  a1, s6                                            // |  7  :           :   v:::   ^       |  0                                  |
    mv  a2, s7                                            // |  6  :           :    v::    ^      |  0                                  |
    call    strncpy@plt                                   // |  6 ^:           :    :::           |  0                                  |
    add a0, s8, s7                                        // |  6  :           :    vv:  ^        |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :           :    : :  v        |  0                                  |
    bne s7, s9, .LBB0_3                                   // |  4  :           :    v v           |  0                                  |
    beqz    s2, .LBB0_2                                   // |  2  :           v                  |  0                                  |
    lb  a0, 5(sp)                                         // |  2  v                     ^        |  0                                  |
    lb  a1, 6(sp)                                         // |  3  v                     :^       |  0                                  |
    sb  a0, 6(sp)                                         // |  3  v                     v:       |  0                                  |
    lb  a0, 4(sp)                                         // |  3  v                     ^:       |  0                                  |
    sb  a0, 5(sp)                                         // |  3  v                     v:       |  0                                  |
    sb  a1, 4(sp)                                         // |  2  v                      v       |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
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
