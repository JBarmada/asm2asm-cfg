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
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    call    strlen@plt                                    // |  3 ^:         :                    |  0                                  |
    li  a1, 10                                            // |  3  :         :            ^       |  0                                  |
    bne a0, a1, .LBB0_11                                  // |  4  :         :           vv       |  0                                  |
    lbu a0, 0(s0)                                         // |  3  :         v           ^        |  0                                  |
    addiw   a1, a0, -58                                   // |  4  :         :           v^       |  0                                  |
    andi    a1, a1, 255                                   // |  3  :         :            ^       |  0                                  |
    li  a2, 246                                           // |  4  :         :            :^      |  0                                  |
    bltu    a1, a2, .LBB0_11                              // |  4  :         :            vv      |  0                                  |
    lbu a1, 1(s0)                                         // |  4  :         v            ^:      |  0                                  |
    addiw   a3, a1, -58                                   // |  5  :         :            v:^     |  0                                  |
    andi    a3, a3, 255                                   // |  5  :         :            ::^     |  0                                  |
    bltu    a3, a2, .LBB0_11                              // |  5  :         :            :vv     |  0                                  |
    lbu a2, 2(s0)                                         // |  4  :         v            :^      |  0                                  |
    li  a3, 45                                            // |  5  :         :            ::^     |  0                                  |
    bne a2, a3, .LBB0_11                                  // |  5  :         :            :vv     |  0                                  |
    lbu a2, 3(s0)                                         // |  4  :         v            :^      |  0                                  |
    addiw   a3, a2, -58                                   // |  5  :         :            :v^     |  0                                  |
    andi    a3, a3, 255                                   // |  5  :         :            ::^     |  0                                  |
    li  a4, 246                                           // |  6  :         :            :::^    |  0                                  |
    bltu    a3, a4, .LBB0_11                              // |  6  :         :            ::vv    |  0                                  |
    lbu a3, 4(s0)                                         // |  6  :         v            ::^:    |  0                                  |
    addiw   a5, a3, -58                                   // |  7  :         :            ::v:^   |  0                                  |
    andi    a5, a5, 255                                   // |  7  :         :            ::::^   |  0                                  |
    bltu    a5, a4, .LBB0_11                              // |  7  :         :            :::vv   |  0                                  |
    lbu a4, 5(s0)                                         // |  6  :         v            :::^    |  0                                  |
    li  a5, 45                                            // |  7  :         :            ::::^   |  0                                  |
    bne a4, a5, .LBB0_11                                  // |  7  :         :            :::vv   |  0                                  |
    lb  a4, 6(s0)                                         // |  6  :         v            :::^    |  0                                  |
    addiw   a4, a4, -58                                   // |  6  :         :            :::^    |  0                                  |
    andi    a5, a4, 255                                   // |  7  :         :            :::v^   |  0                                  |
    li  a4, 246                                           // |  7  :         :            :::^:   |  0                                  |
    bltu    a5, a4, .LBB0_11                              // |  7  :         :            :::vv   |  0                                  |
    lb  a5, 7(s0)                                         // |  7  :         v            ::::^   |  0                                  |
    addiw   a5, a5, -58                                   // |  7  :         :            ::::^   |  0                                  |
    andi    a5, a5, 255                                   // |  7  :         :            ::::^   |  0                                  |
    bltu    a5, a4, .LBB0_11                              // |  7  :         :            :::vv   |  0                                  |
    lb  a4, 8(s0)                                         // |  6  :         v            :::^    |  0                                  |
    addiw   a4, a4, -58                                   // |  6  :         :            :::^    |  0                                  |
    andi    a5, a4, 255                                   // |  7  :         :            :::v^   |  0                                  |
    li  a4, 246                                           // |  7  :         :            :::^:   |  0                                  |
    bltu    a5, a4, .LBB0_11                              // |  7  :         :            :::vv   |  0                                  |
    lb  a5, 9(s0)                                         // |  7  :         v            ::::^   |  0                                  |
    addiw   a5, a5, -58                                   // |  6  :                      ::::^   |  0                                  |
    andi    a5, a5, 255                                   // |  6  :                      ::::^   |  0                                  |
    bgeu    a5, a4, .LBB0_13                              // |  6  :                      :::vv   |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    li  a0, 0                                             // |  5  :                     ^:::     |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  6 ^v                     ::::     |  0                                  |
    ld  s0, 16(sp)                                        // |  7 :v         ^           ::::     |  0                                  |
    addi    sp, sp, 32                                    // |  6 :^                     ::::     |  0                                  |
    ret                                                   // |  6 v:                     ::::     |  0                                  |
.LBB0_13:                                                 // |                                    |                                     |
    sb  a0, 13(sp)                                        // |  5  v                     v:::     |  0                                  |
    sb  a1, 14(sp)                                        // |  4  v                      v::     |  0                                  |
    sb  zero, 15(sp)                                      // |  3  v                       ::     |  0                                  |
    sb  a2, 10(sp)                                        // |  3  v                       v:     |  0                                  |
    sb  a3, 11(sp)                                        // |  2  v                        v     |  0                                  |
    sb  zero, 12(sp)                                      // |  1  v                              |  0                                  |
    addi    a0, sp, 13                                    // |  2  v                     ^        |  0                                  |
    li  a2, 10                                            // |  3  :                     : ^      |  0                                  |
    li  a1, 0                                             // |  3  :                     :^       |  0                                  |
    call    strtol@plt                                    // |  3 ^:                     :        |  0                                  |
    mv  s0, a0                                            // |  3  :         ^           v        |  0                                  |
    addi    a0, sp, 10                                    // |  3  v         :           ^        |  0                                  |
    li  a2, 10                                            // |  3            :           : ^      |  0                                  |
    li  a1, 0                                             // |  3            :           :^       |  0                                  |
    call    strtol@plt                                    // |  3 ^          :           :        |  0                                  |
    mv  a1, a0                                            // |  3            :           v^       |  0                                  |
    addiw   a0, s0, -13                                   // |  3            v           ^:       |  0                                  |
    sltiu   a0, a0, -12                                   // |  3            :           ^:       |  0                                  |
    addiw   a2, a1, -32                                   // |  4            :           :v^      |  0                                  |
    sltiu   a2, a2, -31                                   // |  3            :           : ^      |  0                                  |
    or  a2, a2, a0                                        // |  3            :           v ^      |  0                                  |
    li  a0, 0                                             // |  3            :           ^ :      |  0                                  |
    bnez    a2, .LBB0_12                                  // |  2            :             v      |  0                                  |
    sext.w  a1, a1                                        // |  2            :            ^       |  0                                  |
    andi    a0, s0, -3                                    // |  3            v           ^:       |  0                                  |
    sext.w  a0, a0                                        // |  3            :           ^:       |  0                                  |
    addi    a2, a0, -4                                    // |  4            :           v:^      |  0                                  |
    seqz    a2, a2                                        // |  3            :            :^      |  0                                  |
    addi    a0, a0, -9                                    // |  4            :           ^::      |  0                                  |
    seqz    a0, a0                                        // |  4            :           ^::      |  0                                  |
    or  a0, a0, a2                                        // |  4            :           ^:v      |  0                                  |
    addi    a2, a1, -31                                   // |  4            :           :v^      |  0                                  |
    seqz    a2, a2                                        // |  3            :           : ^      |  0                                  |
    and a2, a2, a0                                        // |  3            :           v ^      |  0                                  |
    li  a0, 0                                             // |  3            :           ^ :      |  0                                  |
    bnez    a2, .LBB0_12                                  // |  2            :             v      |  0                                  |
    sext.w  a0, s0                                        // |  2            v           ^        |  0                                  |
    addi    a0, a0, -2                                    // |  1                        ^        |  0                                  |
    snez    a0, a0                                        // |  1                        ^        |  0                                  |
    sltiu   a1, a1, 30                                    // |  1                         ^       |  0                                  |
    or  a0, a0, a1                                        // |  2                        ^v       |  0                                  |
    j   .LBB0_12                                          // |  0                                 |  0                                  |
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
