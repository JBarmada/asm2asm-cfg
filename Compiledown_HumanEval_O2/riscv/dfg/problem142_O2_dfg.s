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
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:         :                    |  0                                  |
    mv  s1, a0                                            // |  4  :         :^          v        |  0                                  |
    sext.w  a0, a0                                        // |  4  :         ::          ^        |  0                                  |
    li  a1, 5                                             // |  5  :         ::          :^       |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  6  :         ::^         ::       |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_12)                   // |  6  :         ::^         ::       |  0                                  |
    blt a0, a1, .LBB0_11                                  // |  5  :         ::          vv       |  0                                  |
    lbu a0, 0(s0)                                         // |  4  :         v:          ^        |  0                                  |
    li  a1, 65                                            // |  5  :         ::          :^       |  0                                  |
    bltu    a0, a1, .LBB0_11                              // |  5  :         ::          vv       |  0                                  |
    addiw   a1, a0, -91                                   // |  5  :         ::          v^       |  0                                  |
    andi    a1, a1, 255                                   // |  4  :         ::           ^       |  0                                  |
    sltiu   a1, a1, 6                                     // |  4  :         ::           ^       |  0                                  |
    sltiu   a0, a0, 123                                   // |  5  :         ::          ^:       |  0                                  |
    xori    a0, a0, 1                                     // |  5  :         ::          ^:       |  0                                  |
    or  a0, a0, a1                                        // |  5  :         ::          ^v       |  0                                  |
    bnez    a0, .LBB0_11                                  // |  4  :         ::          v        |  0                                  |
    slli    a0, s1, 32                                    // |  4  :         :v          ^        |  0                                  |
    srli    a0, a0, 32                                    // |  4  :         ::          ^        |  0                                  |
    add a0, a0, s0                                        // |  4  :         v:          ^        |  0                                  |
    addi    s3, a0, -4                                    // |  5  :         :: ^        v        |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str.1)                       // |  5  :         :: :         ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_13)                   // |  5  :         :: :         ^       |  0                                  |
    mv  a0, s3                                            // |  5  :         :: v        ^        |  0                                  |
    call    strcmp@plt                                    // |  6 ^:         :: :        :        |  0                                  |
    beqz    a0, .LBB0_6                                   // |  5  :         :: :        v        |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str.2)                       // |  5  :         :: :         ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_14)                   // |  5  :         :: :         ^       |  0                                  |
    mv  a0, s3                                            // |  5  :         :: v        ^        |  0                                  |
    call    strcmp@plt                                    // |  6 ^:         :: :        :        |  0                                  |
    beqz    a0, .LBB0_6                                   // |  5  :         :: :        v        |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str.3)                       // |  5  :         :: :         ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_15)                   // |  5  :         :: :         ^       |  0                                  |
    mv  a0, s3                                            // |  5  :         :: v        ^        |  0                                  |
    call    strcmp@plt                                    // |  5 ^:         ::          :        |  0                                  |
    bnez    a0, .LBB0_11                                  // |  4  :         ::          v        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  4  :         ::           ^       |  0                                  |
    li  a0, 0                                             // |  4  :         ::          ^        |  0                                  |
    li  a2, -1                                            // |  4  :         ::            ^      |  0                                  |
    srli    a2, a2, 32                                    // |  4  :         ::            ^      |  0                                  |
    and a2, a2, s1                                        // |  4  :         :v            ^      |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lbu a3, 0(s0)                                         // |  3  :         v              ^     |  0                                  |
    addiw   a4, a3, -48                                   // |  3  :                        v^    |  0                                  |
    andi    a4, a4, 255                                   // |  2  :                         ^    |  0                                  |
    sltiu   a4, a4, 10                                    // |  2  :                         ^    |  0                                  |
    addw    a1, a1, a4                                    // |  3  :                      ^  v    |  0                                  |
    addi    a3, a3, -46                                   // |  2  :                        ^     |  0                                  |
    seqz    a3, a3                                        // |  2  :                        ^     |  0                                  |
    addw    a0, a0, a3                                    // |  3  :                     ^  v     |  0                                  |
    addi    a2, a2, -1                                    // |  2  :                       ^      |  0                                  |
    addi    s0, s0, 1                                     // |  3  :         ^             :      |  0                                  |
    bnez    a2, .LBB0_7                                   // |  2  :                       v      |  0                                  |
    sltiu   a1, a1, 4                                     // |  2  :                      ^       |  0                                  |
    xori    a1, a1, 1                                     // |  2  :                      ^       |  0                                  |
    addi    a0, a0, -1                                    // |  3  :                     ^:       |  0                                  |
    snez    a0, a0                                        // |  3  :                     ^:       |  0                                  |
    or  a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    bnez    a0, .LBB0_10                                  // |  2  :                     v        |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str.4)                       // |  2  :           ^                  |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_16)                   // |  2  :           ^                  |  0                                  |
    j   .LBB0_11                                          // |  1  :                              |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
.LBB0_17:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  2  :           ^                  |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_17)                   // |  2  :           ^                  |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "No"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  ".txt"                                        // |                                    |                                     |
    .size   .L.str.1, 5                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  ".exe"                                        // |                                    |                                     |
    .size   .L.str.2, 5                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  ".dll"                                        // |                                    |                                     |
    .size   .L.str.3, 5                                   // |                                    |                                     |
    .type   .L.str.4,@object                              // |                                    |                                     |
.L.str.4:                                                 // |                                    |                                     |
    .asciz  "Yes"                                         // |                                    |                                     |
    .size   .L.str.4, 4                                   // |                                    |                                     |
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
