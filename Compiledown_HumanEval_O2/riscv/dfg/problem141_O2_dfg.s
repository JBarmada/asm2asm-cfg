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
    addi    sp, sp, -80                                   // |  1  ^                              |  0                                  |
    sd  ra, 72(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 64(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 56(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 48(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 40(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 32(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 24(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 16(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 8(sp)                                         // |  2  v                v             |  0                                  |
    sd  s8, 0(sp)                                         // |  2  v                 v            |  0                                  |
    mv  s3, a0                                            // |  3  :            ^        v        |  0                                  |
    lbu a0, 0(a0)                                         // |  3  :            :        ^        |  0                                  |
    mv  s2, a1                                            // |  5  :           ^:        :v       |  0                                  |
    beqz    a0, .LBB0_17                                  // |  4  :           ::        v        |  0                                  |
    li  s0, 0                                             // |  4  :         ^ ::                 |  0                                  |
    li  s4, 0                                             // |  4  :           ::^                |  0                                  |
    li  s1, 0                                             // |  5  :          ^:::                |  0                                  |
    li  s5, 32                                            // |  5  :           :::^               |  0                                  |
    li  s6, 1                                             // |  6  :           ::::^              |  0                                  |
    li  s7, 2                                             // |  7  :           :::::^             |  0                                  |
    li  s8, 3                                             // |  8  :           ::::::^            |  0                                  |
    j   .LBB0_4                                           // |  8  :           :::::::            |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   s1, s1, 1                                     // |  9  :          ^:::::::            |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    s0, s0, 1                                     // | 10  :         ^::::::::            |  0                                  |
    mv  a0, s3                                            // | 11  :         :::v:::::   ^        |  0                                  |
    call    strlen@plt                                    // | 12 ^:         :::::::::   :        |  0                                  |
    bgeu    s0, a0, .LBB0_14                              // | 11  :         v::::::::   v        |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a0, s3, s0                                        // | 11  :         v::v:::::   ^        |  0                                  |
    lbu a1, 0(a0)                                         // | 10  :          :: :::::   v^       |  0                                  |
    beq a1, s5, .LBB0_2                                   // | 10  :          :: :v:::   :v       |  0                                  |
    beq s1, s6, .LBB0_8                                   // |  8  :          v: : v::   :        |  0                                  |
    bne s1, s7, .LBB0_9                                   // |  7  :          v: :  v:   :        |  0                                  |
    addiw   a2, s4, 1                                     // |  6  :           : v   :   : ^      |  0                                  |
    add a3, s2, s4                                        // |  6  :           v v   :   :  ^     |  0                                  |
    li  a1, 95                                            // |  7  :           : :   :   :^ :     |  0                                  |
    sb  a1, 0(a3)                                         // |  7  :           : :   :   :v v     |  0                                  |
    li  s1, 2                                             // |  6  :          ^: :   :   :        |  0                                  |
    j   .LBB0_12                                          // |  6  :          :: :   :   :        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    li  a1, 95                                            // |  7  :          :: :   :   :^       |  0                                  |
    j   .LBB0_11                                          // |  6  :          :: :   :   :        |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    blt s1, s8, .LBB0_13                                  // |  6  :          v: :   v   :        |  0                                  |
    li  a1, 45                                            // |  5  :           : :       :^       |  0                                  |
    li  s1, 1                                             // |  6  :          ^: :       ::       |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    mv  a2, s4                                            // |  7  :          :: v       ::^      |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    addw    s4, s4, s1                                    // |  6  :          v: ^       ::       |  0                                  |
    add a2, a2, s2                                        // |  6  :           v :       ::^      |  0                                  |
    sb  a1, 0(a2)                                         // |  6  :           : :       :vv      |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    lb  a0, 0(a0)                                         // |  4  :           : :       v        |  0                                  |
    li  s1, 0                                             // |  5  :          ^: :       :        |  0                                  |
    add a1, s2, s4                                        // |  6  :          :v v       :^       |  0                                  |
    addiw   s4, s4, 1                                     // |  6  :          :: ^       ::       |  0                                  |
    sb  a0, 0(a1)                                         // |  6  :          :: :       vv       |  0                                  |
    j   .LBB0_3                                           // |  4  :          :: :                |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    li  a0, 1                                             // |  5  :          :: :       ^        |  0                                  |
    beq s1, a0, .LBB0_18                                  // |  5  :          v: :       v        |  0                                  |
    li  a0, 2                                             // |  5  :          :: :       ^        |  0                                  |
    bne s1, a0, .LBB0_19                                  // |  5  :          v: :       v        |  0                                  |
    addiw   a1, s4, 1                                     // |  4  :           : v        ^       |  0                                  |
    add a2, s2, s4                                        // |  4  :           v v         ^      |  0                                  |
    li  a0, 95                                            // |  4  :           :         ^ :      |  0                                  |
    sb  a0, 0(a2)                                         // |  4  :           :         v v      |  0                                  |
    li  s1, 2                                             // |  3  :          ^:                  |  0                                  |
    j   .LBB0_22                                          // |  3  :          ::                  |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    li  s4, 0                                             // |  4  :          :: ^                |  0                                  |
    j   .LBB0_23                                          // |  4  :          :: :                |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    li  a0, 95                                            // |  5  :          :: :       ^        |  0                                  |
    j   .LBB0_21                                          // |  4  :          :: :                |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    li  a0, 3                                             // |  5  :          :: :       ^        |  0                                  |
    blt s1, a0, .LBB0_23                                  // |  5  :          v: :       v        |  0                                  |
    li  a0, 45                                            // |  4  :           : :       ^        |  0                                  |
    li  s1, 1                                             // |  5  :          ^: :       :        |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    mv  a1, s4                                            // |  6  :          :: v       :^       |  0                                  |
.LBB0_22:                                                 // |                                    |                                     |
    addw    s4, s4, s1                                    // |  5  :          v: ^       :        |  0                                  |
    add a1, a1, s2                                        // |  5  :           v :       :^       |  0                                  |
    sb  a0, 0(a1)                                         // |  5  :           : :       vv       |  0                                  |
.LBB0_23:                                                 // |                                    |                                     |
    add a0, s2, s4                                        // |  4  :           v v       ^        |  0                                  |
    sb  zero, 0(a0)                                       // |  2  :                     v        |  0                                  |
    ld  ra, 72(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 64(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 56(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 48(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 40(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 32(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 24(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 16(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 8(sp)                                         // |  3 :v                ^             |  0                                  |
    ld  s8, 0(sp)                                         // |  3 :v                 ^            |  0                                  |
    addi    sp, sp, 80                                    // |  2 :^                              |  0                                  |
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
