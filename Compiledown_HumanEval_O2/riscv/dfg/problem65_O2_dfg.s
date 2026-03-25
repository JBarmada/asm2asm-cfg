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
    mv  s2, a0                                            // |  3  :           ^         v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:           :                  |  0                                  |
    sext.w  s4, a0                                        // |  4  :           : ^       v        |  0                                  |
    blez    s4, .LBB0_6                                   // |  3  :           : v                |  0                                  |
    mv  s3, a0                                            // |  5  :           :^:       v        |  0                                  |
    li  s7, 0                                             // |  5  :           :::  ^             |  0                                  |
    li  a0, -1                                            // |  5  :           :::       ^        |  0                                  |
    srli    s5, a0, 32                                    // |  6  :           :::^      v        |  0                                  |
    slli    a0, s3, 32                                    // |  6  :           :v::      ^        |  0                                  |
    srli    s0, a0, 32                                    // |  7  :         ^ ::::      v        |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   s6, %pcrel_hi(.L.str)                         // |  6  :           ::::^              |  0                                  |
    addi    s6, s6, %pcrel_lo(.LBB0_8)                    // |  6  :           ::::^              |  0                                  |
    mv  s1, s2                                            // |  7  :          ^v::::              |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    lbu a1, 0(s1)                                         // |  8  :          v:::::      ^       |  0                                  |
    li  a2, 11                                            // |  7  :           :::::       ^      |  0                                  |
    mv  a0, s6                                            // |  7  :           ::::v     ^        |  0                                  |
    call    memchr@plt                                    // |  6 ^:           ::::               |  0                                  |
    snez    a0, a0                                        // |  6  :           ::::      ^        |  0                                  |
    addw    s7, s7, a0                                    // |  7  :           :::: ^    v        |  0                                  |
    addi    s0, s0, -1                                    // |  6  :         ^ ::::               |  0                                  |
    addi    s1, s1, 1                                     // |  7  :         :^::::               |  0                                  |
    bnez    s0, .LBB0_2                                   // |  6  :         v ::::               |  0                                  |
    blez    s4, .LBB0_7                                   // |  5  :           ::v:               |  0                                  |
    add a0, s3, s5                                        // |  5  :           :v v      ^        |  0                                  |
    and a0, a0, s5                                        // |  4  :           :  v      ^        |  0                                  |
    add a0, a0, s2                                        // |  3  :           v         ^        |  0                                  |
    lbu a0, 0(a0)                                         // |  2  :                     ^        |  0                                  |
    ori a0, a0, 32                                        // |  2  :                     ^        |  0                                  |
    li  a1, 121                                           // |  3  :                     :^       |  0                                  |
    bne a0, a1, .LBB0_7                                   // |  3  :                     vv       |  0                                  |
    addiw   s7, s7, 1                                     // |  2  :                ^             |  0                                  |
    j   .LBB0_7                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  s7, 0                                             // |  2  :                ^             |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    mv  a0, s7                                            // |  3  :                v    ^        |  0                                  |
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
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "aeiouAEIOU"                                  // |                                    |                                     |
    .size   .L.str, 11                                    // |                                    |                                     |
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
