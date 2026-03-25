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
    addi    sp, sp, -400                                  // |  1  ^                              |  0                                  |
    sw  zero, 0(sp)                                       // |  1  v                              |  0                                  |
    sw  zero, 4(sp)                                       // |  1  v                              |  0                                  |
    li  a1, 2                                             // |  2  :                      ^       |  0                                  |
    sw  a1, 8(sp)                                         // |  2  v                      v       |  0                                  |
    li  a1, 4                                             // |  2  :                      ^       |  0                                  |
    sw  zero, 12(sp)                                      // |  2  v                      :       |  0                                  |
    blt a0, a1, .LBB0_3                                   // |  3  :                     vv       |  0                                  |
    li  a4, 0                                             // |  2  :                         ^    |  0                                  |
    li  a1, 0                                             // |  3  :                      ^  :    |  0                                  |
    addiw   a2, a0, 1                                     // |  4  :                     v ^ :    |  0                                  |
    slli    a2, a2, 32                                    // |  3  :                       ^ :    |  0                                  |
    srli    a3, a2, 32                                    // |  4  :                       v^:    |  0                                  |
    addi    a2, sp, 8                                     // |  3  v                       ^ :    |  0                                  |
    addi    a3, a3, -4                                    // |  4  :                       :^:    |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lw  a5, 0(a2)                                         // |  4  :                       v :^   |  0                                  |
    lw  a6, -8(a2)                                        // |  5  :                       v ::^  |  0                                  |
    addw    a1, a1, a5                                    // |  6  :                      ^: :v:  |  0                                  |
    addw    a1, a1, a4                                    // |  6  :                      ^: v::  |  0                                  |
    addw    a1, a1, a6                                    // |  5  :                      ^:  :v  |  0                                  |
    sw  a1, 8(a2)                                         // |  4  :                      vv  :   |  0                                  |
    addi    a3, a3, -1                                    // |  3  :                        ^ :   |  0                                  |
    addi    a2, a2, 4                                     // |  4  :                       ^: :   |  0                                  |
    mv  a4, a5                                            // |  4  :                        :^v   |  0                                  |
    bnez    a3, .LBB0_2                                   // |  2  :                        v     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, a0, 2                                     // |  2  :                     ^        |  0                                  |
    mv  a1, sp                                            // |  2  v                      ^       |  0                                  |
    add a0, a0, a1                                        // |  2                        ^v       |  0                                  |
    lw  a0, 0(a0)                                         // |  1                        v        |  0                                  |
    addi    sp, sp, 400                                   // |  1  ^                              |  0                                  |
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
