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
    mv  a6, a3                                            // |  2                           v  ^  |  0                                  |
    mv  a7, a0                                            // |  3                        v     :^ |  0                                  |
    blez    a2, .LBB0_9                                   // |  3                          v   :: |  0                                  |
    li  t2, 0                                             // |  3       ^                      :: |  0                                  |
    li  t0, 0                                             // |  3     ^                        :: |  0                                  |
    li  t1, -1000                                         // |  3      ^                       :: |  0                                  |
    j   .LBB0_3                                           // |  2                              :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    t2, t2, 1                                     // |  3       ^                      :: |  0                                  |
    mv  t1, t3                                            // |  5      ^:v                     :: |  0                                  |
    mv  t0, a3                                            // |  6     ^::                   v  :: |  0                                  |
    beq t2, a2, .LBB0_10                                  // |  6     ::v                  v   :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, t2, 3                                     // |  6     ::v                ^     :: |  0                                  |
    add a0, a0, a1                                        // |  6     ::                 ^v    :: |  0                                  |
    ld  a3, 0(a0)                                         // |  6     ::                 v  ^  :: |  0                                  |
    lbu a4, 0(a3)                                         // |  6     ::                    v^ :: |  0                                  |
    beqz    a4, .LBB0_7                                   // |  6     ::                    :v :: |  0                                  |
    li  t3, 0                                             // |  7     :: ^                  :: :: |  0                                  |
    addi    a0, a3, 1                                     // |  7     ::                 ^  v: :: |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    addiw   a5, a4, -65                                   // |  7     ::                 :   v^:: |  0                                  |
    andi    a5, a5, 255                                   // |  7     ::                 :   :^:: |  0                                  |
    sltiu   a5, a5, 26                                    // |  7     ::                 :   :^:: |  0                                  |
    addw    t3, t3, a5                                    // |  8     :: ^               :   :v:: |  0                                  |
    addiw   a5, a4, -97                                   // |  7     ::                 :   v^:: |  0                                  |
    lbu a4, 0(a0)                                         // |  6     ::                 v   ^ :: |  0                                  |
    andi    a5, a5, 255                                   // |  6     ::                     :^:: |  0                                  |
    sltiu   a5, a5, 26                                    // |  6     ::                     :^:: |  0                                  |
    subw    t3, t3, a5                                    // |  7     :: ^                   :v:: |  0                                  |
    addi    a0, a0, 1                                     // |  7     :: :               ^   : :: |  0                                  |
    bnez    a4, .LBB0_5                                   // |  6     :: :                   v :: |  0                                  |
    blt t1, t3, .LBB0_2                                   // |  5     :v v                     :: |  0                                  |
    j   .LBB0_8                                           // |  4     ::                       :: |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    li  t3, 0                                             // |  5     :: ^                     :: |  0                                  |
    blt t1, t3, .LBB0_2                                   // |  5     :v v                     :: |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a3, t0                                            // |  5     v:                    ^  :: |  0                                  |
    mv  t3, t1                                            // |  4      v ^                     :: |  0                                  |
    j   .LBB0_2                                           // |  2                              :: |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  a3, 0                                             // |  3                           ^  :: |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
.LBB0_11:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str)                         // |  3                         ^    :: |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_11)                   // |  3                         ^    :: |  0                                  |
    mv  a0, a6                                            // |  3                        ^     v: |  0                                  |
    mv  a2, a7                                            // |  2                          ^    v |  0                                  |
    tail    sprintf@plt                                   // |  0                                 |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "%s.%s"                                       // |                                    |                                     |
    .size   .L.str, 6                                     // |                                    |                                     |
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
