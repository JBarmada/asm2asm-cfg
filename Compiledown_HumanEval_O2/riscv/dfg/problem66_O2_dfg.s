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
    addi    sp, sp, -96                                   // |  1  ^                              |  0                                  |
    sd  ra, 88(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 80(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 72(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 64(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 56(sp)                                        // |  2  v            v                 |  0                                  |
    mv  s1, a1                                            // |  3  :          ^           v       |  0                                  |
    mv  a2, a0                                            // |  4  :          :          v ^      |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    auipc   s0, %pcrel_hi(func0.xs)                       // |  3  :         ^:                   |  0                                  |
    addi    s0, s0, %pcrel_lo(.LBB0_6)                    // |  3  :         ^:                   |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str)                         // |  4  :         ::           ^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_7)                    // |  4  :         ::           ^       |  0                                  |
    mv  a0, s0                                            // |  4  :         v:          ^        |  0                                  |
    call    sprintf@plt                                   // |  4 ^:         ::                   |  0                                  |
    mv  a0, s0                                            // |  4  :         v:          ^        |  0                                  |
    call    strlen@plt                                    // |  5 ^:         ::          :        |  0                                  |
    mv  s2, a0                                            // |  5  :         ::^         v        |  0                                  |
    sext.w  a0, a0                                        // |  5  :         :::         ^        |  0                                  |
    bge a0, s1, .LBB0_4                                   // |  5  :         :v:         v        |  0                                  |
    li  a1, 2                                             // |  5  :         : :         :^       |  0                                  |
    blt a0, a1, .LBB0_5                                   // |  5  :         : :         vv       |  0                                  |
    li  a0, -1                                            // |  4  :         : :         ^        |  0                                  |
    slli    a0, a0, 32                                    // |  4  :         : :         ^        |  0                                  |
    srliw   a1, s2, 1                                     // |  5  :         : v         :^       |  0                                  |
    slli    a2, s2, 32                                    // |  5  :         : v         : ^      |  0                                  |
    add a2, a2, a0                                        // |  5  :         : :         v ^      |  0                                  |
    mv  a3, s0                                            // |  6  :         v :         : :^     |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    srai    a4, a2, 32                                    // |  7  :         : :         : v:^    |  0                                  |
    add a4, a4, s0                                        // |  6  :         v :         :  :^    |  0                                  |
    lb  a5, 0(a4)                                         // |  7  :         : :         :  :v^   |  0                                  |
    lb  s1, 0(a3)                                         // |  8  :         :^:         :  v::   |  0                                  |
    sb  a5, 0(a3)                                         // |  8  :         :::         :  v:v   |  0                                  |
    sb  s1, 0(a4)                                         // |  6  :         :v:         :   v    |  0                                  |
    add a2, a2, a0                                        // |  6  :         :::         v ^      |  0                                  |
    addi    a1, a1, -1                                    // |  5  :         :::          ^       |  0                                  |
    addi    a3, a3, 1                                     // |  6  :         :::          : ^     |  0                                  |
    bnez    a1, .LBB0_3                                   // |  5  :         :::          v       |  0                                  |
    j   .LBB0_5                                           // |  4  :         :::                  |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    add a0, a0, s0                                        // |  5  :         v::         ^        |  0                                  |
    sub a1, a0, s1                                        // |  6  :         :v:         v^       |  0                                  |
    addi    a0, sp, 6                                     // |  5  v         :::         ^        |  0                                  |
    addi    s3, sp, 6                                     // |  5  v         :::^                 |  0                                  |
    call    strcpy@plt                                    // |  6 ^:         ::::                 |  0                                  |
    add a0, s3, s1                                        // |  6  :         :v:v        ^        |  0                                  |
    sb  zero, 0(a0)                                       // |  5  :         :::         v        |  0                                  |
    subw    a2, s2, s1                                    // |  5  :         :vv           ^      |  0                                  |
    addi    a0, sp, 6                                     // |  3  v         :           ^        |  0                                  |
    mv  a1, s0                                            // |  3  :         v            ^       |  0                                  |
    call    strncat@plt                                   // |  3 ^:         :                    |  0                                  |
    addi    a1, sp, 6                                     // |  3  v         :            ^       |  0                                  |
    mv  a0, s0                                            // |  3  :         v           ^        |  0                                  |
    call    strcpy@plt                                    // |  2 ^:                              |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   a0, %pcrel_hi(func0.xs)                       // |  2  :                     ^        |  0                                  |
    addi    a0, a0, %pcrel_lo(.LBB0_8)                    // |  2  :                     ^        |  0                                  |
    ld  ra, 88(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 80(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 72(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 64(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 56(sp)                                        // |  3 :v            ^                 |  0                                  |
    addi    sp, sp, 96                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   func0.xs,@object                              // |                                    |                                     |
    .local  func0.xs                                      // |                                    |                                     |
    .comm   func0.xs,50,1                                 // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "%d"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
    .ident  "Debian clang version 15.0.7"                 // |                                    |                                     |
    .section    ".note.GNU-stack","",@progbits            // |                                    |                                     |
    .addrsig                                              // |                                    |                                     |
    .addrsig_sym func0.xs                                 // |                                    |                                     |
                                                          // +....................................+.....................................+
                                                          // Legend:
                                                          //     ^       : Register assignment (write)
                                                          //     v       : Register usage (read)
                                                          //     x       : Register usage and reassignment (R/W)
                                                          //     :       : Register in use (live)
                                                          //     <space> : Register not in use
                                                          //     #       : Number of occupied registers
