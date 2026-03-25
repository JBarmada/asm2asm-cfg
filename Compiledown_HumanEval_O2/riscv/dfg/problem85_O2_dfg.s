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
    mv  a2, a0                                            // |  3  :                     v ^      |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str)                         // |  2  :                      ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_14)                   // |  2  :                      ^       |  0                                  |
    addi    a0, sp, 10                                    // |  2  v                     ^        |  0                                  |
    call    sprintf@plt                                   // |  2 ^:                              |  0                                  |
    lbu a0, 10(sp)                                        // |  2  v                     ^        |  0                                  |
    beqz    a0, .LBB0_10                                  // |  2  :                     v        |  0                                  |
    li  s0, 0                                             // |  3  :         ^           :        |  0                                  |
    addi    a1, sp, 11                                    // |  4  v         :           :^       |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    andi    a2, a0, 255                                   // |  5  :         :           v:^      |  0                                  |
    lbu a0, 0(a1)                                         // |  4  :         :           ^v       |  0                                  |
    addw    a2, a2, s0                                    // |  4  :         v           : ^      |  0                                  |
    addiw   s0, a2, -48                                   // |  4  :         ^           : v      |  0                                  |
    addi    a1, a1, 1                                     // |  4  :         :           :^       |  0                                  |
    bnez    a0, .LBB0_2                                   // |  3  :         :           v        |  0                                  |
    li  a0, 33                                            // |  3  :         :           ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:         :           :        |  0                                  |
    beqz    s0, .LBB0_11                                  // |  3  :         v           :        |  0                                  |
    li  a1, 0                                             // |  4  :         :           :^       |  0                                  |
    blez    s0, .LBB0_12                                  // |  4  :         v           ::       |  0                                  |
    li  a2, 2                                             // |  5  :         :           ::^      |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    mv  a3, s0                                            // |  6  :         v           :::^     |  0                                  |
    andi    a4, s0, 1                                     // |  7  :         v           ::::^    |  0                                  |
    ori a4, a4, 48                                        // |  6  :                     ::::^    |  0                                  |
    add a5, a0, a1                                        // |  7  :                     vv:::^   |  0                                  |
    addi    a1, a1, 1                                     // |  7  :                     :^::::   |  0                                  |
    sb  a4, 0(a5)                                         // |  7  :                     ::::vv   |  0                                  |
    srliw   s0, s0, 1                                     // |  6  :         ^           ::::     |  0                                  |
    bgeu    a3, a2, .LBB0_6                               // |  5  :                     ::vv     |  0                                  |
    add a2, a0, a1                                        // |  4  :                     vv^      |  0                                  |
    li  a3, 1                                             // |  5  :                     :::^     |  0                                  |
    slli    a3, a3, 32                                    // |  5  :                     :::^     |  0                                  |
    addi    a3, a3, -2                                    // |  5  :                     :::^     |  0                                  |
    and a3, a3, a1                                        // |  5  :                     :v:^     |  0                                  |
    sb  zero, 0(a2)                                       // |  5  :                     ::v:     |  0                                  |
    beqz    a3, .LBB0_13                                  // |  4  :                     :: v     |  0                                  |
    li  a2, 0                                             // |  4  :                     ::^      |  0                                  |
    addi    a3, a1, -1                                    // |  5  :                     :v:^     |  0                                  |
    srli    a6, a1, 1                                     // |  6  :                     :v::  ^  |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    add a4, a0, a2                                        // |  6  :                     v v:^ :  |  0                                  |
    add a5, a0, a3                                        // |  6  :                     v  v:^:  |  0                                  |
    lb  s0, 0(a5)                                         // |  5  :         ^               :v:  |  0                                  |
    lb  a1, 0(a4)                                         // |  6  :         :            ^  v::  |  0                                  |
    sb  s0, 0(a4)                                         // |  6  :         v            :  v::  |  0                                  |
    sb  a1, 0(a5)                                         // |  4  :                      v   v:  |  0                                  |
    addi    a2, a2, 1                                     // |  3  :                       ^   :  |  0                                  |
    addi    a3, a3, -1                                    // |  4  :                       :^  :  |  0                                  |
    bne a6, a2, .LBB0_9                                   // |  3  :                       v   v  |  0                                  |
    j   .LBB0_13                                          // |  1  :                              |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    li  a0, 33                                            // |  2  :                     ^        |  0                                  |
    call    malloc@plt                                    // |  3 ^:                     :        |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a1, 48                                            // |  3  :                     :^       |  0                                  |
    sb  a1, 0(a0)                                         // |  3  :                     vv       |  0                                  |
    li  a1, 1                                             // |  3  :                     :^       |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    add a1, a1, a0                                        // |  3  :                     v^       |  0                                  |
    sb  zero, 0(a1)                                       // |  2  :                      v       |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "%d"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
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
