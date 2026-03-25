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
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    mv  s5, a1                                            // |  4  :           :  ^       v       |  0                                  |
    mv  s0, a0                                            // |  5  :         ^ :  :      v        |  0                                  |
.LBB0_39:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str)                         // |  5  :         :^:  :               |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_39)                   // |  5  :         :^:  :               |  0                                  |
    mv  a0, s1                                            // |  6  :         :v:  :      ^        |  0                                  |
    mv  a1, s0                                            // |  7  :         v::  :      :^       |  0                                  |
    call    strcmp@plt                                    // |  7 ^:         :::  :      :        |  0                                  |
    mv  s4, a0                                            // |  7  :         ::: ^:      v        |  0                                  |
    mv  a0, s1                                            // |  7  :         :v: ::      ^        |  0                                  |
    mv  a1, s5                                            // |  7  :         : : :v      :^       |  0                                  |
    call    strcmp@plt                                    // |  7 ^:         : : ::      :        |  0                                  |
    mv  s3, a0                                            // |  7  :         : :^::      v        |  0                                  |
.LBB0_40:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.1)                       // |  7  :         :^::::               |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_40)                   // |  7  :         :^::::               |  0                                  |
    mv  a0, s1                                            // |  8  :         :v::::      ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v:::::      :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         ::::::      :        |  0                                  |
    li  s6, 1                                             // |  9  :         ::::::^     :        |  0                                  |
    li  s7, 1                                             // |  9  :         :::::: ^    :        |  0                                  |
    beqz    a0, .LBB0_2                                   // |  8  :         ::::::      v        |  0                                  |
    snez    a0, s4                                        // |  8  :         ::::v:      ^        |  0                                  |
    negw    s7, a0                                        // |  8  :         :::: : ^    v        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v:: : :    ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : :: v :    :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : :: : :    :        |  0                                  |
    beqz    a0, .LBB0_4                                   // |  7  :         : :: : :    v        |  0                                  |
    snez    a0, s3                                        // |  7  :         : :v : :    ^        |  0                                  |
    negw    s6, a0                                        // |  7  :         : :  :^:    v        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
.LBB0_41:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.2)                       // |  7  :         :^:  :::             |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_41)                   // |  7  :         :^:  :::             |  0                                  |
    mv  a0, s1                                            // |  8  :         :v:  :::    ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v::  :::    :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         :::  :::    :        |  0                                  |
    li  s3, 2                                             // |  9  :         :::^ :::    :        |  0                                  |
    li  s8, 2                                             // |  9  :         :::  :::^   :        |  0                                  |
    beqz    a0, .LBB0_6                                   // |  8  :         :::  :::    v        |  0                                  |
    mv  s8, s7                                            // |  8  :         :::  ::v^            |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v:  :: :   ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : :  v: :   :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : :  :: :   :        |  0                                  |
    beqz    a0, .LBB0_8                                   // |  7  :         : :  :: :   v        |  0                                  |
    mv  s3, s6                                            // |  7  :         : :^ :v :            |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
.LBB0_42:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.3)                       // |  7  :         :^:: :  :            |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_42)                   // |  7  :         :^:: :  :            |  0                                  |
    mv  a0, s1                                            // |  8  :         :v:: :  :   ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v::: :  :   :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         :::: :  :   :        |  0                                  |
    li  s4, 3                                             // |  9  :         ::::^:  :   :        |  0                                  |
    li  s6, 3                                             // |  9  :         :::: :^ :   :        |  0                                  |
    beqz    a0, .LBB0_10                                  // |  8  :         :::: :  :   v        |  0                                  |
    mv  s6, s8                                            // |  8  :         :::: :^ v            |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v:: ::     ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : :: v:     :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : :: ::     :        |  0                                  |
    beqz    a0, .LBB0_12                                  // |  7  :         : :: ::     v        |  0                                  |
    mv  s4, s3                                            // |  7  :         : :v^::              |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
.LBB0_43:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.4)                       // |  7  :         :^: :::              |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_43)                   // |  7  :         :^: :::              |  0                                  |
    mv  a0, s1                                            // |  8  :         :v: :::     ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v:: :::     :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         ::: :::     :        |  0                                  |
    li  s3, 4                                             // |  9  :         :::^:::     :        |  0                                  |
    li  s7, 4                                             // |  9  :         ::: :::^    :        |  0                                  |
    beqz    a0, .LBB0_14                                  // |  8  :         ::: :::     v        |  0                                  |
    mv  s7, s6                                            // |  8  :         ::: ::v^             |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v: :: :    ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : : :v :    :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : : :: :    :        |  0                                  |
    beqz    a0, .LBB0_16                                  // |  7  :         : : :: :    v        |  0                                  |
    mv  s3, s4                                            // |  7  :         : :^v: :             |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
.LBB0_44:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.5)                       // |  7  :         :^:: : :             |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_44)                   // |  7  :         :^:: : :             |  0                                  |
    mv  a0, s1                                            // |  8  :         :v:: : :    ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v::: : :    :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         :::: : :    :        |  0                                  |
    li  s4, 5                                             // |  9  :         ::::^: :    :        |  0                                  |
    li  s6, 5                                             // |  9  :         :::: :^:    :        |  0                                  |
    beqz    a0, .LBB0_18                                  // |  8  :         :::: : :    v        |  0                                  |
    mv  s6, s7                                            // |  8  :         :::: :^v             |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v:: ::     ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : :: v:     :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : :: ::     :        |  0                                  |
    beqz    a0, .LBB0_20                                  // |  7  :         : :: ::     v        |  0                                  |
    mv  s4, s3                                            // |  7  :         : :v^::              |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
.LBB0_45:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.6)                       // |  7  :         :^: :::              |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_45)                   // |  7  :         :^: :::              |  0                                  |
    mv  a0, s1                                            // |  8  :         :v: :::     ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v:: :::     :^       |  0                                  |
    call    strcmp@plt                                    // |  9 ^:         ::: :::     :        |  0                                  |
    li  s3, 6                                             // |  9  :         :::^:::     :        |  0                                  |
    li  s7, 6                                             // |  9  :         ::: :::^    :        |  0                                  |
    beqz    a0, .LBB0_22                                  // |  8  :         ::: :::     v        |  0                                  |
    mv  s7, s6                                            // |  8  :         ::: ::v^             |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  8  :         :v: :: :    ^        |  0                                  |
    mv  a1, s5                                            // |  8  :         : : :v :    :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:         : : :: :    :        |  0                                  |
    beqz    a0, .LBB0_24                                  // |  7  :         : : :: :    v        |  0                                  |
    mv  s3, s4                                            // |  7  :         : :^v: :             |  0                                  |
.LBB0_24:                                                 // |                                    |                                     |
.LBB0_46:                                                 // |                                    |                                     |
    auipc   s1, %pcrel_hi(.L.str.7)                       // |  7  :         :^:: : :             |  0                                  |
    addi    s1, s1, %pcrel_lo(.LBB0_46)                   // |  7  :         :^:: : :             |  0                                  |
    mv  a0, s1                                            // |  8  :         :v:: : :    ^        |  0                                  |
    mv  a1, s0                                            // |  9  :         v::: : :    :^       |  0                                  |
    call    strcmp@plt                                    // |  8 ^:          ::: : :    :        |  0                                  |
    li  s4, 7                                             // |  8  :          :::^: :    :        |  0                                  |
    li  s0, 7                                             // |  8  :         ^::: : :    :        |  0                                  |
    beqz    a0, .LBB0_26                                  // |  7  :          ::: : :    v        |  0                                  |
    mv  s0, s7                                            // |  7  :         ^::: : v             |  0                                  |
.LBB0_26:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  7  :         :v:: :      ^        |  0                                  |
    mv  a1, s5                                            // |  7  :         : :: v      :^       |  0                                  |
    call    strcmp@plt                                    // |  6 ^:         : ::        :        |  0                                  |
    beqz    a0, .LBB0_28                                  // |  5  :         : ::        v        |  0                                  |
    mv  s4, s3                                            // |  5  :         : :v^                |  0                                  |
.LBB0_28:                                                 // |                                    |                                     |
    addi    a0, s0, 1                                     // |  5  :         v : :       ^        |  0                                  |
    seqz    a0, a0                                        // |  5  :         : : :       ^        |  0                                  |
    addi    a1, s4, 1                                     // |  5  :         : : v        ^       |  0                                  |
    seqz    a1, a1                                        // |  5  :         : : :        ^       |  0                                  |
    or  a0, a0, a1                                        // |  6  :         : : :       ^v       |  0                                  |
    xor a1, s0, s4                                        // |  5  :         v : v        ^       |  0                                  |
    seqz    a1, a1                                        // |  5  :         : : :        ^       |  0                                  |
    or  a0, a0, a1                                        // |  6  :         : : :       ^v       |  0                                  |
    bnez    a0, .LBB0_37                                  // |  5  :         : : :       v        |  0                                  |
    mv  s1, s0                                            // |  5  :         v^: :                |  0                                  |
    blt s4, s0, .LBB0_31                                  // |  4  :         v : v                |  0                                  |
    mv  s1, s4                                            // |  5  :         :^: v                |  0                                  |
.LBB0_31:                                                 // |                                    |                                     |
    blt s0, s4, .LBB0_33                                  // |  5  :         v:: v                |  0                                  |
    mv  s0, s4                                            // |  5  :         ^:: v                |  0                                  |
.LBB0_33:                                                 // |                                    |                                     |
    not a0, s0                                            // |  5  :         v::         ^        |  0                                  |
    addw    a0, a0, s1                                    // |  5  :         :v:         ^        |  0                                  |
    sw  a0, 0(s2)                                         // |  5  :         ::v         v        |  0                                  |
    blez    a0, .LBB0_37                                  // |  5  :         :::         v        |  0                                  |
    slli    a0, a0, 3                                     // |  5  :         :::         ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:         :::         :        |  0                                  |
    addiw   a1, s0, 1                                     // |  6  :         v::         :^       |  0                                  |
    bgeu    a1, s1, .LBB0_38                              // |  6  :         :v:         :v       |  0                                  |
    slli    a1, a1, 32                                    // |  6  :         :::         :^       |  0                                  |
    srli    a2, a1, 32                                    // |  7  :         :::         :v^      |  0                                  |
    srli    a3, a1, 30                                    // |  8  :         :::         :v:^     |  0                                  |
.LBB0_47:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.Lreltable.func0)               // |  7  :         :::         :^:      |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_47)                   // |  7  :         :::         :^:      |  0                                  |
    add a3, a3, a1                                        // |  8  :         :::         :v:^     |  0                                  |
    mv  a4, s0                                            // |  9  :         v::         ::::^    |  0                                  |
.LBB0_36:                                                 // |                                    |                                     |
    lw  a5, 0(a3)                                         // |  9  :         :::         :::v ^   |  0                                  |
    add a5, a5, a1                                        // |  8  :         :::         :v:  ^   |  0                                  |
    subw    a4, a4, s0                                    // |  8  :         v::         : : ^:   |  0                                  |
    slli    a4, a4, 3                                     // |  7  :          ::         : : ^:   |  0                                  |
    add a4, a4, a0                                        // |  7  :          ::         v : ^:   |  0                                  |
    sd  a5, 0(a4)                                         // |  6  :          ::           : vv   |  0                                  |
    mv  a4, a2                                            // |  5  :          ::           v ^    |  0                                  |
    addiw   a5, a2, 1                                     // |  5  :          ::           v  ^   |  0                                  |
    addi    a2, a2, 1                                     // |  5  :          ::           ^  :   |  0                                  |
    addi    a3, a3, 4                                     // |  5  :          ::            ^ :   |  0                                  |
    bne s1, a5, .LBB0_36                                  // |  4  :          v:              v   |  0                                  |
    j   .LBB0_38                                          // |  2  :           :                  |  0                                  |
.LBB0_37:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  3  :           :         ^        |  0                                  |
    sw  zero, 0(s2)                                       // |  2  :           v                  |  0                                  |
.LBB0_38:                                                 // |                                    |                                     |
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
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "Mercury"                                     // |                                    |                                     |
    .size   .L.str, 8                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "Venus"                                       // |                                    |                                     |
    .size   .L.str.1, 6                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  "Earth"                                       // |                                    |                                     |
    .size   .L.str.2, 6                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  "Mars"                                        // |                                    |                                     |
    .size   .L.str.3, 5                                   // |                                    |                                     |
    .type   .L.str.4,@object                              // |                                    |                                     |
.L.str.4:                                                 // |                                    |                                     |
    .asciz  "Jupiter"                                     // |                                    |                                     |
    .size   .L.str.4, 8                                   // |                                    |                                     |
    .type   .L.str.5,@object                              // |                                    |                                     |
.L.str.5:                                                 // |                                    |                                     |
    .asciz  "Saturn"                                      // |                                    |                                     |
    .size   .L.str.5, 7                                   // |                                    |                                     |
    .type   .L.str.6,@object                              // |                                    |                                     |
.L.str.6:                                                 // |                                    |                                     |
    .asciz  "Uranus"                                      // |                                    |                                     |
    .size   .L.str.6, 7                                   // |                                    |                                     |
    .type   .L.str.7,@object                              // |                                    |                                     |
.L.str.7:                                                 // |                                    |                                     |
    .asciz  "Neptune"                                     // |                                    |                                     |
    .size   .L.str.7, 8                                   // |                                    |                                     |
    .type   .Lreltable.func0,@object                      // |                                    |                                     |
    .section    .rodata,"a",@progbits                     // |                                    |                                     |
    .p2align    2                                         // |                                    |                                     |
.Lreltable.func0:                                         // |                                    |                                     |
    .word   .L.str-.Lreltable.func0                       // |                                    |                                     |
    .word   .L.str.1-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.2-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.3-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.4-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.5-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.6-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.7-.Lreltable.func0                     // |                                    |                                     |
    .size   .Lreltable.func0, 32                          // |                                    |                                     |
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
