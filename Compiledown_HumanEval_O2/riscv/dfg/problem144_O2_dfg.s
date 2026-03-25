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
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s4, a0                                            // |  4  :           : ^       v        |  0                                  |
    li  s0, 0                                             // |  4  :         ^ : :                |  0                                  |
    li  s1, 0                                             // |  4  :          ^: :                |  0                                  |
    li  s3, 0                                             // |  5  :          ::^:                |  0                                  |
    li  s5, 32                                            // |  6  :          ::::^               |  0                                  |
    li  s6, 2                                             // |  7  :          :::::^              |  0                                  |
    li  s7, 4                                             // |  8  :          ::::::^             |  0                                  |
    j   .LBB0_3                                           // |  8  :          :::::::             |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    add a0, s2, s3                                        // |  9  :          :vv::::    ^        |  0                                  |
    sub a1, a1, s1                                        // |  8  :          v: ::::     ^       |  0                                  |
    mv  a2, s1                                            // |  8  :          v: ::::      ^      |  0                                  |
    call    memcpy@plt                                    // |  8 ^:          :: ::::             |  0                                  |
    addw    s3, s3, s1                                    // |  8  :          v:^::::             |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    li  s1, 0                                             // |  8  :          ^::::::             |  0                                  |
    addi    s0, s0, 1                                     // |  8  :         ^ ::::::             |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a1, s4, s0                                        // |  9  :         v ::v:::     ^       |  0                                  |
    lbu a0, 0(a1)                                         // |  8  :           :: :::    ^v       |  0                                  |
    beq a0, s5, .LBB0_6                                   // |  7  :           :: v::    v        |  0                                  |
    beqz    a0, .LBB0_13                                  // |  7  :           :: :::    v        |  0                                  |
    addiw   s1, s1, 1                                     // |  7  :          ^:: :::             |  0                                  |
    addi    s0, s0, 1                                     // |  8  :         ^::: :::             |  0                                  |
    j   .LBB0_3                                           // |  7  :          ::: :::             |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    blt s1, s6, .LBB0_2                                   // |  7  :          v:: :v:             |  0                                  |
    bltu    s1, s7, .LBB0_11                              // |  6  :          v:: : v             |  0                                  |
    li  a0, 2                                             // |  6  :          ::: :      ^        |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    remw    a2, s1, a0                                    // |  7  :          v:: :      v ^      |  0                                  |
    beqz    a2, .LBB0_2                                   // |  6  :          ::: :        v      |  0                                  |
    addiw   a0, a0, 1                                     // |  6  :          ::: :      ^        |  0                                  |
    mulw    a2, a0, a0                                    // |  7  :          ::: :      v ^      |  0                                  |
    bge s1, a2, .LBB0_9                                   // |  6  :          v:: :        v      |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    blez    s3, .LBB0_1                                   // |  5  :          ::v :               |  0                                  |
    add a0, s2, s3                                        // |  6  :          :vv :      ^        |  0                                  |
    addiw   s3, s3, 1                                     // |  6  :          ::^ :      :        |  0                                  |
    sb  s5, 0(a0)                                         // |  6  :          ::: v      v        |  0                                  |
    j   .LBB0_1                                           // |  4  :          :::                 |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    li  a0, 2                                             // |  5  :          :::        ^        |  0                                  |
    blt s1, a0, .LBB0_21                                  // |  5  :          v::        v        |  0                                  |
    li  a0, 4                                             // |  5  :          :::        ^        |  0                                  |
    bltu    s1, a0, .LBB0_18                              // |  5  :          v::        v        |  0                                  |
    li  a0, 2                                             // |  5  :          :::        ^        |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    remw    a2, s1, a0                                    // |  6  :          v::        v ^      |  0                                  |
    beqz    a2, .LBB0_21                                  // |  5  :          :::          v      |  0                                  |
    addiw   a0, a0, 1                                     // |  5  :          :::        ^        |  0                                  |
    mulw    a2, a0, a0                                    // |  6  :          :::        v ^      |  0                                  |
    bge s1, a2, .LBB0_16                                  // |  5  :          v::          v      |  0                                  |
.LBB0_18:                                                 // |                                    |                                     |
    blez    s3, .LBB0_20                                  // |  4  :          ::v                 |  0                                  |
    add a0, s2, s3                                        // |  5  :          :vv        ^        |  0                                  |
    addiw   s3, s3, 1                                     // |  5  :          ::^        :        |  0                                  |
    li  a2, 32                                            // |  6  :          :::        : ^      |  0                                  |
    sb  a2, 0(a0)                                         // |  6  :          :::        v v      |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
    add a0, s2, s3                                        // |  5  :          :vv        ^        |  0                                  |
    sub a1, a1, s1                                        // |  4  :          v:          ^       |  0                                  |
    mv  a2, s1                                            // |  4  :          v:           ^      |  0                                  |
    call    memcpy@plt                                    // |  4 ^:          ::                  |  0                                  |
    addw    s3, s3, s1                                    // |  4  :          v:^                 |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    add a0, s2, s3                                        // |  4  :           vv        ^        |  0                                  |
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
