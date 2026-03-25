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
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:          :                   |  0                                  |
    li  a1, 3                                             // |  3  :          :           ^       |  0                                  |
    bgeu    a0, a1, .LBB0_2                               // |  4  :          :          vv       |  0                                  |
    li  a0, 0                                             // |  3  :          :          ^        |  0                                  |
    j   .LBB0_8                                           // |  3  :          :          :        |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu a3, 1(s1)                                         // |  4  :          v          :  ^     |  0                                  |
    lbu a2, 2(s1)                                         // |  5  :          v          : ^:     |  0                                  |
    li  a1, 1                                             // |  6  :          :          :^::     |  0                                  |
    beq a2, a3, .LBB0_7                                   // |  5  :          :          : vv     |  0                                  |
    li  a3, 0                                             // |  5  :          :          : :^     |  0                                  |
    addi    a6, a0, -3                                    // |  6  :          :          v ::  ^  |  0                                  |
    li  a1, 1                                             // |  7  :          :          :^::  :  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a4, s1, a3                                        // |  7  :          v          : :v^ :  |  0                                  |
    lbu s0, 0(a4)                                         // |  7  :         ^           : ::v :  |  0                                  |
    andi    a5, a2, 255                                   // |  8  :         :           : v::^:  |  0                                  |
    beq a5, s0, .LBB0_7                                   // |  7  :         v           :  ::v:  |  0                                  |
    addi    a1, a3, 3                                     // |  7  :                     :^ v:::  |  0                                  |
    sltu    a1, a1, a0                                    // |  7  :                     v^ ::::  |  0                                  |
    beq a6, a3, .LBB0_7                                   // |  6  :                      : v::v  |  0                                  |
    lbu a2, 3(a4)                                         // |  5  :                      :^ v:   |  0                                  |
    addi    a3, a3, 1                                     // |  5  :                      ::^ :   |  0                                  |
    bne a2, a5, .LBB0_4                                   // |  4  :                      :v  v   |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    xori    a0, a1, 1                                     // |  3  :                     ^v       |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    andi    a0, a0, 1                                     // |  2  :                     ^        |  0                                  |
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
