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
    sraiw   a2, a0, 31                                    // |  2                        v ^      |  0                                  |
    xor a0, a0, a2                                        // |  2                        ^ v      |  0                                  |
    subw    a0, a0, a2                                    // |  2                        ^ v      |  0                                  |
    slli    a2, a0, 32                                    // |  2                        v ^      |  0                                  |
    srli    a2, a2, 32                                    // |  1                          ^      |  0                                  |
    lui a3, 205                                           // |  1                           ^     |  0                                  |
    addiw   a3, a3, -819                                  // |  1                           ^     |  0                                  |
    slli    a3, a3, 12                                    // |  1                           ^     |  0                                  |
    addi    a3, a3, -819                                  // |  1                           ^     |  0                                  |
    mul a2, a2, a3                                        // |  2                          ^v     |  0                                  |
    srli    a2, a2, 35                                    // |  2                          ^:     |  0                                  |
    li  a4, 10                                            // |  2                           :^    |  0                                  |
    mulw    a2, a2, a4                                    // |  3                          ^:v    |  0                                  |
    subw    a0, a0, a2                                    // |  4                        ^ v::    |  0                                  |
    sraiw   a2, a1, 31                                    // |  4                         v^::    |  0                                  |
    xor a1, a1, a2                                        // |  4                         ^v::    |  0                                  |
    subw    a1, a1, a2                                    // |  4                         ^v::    |  0                                  |
    slli    a2, a1, 32                                    // |  4                         v^::    |  0                                  |
    srli    a2, a2, 32                                    // |  3                          ^::    |  0                                  |
    mul a2, a2, a3                                        // |  3                          ^v:    |  0                                  |
    srli    a2, a2, 35                                    // |  2                          ^ :    |  0                                  |
    mulw    a2, a2, a4                                    // |  2                          ^ v    |  0                                  |
    subw    a1, a1, a2                                    // |  2                         ^v      |  0                                  |
    mulw    a0, a1, a0                                    // |  2                        ^v       |  0                                  |
    slli    a0, a0, 32                                    // |  1                        ^        |  0                                  |
    srli    a0, a0, 32                                    // |  1                        ^        |  0                                  |
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
