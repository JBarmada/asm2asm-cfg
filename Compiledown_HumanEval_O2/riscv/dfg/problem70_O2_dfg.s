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
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s0, a1                                            // |  3  :         ^            v       |  0                                  |
    mv  s2, a0                                            // |  4  :         : ^         v        |  0                                  |
    addiw   a0, a1, 1                                     // |  4  :         :           ^v       |  0                                  |
    li  a1, 4                                             // |  4  :         :           :^       |  0                                  |
    call    calloc@plt                                    // |  4 ^:         :           :        |  0                                  |
    blez    s0, .LBB0_5                                   // |  3  :         v           :        |  0                                  |
    li  a1, -1                                            // |  3  :                     :^       |  0                                  |
    j   .LBB0_3                                           // |  2  :                     :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  3  :         ^           :        |  0                                  |
    addi    s2, s2, 4                                     // |  4  :         : ^         :        |  0                                  |
    mv  a1, s1                                            // |  6  :         :v:         :^       |  0                                  |
    beqz    s0, .LBB0_6                                   // |  5  :         v :         ::       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lw  s1, 0(s2)                                         // |  5  :          ^v         ::       |  0                                  |
    slli    a2, s1, 2                                     // |  5  :          v          ::^      |  0                                  |
    add a2, a2, a0                                        // |  5  :          :          v:^      |  0                                  |
    lw  a3, 0(a2)                                         // |  5  :          :           :v^     |  0                                  |
    addiw   a3, a3, 1                                     // |  5  :          :           ::^     |  0                                  |
    slt a4, a3, s1                                        // |  6  :          v           ::v^    |  0                                  |
    xori    a4, a4, 1                                     // |  6  :          :           :::^    |  0                                  |
    slt a5, a1, s1                                        // |  6  :          v           v:: ^   |  0                                  |
    and a4, a4, a5                                        // |  6  :                      :::^v   |  0                                  |
    sw  a3, 0(a2)                                         // |  5  :                      :vv:    |  0                                  |
    bnez    a4, .LBB0_2                                   // |  3  :                      :  v    |  0                                  |
    mv  s1, a1                                            // |  3  :          ^           v       |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  s1, -1                                            // |  2  :          ^                   |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    call    free@plt                                      // |  3 ^:          :                   |  0                                  |
    mv  a0, s1                                            // |  3  :          v          ^        |  0                                  |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
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
