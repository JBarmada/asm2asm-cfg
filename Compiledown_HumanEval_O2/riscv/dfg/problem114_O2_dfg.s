                                                                                 // +------------------------------------+-------------------------------------+
                                                                                 // |                GPR                 |                FLOAT                |
                                                                                 // |                                    |                                     |
                                                                                 // |    RSGTTTTTTTTSSSSSSSSSSSSAAAAAAAA |    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF |
                                                                                 // |    APPP012345601234567891101234567 |    TTTTTTTTTTTTAAAAAAAASSSSSSSSSSSS |
                                                                                 // |                         01         |    01234567891101234567012345678911 |
                                                                                 // |  #                                 |  #           01                  01 |
                                                                                 // +------------------------------------+-------------------------------------+
    .text                                                                        // |                                    |                                     |
    .attribute  4, 16                                                            // |                                    |                                     |
    .attribute  5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"                           // |                                    |                                     |
    .file   "code.c"                                                             // |                                    |                                     |
    .globl  func0                                                                // |                                    |                                     |
    .p2align    1                                                                // |                                    |                                     |
    .type   func0,@function                                                      // |                                    |                                     |
func0:                                                                           // |                                    |                                     |
    addi    sp, sp, -80                                                          // |  1  ^                              |  0                                  |
    sd  ra, 72(sp)                                                               // |  2 vv                              |  0                                  |
    sd  s0, 64(sp)                                                               // |  2  v         v                    |  0                                  |
    sd  s1, 56(sp)                                                               // |  2  v          v                   |  0                                  |
    sd  s2, 48(sp)                                                               // |  2  v           v                  |  0                                  |
    sd  s3, 40(sp)                                                               // |  2  v            v                 |  0                                  |
    sd  s4, 32(sp)                                                               // |  2  v             v                |  0                                  |
    sd  s5, 24(sp)                                                               // |  2  v              v               |  0                                  |
    sd  s6, 16(sp)                                                               // |  2  v               v              |  0                                  |
    sd  s7, 8(sp)                                                                // |  2  v                v             |  0                                  |
    sd  s8, 0(sp)                                                                // |  2  v                 v            |  0                                  |
    mv  s3, a1                                                                   // |  3  :            ^         v       |  0                                  |
    mv  s2, a0                                                                   // |  4  :           ^:        v        |  0                                  |
    slli    a0, a1, 3                                                            // |  5  :           ::        ^v       |  0                                  |
    call    malloc@plt                                                           // |  5 ^:           ::        :        |  0                                  |
    mv  s4, a0                                                                   // |  5  :           ::^       v        |  0                                  |
    blez    s3, .LBB0_9                                                          // |  4  :           :v:                |  0                                  |
    li  s6, 0                                                                    // |  5  :           ::: ^              |  0                                  |
.LBB0_10:                                                                        // |                                    |                                     |
    auipc   s5, %pcrel_hi(.L.str)                                                // |  5  :           :::^               |  0                                  |
    addi    s5, s5, %pcrel_lo(.LBB0_10)                                          // |  5  :           :::^               |  0                                  |
    li  s7, 9                                                                    // |  6  :           :::: ^             |  0                                  |
    lui a0, 524288                                                               // |  7  :           :::: :    ^        |  0                                  |
    addiw   s0, a0, 1                                                            // |  8  :         ^ :::: :    v        |  0                                  |
    j   .LBB0_4                                                                  // |  7  :         : :::: :             |  0                                  |
.LBB0_2:                                                                         // |                                    |                                     |
    li  s1, 0                                                                    // |  8  :         :^:::: :             |  0                                  |
.LBB0_3:                                                                         // |                                    |                                     |
    li  a0, 100                                                                  // |  9  :         :::::: :    ^        |  0                                  |
    call    malloc@plt                                                           // | 10 ^:         :::::: :    :        |  0                                  |
    add a1, s4, s8                                                               // | 11  :         ::::v: :v   :^       |  0                                  |
    sd  a0, 0(a1)                                                                // | 10  :         :::::: :    vv       |  0                                  |
    mv  a1, s5                                                                   // |  9  :         :::::v :     ^       |  0                                  |
    mv  a2, s1                                                                   // |  8  :         :v:::  :      ^      |  0                                  |
    mv  a3, s1                                                                   // |  8  :         :v:::  :       ^     |  0                                  |
    mv  a4, s1                                                                   // |  8  :         :v:::  :        ^    |  0                                  |
    call    sprintf@plt                                                          // |  7 ^:         : :::  :             |  0                                  |
    addi    s6, s6, 1                                                            // |  7  :         : ::: ^:             |  0                                  |
    beq s6, s3, .LBB0_9                                                          // |  7  :         : :v: v:             |  0                                  |
.LBB0_4:                                                                         // |                                    |                                     |
    slli    s8, s6, 3                                                            // |  7  :         : : : v:^            |  0                                  |
    add a0, s2, s8                                                               // |  7  :         : v :  :v   ^        |  0                                  |
    ld  a0, 0(a0)                                                                // |  5  :         :   :  :    v        |  0                                  |
    lbu a1, 0(a0)                                                                // |  6  :         :   :  :    v^       |  0                                  |
    beqz    a1, .LBB0_2                                                          // |  5  :         :   :  :     v       |  0                                  |
    li  s1, 0                                                                    // |  5  :         :^  :  :             |  0                                  |
    addi    a0, a0, 1                                                            // |  5  :         :   :  :    ^        |  0                                  |
    j   .LBB0_7                                                                  // |  5  :         :   :  :    :        |  0                                  |
.LBB0_6:                                                                         // |                                    |                                     |
    lbu a1, 0(a0)                                                                // |  6  :         :   :  :    v^       |  0                                  |
    addi    a0, a0, 1                                                            // |  6  :         :   :  :    ^:       |  0                                  |
    beqz    a1, .LBB0_3                                                          // |  5  :         :   :  :     v       |  0                                  |
.LBB0_7:                                                                         // |                                    |                                     |
    addiw   a2, a1, -48                                                          // |  6  :         :   :  :     v^      |  0                                  |
    andi    a2, a2, 255                                                          // |  5  :         :   :  :      ^      |  0                                  |
    bltu    s7, a2, .LBB0_6                                                      // |  5  :         :   :  v      v      |  0                                  |
    andi    a1, a1, 255                                                          // |  4  :         :   :        ^       |  0                                  |
    addi    a1, a1, -48                                                          // |  4  :         :   :        ^       |  0                                  |
    and a1, a1, s0                                                               // |  4  :         v   :        ^       |  0                                  |
    addi    a1, a1, -1                                                           // |  3  :             :        ^       |  0                                  |
    seqz    a1, a1                                                               // |  3  :             :        ^       |  0                                  |
    addw    s1, s1, a1                                                           // |  4  :          ^  :        v       |  0                                  |
    j   .LBB0_6                                                                  // |  2  :             :                |  0                                  |
.LBB0_9:                                                                         // |                                    |                                     |
    mv  a0, s4                                                                   // |  3  :             v       ^        |  0                                  |
    ld  ra, 72(sp)                                                               // |  2 ^v                              |  0                                  |
    ld  s0, 64(sp)                                                               // |  3 :v         ^                    |  0                                  |
    ld  s1, 56(sp)                                                               // |  3 :v          ^                   |  0                                  |
    ld  s2, 48(sp)                                                               // |  3 :v           ^                  |  0                                  |
    ld  s3, 40(sp)                                                               // |  3 :v            ^                 |  0                                  |
    ld  s4, 32(sp)                                                               // |  3 :v             ^                |  0                                  |
    ld  s5, 24(sp)                                                               // |  3 :v              ^               |  0                                  |
    ld  s6, 16(sp)                                                               // |  3 :v               ^              |  0                                  |
    ld  s7, 8(sp)                                                                // |  3 :v                ^             |  0                                  |
    ld  s8, 0(sp)                                                                // |  3 :v                 ^            |  0                                  |
    addi    sp, sp, 80                                                           // |  2 :^                              |  0                                  |
    ret                                                                          // |  1 v                               |  0                                  |
.Lfunc_end0:                                                                     // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                                             // |                                    |                                     |
    .type   .L.str,@object                                                       // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1                                 // |                                    |                                     |
.L.str:                                                                          // |                                    |                                     |
    .asciz  "the number of odd elements %d in the string %d of the %d input."    // |                                    |                                     |
    .size   .L.str, 64                                                           // |                                    |                                     |
    .ident  "Debian clang version 15.0.7"                                        // |                                    |                                     |
    .section    ".note.GNU-stack","",@progbits                                   // |                                    |                                     |
    .addrsig                                                                     // |                                    |                                     |
                                                                                 // +....................................+.....................................+
                                                                                 // Legend:
                                                                                 //     ^       : Register assignment (write)
                                                                                 //     v       : Register usage (read)
                                                                                 //     x       : Register usage and reassignment (R/W)
                                                                                 //     :       : Register in use (live)
                                                                                 //     <space> : Register not in use
                                                                                 //     #       : Number of occupied registers
