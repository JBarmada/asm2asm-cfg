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
    li  a2, 0                                             // |  1                          ^      |  0                                  |
    li  a3, 0                                             // |  1                           ^     |  0                                  |
    sraiw   a4, a0, 31                                    // |  2                        v   ^    |  0                                  |
    xor a0, a0, a4                                        // |  2                        ^   v    |  0                                  |
    subw    a5, a0, a4                                    // |  3                        v   v^   |  0                                  |
    lui a0, 419430                                        // |  2                        ^    :   |  0                                  |
    addiw   a7, a0, 1639                                  // |  3                        v    : ^ |  0                                  |
    li  a6, 9                                             // |  3                             :^: |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    mv  t0, a5                                            // |  4     ^                       v:: |  0                                  |
    mul a5, a5, a7                                        // |  4     :                       ^:v |  0                                  |
    srli    a0, a5, 63                                    // |  4     :                  ^    v:  |  0                                  |
    srai    a5, a5, 34                                    // |  4     :                  :    ^:  |  0                                  |
    addw    a5, a5, a0                                    // |  4     :                  v    ^:  |  0                                  |
    andi    a0, t0, 1                                     // |  3     v                  ^     :  |  0                                  |
    xori    a4, a0, 1                                     // |  4     :                  v   ^ :  |  0                                  |
    addw    a2, a2, a4                                    // |  5     :                  : ^ v :  |  0                                  |
    addw    a3, a3, a0                                    // |  5     :                  v :^  :  |  0                                  |
    blt a6, t0, .LBB0_1                                   // |  4     v                    ::  v  |  0                                  |
    sw  a2, 0(a1)                                         // |  3                         vv:     |  0                                  |
    sw  a3, 4(a1)                                         // |  2                         v v     |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
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
