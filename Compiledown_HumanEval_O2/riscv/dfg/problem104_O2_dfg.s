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
    bge a1, a0, .LBB0_2                                   // |  3  :                     vv       |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(.L.str)                         // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_5)                    // |  2  :                     ^        |  0                                  |
    j   .LBB0_4                                           // |  2  :                     :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addw    s0, a1, a0                                    // |  4  :         ^           vv       |  0                                  |
    li  a0, 33                                            // |  3  :         :           ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:         :           :        |  0                                  |
    sb  zero, 0(a0)                                       // |  3  :         :           v        |  0                                  |
    addi    a1, a0, 32                                    // |  4  :         :           v^       |  0                                  |
    sb  zero, 32(a0)                                      // |  4  :         :           v:       |  0                                  |
    li  a2, 3                                             // |  4  :         :            :^      |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, s0                                            // |  5  :         v            ::^     |  0                                  |
    srliw   a0, s0, 31                                    // |  6  :         v           ^:::     |  0                                  |
    addw    a0, a0, s0                                    // |  6  :         v           ^:::     |  0                                  |
    sraiw   s0, a0, 1                                     // |  6  :         ^           v:::     |  0                                  |
    srliw   a0, a0, 31                                    // |  6  :         :           ^:::     |  0                                  |
    addw    a0, a0, s0                                    // |  6  :         v           ^:::     |  0                                  |
    andi    a0, a0, 254                                   // |  6  :         :           ^:::     |  0                                  |
    subw    a0, s0, a0                                    // |  6  :         v           ^:::     |  0                                  |
    addiw   a4, a0, 48                                    // |  6  :                     v:::^    |  0                                  |
    addi    a0, a1, -1                                    // |  6  :                     ^v:::    |  0                                  |
    sb  a4, -1(a1)                                        // |  6  :                     :v::v    |  0                                  |
    mv  a1, a0                                            // |  5  :                     v^::     |  0                                  |
    blt a2, a3, .LBB0_3                                   // |  3  :                       vv     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    ld  ra, 8(sp)                                         // |  2 ^v                              |  0                                  |
    ld  s0, 0(sp)                                         // |  3 :v         ^                    |  0                                  |
    addi    sp, sp, 16                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "-1"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
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
