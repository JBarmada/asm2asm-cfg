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
    addi    sp, sp, -160                                  // |  1  ^                              |  0                                  |
    sd  ra, 152(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 144(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 136(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 128(sp)                                       // |  2  v           v                  |  0                                  |
    sd  s3, 120(sp)                                       // |  2  v            v                 |  0                                  |
    sd  s4, 112(sp)                                       // |  2  v             v                |  0                                  |
    mv  s3, a3                                            // |  3  :            ^           v     |  0                                  |
    mv  s2, a2                                            // |  4  :           ^:          v      |  0                                  |
    mv  s1, a1                                            // |  5  :          ^::         v       |  0                                  |
    mv  s0, a0                                            // |  6  :         ^:::        v        |  0                                  |
    addi    a0, sp, 8                                     // |  5  v          :::        ^        |  0                                  |
    li  a2, 104                                           // |  5  :          :::          ^      |  0                                  |
    addi    s4, sp, 8                                     // |  5  v          :::^                |  0                                  |
    li  a1, 0                                             // |  6  :          ::::        ^       |  0                                  |
    call    memset@plt                                    // |  6 ^:          ::::                |  0                                  |
    li  a0, 0                                             // |  6  :          ::::       ^        |  0                                  |
    li  a1, 32                                            // |  7  :          ::::       :^       |  0                                  |
    j   .LBB0_2                                           // |  7  :          ::::       ::       |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    addi    s0, s0, 1                                     // |  8  :         ^::::       ::       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu a2, 0(s0)                                         // |  9  :         v::::       ::^      |  0                                  |
    beq a2, a1, .LBB0_1                                   // |  8  :          ::::       :vv      |  0                                  |
    beqz    a2, .LBB0_6                                   // |  7  :          ::::       : v      |  0                                  |
    slli    a2, a2, 2                                     // |  7  :          ::::       : ^      |  0                                  |
    add a3, a2, s4                                        // |  8  :          :::v       : v^     |  0                                  |
    lw  a4, -388(a3)                                      // |  7  :          :::        :  v^    |  0                                  |
    addiw   a2, a4, 1                                     // |  8  :          :::        : ^:v    |  0                                  |
    sw  a2, -388(a3)                                      // |  8  :          :::        : vv:    |  0                                  |
    blt a4, a0, .LBB0_1                                   // |  7  :          :::        v : v    |  0                                  |
    mv  a0, a2                                            // |  6  :          :::        ^ v      |  0                                  |
    j   .LBB0_1                                           // |  5  :          :::        :        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  6  :          :::        :^       |  0                                  |
    li  a3, 0                                             // |  6  :          :::        :  ^     |  0                                  |
    addi    a6, sp, 8                                     // |  7  v          :::        :  :  ^  |  0                                  |
    li  a5, 104                                           // |  8  :          :::        :  : ^:  |  0                                  |
    j   .LBB0_8                                           // |  8  :          :::        :  : ::  |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addi    a1, a1, 4                                     // |  9  :          :::        :^ : ::  |  0                                  |
    addiw   a2, a2, 1                                     // | 10  :          :::        ::^: ::  |  0                                  |
    beq a1, a5, .LBB0_10                                  // | 10  :          :::        :v:: v:  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    add s0, a6, a1                                        // | 10  :         ^:::        :v::  v  |  0                                  |
    lw  s0, 0(s0)                                         // |  9  :         v:::        ::::     |  0                                  |
    add a4, s1, a1                                        // | 10  :         :v::        :v::^    |  0                                  |
    sw  s0, 0(a4)                                         // |  8  :         v ::        : ::v    |  0                                  |
    bne s0, a0, .LBB0_7                                   // |  7  :         v ::        v ::     |  0                                  |
    addiw   a4, a2, 97                                    // |  7  :           ::        : v:^    |  0                                  |
    add s0, s3, a3                                        // |  7  :         ^ :v        :  v:    |  0                                  |
    addiw   a3, a3, 1                                     // |  7  :         : ::        :  ^:    |  0                                  |
    sb  a4, 0(s0)                                         // |  7  :         v ::        :  :v    |  0                                  |
    j   .LBB0_7                                           // |  5  :           ::        :  :     |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    sw  a0, 0(s2)                                         // |  5  :           v:        v  :     |  0                                  |
    add a0, s3, a3                                        // |  4  :            v        ^  v     |  0                                  |
    sb  zero, 0(a0)                                       // |  2  :                     v        |  0                                  |
    ld  ra, 152(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 144(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 136(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 128(sp)                                       // |  3 :v           ^                  |  0                                  |
    ld  s3, 120(sp)                                       // |  3 :v            ^                 |  0                                  |
    ld  s4, 112(sp)                                       // |  3 :v             ^                |  0                                  |
    addi    sp, sp, 160                                   // |  2 :^                              |  0                                  |
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
