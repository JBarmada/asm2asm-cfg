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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s5, a0                                            // |  4  :           :  ^      v        |  0                                  |
    li  a0, -1                                            // |  4  :           :  :      ^        |  0                                  |
    srli    s0, a0, 32                                    // |  5  :         ^ :  :      v        |  0                                  |
    mv  a0, s5                                            // |  5  :         : :  v      ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:         : :  :      :        |  0                                  |
    mv  s4, a0                                            // |  6  :         : : ^:      v        |  0                                  |
    sext.w  s6, a0                                        // |  7  :         : : ::^     v        |  0                                  |
    slli    s1, a0, 32                                    // |  8  :         :^: :::     v        |  0                                  |
    srai    a0, s1, 29                                    // |  8  :         :v: :::     ^        |  0                                  |
    call    malloc@plt                                    // |  9 ^:         ::: :::     :        |  0                                  |
    mv  s3, a0                                            // |  9  :         :::^:::     v        |  0                                  |
    or  a0, s1, s0                                        // |  9  :         vv:::::     ^        |  0                                  |
    addi    a0, a0, 1                                     // |  8  :         : :::::     ^        |  0                                  |
    srai    a0, a0, 32                                    // |  8  :         : :::::     ^        |  0                                  |
    call    malloc@plt                                    // |  9 ^:         : :::::     :        |  0                                  |
    mv  s1, a0                                            // |  9  :         :^:::::     v        |  0                                  |
    sb  zero, 0(a0)                                       // |  9  :         :::::::     v        |  0                                  |
    blez    s6, .LBB0_3                                   // |  8  :         ::::::v              |  0                                  |
    and s7, s4, s0                                        // |  8  :         v:::v: ^             |  0                                  |
    mv  s0, s3                                            // |  7  :         ^::v::               |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v::::      ^        |  0                                  |
    call    strlen@plt                                    // |  9 ^:         ::::::      :        |  0                                  |
    mv  s6, a0                                            // |  9  :         ::::::^     v        |  0                                  |
    addi    a1, a0, 2                                     // | 10  :         :::::::     v^       |  0                                  |
    mv  a0, s1                                            // |  9  :         :v:::::     ^        |  0                                  |
    call    realloc@plt                                   // |  9 ^:         : :::::     :        |  0                                  |
    lb  a1, 0(s5)                                         // |  9  :         : :::v:     :^       |  0                                  |
    mv  s1, a0                                            // |  9  :         :^::: :     v:       |  0                                  |
    add a0, a0, s6                                        // |  9  :         ::::: v     ^:       |  0                                  |
    sb  a1, 0(a0)                                         // |  8  :         :::::       vv       |  0                                  |
    sb  zero, 1(a0)                                       // |  7  :         :::::       v        |  0                                  |
    mv  a0, s1                                            // |  7  :         :v:::       ^        |  0                                  |
    call    strlen@plt                                    // |  7 ^:         :::::                |  0                                  |
    addi    a0, a0, 1                                     // |  7  :         :::::       ^        |  0                                  |
    call    malloc@plt                                    // |  8 ^:         :::::       :        |  0                                  |
    sd  a0, 0(s0)                                         // |  7  :         v::::       v        |  0                                  |
    mv  a1, s1                                            // |  6  :          v:::        ^       |  0                                  |
    call    strcpy@plt                                    // |  6 ^:          ::::                |  0                                  |
    addi    s0, s0, 8                                     // |  6  :         ^::::                |  0                                  |
    addi    s7, s7, -1                                    // |  6  :          ::::  ^             |  0                                  |
    addi    s5, s5, 1                                     // |  7  :          ::::^ :             |  0                                  |
    bnez    s7, .LBB0_2                                   // |  6  :          ::::  v             |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a0, s1                                            // |  6  :          v:::       ^        |  0                                  |
    call    free@plt                                      // |  5 ^:           :::                |  0                                  |
    sw  s4, 0(s2)                                         // |  4  :           v:v                |  0                                  |
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
