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
    addi    sp, sp, -16                                   // |  1  ^                              |  0                                  |
    sd  ra, 8(sp)                                         // |  2 vv                              |  0                                  |
    call    strlen@plt                                    // |  2 ^:                              |  0                                  |
    sext.w  a2, a0                                        // |  3  :                     v ^      |  0                                  |
    li  a1, 2                                             // |  3  :                      ^:      |  0                                  |
    bge a2, a1, .LBB0_2                                   // |  3  :                      vv      |  0                                  |
    li  a1, 0                                             // |  3  :                      ^:      |  0                                  |
    j   .LBB0_7                                           // |  2  :                       :      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  a3, 4                                             // |  3  :                       :^     |  0                                  |
    li  a1, 1                                             // |  4  :                      ^::     |  0                                  |
    bltu    a2, a3, .LBB0_7                               // |  3  :                       vv     |  0                                  |
    li  a1, 2                                             // |  3  :                      ^:      |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    remw    a3, a0, a1                                    // |  5  :                     vv:^     |  0                                  |
    beqz    a3, .LBB0_6                                   // |  3  :                       :v     |  0                                  |
    addiw   a1, a1, 1                                     // |  4  :                      ^::     |  0                                  |
    mulw    a4, a1, a1                                    // |  5  :                      v::^    |  0                                  |
    bge a2, a4, .LBB0_4                                   // |  4  :                       v:v    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    snez    a1, a3                                        // |  3  :                      ^ v     |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  3  :                     ^v       |  0                                  |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  0                                  |
    addi    sp, sp, 16                                    // |  2 :^                              |  0                                  |
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
