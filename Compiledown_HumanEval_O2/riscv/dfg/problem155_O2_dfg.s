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
    sd  s8, 0(sp)                                         // |  2  v                 v            |  0                                  |
    mv  s3, a1                                            // |  3  :            ^         v       |  0                                  |
    mv  s2, a0                                            // |  4  :           ^:        v        |  0                                  |
    mv  a0, a1                                            // |  5  :           ::        ^v       |  0                                  |
    call    strlen@plt                                    // |  5 ^:           ::        :        |  0                                  |
    mv  s1, a0                                            // |  5  :          ^::        v        |  0                                  |
    sext.w  s5, a0                                        // |  6  :          ::: ^      v        |  0                                  |
    slliw   a0, a0, 1                                     // |  6  :          ::: :      ^        |  0                                  |
    ori a0, a0, 1                                         // |  6  :          ::: :      ^        |  0                                  |
    call    malloc@plt                                    // |  7 ^:          ::: :      :        |  0                                  |
    mv  s4, a0                                            // |  7  :          :::^:      v        |  0                                  |
    blez    s5, .LBB0_4                                   // |  6  :          ::::v               |  0                                  |
    li  s0, 0                                             // |  7  :         ^:::::               |  0                                  |
    add s7, s4, s5                                        // |  8  :         ::::vv ^             |  0                                  |
    slli    a0, s1, 32                                    // |  9  :         :v:::: :    ^        |  0                                  |
    srli    s8, a0, 32                                    // |  9  :         : :::: :^   v        |  0                                  |
    li  s6, 1                                             // |  9  :         : ::::^::            |  0                                  |
    mv  s1, s5                                            // |  9  :         :^:::v ::            |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    add a1, s3, s0                                        // | 10  :         v::v:: ::    ^       |  0                                  |
    mv  a0, s4                                            // | 10  :         ::::v: ::   ^        |  0                                  |
    mv  a2, s1                                            // | 10  :         :v:::: ::     ^      |  0                                  |
    call    strncpy@plt                                   // | 10 ^:         :::::: ::            |  0                                  |
    add a0, s4, s1                                        // | 10  :         :v::v: ::   ^        |  0                                  |
    mv  a1, s3                                            // |  9  :         : :v:: ::    ^       |  0                                  |
    mv  a2, s0                                            // |  8  :         v : :: ::     ^      |  0                                  |
    call    strncpy@plt                                   // |  7 ^:           : :: ::            |  0                                  |
    sb  zero, 0(s7)                                       // |  6  :           : :: v:            |  0                                  |
    mv  a0, s2                                            // |  6  :           v ::  :   ^        |  0                                  |
    mv  a1, s4                                            // |  6  :             v:  :   :^       |  0                                  |
    call    strstr@plt                                    // |  6 ^:             ::  :   :        |  0                                  |
    bnez    a0, .LBB0_5                                   // |  5  :             ::  :   v        |  0                                  |
    addi    s0, s0, 1                                     // |  5  :         ^   ::  :            |  0                                  |
    slt s6, s0, s5                                        // |  6  :         v   :v^ :            |  0                                  |
    addi    s1, s1, -1                                    // |  5  :         :^  :   :            |  0                                  |
    bne s8, s0, .LBB0_2                                   // |  4  :         v   :   v            |  0                                  |
    j   .LBB0_5                                           // |  2  :             :                |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  s6, 0                                             // |  3  :             : ^              |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, s4                                            // |  4  :             v :     ^        |  0                                  |
    call    free@plt                                      // |  3 ^:               :              |  0                                  |
    andi    a0, s6, 1                                     // |  3  :               v     ^        |  0                                  |
    ld  ra, 72(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 64(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 56(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 48(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 40(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 32(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 24(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 16(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 8(sp)                                         // |  3 :v                ^             |  0                                  |
    ld  s8, 0(sp)                                         // |  3 :v                 ^            |  0                                  |
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
