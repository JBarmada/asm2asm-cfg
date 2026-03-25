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
    sext.w  a2, a0                                        // |  4  :         :           v ^      |  0                                  |
    li  a3, 2                                             // |  4  :         :             :^     |  0                                  |
    li  a1, 1                                             // |  5  :         :            ^::     |  0                                  |
    blt a2, a3, .LBB0_7                                   // |  4  :         :             vv     |  0                                  |
    lbu a1, 0(s0)                                         // |  3  :         v            ^       |  0                                  |
    addiw   a2, a0, -1                                    // |  5  :         :           v:^      |  0                                  |
    add a2, a2, s0                                        // |  4  :         v            :^      |  0                                  |
    lbu a2, 0(a2)                                         // |  4  :         :            :^      |  0                                  |
    bne a1, a2, .LBB0_6                                   // |  4  :         :            vv      |  0                                  |
    li  a3, -1                                            // |  3  :         :              ^     |  0                                  |
    slli    a6, a3, 32                                    // |  4  :         :              v  ^  |  0                                  |
    srliw   a1, a0, 1                                     // |  5  :         :           v^    :  |  0                                  |
    slli    a0, a0, 32                                    // |  5  :         :           ^:    :  |  0                                  |
    slli    a3, a3, 33                                    // |  5  :         :            : ^  :  |  0                                  |
    add a0, a0, a3                                        // |  6  :         :           ^: v  :  |  0                                  |
    li  a4, 1                                             // |  6  :         :           ::  ^ :  |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    mv  a3, a4                                            // |  7  :         :           :: ^v :  |  0                                  |
    beq a1, a4, .LBB0_5                                   // |  7  :         :           :v :v :  |  0                                  |
    add a4, s0, a3                                        // |  7  :         v           :: v^ :  |  0                                  |
    lbu a5, 0(a4)                                         // |  8  :         :           :: :v^:  |  0                                  |
    srai    a4, a0, 32                                    // |  8  :         :           v: :^::  |  0                                  |
    add a4, a4, s0                                        // |  7  :         v            : :^::  |  0                                  |
    lbu a2, 0(a4)                                         // |  7  :                      :^:v::  |  0                                  |
    add a0, a0, a6                                        // |  7  :                     ^::: :v  |  0                                  |
    addi    a4, a3, 1                                     // |  6  :                      ::v^:   |  0                                  |
    beq a5, a2, .LBB0_3                                   // |  5  :                      :v: v   |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sltu    a0, a3, a1                                    // |  4  :                     ^v v     |  0                                  |
    xori    a1, a0, 1                                     // |  3  :                     v^       |  0                                  |
    j   .LBB0_7                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  2  :                      ^       |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, a1                                            // |  3  :                     ^v       |  0                                  |
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
