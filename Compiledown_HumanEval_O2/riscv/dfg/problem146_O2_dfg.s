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
    mv  s7, a1                                            // |  3  :                ^     v       |  0                                  |
    mv  s2, a0                                            // |  4  :           ^    :    v        |  0                                  |
    slli    a0, a1, 2                                     // |  5  :           :    :    ^v       |  0                                  |
    call    malloc@plt                                    // |  5 ^:           :    :    :        |  0                                  |
    mv  s3, a0                                            // |  5  :           :^   :    v        |  0                                  |
    blez    s7, .LBB0_19                                  // |  4  :           ::   v             |  0                                  |
    li  s0, 0                                             // |  5  :         ^ ::   :             |  0                                  |
    addi    s5, sp, 5                                     // |  5  v           :: ^ :             |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
    auipc   s4, %pcrel_hi(.L.str)                         // |  6  :           ::^: :             |  0                                  |
    addi    s4, s4, %pcrel_lo(.LBB0_20)                   // |  6  :           ::^: :             |  0                                  |
    li  s6, 2                                             // |  7  :           ::::^:             |  0                                  |
    j   .LBB0_4                                           // |  7  :           ::::::             |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sub a0, a1, a0                                        // |  9  :           ::::::    ^v       |  0                                  |
    addi    a0, a0, 48                                    // |  8  :           ::::::    ^        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a1, s3, s8                                        // | 10  :           :v::::v   :^       |  0                                  |
    addi    s0, s0, 1                                     // | 10  :         ^ ::::::    ::       |  0                                  |
    sw  a0, 0(a1)                                         // | 10  :         : ::::::    vv       |  0                                  |
    beq s0, s7, .LBB0_10                                  // |  8  :         v :::::v             |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    slli    s8, s0, 2                                     // |  9  :         v ::::::^            |  0                                  |
    add s1, s2, s8                                        // |  9  :          ^v:::::v            |  0                                  |
    lw  a0, 0(s1)                                         // |  9  :          v::::::    ^        |  0                                  |
    sraiw   a1, a0, 31                                    // | 10  :          :::::::    v^       |  0                                  |
    xor a0, a0, a1                                        // | 10  :          :::::::    ^v       |  0                                  |
    subw    a2, a0, a1                                    // | 11  :          :::::::    vv^      |  0                                  |
    addi    a0, sp, 4                                     // |  9  v          :::::::    ^        |  0                                  |
    mv  a1, s4                                            // |  9  :          :::v:::     ^       |  0                                  |
    call    sprintf@plt                                   // |  8 ^:          ::: :::             |  0                                  |
    addi    a0, sp, 4                                     // |  8  v          ::: :::    ^        |  0                                  |
    call    strlen@plt                                    // |  9 ^:          ::: :::    :        |  0                                  |
    sext.w  a1, a0                                        // |  9  :          ::: :::    v^       |  0                                  |
    blt a1, s6, .LBB0_7                                   // |  8  :          ::: :v:     v       |  0                                  |
    li  a1, 0                                             // |  7  :          ::: : :     ^       |  0                                  |
    slli    a0, a0, 32                                    // |  7  :          ::: : :    ^        |  0                                  |
    srli    a0, a0, 32                                    // |  7  :          ::: : :    ^        |  0                                  |
    addi    a0, a0, -1                                    // |  7  :          ::: : :    ^        |  0                                  |
    mv  a2, s5                                            // |  7  :          ::: v :      ^      |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lbu a3, 0(a2)                                         // |  7  :          :::   :      v^     |  0                                  |
    addw    a1, a1, a3                                    // |  7  :          :::   :     ^ v     |  0                                  |
    addiw   a1, a1, -48                                   // |  6  :          :::   :     ^       |  0                                  |
    addi    a0, a0, -1                                    // |  6  :          :::   :    ^        |  0                                  |
    addi    a2, a2, 1                                     // |  7  :          :::   :    : ^      |  0                                  |
    bnez    a0, .LBB0_6                                   // |  6  :          :::   :    v        |  0                                  |
    j   .LBB0_8                                           // |  5  :          :::   :             |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  6  :          :::   :     ^       |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    lw  a2, 0(s1)                                         // |  7  :          v::   :     :^      |  0                                  |
    lbu a0, 4(sp)                                         // |  8  v          :::   :    ^::      |  0                                  |
    blez    a2, .LBB0_2                                   // |  7  :          :::   :     :v      |  0                                  |
    add a0, a0, a1                                        // |  7  :          :::   :    ^v       |  0                                  |
    addi    a0, a0, -48                                   // |  6  :          :::   :    ^        |  0                                  |
    j   .LBB0_3                                           // |  5  :          :::   :             |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    blez    s7, .LBB0_19                                  // |  5  :          :::   v             |  0                                  |
    li  a0, 0                                             // |  6  :          :::   :    ^        |  0                                  |
    addi    a7, s3, 4                                     // |  6  :          ::v   :           ^ |  0                                  |
    addi    t0, s2, 4                                     // |  7  :  ^       :v:   :           : |  0                                  |
    addi    a3, s7, -1                                    // |  8  :  :       :::   v       ^   : |  0                                  |
    li  a6, 1                                             // |  9  :  :       :::   :       :  ^: |  0                                  |
    j   .LBB0_13                                          // |  9  :  :       :::   :       :  :: |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    addiw   a0, a0, 1                                     // | 10  :  :       :::   :    ^  :  :: |  0                                  |
    bge a0, s7, .LBB0_19                                  // | 10  :  :       :::   v    v  :  :: |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    beq s7, a6, .LBB0_12                                  // |  9  :  :       :::   v       :  v: |  0                                  |
    lw  a4, 0(s3)                                         // |  8  :  :       ::v           :^  : |  0                                  |
    mv  a5, a3                                            // |  9  :  :       :::           v:^ : |  0                                  |
    mv  a2, t0                                            // |  8  :  v       :::          ^ :  : |  0                                  |
    mv  a1, a7                                            // |  8  :          :::         ^: :  v |  0                                  |
    j   .LBB0_17                                          // |  7  :          :::         :: :    |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    sw  a4, 0(a1)                                         // |  7  :          :::         v: v    |  0                                  |
    sw  s1, -4(a1)                                        // |  7  :          v::         v: :    |  0                                  |
    lw  s1, -4(a2)                                        // |  6  :          ^::          v :    |  0                                  |
    lw  s0, 0(a2)                                         // |  7  :         ^:::          v :    |  0                                  |
    sw  s1, 0(a2)                                         // |  7  :         :v::          v :    |  0                                  |
    sw  s0, -4(a2)                                        // |  6  :         v ::          v :    |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    addi    a1, a1, 4                                     // |  5  :           ::         ^  :    |  0                                  |
    addi    a5, a5, -1                                    // |  6  :           ::         :  :^   |  0                                  |
    addi    a2, a2, 4                                     // |  7  :           ::         :^ ::   |  0                                  |
    beqz    a5, .LBB0_12                                  // |  6  :           ::         :  :v   |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    lw  s1, 0(a1)                                         // |  6  :          ^::         v  :    |  0                                  |
    blt s1, a4, .LBB0_15                                  // |  5  :          v::            v    |  0                                  |
    mv  a4, s1                                            // |  5  :          v::            ^    |  0                                  |
    j   .LBB0_16                                          // |  3  :           ::                 |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  4  :           :v        ^        |  0                                  |
    call    free@plt                                      // |  3 ^:           :                  |  0                                  |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
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
    addi    sp, sp, 96                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "%d"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
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
