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
    addi    sp, sp, -352                                  // |  1  ^                              |  0                                  |
    sd  ra, 344(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 336(sp)                                       // |  2  v         v                    |  0                                  |
    sd  s1, 328(sp)                                       // |  2  v          v                   |  0                                  |
    sd  s2, 320(sp)                                       // |  2  v           v                  |  0                                  |
    sd  s3, 312(sp)                                       // |  2  v            v                 |  0                                  |
    sd  s4, 304(sp)                                       // |  2  v             v                |  0                                  |
    sd  s5, 296(sp)                                       // |  2  v              v               |  0                                  |
    sd  s6, 288(sp)                                       // |  2  v               v              |  0                                  |
    sd  s7, 280(sp)                                       // |  2  v                v             |  0                                  |
    sd  s8, 272(sp)                                       // |  2  v                 v            |  0                                  |
    sd  s9, 264(sp)                                       // |  2  v                  v           |  0                                  |
    blez    a1, .LBB0_13                                  // |  2  :                      v       |  0                                  |
    mv  s4, a1                                            // |  3  :             ^        v       |  0                                  |
    mv  s3, a0                                            // |  4  :            ^:       v        |  0                                  |
    li  s8, 0                                             // |  4  :            ::   ^            |  0                                  |
    li  s6, 0                                             // |  4  :            :: ^              |  0                                  |
.LBB0_15:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  4  :           ^::                |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_15)                   // |  4  :           ^::                |  0                                  |
    addi    s7, sp, 8                                     // |  4  v            ::  ^             |  0                                  |
    j   .LBB0_4                                           // |  4  :            ::  :             |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    mv  s6, s9                                            // |  6  :            :: ^: v           |  0                                  |
    mv  s2, s5                                            // |  7  :           ^::v::             |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    addi    s8, s8, 1                                     // |  7  :           ::: ::^            |  0                                  |
    beq s8, s4, .LBB0_14                                  // |  7  :           ::v ::v            |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    addi    a0, sp, 8                                     // |  7  v           ::  :::   ^        |  0                                  |
    li  a2, 256                                           // |  7  :           ::  :::     ^      |  0                                  |
    li  a1, 0                                             // |  7  :           ::  :::    ^       |  0                                  |
    call    memset@plt                                    // |  7 ^:           ::  :::            |  0                                  |
    slli    a0, s8, 3                                     // |  7  :           ::  ::v   ^        |  0                                  |
    add a0, a0, s3                                        // |  6  :           :v  ::    ^        |  0                                  |
    ld  s5, 0(a0)                                         // |  6  :           :  ^::    v        |  0                                  |
    lbu s1, 0(s5)                                         // |  6  :          ^:  v::             |  0                                  |
    beqz    s1, .LBB0_9                                   // |  6  :          v:  :::             |  0                                  |
    li  s9, 0                                             // |  6  :           :  ::: ^           |  0                                  |
    addi    s0, s5, 1                                     // |  6  :         ^ :  v::             |  0                                  |
    j   .LBB0_7                                           // |  6  :         : :  :::             |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    lbu s1, 0(s0)                                         // |  7  :         v^:  :::             |  0                                  |
    addi    s0, s0, 1                                     // |  7  :         ^::  :::             |  0                                  |
    beqz    s1, .LBB0_10                                  // |  6  :          v:  :::             |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    andi    a1, s1, 255                                   // |  7  :          v:  :::     ^       |  0                                  |
    addi    a0, sp, 8                                     // |  7  v          ::  :::    ^        |  0                                  |
    call    strchr@plt                                    // |  8 ^:          ::  :::    :        |  0                                  |
    bnez    a0, .LBB0_6                                   // |  7  :          ::  :::    v        |  0                                  |
    addi    a0, sp, 8                                     // |  7  v          ::  :::    ^        |  0                                  |
    call    strlen@plt                                    // |  8 ^:          ::  :::    :        |  0                                  |
    sext.w  a1, a0                                        // |  8  :          ::  :::    v^       |  0                                  |
    add a1, a1, s7                                        // |  7  :          ::  ::v     ^       |  0                                  |
    sb  s1, 0(a1)                                         // |  7  :          v:  :::     v       |  0                                  |
    addiw   a0, a0, 1                                     // |  6  :           :  :::    ^        |  0                                  |
    add a0, a0, s7                                        // |  6  :           :  ::v    ^        |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :           :  ::     v        |  0                                  |
    addiw   s9, s9, 1                                     // |  5  :           :  ::  ^           |  0                                  |
    j   .LBB0_6                                           // |  4  :           :  ::              |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  s9, 0                                             // |  5  :           :  ::  ^           |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    blt s6, s9, .LBB0_2                                   // |  5  :           :  :v  v           |  0                                  |
    bne s9, s6, .LBB0_3                                   // |  5  :           :  :v  v           |  0                                  |
    mv  a0, s5                                            // |  4  :           :  v      ^        |  0                                  |
    mv  a1, s2                                            // |  4  :           v         :^       |  0                                  |
    call    strcmp@plt                                    // |  3 ^:                     :        |  0                                  |
    bltz    a0, .LBB0_2                                   // |  2  :                     v        |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
.LBB0_16:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str)                         // |  2  :           ^                  |  0                                  |
    addi    s2, s2, %pcrel_lo(.LBB0_16)                   // |  2  :           ^                  |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    mv  a0, s2                                            // |  3  :           v         ^        |  0                                  |
    ld  ra, 344(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 336(sp)                                       // |  3 :v         ^                    |  0                                  |
    ld  s1, 328(sp)                                       // |  3 :v          ^                   |  0                                  |
    ld  s2, 320(sp)                                       // |  3 :v           ^                  |  0                                  |
    ld  s3, 312(sp)                                       // |  3 :v            ^                 |  0                                  |
    ld  s4, 304(sp)                                       // |  3 :v             ^                |  0                                  |
    ld  s5, 296(sp)                                       // |  3 :v              ^               |  0                                  |
    ld  s6, 288(sp)                                       // |  3 :v               ^              |  0                                  |
    ld  s7, 280(sp)                                       // |  3 :v                ^             |  0                                  |
    ld  s8, 272(sp)                                       // |  3 :v                 ^            |  0                                  |
    ld  s9, 264(sp)                                       // |  3 :v                  ^           |  0                                  |
    addi    sp, sp, 352                                   // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .zero   1                                             // |                                    |                                     |
    .size   .L.str, 1                                     // |                                    |                                     |
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
