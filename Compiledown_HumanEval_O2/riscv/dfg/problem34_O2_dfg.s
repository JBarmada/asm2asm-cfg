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
    sd  s4, 0(sp)                                         // |  2  v             v                |  0                                  |
    mv  s4, a2                                            // |  3  :             ^         v      |  0                                  |
    mv  s2, a1                                            // |  4  :           ^ :        v       |  0                                  |
    mv  s3, a0                                            // |  5  :           :^:       v        |  0                                  |
    lui a0, 349525                                        // |  5  :           :::       ^        |  0                                  |
    addiw   a0, a0, 1366                                  // |  5  :           :::       ^        |  0                                  |
    mul a0, a1, a0                                        // |  6  :           :::       ^v       |  0                                  |
    srli    a1, a0, 63                                    // |  6  :           :::       v^       |  0                                  |
    srli    a0, a0, 32                                    // |  6  :           :::       ^:       |  0                                  |
    addw    a0, a0, a1                                    // |  6  :           :::       ^v       |  0                                  |
    addiw   a0, a0, 1                                     // |  5  :           :::       ^        |  0                                  |
    slli    a0, a0, 2                                     // |  5  :           :::       ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:           :::       :        |  0                                  |
    blez    s2, .LBB0_18                                  // |  5  :           v::       :        |  0                                  |
    addiw   a1, s2, -1                                    // |  6  :           v::       :^       |  0                                  |
    lui a2, 699051                                        // |  6  :           :::       : ^      |  0                                  |
    addiw   a2, a2, -1365                                 // |  6  :           :::       : ^      |  0                                  |
    slli    a2, a2, 32                                    // |  6  :           :::       : ^      |  0                                  |
    slli    a1, a1, 32                                    // |  7  :           :::       :^:      |  0                                  |
    mulhu   a1, a1, a2                                    // |  7  :           :::       :^v      |  0                                  |
    srli    a6, a1, 33                                    // |  7  :           :::       :v    ^  |  0                                  |
    addi    a1, a6, 1                                     // |  7  :           :::       :^    v  |  0                                  |
    mv  a2, s3                                            // |  7  :           :v:       : ^   :  |  0                                  |
    mv  a3, a0                                            // |  8  :           :::       v :^  :  |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a4, 0(a2)                                         // |  9  :           :::       : v:^ :  |  0                                  |
    sw  a4, 0(a3)                                         // |  8  :           :::       :  vv :  |  0                                  |
    addi    a3, a3, 4                                     // |  7  :           :::       :  ^  :  |  0                                  |
    addi    a1, a1, -1                                    // |  7  :           :::       :^    :  |  0                                  |
    addi    a2, a2, 12                                    // |  8  :           :::       ::^   :  |  0                                  |
    bnez    a1, .LBB0_2                                   // |  7  :           :::       :v    :  |  0                                  |
    blez    a6, .LBB0_12                                  // |  6  :           :::       :     v  |  0                                  |
    li  a7, 0                                             // |  7  :           :::       :     :^ |  0                                  |
    addi    t1, a0, 4                                     // |  8  :   ^       :::       v     :: |  0                                  |
    li  a4, 1                                             // |  8  :           :::       :   ^ :: |  0                                  |
    mv  a5, a6                                            // |  8  :           :::       :    ^v: |  0                                  |
    j   .LBB0_6                                           // |  7  :           :::       :     :: |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addi    a4, a4, 1                                     // |  8  :           :::       :   ^ :: |  0                                  |
    addi    t1, t1, 4                                     // |  9  :   ^       :::       :   : :: |  0                                  |
    addi    a5, a5, -1                                    // | 10  :   :       :::       :   :^:: |  0                                  |
    beq a7, a6, .LBB0_12                                  // | 10  :   :       :::       :   ::vv |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  s1, 0                                             // | 10  :   :      ^:::       :   :: : |  0                                  |
    mv  t0, a7                                            // | 10  :  ^:       :::       :   :: v |  0                                  |
    addi    a7, a7, 1                                     // | 10  :  ::       :::       :   :: ^ |  0                                  |
    mv  a3, t1                                            // | 10  :  :v       :::       :  ^::   |  0                                  |
    mv  a1, t0                                            // |  9  :  v        :::       :^  ::   |  0                                  |
    j   .LBB0_8                                           // |  9  :  :        :::       ::  ::   |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addi    s1, s1, 1                                     // | 10  :  :       ^:::       ::  ::   |  0                                  |
    addi    a3, a3, 4                                     // | 11  :  :       ::::       :: ^::   |  0                                  |
    beq a5, s1, .LBB0_10                                  // | 11  :  :       v:::       :: ::v   |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    lw  a2, 0(a3)                                         // | 11  :  :       ::::       ::^v:    |  0                                  |
    sext.w  s0, a1                                        // | 11  :  :      ^::::       :v: :    |  0                                  |
    slli    s0, s0, 2                                     // | 10  :  :      ^::::       : : :    |  0                                  |
    add s0, s0, a0                                        // | 10  :  :      ^::::       v : :    |  0                                  |
    lw  s0, 0(s0)                                         // | 10  :  :      v::::       : : :    |  0                                  |
    bge a2, s0, .LBB0_7                                   // | 10  :  :      v::::       : v :    |  0                                  |
    add a1, a4, s1                                        // |  9  :  :       v:::       :^  v    |  0                                  |
    j   .LBB0_7                                           // |  7  :  :        :::       ::       |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    slli    a2, a1, 32                                    // |  8  :  :        :::       :v^      |  0                                  |
    srli    a2, a2, 32                                    // |  7  :  :        :::       : ^      |  0                                  |
    beq t0, a2, .LBB0_5                                   // |  7  :  v        :::       : v      |  0                                  |
    slli    a2, t0, 2                                     // |  7  :  v        :::       : ^      |  0                                  |
    add a2, a2, a0                                        // |  6  :           :::       v ^      |  0                                  |
    sext.w  a1, a1                                        // |  7  :           :::       :^:      |  0                                  |
    slli    a1, a1, 2                                     // |  7  :           :::       :^:      |  0                                  |
    add a1, a1, a0                                        // |  7  :           :::       v^:      |  0                                  |
    lw  a3, 0(a1)                                         // |  8  :           :::       :v:^     |  0                                  |
    lw  s1, 0(a2)                                         // |  9  :          ^:::       ::v:     |  0                                  |
    sw  a3, 0(a2)                                         // |  9  :          ::::       ::vv     |  0                                  |
    sw  s1, 0(a1)                                         // |  7  :          v:::       :v       |  0                                  |
    j   .LBB0_5                                           // |  5  :           :::       :        |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    blez    s2, .LBB0_18                                  // |  5  :           v::       :        |  0                                  |
    li  a1, 0                                             // |  6  :           :::       :^       |  0                                  |
    lui a2, 699051                                        // |  6  :           :::       : ^      |  0                                  |
    addiw   a2, a2, -1365                                 // |  6  :           :::       : ^      |  0                                  |
    slli    a2, a2, 32                                    // |  6  :           :::       : ^      |  0                                  |
    j   .LBB0_16                                          // |  6  :           :::       : :      |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a3, s3                                            // |  7  :           :v:       : :^     |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    lw  a3, 0(a3)                                         // |  6  :           : :       : :v     |  0                                  |
    sw  a3, 0(s4)                                         // |  6  :           : v       : :v     |  0                                  |
    addi    a1, a1, 1                                     // |  5  :           :         :^:      |  0                                  |
    addi    s4, s4, 4                                     // |  6  :           : ^       :::      |  0                                  |
    addi    s3, s3, 4                                     // |  6  :           :^        :::      |  0                                  |
    beq s2, a1, .LBB0_18                                  // |  5  :           v         :v:      |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    slli    a3, a1, 32                                    // |  5  :                     :v:^     |  0                                  |
    mulhu   a3, a3, a2                                    // |  5  :                     ::v^     |  0                                  |
    srli    a3, a3, 33                                    // |  4  :                     :: ^     |  0                                  |
    slliw   a4, a3, 1                                     // |  5  :                     :: v^    |  0                                  |
    addw    a4, a4, a3                                    // |  5  :                     :: v^    |  0                                  |
    subw    a4, a1, a4                                    // |  4  :                     :v  ^    |  0                                  |
    bnez    a4, .LBB0_14                                  // |  3  :                     :   v    |  0                                  |
    slli    a3, a3, 2                                     // |  3  :                     :  ^     |  0                                  |
    add a3, a3, a0                                        // |  3  :                     v  ^     |  0                                  |
    j   .LBB0_15                                          // |  1  :                              |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  2  v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  2  v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  2  v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  2  v            ^                 |  0                                  |
    ld  s4, 0(sp)                                         // |  2  v             ^                |  0                                  |
    addi    sp, sp, 48                                    // |  1  ^                              |  0                                  |
    tail    free@plt                                      // |  0                                 |  0                                  |
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
