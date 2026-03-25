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
    addi    sp, sp, -272                                  // |  1  ^                              |  0                                  |
    sd  ra, 264(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 256(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 248(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 240(sp)                                       // |  2  v           v                  |  0                                  |
    sd  s3, 232(sp)                                       // |  2  v            v                 |  0                                  |
    sd  s4, 224(sp)                                       // |  2  v             v                |  0                                  |
    sd  s5, 216(sp)                                       // |  2  v              v               |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    lbu a2, 0(a0)                                         // |  4  :          :          v ^      |  0                                  |
    li  a0, 47                                            // |  4  :          :          ^ :      |  0                                  |
    mv  s5, a1                                            // |  6  :          :   ^      :v:      |  0                                  |
    bne a2, a0, .LBB0_2                                   // |  5  :          :   :      v v      |  0                                  |
    li  s0, 0                                             // |  6  :         ^:   :      : :      |  0                                  |
    li  a1, 0                                             // |  6  :          :   :      :^:      |  0                                  |
    j   .LBB0_5                                           // |  5  :          :   :      : :      |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  a1, 0                                             // |  6  :          :   :      :^:      |  0                                  |
    addi    a3, s1, 1                                     // |  7  :          v   :      :::^     |  0                                  |
    addi    a4, sp, 115                                   // |  8  v          :   :      ::::^    |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a5, a4, a1                                        // |  9  :          :   :      :v::v^   |  0                                  |
    sb  a2, 0(a5)                                         // |  8  :          :   :      ::v: v   |  0                                  |
    add a2, a3, a1                                        // |  7  :          :   :      :v^v     |  0                                  |
    lbu a2, 0(a2)                                         // |  5  :          :   :      : ^      |  0                                  |
    addi    a1, a1, 1                                     // |  6  :          :   :      :^:      |  0                                  |
    bne a2, a0, .LBB0_3                                   // |  6  :          :   :      v:v      |  0                                  |
    mv  s0, a1                                            // |  5  :         ^:   :       v       |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  a0, -1                                            // |  6  :         ::   :      ^:       |  0                                  |
    srli    s4, a0, 32                                    // |  7  :         ::  ^:      v:       |  0                                  |
    addi    a0, sp, 115                                   // |  7  v         ::  ::      ^:       |  0                                  |
    add a0, a0, a1                                        // |  7  :         ::  ::      ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  6  :         ::  ::      v        |  0                                  |
    addi    a0, sp, 115                                   // |  6  v         ::  ::      ^        |  0                                  |
    li  a2, 10                                            // |  7  :         ::  ::      : ^      |  0                                  |
    li  a1, 0                                             // |  7  :         ::  ::      :^       |  0                                  |
    call    strtol@plt                                    // |  7 ^:         ::  ::      :        |  0                                  |
    addiw   a1, s0, 1                                     // |  7  :         v:  ::      :^       |  0                                  |
    slli    a1, a1, 32                                    // |  7  :         ::  ::      :^       |  0                                  |
    srli    a1, a1, 32                                    // |  7  :         ::  ::      :^       |  0                                  |
    add a1, a1, s1                                        // |  7  :         :v  ::      :^       |  0                                  |
    lbu a1, 0(a1)                                         // |  7  :         ::  ::      :^       |  0                                  |
    mv  s2, a0                                            // |  8  :         ::^ ::      v:       |  0                                  |
    beqz    a1, .LBB0_9                                   // |  7  :         ::: ::       v       |  0                                  |
    li  a3, 0                                             // |  8  :         ::: ::       : ^     |  0                                  |
    slli    a0, s0, 32                                    // |  9  :         v:: ::      ^: :     |  0                                  |
    srli    a0, a0, 32                                    // |  8  :          :: ::      ^: :     |  0                                  |
    add a0, a0, s1                                        // |  8  :          v: ::      ^: :     |  0                                  |
    addi    a0, a0, 2                                     // |  7  :           : ::      ^: :     |  0                                  |
    addi    a2, sp, 14                                    // |  8  v           : ::      ::^:     |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    add a4, a2, a3                                        // |  9  :           : ::      ::vv^    |  0                                  |
    sb  a1, 0(a4)                                         // |  8  :           : ::      :v :v    |  0                                  |
    add a1, a0, a3                                        // |  7  :           : ::      v^ v     |  0                                  |
    lbu a1, 0(a1)                                         // |  5  :           : ::       ^       |  0                                  |
    addi    a3, a3, 1                                     // |  6  :           : ::       : ^     |  0                                  |
    bnez    a1, .LBB0_7                                   // |  6  :           : ::       v :     |  0                                  |
    and a0, a3, s4                                        // |  6  :           : v:      ^  v     |  0                                  |
    j   .LBB0_10                                          // |  4  :           : ::               |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  5  :           : ::      ^        |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    addi    a1, sp, 14                                    // |  5  v           : ::       ^       |  0                                  |
    add a0, a0, a1                                        // |  6  :           : ::      ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :           : ::      v        |  0                                  |
    addi    a0, sp, 14                                    // |  5  v           : ::      ^        |  0                                  |
    li  a2, 10                                            // |  6  :           : ::      : ^      |  0                                  |
    li  a1, 0                                             // |  6  :           : ::      :^       |  0                                  |
    call    strtol@plt                                    // |  6 ^:           : ::      :        |  0                                  |
    lbu a2, 0(s5)                                         // |  6  :           : :v      : ^      |  0                                  |
    li  a1, 47                                            // |  7  :           : ::      :^:      |  0                                  |
    mv  s3, a0                                            // |  8  :           :^::      v::      |  0                                  |
    bne a2, a1, .LBB0_12                                  // |  7  :           ::::       vv      |  0                                  |
    li  s0, 0                                             // |  8  :         ^ ::::       ::      |  0                                  |
    li  a0, 0                                             // |  8  :           ::::      ^::      |  0                                  |
    j   .LBB0_15                                          // |  7  :           ::::       ::      |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  8  :           ::::      ^::      |  0                                  |
    addi    a3, s5, 1                                     // |  9  :           :::v      :::^     |  0                                  |
    addi    a4, sp, 115                                   // | 10  v           ::::      ::::^    |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    add a5, a4, a0                                        // | 11  :           ::::      v:::v^   |  0                                  |
    sb  a2, 0(a5)                                         // | 10  :           ::::      ::v: v   |  0                                  |
    add a2, a3, a0                                        // |  9  :           ::::      v:^v     |  0                                  |
    lbu a2, 0(a2)                                         // |  7  :           ::::       :^      |  0                                  |
    addi    a0, a0, 1                                     // |  8  :           ::::      ^::      |  0                                  |
    bne a2, a1, .LBB0_13                                  // |  8  :           ::::      :vv      |  0                                  |
    mv  s0, a0                                            // |  7  :         ^ ::::      v        |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    addi    a1, sp, 115                                   // |  7  v         : ::::       ^       |  0                                  |
    add a0, a0, a1                                        // |  8  :         : ::::      ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  7  :         : ::::      v        |  0                                  |
    addi    a0, sp, 115                                   // |  7  v         : ::::      ^        |  0                                  |
    li  a2, 10                                            // |  8  :         : ::::      : ^      |  0                                  |
    li  a1, 0                                             // |  8  :         : ::::      :^       |  0                                  |
    call    strtol@plt                                    // |  8 ^:         : ::::      :        |  0                                  |
    addiw   a1, s0, 1                                     // |  8  :         v ::::      :^       |  0                                  |
    slli    a1, a1, 32                                    // |  8  :         : ::::      :^       |  0                                  |
    srli    a1, a1, 32                                    // |  8  :         : ::::      :^       |  0                                  |
    add a1, a1, s5                                        // |  8  :         : :::v      :^       |  0                                  |
    lbu a1, 0(a1)                                         // |  8  :         : ::::      :^       |  0                                  |
    mv  s1, a0                                            // |  9  :         :^::::      v:       |  0                                  |
    beqz    a1, .LBB0_19                                  // |  8  :         ::::::       v       |  0                                  |
    li  a3, 0                                             // |  9  :         ::::::       : ^     |  0                                  |
    slli    a0, s0, 32                                    // | 10  :         v:::::      ^: :     |  0                                  |
    srli    a0, a0, 32                                    // |  9  :          :::::      ^: :     |  0                                  |
    add a0, a0, s5                                        // |  9  :          ::::v      ^: :     |  0                                  |
    addi    a0, a0, 2                                     // |  8  :          ::::       ^: :     |  0                                  |
    addi    a2, sp, 14                                    // |  9  v          ::::       ::^:     |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    add a4, a2, a3                                        // | 10  :          ::::       ::vv^    |  0                                  |
    sb  a1, 0(a4)                                         // |  9  :          ::::       :v :v    |  0                                  |
    add a1, a0, a3                                        // |  8  :          ::::       v^ v     |  0                                  |
    lbu a1, 0(a1)                                         // |  6  :          ::::        ^       |  0                                  |
    addi    a3, a3, 1                                     // |  7  :          ::::        : ^     |  0                                  |
    bnez    a1, .LBB0_17                                  // |  7  :          ::::        v :     |  0                                  |
    and a0, a3, s4                                        // |  7  :          :::v       ^  v     |  0                                  |
    j   .LBB0_20                                          // |  4  :          :::                 |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  5  :          :::        ^        |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
    addi    a1, sp, 14                                    // |  5  v          :::         ^       |  0                                  |
    add a0, a0, a1                                        // |  6  :          :::        ^v       |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :          :::        v        |  0                                  |
    addi    a0, sp, 14                                    // |  5  v          :::        ^        |  0                                  |
    li  a2, 10                                            // |  5  :          :::          ^      |  0                                  |
    li  a1, 0                                             // |  5  :          :::         ^       |  0                                  |
    call    strtol@plt                                    // |  5 ^:          :::                 |  0                                  |
    mulw    a1, s1, s2                                    // |  5  :          vv:         ^       |  0                                  |
    mulw    a0, a0, s3                                    // |  4  :            v        ^:       |  0                                  |
    remw    a0, a1, a0                                    // |  3  :                     ^v       |  0                                  |
    seqz    a0, a0                                        // |  2  :                     ^        |  0                                  |
    ld  ra, 264(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 256(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 248(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 240(sp)                                       // |  3 :v           ^                  |  0                                  |
    ld  s3, 232(sp)                                       // |  3 :v            ^                 |  0                                  |
    ld  s4, 224(sp)                                       // |  3 :v             ^                |  0                                  |
    ld  s5, 216(sp)                                       // |  3 :v              ^               |  0                                  |
    addi    sp, sp, 272                                   // |  2 :^                              |  0                                  |
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
