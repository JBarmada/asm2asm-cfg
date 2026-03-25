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
    call    strlen@plt                                    // |  4 ^:         ::                   |  0                                  |
    beqz    a0, .LBB0_5                                   // |  4  :         ::          v        |  0                                  |
    li  a1, -76                                           // |  4  :         ::           ^       |  0                                  |
    beqz    s1, .LBB0_3                                   // |  3  :         :v                   |  0                                  |
    li  a1, -92                                           // |  3  :         :            ^       |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    lui a2, 322639                                        // |  4  :         :            :^      |  0                                  |
    addiw   a2, a2, -945                                  // |  4  :         :            :^      |  0                                  |
    li  a3, 26                                            // |  5  :         :            ::^     |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lbu a4, 0(s0)                                         // |  6  :         v            :::^    |  0                                  |
    add a4, a4, a1                                        // |  6  :         :            v::^    |  0                                  |
    mul a5, a4, a2                                        // |  6  :         :             v:v^   |  0                                  |
    srli    s1, a5, 63                                    // |  5  :         :^             : v   |  0                                  |
    srli    a5, a5, 35                                    // |  5  :         ::             : ^   |  0                                  |
    addw    a5, a5, s1                                    // |  5  :         :v             : ^   |  0                                  |
    mulw    a5, a5, a3                                    // |  4  :         :              v ^   |  0                                  |
    subw    a4, a4, a5                                    // |  4  :         :               ^v   |  0                                  |
    addiw   a4, a4, 97                                    // |  3  :         :               ^    |  0                                  |
    sb  a4, 0(s0)                                         // |  3  :         v               v    |  0                                  |
    addi    a0, a0, -1                                    // |  2  :                     ^        |  0                                  |
    addi    s0, s0, 1                                     // |  3  :         ^           :        |  0                                  |
    bnez    a0, .LBB0_4                                   // |  2  :                     v        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
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
