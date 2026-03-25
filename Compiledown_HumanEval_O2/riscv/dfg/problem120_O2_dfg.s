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
    mv  s5, a1                                            // |  3  :              ^       v       |  0                                  |
    mv  s0, a0                                            // |  4  :         ^    :      v        |  0                                  |
    li  a0, -1                                            // |  4  :         :    :      ^        |  0                                  |
    srli    s3, a0, 32                                    // |  5  :         :  ^ :      v        |  0                                  |
    mv  a0, s0                                            // |  5  :         v  : :      ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:         :  : :      :        |  0                                  |
    mv  s2, a0                                            // |  6  :         : ^: :      v        |  0                                  |
    sext.w  s4, a0                                        // |  7  :         : ::^:      v        |  0                                  |
    mv  a0, s5                                            // |  7  :         : :::v      ^        |  0                                  |
    call    strlen@plt                                    // |  8 ^:         : ::::      :        |  0                                  |
    li  a1, 0                                             // |  8  :         : ::::      :^       |  0                                  |
    blez    s4, .LBB0_5                                   // |  7  :         : ::v:      :        |  0                                  |
    and a3, s2, s3                                        // |  8  :         : vv::      :  ^     |  0                                  |
    li  a5, 1                                             // |  8  :         : ::::      :    ^   |  0                                  |
    mv  a4, s0                                            // |  8  :         v ::::      :   ^    |  0                                  |
    j   .LBB0_3                                           // |  6  :           ::::      :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    a3, a3, -1                                    // |  7  :           ::::      :  ^     |  0                                  |
    addi    a4, a4, 1                                     // |  8  :           ::::      :  :^    |  0                                  |
    mv  a5, a2                                            // | 10  :           ::::      : v::^   |  0                                  |
    beqz    a3, .LBB0_6                                   // |  9  :           ::::      :  v::   |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lbu a2, 0(a4)                                         // | 10  :           ::::      : ^:v:   |  0                                  |
    addi    s1, a2, -40                                   // | 10  :          ^::::      : v: :   |  0                                  |
    seqz    s1, s1                                        // |  9  :          ^::::      :  : :   |  0                                  |
    addw    a1, a1, s1                                    // | 10  :          v::::      :^ : :   |  0                                  |
    addi    a2, a2, -41                                   // |  9  :           ::::      : ^: :   |  0                                  |
    seqz    a2, a2                                        // |  9  :           ::::      : ^: :   |  0                                  |
    subw    a1, a1, a2                                    // | 10  :           ::::      :^v: :   |  0                                  |
    li  a2, 0                                             // | 10  :           ::::      ::^: :   |  0                                  |
    bltz    a1, .LBB0_2                                   // |  9  :           ::::      :v : :   |  0                                  |
    mv  a2, a5                                            // |  9  :           ::::      : ^: v   |  0                                  |
    j   .LBB0_2                                           // |  7  :           ::::      :  :     |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a2, 1                                             // |  8  :           ::::      : ^:     |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    sext.w  a6, a0                                        // |  8  :           ::::      v  :  ^  |  0                                  |
    blez    a6, .LBB0_17                                  // |  8  :           ::::      :  :  v  |  0                                  |
    and a4, a0, s3                                        // |  9  :           :v::      v  :^ :  |  0                                  |
    mv  a5, s5                                            // |  9  :           :::v      :  : ^:  |  0                                  |
    j   .LBB0_9                                           // |  7  :           :::       :  :  :  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    addi    a4, a4, -1                                    // |  8  :           :::       :  :^ :  |  0                                  |
    addi    a5, a5, 1                                     // |  9  :           :::       :  ::^:  |  0                                  |
    mv  a2, a3                                            // | 10  :           :::       : ^v:::  |  0                                  |
    beqz    a4, .LBB0_11                                  // |  9  :           :::       : : v::  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    lbu a3, 0(a5)                                         // |  9  :           :::       : :^ v:  |  0                                  |
    addi    s1, a3, -40                                   // |  9  :          ^:::       : :v  :  |  0                                  |
    seqz    s1, s1                                        // |  8  :          ^:::       : :   :  |  0                                  |
    addw    a1, a1, s1                                    // |  9  :          v:::       :^:   :  |  0                                  |
    addi    a3, a3, -41                                   // |  8  :           :::       : :^  :  |  0                                  |
    seqz    a3, a3                                        // |  8  :           :::       : :^  :  |  0                                  |
    subw    a1, a1, a3                                    // |  9  :           :::       :^:v  :  |  0                                  |
    li  a3, 0                                             // |  9  :           :::       :::^  :  |  0                                  |
    bltz    a1, .LBB0_8                                   // |  8  :           :::       :v:   :  |  0                                  |
    mv  a3, a2                                            // |  8  :           :::       : v^  :  |  0                                  |
    j   .LBB0_8                                           // |  7  :           :::       :  :  :  |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    seqz    a1, a1                                        // |  8  :           :::       :^ :  :  |  0                                  |
    snez    a2, a3                                        // |  8  :           :::       : ^v  :  |  0                                  |
    and a1, a1, a2                                        // |  8  :           :::       :^v   :  |  0                                  |
    bnez    a1, .LBB0_27                                  // |  7  :           :::       :v    :  |  0                                  |
    blez    a6, .LBB0_18                                  // |  6  :           :::       :     v  |  0                                  |
    li  a1, 0                                             // |  6  :           :::       :^       |  0                                  |
    and a2, a0, s3                                        // |  6  :           :v:       v ^      |  0                                  |
    li  a3, 1                                             // |  6  :           :::       :  ^     |  0                                  |
    j   .LBB0_15                                          // |  5  :           :::       :        |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    addi    a2, a2, -1                                    // |  6  :           :::       : ^      |  0                                  |
    addi    s5, s5, 1                                     // |  7  :           :::^      : :      |  0                                  |
    mv  a3, a0                                            // |  8  :           ::::      v :^     |  0                                  |
    beqz    a2, .LBB0_19                                  // |  7  :           ::::        v:     |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    lbu a0, 0(s5)                                         // |  8  :           :::v      ^ ::     |  0                                  |
    addi    a4, a0, -40                                   // |  8  :           :::       v ::^    |  0                                  |
    seqz    a4, a4                                        // |  7  :           :::         ::^    |  0                                  |
    addw    a1, a1, a4                                    // |  8  :           :::        ^::v    |  0                                  |
    addi    a0, a0, -41                                   // |  7  :           :::       ^ ::     |  0                                  |
    seqz    a0, a0                                        // |  7  :           :::       ^ ::     |  0                                  |
    subw    a1, a1, a0                                    // |  8  :           :::       v^::     |  0                                  |
    li  a0, 0                                             // |  8  :           :::       ^:::     |  0                                  |
    bltz    a1, .LBB0_14                                  // |  7  :           :::        v::     |  0                                  |
    mv  a0, a3                                            // |  8  :           :::       ^::v     |  0                                  |
    j   .LBB0_14                                          // |  7  :           :::        :::     |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    seqz    a0, a1                                        // |  8  :           :::       ^v::     |  0                                  |
    snez    a1, a2                                        // |  7  :           :::        ^v:     |  0                                  |
    and a0, a0, a1                                        // |  7  :           :::       ^v :     |  0                                  |
    bnez    a0, .LBB0_27                                  // |  6  :           :::       v  :     |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    li  a1, 0                                             // |  6  :           :::        ^ :     |  0                                  |
    li  a0, 1                                             // |  6  :           :::       ^  :     |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    blez    s4, .LBB0_24                                  // |  5  :           ::v          :     |  0                                  |
    and a2, s2, s3                                        // |  5  :           vv          ^:     |  0                                  |
    j   .LBB0_22                                          // |  2  :                        :     |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    addi    a2, a2, -1                                    // |  3  :                       ^:     |  0                                  |
    addi    s0, s0, 1                                     // |  4  :         ^             ::     |  0                                  |
    mv  a0, a3                                            // |  5  :         :           ^ :v     |  0                                  |
    beqz    a2, .LBB0_25                                  // |  4  :         :           : v      |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    lbu a3, 0(s0)                                         // |  4  :         v           :  ^     |  0                                  |
    addi    a4, a3, -40                                   // |  4  :                     :  v^    |  0                                  |
    seqz    a4, a4                                        // |  3  :                     :   ^    |  0                                  |
    addw    a1, a1, a4                                    // |  4  :                     :^  v    |  0                                  |
    addi    a3, a3, -41                                   // |  3  :                     :  ^     |  0                                  |
    seqz    a3, a3                                        // |  3  :                     :  ^     |  0                                  |
    subw    a1, a1, a3                                    // |  4  :                     :^ v     |  0                                  |
    li  a3, 0                                             // |  4  :                     :: ^     |  0                                  |
    bltz    a1, .LBB0_21                                  // |  3  :                     :v       |  0                                  |
    mv  a3, a0                                            // |  4  :                     v: ^     |  0                                  |
    j   .LBB0_21                                          // |  3  :                     ::       |  0                                  |
.LBB0_24:                                                 // |                                    |                                     |
    mv  a3, a0                                            // |  4  :                     v: ^     |  0                                  |
.LBB0_25:                                                 // |                                    |                                     |
    seqz    a0, a1                                        // |  4  :                     ^v :     |  0                                  |
    snez    a1, a3                                        // |  3  :                      ^ v     |  0                                  |
    and a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    bnez    a0, .LBB0_27                                  // |  2  :                     v        |  0                                  |
.LBB0_29:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str.1)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_29)                   // |  2  :                     ^        |  0                                  |
    j   .LBB0_28                                          // |  1  :                              |  0                                  |
.LBB0_27:                                                 // |                                    |                                     |
.LBB0_30:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str)                         // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_30)                   // |  2  :                     ^        |  0                                  |
.LBB0_28:                                                 // |                                    |                                     |
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
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "Yes"                                         // |                                    |                                     |
    .size   .L.str, 4                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "No"                                          // |                                    |                                     |
    .size   .L.str.1, 3                                   // |                                    |                                     |
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
