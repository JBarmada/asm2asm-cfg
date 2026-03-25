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
    sd  s6, 0(sp)                                         // |  2  v               v              |  0                                  |
    mv  s4, a2                                            // |  3  :             ^         v      |  0                                  |
    sw  a1, 0(a3)                                         // |  4  :             :        v v     |  0                                  |
    beqz    a1, .LBB0_14                                  // |  3  :             :        v       |  0                                  |
    mv  s6, a1                                            // |  4  :             : ^      v       |  0                                  |
    mv  s2, a0                                            // |  5  :           ^ : :     v        |  0                                  |
    slli    s3, a1, 2                                     // |  6  :           :^: :      v       |  0                                  |
    mv  a0, s3                                            // |  6  :           :v: :     ^        |  0                                  |
    call    malloc@plt                                    // |  7 ^:           ::: :     :        |  0                                  |
    sd  a0, 0(s4)                                         // |  6  :           ::v :     v        |  0                                  |
    beqz    a0, .LBB0_16                                  // |  6  :           ::: :     v        |  0                                  |
    mv  s5, a0                                            // |  7  :           :::^:     v        |  0                                  |
    blez    s6, .LBB0_4                                   // |  6  :           ::::v              |  0                                  |
    mv  a0, s5                                            // |  7  :           :::v:     ^        |  0                                  |
    mv  a1, s2                                            // |  7  :           v::::      ^       |  0                                  |
    mv  a2, s3                                            // |  7  :           :v:::       ^      |  0                                  |
    call    memcpy@plt                                    // |  6 ^:           : :::              |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a0, 2                                             // |  6  :           : :::     ^        |  0                                  |
    blt s6, a0, .LBB0_15                                  // |  6  :           : ::v     v        |  0                                  |
    lw  a0, 0(s2)                                         // |  6  :           v :::     ^        |  0                                  |
    addiw   a1, s6, -1                                    // |  6  :           : ::v      ^       |  0                                  |
    slli    a2, a1, 2                                     // |  7  :           : :::      v^      |  0                                  |
    add a2, a2, s2                                        // |  6  :           v :::       ^      |  0                                  |
    lw  a2, 0(a2)                                         // |  5  :             :::       v      |  0                                  |
    li  a7, 0                                             // |  6  :             :::       :    ^ |  0                                  |
    addw    a0, a0, a2                                    // |  7  :             :::     ^ v    : |  0                                  |
    lui a2, 524288                                        // |  6  :             :::       ^    : |  0                                  |
    addiw   a2, a2, 1                                     // |  6  :             :::       ^    : |  0                                  |
    and a0, a0, a2                                        // |  7  :             :::     ^ v    : |  0                                  |
    slli    a1, a1, 32                                    // |  8  :             :::     :^:    : |  0                                  |
    srli    a6, a1, 32                                    // |  9  :             :::     :v:   ^: |  0                                  |
    addi    t0, s5, 4                                     // |  9  :  ^          :v:     : :   :: |  0                                  |
    li  a4, 1                                             // |  9  :             :::     : : ^ :: |  0                                  |
    li  a5, 1                                             // | 10  :             :::     : : :^:: |  0                                  |
    j   .LBB0_7                                           // |  9  :             :::     : : : :: |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    a5, a5, 1                                     // | 10  :             :::     : : :^:: |  0                                  |
    addi    t0, t0, 4                                     // | 11  :  ^          :::     : : :::: |  0                                  |
    beq a7, a6, .LBB0_15                                  // | 11  :  :          :::     : : ::vv |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a1, a7                                            // | 11  :  :          :::     :^: :: v |  0                                  |
    addi    a7, a7, 1                                     // | 10  :  :          :::     : : :: ^ |  0                                  |
    bge a7, s6, .LBB0_6                                   // | 10  :  :          ::v     : : :: v |  0                                  |
    slli    a1, a1, 2                                     // | 10  :  :          :::     :^: ::   |  0                                  |
    add s1, s5, a1                                        // | 11  :  :       ^  :v:     :v: ::   |  0                                  |
    mv  s0, s6                                            // | 11  :  :      ^:  : v     ::: ::   |  0                                  |
    mv  a3, t0                                            // | 10  :  v       :  :       :::^::   |  0                                  |
    j   .LBB0_11                                          // |  9  :          :  :       ::::::   |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    sw  a2, 0(s1)                                         // |  9  :          v  :       ::v:::   |  0                                  |
    sw  a1, 0(a3)                                         // |  8  :          :  :       :v v::   |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    s0, s0, -1                                    // |  7  :         ^:  :       :   ::   |  0                                  |
    addi    a3, a3, 4                                     // |  8  :         ::  :       :  ^::   |  0                                  |
    beq a5, s0, .LBB0_6                                   // |  8  :         v:  :       :  ::v   |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    lw  a1, 0(s1)                                         // |  7  :          v  :       :^ ::    |  0                                  |
    lw  a2, 0(a3)                                         // |  7  :             :       ::^v:    |  0                                  |
    bne a0, a4, .LBB0_13                                  // |  6  :             :       v:: v    |  0                                  |
    blt a2, a1, .LBB0_9                                   // |  4  :             :        vv      |  0                                  |
    j   .LBB0_10                                          // |  4  :             :        ::      |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    blt a1, a2, .LBB0_9                                   // |  4  :             :        vv      |  0                                  |
    j   .LBB0_10                                          // |  2  :             :                |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    sd  zero, 0(s4)                                       // |  2  :             v                |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  3 :v              ^               |  0                                  |
    ld  s6, 0(sp)                                         // |  3 :v               ^              |  0                                  |
    addi    sp, sp, 64                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    li  a0, 1                                             // |  1                        ^        |  0                                  |
    call    exit@plt                                      // |  1 ^                               |  0                                  |
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
