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
    lbu s1, 0(a0)                                         // |  3  :          ^          v        |  0                                  |
    beqz    s1, .LBB0_8                                   // |  2  :          v                   |  0                                  |
    mv  s2, a0                                            // |  4  :          :^         v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  4 ^:          ::                  |  0                                  |
    mv  a1, a0                                            // |  5  :          ::         v^       |  0                                  |
    li  a0, 0                                             // |  5  :          ::         ^:       |  0                                  |
    li  s0, 0                                             // |  5  :         ^::          :       |  0                                  |
    ld  t0, 0(a1)                                         // |  6  :  ^      :::          v       |  0                                  |
    addi    a2, s2, 1                                     // |  6  :  :      ::v           ^      |  0                                  |
    li  t1, 1                                             // |  6  :  :^     ::            :      |  0                                  |
    li  a6, 63                                            // |  7  :  ::     ::            :   ^  |  0                                  |
    lui a3, 786434                                        // |  8  :  ::     ::            :^  :  |  0                                  |
    addiw   a3, a3, 1                                     // |  8  :  ::     ::            :^  :  |  0                                  |
    slli    a7, a3, 33                                    // |  9  :  ::     ::            :v  :^ |  0                                  |
    j   .LBB0_4                                           // |  8  :  ::     ::            :   :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  a3, 1                                             // |  9  :  ::     ::            :^  :: |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    srli    a1, s1, 13                                    // | 10  :  ::     :v           ^::  :: |  0                                  |
    lbu s1, 0(a2)                                         // |  9  :  ::     :^            v:  :: |  0                                  |
    snez    a4, s0                                        // |  9  :  ::     v:             :^ :: |  0                                  |
    and a1, a1, a4                                        // |  9  :  ::      :           ^ :v :: |  0                                  |
    addw    a0, a0, a1                                    // |  9  :  ::      :          ^v :  :: |  0                                  |
    addi    a2, a2, 1                                     // |  8  :  ::      :            ^:  :: |  0                                  |
    mv  s0, a3                                            // |  8  :  ::     ^:             v  :: |  0                                  |
    beqz    s1, .LBB0_9                                   // |  6  :  ::      v                :: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    andi    a4, s1, 255                                   // |  7  :  ::      v              ^ :: |  0                                  |
    slli    a3, a4, 1                                     // |  7  :  ::                    ^v :: |  0                                  |
    add a3, a3, t0                                        // |  7  :  v:                    ^: :: |  0                                  |
    lh  s1, 0(a3)                                         // |  7  :   :      ^             v: :: |  0                                  |
    slli    a3, s1, 50                                    // |  7  :   :      v             ^: :: |  0                                  |
    srai    a3, a3, 63                                    // |  6  :   :                    ^: :: |  0                                  |
    addi    a1, a4, -73                                   // |  7  :   :                  ^ :v :: |  0                                  |
    seqz    a1, a1                                        // |  7  :   :                  ^ :: :: |  0                                  |
    snez    a5, t1                                        // |  7  :   v                    ::^:: |  0                                  |
    and a1, a1, a5                                        // |  7  :                      ^ ::v:: |  0                                  |
    and t1, a3, t1                                        // |  7  :   ^                  : v: :: |  0                                  |
    bnez    a1, .LBB0_2                                   // |  5  :                      v  : :: |  0                                  |
    li  a3, 0                                             // |  5  :                        ^: :: |  0                                  |
    bltu    a6, a4, .LBB0_3                               // |  4  :                         v v: |  0                                  |
    srl a1, a7, a4                                        // |  4  :                      ^  v  v |  0                                  |
    andi    a1, a1, 1                                     // |  2  :                      ^       |  0                                  |
    beqz    a1, .LBB0_3                                   // |  2  :                      v       |  0                                  |
    li  a3, 0                                             // |  2  :                        ^     |  0                                  |
    li  t1, 1                                             // |  2  :   ^                          |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  2  :                     ^        |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
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
