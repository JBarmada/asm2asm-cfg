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
    .section    .sdata,"aw",@progbits                     // |                                    |                                     |
    .p2align    3                                         // |                                    |                                     |
.LCPI0_0:                                                 // |                                    |                                     |
    .quad   4575140898685201                              // |                                    |                                     |
    .text                                                 // |                                    |                                     |
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
    lbu s1, 0(a0)                                         // |  3  :          ^          v        |  0                                  |
    mv  s3, a1                                            // |  4  :          : ^         v       |  0                                  |
    beqz    s1, .LBB0_11                                  // |  3  :          v :                 |  0                                  |
    mv  s2, a0                                            // |  5  :          :^:        v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  5 ^:          :::                 |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.LCPI0_0)                       // |  5  :          :::         ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_13)                   // |  5  :          :::         ^       |  0                                  |
    ld  s4, 0(a1)                                         // |  6  :          :::^        v       |  0                                  |
    mv  s6, a0                                            // |  7  :          :::: ^     v        |  0                                  |
    li  s0, 0                                             // |  7  :         ^:::: :              |  0                                  |
    addi    s5, s2, 1                                     // |  8  :         ::v::^:              |  0                                  |
    li  s2, 52                                            // |  8  :         ::^::::              |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    ld  a0, 0(s6)                                         // |  9  :         ::::::v     ^        |  0                                  |
    andi    s7, s1, 255                                   // |  8  :         :v:::: ^             |  0                                  |
    slli    a1, s7, 1                                     // |  8  :         : :::: v     ^       |  0                                  |
    add a0, a0, a1                                        // |  9  :         : :::: :    ^v       |  0                                  |
    lhu a0, 0(a0)                                         // |  8  :         : :::: :    ^        |  0                                  |
    andi    a1, a0, 512                                   // |  9  :         : :::: :    v^       |  0                                  |
    bnez    a1, .LBB0_5                                   // |  8  :         : :::: :     v       |  0                                  |
    andi    a0, a0, 256                                   // |  8  :         : :::: :    ^        |  0                                  |
    beqz    a0, .LBB0_7                                   // |  8  :         : :::: :    v        |  0                                  |
    call    __ctype_tolower_loc@plt                       // |  9 ^:         : :::: :    :        |  0                                  |
    j   .LBB0_6                                           // |  8  :         : :::: :    :        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    call    __ctype_toupper_loc@plt                       // |  9 ^:         : :::: :    :        |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    ld  a0, 0(a0)                                         // |  8  :         : :::: :    v        |  0                                  |
    slli    a1, s7, 2                                     // |  8  :         : :::: v     ^       |  0                                  |
    add a0, a0, a1                                        // |  8  :         : ::::      ^v       |  0                                  |
    lb  s1, 0(a0)                                         // |  8  :         :^::::      v        |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    andi    a0, s1, 255                                   // |  8  :         :v::::      ^        |  0                                  |
    addi    a0, a0, -65                                   // |  7  :         : ::::      ^        |  0                                  |
    bltu    s2, a0, .LBB0_10                              // |  7  :         : v:::      v        |  0                                  |
    srl a0, s4, a0                                        // |  6  :         :  :v:      ^        |  0                                  |
    andi    a0, a0, 1                                     // |  5  :         :  : :      ^        |  0                                  |
    beqz    a0, .LBB0_10                                  // |  5  :         :  : :      v        |  0                                  |
    addi    s1, s1, 2                                     // |  5  :         :^ : :               |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    add a0, s3, s0                                        // |  6  :         v: v :      ^        |  0                                  |
    sb  s1, 0(a0)                                         // |  6  :         :v : :      v        |  0                                  |
    add a0, s5, s0                                        // |  5  :         v  : v      ^        |  0                                  |
    lbu s1, 0(a0)                                         // |  5  :         :^ :        v        |  0                                  |
    addi    a0, s0, 1                                     // |  5  :         v: :        ^        |  0                                  |
    mv  s0, a0                                            // |  5  :         ^: :        v        |  0                                  |
    bnez    s1, .LBB0_2                                   // |  3  :          v :                 |  0                                  |
    j   .LBB0_12                                          // |  2  :            :                 |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  3  :            :        ^        |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    add a0, a0, s3                                        // |  3  :            v        ^        |  0                                  |
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
