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
    addi    sp, sp, -48                                   // |  1  ^                              |  0                                  |
    sd  ra, 40(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 32(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 24(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 16(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 8(sp)                                         // |  2  v            v                 |  0                                  |
    sd  s4, 0(sp)                                         // |  2  v             v                |  0                                  |
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s4, a0                                            // |  4  :           : ^       v        |  0                                  |
    li  a0, -1                                            // |  4  :           : :       ^        |  0                                  |
    srli    s1, a0, 32                                    // |  5  :          ^: :       v        |  0                                  |
    mv  a0, s4                                            // |  5  :          :: v       ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:          :: :       :        |  0                                  |
    mv  s0, a0                                            // |  6  :         ^:: :       v        |  0                                  |
    sext.w  s3, a0                                        // |  7  :         :::^:       v        |  0                                  |
    mv  a0, s2                                            // |  7  :         ::v::       ^        |  0                                  |
    call    strlen@plt                                    // |  8 ^:         :::::       :        |  0                                  |
    and a7, a0, s1                                        // |  8  :         :v:::       v      ^ |  0                                  |
    sext.w  t0, a0                                        // |  9  :  ^      :::::       v      : |  0                                  |
    blez    s3, .LBB0_8                                   // |  8  :  :      :::v:              : |  0                                  |
    li  a3, 0                                             // |  9  :  :      :::::          ^   : |  0                                  |
    and a6, s0, s1                                        // | 10  :  :      vv:::          :  ^: |  0                                  |
    li  a2, 1                                             // | 11  :  :      :::::         ^:  :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    blez    t0, .LBB0_18                                  // | 10  :  v      :::::          :  :: |  0                                  |
    add a1, s4, a3                                        // | 11  :  :      ::::v        ^ v  :: |  0                                  |
    lbu a5, 0(a1)                                         // | 11  :  :      :::::        v   ^:: |  0                                  |
    mv  a1, a7                                            // | 11  :  :      :::::        ^   ::v |  0                                  |
    mv  a4, s2                                            // | 11  :  :      ::v::           ^::: |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    lbu a0, 0(a4)                                         // | 12  :  :      :::::       ^   v::: |  0                                  |
    beq a5, a0, .LBB0_6                                   // | 11  :  :      :::::       v    v:: |  0                                  |
    addi    a1, a1, -1                                    // | 10  :  :      :::::        ^    :: |  0                                  |
    addi    a4, a4, 1                                     // | 11  :  :      :::::        :  ^ :: |  0                                  |
    bnez    a1, .LBB0_4                                   // | 10  :  :      :::::        v    :: |  0                                  |
    j   .LBB0_7                                           // |  9  :  :      :::::             :: |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    a3, a3, 1                                     // | 10  :  :      :::::          ^  :: |  0                                  |
    slt a2, a3, s3                                        // | 11  :  :      :::v:         ^v  :: |  0                                  |
    bne a3, a6, .LBB0_2                                   // | 11  :  :      :::::         :v  v: |  0                                  |
    j   .LBB0_8                                           // |  9  :  :      :::::         :    : |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    andi    a0, a2, 1                                     // | 10  :  :      :::::       ^ v    : |  0                                  |
    bnez    a0, .LBB0_17                                  // |  9  :  :      :::::       v      : |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    blez    t0, .LBB0_15                                  // |  8  :  v      :::::              : |  0                                  |
    li  a3, 0                                             // |  9  :  :      :::::          ^   : |  0                                  |
    and a1, s0, s1                                        // | 10  :  :      vv:::        ^ :   : |  0                                  |
    li  a2, 1                                             // |  9  :  :        :::        :^:   : |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    blez    s3, .LBB0_19                                  // |  8  :  :        :v:        : :   : |  0                                  |
    add a0, s2, a3                                        // |  8  :  :        v :       ^: v   : |  0                                  |
    lbu a5, 0(a0)                                         // |  7  :  :          :       v:   ^ : |  0                                  |
    mv  a4, a1                                            // |  7  :  :          :        v  ^: : |  0                                  |
    mv  s1, s4                                            // |  6  :  :       ^  v            : : |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    lbu a0, 0(s1)                                         // |  6  :  :       v          ^    : : |  0                                  |
    beq a5, a0, .LBB0_14                                  // |  5  :  :                  v    v : |  0                                  |
    addi    a4, a4, -1                                    // |  4  :  :                      ^  : |  0                                  |
    addi    s1, s1, 1                                     // |  5  :  :       ^              :  : |  0                                  |
    bnez    a4, .LBB0_12                                  // |  4  :  :                      v  : |  0                                  |
    j   .LBB0_16                                          // |  3  :  :                         : |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    addi    a3, a3, 1                                     // |  4  :  :                     ^   : |  0                                  |
    slt a2, a3, t0                                        // |  5  :  v                    ^v   : |  0                                  |
    bne a3, a7, .LBB0_10                                  // |  3  :                        v   v |  0                                  |
    j   .LBB0_16                                          // |  1  :                              |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    li  a2, 0                                             // |  2  :                       ^      |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    xori    a1, a2, 1                                     // |  3  :                      ^v      |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    andi    a0, a1, 1                                     // |  3  :                     ^v       |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    ld  s4, 0(sp)                                         // |  3 :v             ^                |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    li  a1, 0                                             // |  1                         ^       |  0                                  |
    j   .LBB0_17                                          // |  0                                 |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    li  a2, 1                                             // |  1                          ^      |  0                                  |
    j   .LBB0_16                                          // |  0                                 |  0                                  |
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
