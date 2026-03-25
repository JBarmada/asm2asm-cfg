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
    li  a6, 0                                             // |  1                              ^  |  0                                  |
    blez    a1, .LBB0_3                                   // |  1                         v       |  0                                  |
    mv  a5, a1                                            // |  2                         v   ^   |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a4, 0(a0)                                         // |  2                        v   ^    |  0                                  |
    not a4, a4                                            // |  1                            ^    |  0                                  |
    andi    a4, a4, 1                                     // |  1                            ^    |  0                                  |
    addw    a6, a4, a6                                    // |  2                            v ^  |  0                                  |
    addi    a5, a5, -1                                    // |  1                             ^   |  0                                  |
    addi    a0, a0, 4                                     // |  2                        ^    :   |  0                                  |
    bnez    a5, .LBB0_2                                   // |  1                             v   |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    blez    a3, .LBB0_5                                   // |  1                           v     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lw  a0, 0(a2)                                         // |  2                        ^ v      |  0                                  |
    not a0, a0                                            // |  1                        ^        |  0                                  |
    andi    a0, a0, 1                                     // |  1                        ^        |  0                                  |
    addw    a6, a0, a6                                    // |  2                        v     ^  |  0                                  |
    addi    a3, a3, -1                                    // |  2                           ^  :  |  0                                  |
    addi    a2, a2, 4                                     // |  3                          ^:  :  |  0                                  |
    bnez    a3, .LBB0_4                                   // |  2                           v  :  |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    blt a6, a1, .LBB0_7                                   // |  2                         v    v  |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str)                         // |  1                        ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_8)                    // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
.LBB0_9:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str.1)                       // |  1                        ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_9)                    // |  1                        ^        |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "YES"                                         // |                                    |                                     |
    .size   .L.str, 4                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "NO"                                          // |                                    |                                     |
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
