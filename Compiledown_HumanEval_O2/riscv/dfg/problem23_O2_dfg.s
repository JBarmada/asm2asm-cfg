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
    lbu s1, 0(a0)                                         // |  3  :          ^          v        |  0                                  |
    mv  s2, a1                                            // |  4  :          :^          v       |  0                                  |
    beqz    s1, .LBB0_13                                  // |  3  :          v:                  |  0                                  |
    mv  s7, a0                                            // |  5  :          ::    ^    v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  5 ^:          ::    :             |  0                                  |
    mv  s3, a0                                            // |  6  :          ::^   :    v        |  0                                  |
    li  s4, 0                                             // |  6  :          :::^  :             |  0                                  |
    li  s5, 44                                            // |  7  :          ::::^ :             |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    auipc   s6, %pcrel_hi(func0.out)                      // |  8  :          :::::^:             |  0                                  |
    addi    s6, s6, %pcrel_lo(.LBB0_15)                   // |  8  :          :::::^:             |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    ld  a0, 0(s3)                                         // |  9  :          ::v::::    ^        |  0                                  |
    mv  s0, s7                                            // |  9  :         ^:: :::v    :        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    andi    a1, s1, 255                                   // |  9  :         :v: :::     :^       |  0                                  |
    slli    a2, a1, 1                                     // |  9  :         : : :::     :v^      |  0                                  |
    add a2, a2, a0                                        // |  8  :         : : :::     v ^      |  0                                  |
    lbu a2, 1(a2)                                         // |  7  :         : : :::       ^      |  0                                  |
    slli    a2, a2, 60                                    // |  7  :         : : :::       ^      |  0                                  |
    srli    a2, a2, 63                                    // |  7  :         : : :::       ^      |  0                                  |
    addi    a1, a1, -45                                   // |  8  :         : : :::      ^:      |  0                                  |
    seqz    a1, a1                                        // |  8  :         : : :::      ^:      |  0                                  |
    or  a1, a1, a2                                        // |  8  :         : : :::      ^v      |  0                                  |
    bnez    a1, .LBB0_5                                   // |  7  :         : : :::      v       |  0                                  |
    lbu s1, 1(s0)                                         // |  7  :         v^: :::              |  0                                  |
    addi    s0, s0, 1                                     // |  7  :         ^:: :::              |  0                                  |
    bnez    s1, .LBB0_3                                   // |  7  :         :v: :::              |  0                                  |
    j   .LBB0_14                                          // |  6  :         : : :::              |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a1, sp                                            // |  7  v         : : :::      ^       |  0                                  |
    li  a2, 10                                            // |  7  :         : : :::       ^      |  0                                  |
    mv  a0, s0                                            // |  7  :         v : :::     ^        |  0                                  |
    call    strtol@plt                                    // |  8 ^:         : : :::     :        |  0                                  |
    ld  s7, 0(sp)                                         // |  8  v         : : :::^    :        |  0                                  |
    beq s0, s7, .LBB0_10                                  // |  8  :         v : :::v    :        |  0                                  |
    lbu a1, 0(s7)                                         // |  8  :           : :::v    :^       |  0                                  |
    beq a1, s5, .LBB0_8                                   // |  8  :           : :v::    :v       |  0                                  |
    bnez    a1, .LBB0_10                                  // |  8  :           : ::::    :v       |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    slli    a1, s4, 2                                     // |  8  :           : v:::    :^       |  0                                  |
    add a1, a1, s6                                        // |  7  :           :  :v:    :^       |  0                                  |
    sw  a0, 0(a1)                                         // |  6  :           :  : :    vv       |  0                                  |
    lbu s1, 0(s7)                                         // |  5  :          ^:  : v             |  0                                  |
    addiw   s4, s4, 1                                     // |  5  :          :: ^:               |  0                                  |
    bnez    s1, .LBB0_2                                   // |  4  :          v:  :               |  0                                  |
    j   .LBB0_14                                          // |  3  :           :  :               |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    addi    s7, s7, 1                                     // |  4  :           :  : ^             |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    lbu s1, 0(s7)                                         // |  5  :          ^:  : v             |  0                                  |
    beqz    s1, .LBB0_12                                  // |  5  :          v:  : :             |  0                                  |
    bne s1, s5, .LBB0_9                                   // |  5  :          v:  v :             |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    sd  s7, 0(sp)                                         // |  4  v          ::    v             |  0                                  |
    bnez    s1, .LBB0_2                                   // |  3  :          v:                  |  0                                  |
    j   .LBB0_14                                          // |  2  :           :                  |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    li  s4, 0                                             // |  3  :           : ^                |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
.LBB0_16:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(func0.out)                      // |  4  :           : :       ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_16)                   // |  4  :           : :       ^        |  0                                  |
    sw  s4, 0(s2)                                         // |  3  :           v v                |  0                                  |
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
    .type   func0.out,@object                             // |                                    |                                     |
    .local  func0.out                                     // |                                    |                                     |
    .comm   func0.out,1024,4                              // |                                    |                                     |
    .ident  "Debian clang version 15.0.7"                 // |                                    |                                     |
    .section    ".note.GNU-stack","",@progbits            // |                                    |                                     |
    .addrsig                                              // |                                    |                                     |
    .addrsig_sym func0.out                                // |                                    |                                     |
                                                          // +....................................+.....................................+
                                                          // Legend:
                                                          //     ^       : Register assignment (write)
                                                          //     v       : Register usage (read)
                                                          //     x       : Register usage and reassignment (R/W)
                                                          //     :       : Register in use (live)
                                                          //     <space> : Register not in use
                                                          //     #       : Number of occupied registers
