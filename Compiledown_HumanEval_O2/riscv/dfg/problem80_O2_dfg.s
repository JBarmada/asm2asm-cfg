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
    sd  s4, 0(sp)                                         // |  2  v             v                |  0                                  |
    mv  s1, a0                                            // |  3  :          ^          v        |  0                                  |
    li  a0, 64                                            // |  3  :          :          ^        |  0                                  |
    call    malloc@plt                                    // |  4 ^:          :          :        |  0                                  |
    beqz    a0, .LBB0_5                                   // |  3  :          :          v        |  0                                  |
    mv  s0, a0                                            // |  4  :         ^:          v        |  0                                  |
    sb  zero, 63(a0)                                      // |  4  :         ::          v        |  0                                  |
    beqz    s1, .LBB0_6                                   // |  3  :         :v                   |  0                                  |
    li  a0, 62                                            // |  4  :         ::          ^        |  0                                  |
    blez    s1, .LBB0_7                                   // |  4  :         :v          :        |  0                                  |
    li  a1, 1                                             // |  5  :         ::          :^       |  0                                  |
.LBB0_4:                                                  // |                                    |                                     |
    sext.w  a2, s1                                        // |  6  :         :v          ::^      |  0                                  |
    andi    a3, s1, 1                                     // |  7  :         :v          :::^     |  0                                  |
    ori a3, a3, 48                                        // |  6  :         :           :::^     |  0                                  |
    add a4, s0, a0                                        // |  7  :         v           v:::^    |  0                                  |
    addi    a0, a0, -1                                    // |  7  :         :           ^::::    |  0                                  |
    sb  a3, 0(a4)                                         // |  6  :         :            ::vv    |  0                                  |
    srliw   s1, s1, 1                                     // |  5  :         :^           ::      |  0                                  |
    bltu    a1, a2, .LBB0_4                               // |  4  :         :            vv      |  0                                  |
    j   .LBB0_7                                           // |  2  :         :                    |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    li  s1, 0                                             // |  3  :         :^                   |  0                                  |
    j   .LBB0_11                                          // |  2  :         :                    |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    li  a0, 48                                            // |  3  :         :           ^        |  0                                  |
    sb  a0, 62(s0)                                        // |  3  :         v           v        |  0                                  |
    li  a0, 61                                            // |  3  :         :           ^        |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    addiw   a1, a0, -1                                    // |  4  :         :           v^       |  0                                  |
    sext.w  a2, a0                                        // |  5  :         :           v:^      |  0                                  |
    add a2, a2, s0                                        // |  4  :         v            :^      |  0                                  |
    li  s3, 98                                            // |  5  :         :  ^         ::      |  0                                  |
    sb  s3, 0(a2)                                         // |  5  :         :  v         :v      |  0                                  |
    add s2, s0, a1                                        // |  5  :         v ^:         v       |  0                                  |
    li  s4, 100                                           // |  5  :         : ::^                |  0                                  |
    sb  s4, 0(s2)                                         // |  5  :         : v:v                |  0                                  |
    li  a1, 66                                            // |  6  :         : :::        ^       |  0                                  |
    subw    a0, a1, a0                                    // |  7  :         : :::       ^v       |  0                                  |
    call    malloc@plt                                    // |  7 ^:         : :::       :        |  0                                  |
    beqz    a0, .LBB0_9                                   // |  6  :         : :::       v        |  0                                  |
    mv  s1, a0                                            // |  7  :         :^:::       v        |  0                                  |
    mv  a1, s2                                            // |  7  :         ::v::        ^       |  0                                  |
    call    strcpy@plt                                    // |  6 ^:         :: ::                |  0                                  |
    mv  a0, s1                                            // |  6  :         :v ::       ^        |  0                                  |
    call    strlen@plt                                    // |  6 ^:         :: ::                |  0                                  |
    add a0, a0, s1                                        // |  6  :         :v ::       ^        |  0                                  |
    sb  s4, 0(a0)                                         // |  5  :         :  :v       v        |  0                                  |
    sb  s3, 1(a0)                                         // |  4  :         :  v        v        |  0                                  |
    sb  zero, 2(a0)                                       // |  3  :         :           v        |  0                                  |
    j   .LBB0_10                                          // |  2  :         :                    |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    li  s1, 0                                             // |  3  :         :^                   |  0                                  |
.LBB0_10:                                                 // |                                    |                                     |
    mv  a0, s0                                            // |  4  :         v:          ^        |  0                                  |
    call    free@plt                                      // |  3 ^:          :                   |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    mv  a0, s1                                            // |  3  :          v          ^        |  0                                  |
    ld  ra, 40(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 32(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 24(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 16(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 8(sp)                                         // |  3 :v            ^                 |  0                                  |
    ld  s4, 0(sp)                                         // |  3 :v             ^                |  0                                  |
    addi    sp, sp, 48                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "db"                                          // |                                    |                                     |
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
