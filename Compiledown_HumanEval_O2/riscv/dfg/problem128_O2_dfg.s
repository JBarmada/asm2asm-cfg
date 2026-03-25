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
    blt a2, a0, .LBB0_2                                   // |  2                        v v      |  0                                  |
    mv  a0, a2                                            // |  2                        ^ v      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    blt a1, a3, .LBB0_4                                   // |  3                        :v v     |  0                                  |
    mv  a1, a3                                            // |  3                        :^ v     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    subw    a1, a1, a0                                    // |  2                        v^       |  0                                  |
    li  a2, 2                                             // |  2                         :^      |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str)                         // |  3                        ^::      |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_12)                   // |  3                        ^::      |  0                                  |
    bge a1, a2, .LBB0_6                                   // |  2                         vv      |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    ret                                                   // |  2 v                       :       |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a3, 4                                             // |  2                         : ^     |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    auipc   a2, %pcrel_hi(.L.str.1)                       // |  3                         :^:     |  0                                  |
    addi    a2, a2, %pcrel_lo(.LBB0_13)                   // |  3                         :^:     |  0                                  |
    bgeu    a1, a3, .LBB0_8                               // |  3                         v:v     |  0                                  |
    mv  a0, a2                                            // |  3                        ^:v      |  0                                  |
    ret                                                   // |  3 v                       ::      |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a3, 2                                             // |  3                         ::^     |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    remw    a4, a1, a3                                    // |  4                         v:v^    |  0                                  |
    beqz    a4, .LBB0_5                                   // |  3                         :: v    |  0                                  |
    addiw   a3, a3, 1                                     // |  3                         ::^     |  0                                  |
    mulw    a4, a3, a3                                    // |  4                         ::v^    |  0                                  |
    bge a1, a4, .LBB0_9                                   // |  3                         v: v    |  0                                  |
    mv  a0, a2                                            // |  2                        ^ v      |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "NO"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "YES"                                         // |                                    |                                     |
    .size   .L.str.1, 4                                   // |                                    |                                     |
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
