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
    addi    sp, sp, -432                                  // |  1  ^                              |  0                                  |
    sd  ra, 424(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 416(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 408(sp)                                       // |  2  v          v                   |  0                                  |
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    addi    a0, sp, 8                                     // |  3  v         :           ^        |  0                                  |
    li  a2, 400                                           // |  3  :         :             ^      |  0                                  |
    addi    s1, sp, 8                                     // |  3  v         :^                   |  0                                  |
    li  a1, 0                                             // |  4  :         ::           ^       |  0                                  |
    call    memset@plt                                    // |  4 ^:         ::                   |  0                                  |
    li  a0, 1                                             // |  4  :         ::          ^        |  0                                  |
    li  a1, 3                                             // |  5  :         ::          :^       |  0                                  |
    sw  a0, 16(sp)                                        // |  5  v         ::          v:       |  0                                  |
    blt s0, a1, .LBB0_3                                   // |  4  :         v:           v       |  0                                  |
    li  a3, 0                                             // |  4  :         ::             ^     |  0                                  |
    addiw   a1, s0, 1                                     // |  5  :         v:           ^ :     |  0                                  |
    slli    a1, a1, 32                                    // |  5  :         ::           ^ :     |  0                                  |
    srli    a2, a1, 32                                    // |  6  :         ::           v^:     |  0                                  |
    addi    a1, sp, 20                                    // |  5  v         ::           ^ :     |  0                                  |
    addi    a2, a2, -3                                    // |  6  :         ::           :^:     |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a4, -8(a1)                                        // |  6  :         ::           v :^    |  0                                  |
    addw    a0, a0, a4                                    // |  7  :         ::          ^: :v    |  0                                  |
    addw    a0, a0, a3                                    // |  7  :         ::          ^: v:    |  0                                  |
    sw  a0, 0(a1)                                         // |  6  :         ::          vv  :    |  0                                  |
    addi    a2, a2, -1                                    // |  5  :         ::            ^ :    |  0                                  |
    addi    a1, a1, 4                                     // |  6  :         ::           ^: :    |  0                                  |
    mv  a3, a4                                            // |  6  :         ::            :^v    |  0                                  |
    bnez    a2, .LBB0_2                                   // |  4  :         ::            v      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, s0, 2                                     // |  4  :         v:          ^        |  0                                  |
    add a0, a0, s1                                        // |  3  :          v          ^        |  0                                  |
    lw  a0, 0(a0)                                         // |  2  :                     v        |  0                                  |
    ld  ra, 424(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 416(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 408(sp)                                       // |  3 :v          ^                   |  0                                  |
    addi    sp, sp, 432                                   // |  2 :^                              |  0                                  |
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
