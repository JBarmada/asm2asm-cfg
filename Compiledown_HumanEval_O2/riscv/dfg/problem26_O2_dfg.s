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
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    mv  s1, a1                                            // |  3  :          ^           v       |  0                                  |
    mv  s0, a0                                            // |  4  :         ^:          v        |  0                                  |
    li  a0, 256                                           // |  4  :         ::          ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:         ::          :        |  0                                  |
    li  a2, 4                                             // |  5  :         ::          : ^      |  0                                  |
    sw  zero, 0(s1)                                       // |  5  :         :v          : :      |  0                                  |
    li  a1, 0                                             // |  6  :         ::          :^:      |  0                                  |
    bge s0, a2, .LBB0_4                                   // |  6  :         v:          ::v      |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    sext.w  a2, s0                                        // |  6  :         v:          ::^      |  0                                  |
    li  a3, 1                                             // |  7  :         ::          :::^     |  0                                  |
    bge a3, a2, .LBB0_3                                   // |  7  :         ::          ::vv     |  0                                  |
    addiw   a2, a1, 1                                     // |  6  :         ::          :v^      |  0                                  |
    sw  a2, 0(s1)                                         // |  5  :         :v          : v      |  0                                  |
    sext.w  a1, a1                                        // |  4  :         :           :^       |  0                                  |
    slli    a1, a1, 2                                     // |  4  :         :           :^       |  0                                  |
    add a1, a1, a0                                        // |  4  :         :           v^       |  0                                  |
    sw  s0, 0(a1)                                         // |  4  :         v           :v       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  3 ^v                     :        |  0                                  |
    ld  s0, 16(sp)                                        // |  4 :v         ^           :        |  0                                  |
    ld  s1, 8(sp)                                         // |  5 :v         :^          :        |  0                                  |
    addi    sp, sp, 32                                    // |  5 :^         ::          :        |  0                                  |
    ret                                                   // |  4 v          ::          :        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a2, 2                                             // |  4            ::          : ^      |  0                                  |
    j   .LBB0_6                                           // |  3            ::          :        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  4            ::          : ^      |  0                                  |
    mulw    a3, a2, a2                                    // |  5            ::          : v^     |  0                                  |
    sext.w  a4, s0                                        // |  6            v:          : ::^    |  0                                  |
    blt a4, a3, .LBB0_1                                   // |  6            ::          : :vv    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    remw    a3, s0, a2                                    // |  5            v:          : v^     |  0                                  |
    bnez    a3, .LBB0_5                                   // |  4             :          : :v     |  0                                  |
    sext.w  a1, a1                                        // |  4             :          :^:      |  0                                  |
    slli    a3, a1, 2                                     // |  5             :          :v:^     |  0                                  |
    add a3, a3, a0                                        // |  4             :          v :^     |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    divw    s0, s0, a2                                    // |  4            ^:            v:     |  0                                  |
    addi    a1, a1, 1                                     // |  5            ::           ^::     |  0                                  |
    sw  a2, 0(a3)                                         // |  5            ::           :vv     |  0                                  |
    remw    a4, s0, a2                                    // |  5            v:           :v ^    |  0                                  |
    addi    a3, a3, 4                                     // |  4             :           : ^:    |  0                                  |
    beqz    a4, .LBB0_8                                   // |  3             :           :  v    |  0                                  |
    sw  a1, 0(s1)                                         // |  2             v           v       |  0                                  |
    j   .LBB0_5                                           // |  0                                 |  0                                  |
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
