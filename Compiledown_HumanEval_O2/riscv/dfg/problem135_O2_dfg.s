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
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:         :                    |  0                                  |
    sext.w  s1, a0                                        // |  4  :         :^          v        |  0                                  |
    beqz    s1, .LBB0_4                                   // |  3  :         :v                   |  0                                  |
    slli    s2, a0, 32                                    // |  5  :         ::^         v        |  0                                  |
    li  a0, -1                                            // |  5  :         :::         ^        |  0                                  |
    slli    a0, a0, 32                                    // |  5  :         :::         ^        |  0                                  |
    add a0, a0, s2                                        // |  5  :         ::v         ^        |  0                                  |
    srai    a0, a0, 32                                    // |  5  :         :::         ^        |  0                                  |
    add a0, a0, s0                                        // |  5  :         v::         ^        |  0                                  |
    lbu s3, 0(a0)                                         // |  6  :         :::^        v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  7 ^:         ::::        :        |  0                                  |
    ld  a1, 0(a0)                                         // |  7  :         ::::        v^       |  0                                  |
    slli    a0, s3, 1                                     // |  7  :         :::v        ^:       |  0                                  |
    add a0, a0, a1                                        // |  6  :         :::         ^v       |  0                                  |
    lbu a0, 1(a0)                                         // |  6  :         :::         ^:       |  0                                  |
    andi    a2, a0, 4                                     // |  7  :         :::         v:^      |  0                                  |
    li  a0, 0                                             // |  7  :         :::         ^::      |  0                                  |
    beqz    a2, .LBB0_5                                   // |  6  :         :::          :v      |  0                                  |
    li  a0, 1                                             // |  6  :         :::         ^:       |  0                                  |
    beq s1, a0, .LBB0_5                                   // |  6  :         :v:         v:       |  0                                  |
    li  a0, -1                                            // |  5  :         : :         ^:       |  0                                  |
    slli    a0, a0, 33                                    // |  5  :         : :         ^:       |  0                                  |
    add a0, a0, s2                                        // |  5  :         : v         ^:       |  0                                  |
    srai    a0, a0, 32                                    // |  4  :         :           ^:       |  0                                  |
    add a0, a0, s0                                        // |  4  :         v           ^:       |  0                                  |
    lbu a0, 0(a0)                                         // |  3  :                     ^:       |  0                                  |
    slli    a0, a0, 1                                     // |  3  :                     ^:       |  0                                  |
    add a0, a0, a1                                        // |  3  :                     ^v       |  0                                  |
    lhu a0, 0(a0)                                         // |  2  :                     ^        |  0                                  |
    andi    a0, a0, 1024                                  // |  2  :                     ^        |  0                                  |
    seqz    a0, a0                                        // |  2  :                     ^        |  0                                  |
    j   .LBB0_5                                           // |  1  :                              |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    li  a0, 0                                             // |  2  :                     ^        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
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
