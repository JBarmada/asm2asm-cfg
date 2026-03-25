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
    sd  s0, 0(sp)                                         // |  2  v         v                    |  0                                  |
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:         :                    |  0                                  |
    beqz    a0, .LBB0_11                                  // |  3  :         :           v        |  0                                  |
    lbu a1, 0(s0)                                         // |  3  :         v            ^       |  0                                  |
    addi    a2, a1, -91                                   // |  4  :         :            v^      |  0                                  |
    seqz    a2, a2                                        // |  3  :         :             ^      |  0                                  |
    addi    a1, a1, -93                                   // |  4  :         :            ^:      |  0                                  |
    seqz    a1, a1                                        // |  4  :         :            ^:      |  0                                  |
    sub a1, a2, a1                                        // |  4  :         :            ^v      |  0                                  |
    bgtz    a1, .LBB0_3                                   // |  4  :         :            v:      |  0                                  |
    li  a1, 0                                             // |  4  :         :            ^:      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    li  a4, 1                                             // |  5  :         :            :: ^    |  0                                  |
    mv  a3, a1                                            // |  5  :         :            v:^     |  0                                  |
    j   .LBB0_5                                           // |  5  :         :            :::     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addiw   a5, a1, -2                                    // |  6  :         :            v:: ^   |  0                                  |
    addi    a4, a2, 1                                     // |  7  :         :            :v:^:   |  0                                  |
    bge a5, a3, .LBB0_10                                  // |  6  :         :            : v:v   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a2, a4                                            // |  5  :         :            :^ v    |  0                                  |
    beq a0, a4, .LBB0_10                                  // |  6  :         :           v:: v    |  0                                  |
    add a4, s0, a2                                        // |  5  :         v            :v ^    |  0                                  |
    lbu a4, 0(a4)                                         // |  4  :                      :: ^    |  0                                  |
    addi    a5, a4, -91                                   // |  5  :                      :: v^   |  0                                  |
    seqz    a5, a5                                        // |  4  :                      ::  ^   |  0                                  |
    addw    a3, a3, a5                                    // |  5  :                      ::^ v   |  0                                  |
    addi    a4, a4, -93                                   // |  4  :                      :: ^    |  0                                  |
    seqz    a4, a4                                        // |  4  :                      :: ^    |  0                                  |
    subw    a3, a3, a4                                    // |  5  :                      ::^v    |  0                                  |
    bgtz    a3, .LBB0_8                                   // |  4  :                      ::v     |  0                                  |
    li  a3, 0                                             // |  4  :                      ::^     |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    sext.w  a4, a1                                        // |  5  :                      v::^    |  0                                  |
    mv  a1, a3                                            // |  5  :                      ^:v:    |  0                                  |
    blt a4, a3, .LBB0_4                                   // |  4  :                       :vv    |  0                                  |
    mv  a1, a4                                            // |  4  :                      ^: v    |  0                                  |
    j   .LBB0_4                                           // |  2  :                       :      |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    sltu    a0, a2, a0                                    // |  3  :                     ^ v      |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  0                                  |
    ld  s0, 0(sp)                                         // |  3 :v         ^                    |  0                                  |
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
