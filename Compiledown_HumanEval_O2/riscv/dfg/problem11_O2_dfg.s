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
    addi    sp, sp, -128                                  // |  1  ^                              |  0                                  |
    sd  ra, 120(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 112(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 104(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 96(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 88(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 80(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 72(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 64(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 56(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 48(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 40(sp)                                        // |  2  v                  v           |  0                                  |
    sd  s10, 32(sp)                                       // |  2  v                   v          |  0                                  |
    sd  s11, 24(sp)                                       // |  2  v                    v         |  0                                  |
    mv  s6, a0                                            // |  3  :               ^     v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:               :              |  0                                  |
    mv  s2, a0                                            // |  4  :           ^   :     v        |  0                                  |
    slliw   a0, a0, 1                                     // |  4  :           :   :     ^        |  0                                  |
    sd  a0, 16(sp)                                        // |  4  v           :   :     v        |  0                                  |
    ori a0, a0, 1                                         // |  4  :           :   :     ^        |  0                                  |
    call    malloc@plt                                    // |  5 ^:           :   :     :        |  0                                  |
    mv  s3, a0                                            // |  5  :           :^  :     v        |  0                                  |
    beqz    a0, .LBB0_19                                  // |  5  :           ::  :     v        |  0                                  |
    sext.w  s5, s2                                        // |  5  :           v: ^:              |  0                                  |
    blez    s5, .LBB0_14                                  // |  5  :           :: v:              |  0                                  |
    li  s0, 0                                             // |  6  :         ^ :: ::              |  0                                  |
    li  a0, -1                                            // |  7  :         : :: ::     ^        |  0                                  |
    slli    s1, a0, 32                                    // |  8  :         :^:: ::     v        |  0                                  |
    srli    a0, a0, 32                                    // |  8  :         :::: ::     ^        |  0                                  |
    sd  a0, 0(sp)                                         // |  8  v         :::: ::     v        |  0                                  |
    slli    a0, s2, 32                                    // |  8  :         ::v: ::     ^        |  0                                  |
    srli    s9, a0, 32                                    // |  9  :         :::: ::  ^  v        |  0                                  |
    sd  a0, 8(sp)                                         // |  9  v         :::: ::  :  v        |  0                                  |
    add s10, a0, s1                                       // | 10  :         :v:: ::  :^ v        |  0                                  |
    add s11, s3, s5                                       // | 10  :         :::v v:  ::^         |  0                                  |
    li  s7, 2                                             // | 11  :         :::: ::^ :::         |  0                                  |
    mv  s8, s6                                            // | 12  :         :::: :v:^:::         |  0                                  |
    j   .LBB0_5                                           // | 11  :         :::: ::: :::         |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a0, s0, s5                                        // | 12  :         v::: v:: :::^        |  0                                  |
    add a0, a0, s3                                        // | 11  :          ::v ::: :::^        |  0                                  |
    sb  zero, 0(a0)                                       // | 11  :          ::: ::: :::v        |  0                                  |
    beqz    s4, .LBB0_19                                  // | 11  :          :::v::: :::         |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addi    s0, s0, 1                                     // | 11  :         ^::: ::: :::         |  0                                  |
    addi    s8, s8, 1                                     // | 12  :         :::: :::^:::         |  0                                  |
    beq s0, s9, .LBB0_15                                  // | 12  :         v::: ::::v::         |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sub a1, s5, s0                                        // | 12  :         v::: v::: :: ^       |  0                                  |
    blt a1, s7, .LBB0_10                                  // | 12  :         :::: ::v: :: v       |  0                                  |
    li  a0, 0                                             // | 12  :         :::: :: : ::^:       |  0                                  |
    srliw   a2, a1, 31                                    // | 13  :         :::: :: : :::v^      |  0                                  |
    addw    a1, a1, a2                                    // | 13  :         :::: :: : :::^v      |  0                                  |
    sraiw   a1, a1, 1                                     // | 12  :         :::: :: : :::^       |  0                                  |
    slli    a2, a1, 32                                    // | 13  :         :::: :: : :::v^      |  0                                  |
    srli    a2, a2, 32                                    // | 13  :         :::: :: : ::::^      |  0                                  |
    mv  a3, s10                                           // | 14  :         :::: :: : v::::^     |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    add a4, s8, a0                                        // | 14  :         :::: :: v  :v:::^    |  0                                  |
    lbu a4, 0(a4)                                         // | 13  :         :::: :: :  : :::^    |  0                                  |
    srai    a5, a3, 32                                    // | 14  :         :::: :: :  : ::v:^   |  0                                  |
    add a5, a5, s6                                        // | 13  :         :::: :v :  : :: :^   |  0                                  |
    lbu a5, 0(a5)                                         // | 13  :         :::: :: :  : :: :^   |  0                                  |
    bne a4, a5, .LBB0_4                                   // | 13  :         :::: :: :  : :: vv   |  0                                  |
    addi    a0, a0, 1                                     // | 12  :         :::: :: :  :^::      |  0                                  |
    add a3, a3, s1                                        // | 13  :         :v:: :: :  ::::^     |  0                                  |
    bne a2, a0, .LBB0_7                                   // | 12  :         :::: :: :  :v:v      |  0                                  |
    slt s4, a0, a1                                        // | 12  :         ::::^:: :  :vv       |  0                                  |
    j   .LBB0_11                                          // |  9  :         :::: :: :  :         |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  s4, 0                                             // | 10  :         ::::^:: :  :         |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    mv  a0, s3                                            // | 10  :         :::v :: :  :^        |  0                                  |
    mv  a1, s6                                            // | 10  :         :::: :v :  : ^       |  0                                  |
    mv  a2, s5                                            // | 10  :         :::: v: :  :  ^      |  0                                  |
    call    strncpy@plt                                   // | 10 ^:         :::: :: :  :         |  0                                  |
    beqz    s0, .LBB0_3                                   // |  9  :         v::: :: :  :         |  0                                  |
    li  a0, 0                                             // | 10  :         :::: :: :  :^        |  0                                  |
    mv  a1, s11                                           // | 11  :         :::: :: :  v:^       |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    add a2, s8, a0                                        // | 11  :         :::: :: v   v:^      |  0                                  |
    lb  a2, -1(a2)                                        // |  9  :         :::: ::      :v      |  0                                  |
    sb  a2, 0(a1)                                         // |  9  :         :::: ::      vv      |  0                                  |
    addi    a0, a0, -1                                    // |  8  :         :::: ::     ^        |  0                                  |
    add a2, s0, a0                                        // |  9  :         v::: ::     v ^      |  0                                  |
    addi    a1, a1, 1                                     // |  8  :          ::: ::      ^:      |  0                                  |
    bnez    a2, .LBB0_13                                  // |  7  :          ::: ::       v      |  0                                  |
    j   .LBB0_3                                           // |  6  :          ::: ::              |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  7  :          ::v ::     ^        |  0                                  |
    mv  a1, s6                                            // |  7  :          ::: :v      ^       |  0                                  |
    mv  a2, s5                                            // |  7  :          ::: v:       ^      |  0                                  |
    call    strncpy@plt                                   // |  7 ^:          ::: ::              |  0                                  |
    ld  a4, 16(sp)                                        // |  7  v          ::: ::         ^    |  0                                  |
    j   .LBB0_18                                          // |  6  :          ::: ::              |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  7  :          ::v ::     ^        |  0                                  |
    mv  a1, s6                                            // |  7  :          ::: :v      ^       |  0                                  |
    mv  a2, s5                                            // |  7  :          ::: v:       ^      |  0                                  |
    call    strncpy@plt                                   // |  7 ^:          ::: ::              |  0                                  |
    ld  a4, 16(sp)                                        // |  7  v          ::: ::         ^    |  0                                  |
    blez    s5, .LBB0_18                                  // |  7  :          ::: v:         :    |  0                                  |
    ld  a0, 0(sp)                                         // |  8  v          ::: ::     ^   :    |  0                                  |
    and a0, s2, a0                                        // |  8  :          :v: ::     ^   :    |  0                                  |
    ld  a1, 8(sp)                                         // |  7  v          : : ::      ^  :    |  0                                  |
    add a1, a1, s1                                        // |  7  :          v : ::      ^  :    |  0                                  |
    add a2, s3, s5                                        // |  8  :          : v v:      :^ :    |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    srai    a3, a1, 32                                    // |  8  :          : :  :      v:^:    |  0                                  |
    add a3, a3, s6                                        // |  7  :          : :  v       :^:    |  0                                  |
    lb  a3, 0(a3)                                         // |  6  :          : :          :v:    |  0                                  |
    sb  a3, 0(a2)                                         // |  6  :          : :          vv:    |  0                                  |
    add a1, a1, s1                                        // |  5  :          v :         ^  :    |  0                                  |
    addi    a0, a0, -1                                    // |  4  :            :        ^   :    |  0                                  |
    addi    a2, a2, 1                                     // |  5  :            :        : ^ :    |  0                                  |
    bnez    a0, .LBB0_17                                  // |  4  :            :        v   :    |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    add a0, s3, a4                                        // |  4  :            v        ^   v    |  0                                  |
    sb  zero, 0(a0)                                       // |  3  :            :        v        |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    mv  a0, s3                                            // |  3  :            v        ^        |  0                                  |
    ld  ra, 120(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 112(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 104(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 96(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 88(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 80(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 72(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 64(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 56(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 48(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 40(sp)                                        // |  3 :v                  ^           |  0                                  |
    ld  s10, 32(sp)                                       // |  3 :v                   ^          |  0                                  |
    ld  s11, 24(sp)                                       // |  3 :v                    ^         |  0                                  |
    addi    sp, sp, 128                                   // |  2 :^                              |  0                                  |
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
