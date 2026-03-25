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
    mv  s2, a2                                            // |  3  :           ^           v      |  0                                  |
    mv  s4, a0                                            // |  4  :           : ^       v        |  0                                  |
    li  a0, 2                                             // |  4  :           : :       ^        |  0                                  |
    addiw   a7, a1, -1                                    // |  6  :           : :       :v     ^ |  0                                  |
    blt a1, a0, .LBB0_9                                   // |  6  :           : :       vv     : |  0                                  |
    li  a2, 0                                             // |  5  :           : :         ^    : |  0                                  |
    addi    a6, s4, 4                                     // |  5  :           : v             ^: |  0                                  |
    mv  a5, a7                                            // |  6  :           : :            ^:v |  0                                  |
    j   .LBB0_3                                           // |  5  :           : :             :: |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addiw   a2, a2, 1                                     // |  6  :           : :         ^   :: |  0                                  |
    addiw   a5, a5, -1                                    // |  7  :           : :         :  ^:: |  0                                  |
    bge a2, a7, .LBB0_9                                   // |  7  :           : :         v  ::v |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    not a0, a2                                            // |  8  :           : :       ^ v  ::: |  0                                  |
    addw    a0, a0, a1                                    // |  8  :           : :       ^v   ::: |  0                                  |
    blez    a0, .LBB0_2                                   // |  7  :           : :       v    ::: |  0                                  |
    lw  a0, 0(s4)                                         // |  7  :           : v       ^    ::: |  0                                  |
    slli    a4, a5, 32                                    // |  8  :           : :       :   ^v:: |  0                                  |
    srli    s0, a4, 32                                    // |  8  :         ^ : :       :   v :: |  0                                  |
    mv  a4, a6                                            // |  7  :           : :       :   ^ v: |  0                                  |
    j   .LBB0_7                                           // |  6  :           : :       :   :  : |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    sw  s1, -4(a4)                                        // |  7  :          v: :       :   v  : |  0                                  |
    sw  a0, 0(a4)                                         // |  6  :           : :       v   v  : |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    addi    s0, s0, -1                                    // |  6  :         ^ : :       :      : |  0                                  |
    addi    a4, a4, 4                                     // |  7  :         : : :       :   ^  : |  0                                  |
    beqz    s0, .LBB0_2                                   // |  7  :         v : :       :   :  : |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    lw  s1, 0(a4)                                         // |  7  :          ^: :       :   v  : |  0                                  |
    blt s1, a0, .LBB0_5                                   // |  6  :          v: :       v      : |  0                                  |
    mv  a0, s1                                            // |  6  :          v: :       ^      : |  0                                  |
    j   .LBB0_6                                           // |  4  :           : :              : |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    sw  zero, 0(a3)                                       // |  5  :           : :          v   : |  0                                  |
    slli    s3, a7, 32                                    // |  5  :           :^:              v |  0                                  |
    li  s0, 0                                             // |  5  :         ^ :::                |  0                                  |
    blez    a1, .LBB0_14                                  // |  5  :           :::        v       |  0                                  |
    srli    a0, s3, 32                                    // |  5  :           :v:       ^        |  0                                  |
    addi    a0, a0, 1                                     // |  5  :           :::       ^        |  0                                  |
    srli    a2, s3, 30                                    // |  5  :           :v:         ^      |  0                                  |
    add a2, a2, s4                                        // |  5  :           ::v         ^      |  0                                  |
    li  a4, 8                                             // |  5  :           :::           ^    |  0                                  |
    j   .LBB0_12                                          // |  5  :           :::           :    |  0                                  |
.LBB0_11:                                                 // |                                    |                                     |
    addi    a0, a0, -1                                    // |  6  :           :::       ^   :    |  0                                  |
    addi    a2, a2, -4                                    // |  7  :           :::       : ^ :    |  0                                  |
    blez    a0, .LBB0_14                                  // |  7  :           :::       v : :    |  0                                  |
.LBB0_12:                                                 // |                                    |                                     |
    lw  a5, 0(a2)                                         // |  7  :           :::         v :^   |  0                                  |
    addiw   a5, a5, -1                                    // |  6  :           :::           :^   |  0                                  |
    bltu    a4, a5, .LBB0_11                              // |  6  :           :::           vv   |  0                                  |
    addiw   s0, s0, 1                                     // |  5  :         ^ :::                |  0                                  |
    sw  s0, 0(a3)                                         // |  6  :         v :::          v     |  0                                  |
    j   .LBB0_11                                          // |  5  :         : :::                |  0                                  |
.LBB0_14:                                                 // |                                    |                                     |
    sgtz    s1, a1                                        // |  7  :         :^:::        v       |  0                                  |
    slli    a0, s0, 3                                     // |  7  :         v::::       ^        |  0                                  |
    call    malloc@plt                                    // |  8 ^:         :::::       :        |  0                                  |
    sgtz    a1, s0                                        // |  8  :         v::::       :^       |  0                                  |
    and a1, a1, s1                                        // |  8  :         :v:::       :^       |  0                                  |
    sd  a0, 0(s2)                                         // |  7  :         : v::       v:       |  0                                  |
    beqz    a1, .LBB0_19                                  // |  6  :         : :::        v       |  0                                  |
    li  a4, 0                                             // |  6  :         : :::           ^    |  0                                  |
    srli    a0, s3, 32                                    // |  7  :         : :v:       ^   :    |  0                                  |
    srli    a1, s3, 30                                    // |  8  :         : :v:       :^  :    |  0                                  |
    add a1, a1, s4                                        // |  7  :         : : v       :^  :    |  0                                  |
    li  a6, 8                                             // |  6  :         : :         :   : ^  |  0                                  |
.LBB0_20:                                                 // |                                    |                                     |
    auipc   a3, %pcrel_hi(.Lreltable.func0)               // |  7  :         : :         :  ^: :  |  0                                  |
    addi    a3, a3, %pcrel_lo(.LBB0_20)                   // |  7  :         : :         :  ^: :  |  0                                  |
    j   .LBB0_17                                          // |  7  :         : :         :  :: :  |  0                                  |
.LBB0_16:                                                 // |                                    |                                     |
    sgtz    a2, a0                                        // |  8  :         : :         v ^:: :  |  0                                  |
    slt a5, a4, s0                                        // |  7  :         v :            :v^:  |  0                                  |
    and a2, a2, a5                                        // |  7  :           :           ^::v:  |  0                                  |
    addi    a0, a0, -1                                    // |  7  :           :         ^ ::: :  |  0                                  |
    addi    a1, a1, -4                                    // |  7  :           :          ^::: :  |  0                                  |
    beqz    a2, .LBB0_19                                  // |  7  :           :          :v:: :  |  0                                  |
.LBB0_17:                                                 // |                                    |                                     |
    lwu a5, 0(a1)                                         // |  7  :           :          v ::^:  |  0                                  |
    addiw   s1, a5, -1                                    // |  7  :          ^:            ::v:  |  0                                  |
    bltu    a6, s1, .LBB0_16                              // |  6  :          v:            :: v  |  0                                  |
    slli    a5, a5, 2                                     // |  5  :           :            ::^   |  0                                  |
    add a5, a5, a3                                        // |  5  :           :            v:^   |  0                                  |
    lw  a5, 0(a5)                                         // |  5  :           :            ::v   |  0                                  |
    ld  s1, 0(s2)                                         // |  5  :          ^v            ::    |  0                                  |
    add a5, a5, a3                                        // |  5  :          :             v:^   |  0                                  |
    slli    a2, a4, 3                                     // |  5  :          :            ^ v:   |  0                                  |
    addiw   a4, a4, 1                                     // |  4  :          :              ^:   |  0                                  |
    add a2, a2, s1                                        // |  4  :          v            ^  :   |  0                                  |
    sd  a5, 0(a2)                                         // |  3  :                       v  v   |  0                                  |
    j   .LBB0_16                                          // |  1  :                              |  0                                  |
.LBB0_19:                                                 // |                                    |                                     |
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
    .zero   1                                             // |                                    |                                     |
    .size   .L.str, 1                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "One"                                         // |                                    |                                     |
    .size   .L.str.1, 4                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  "Two"                                         // |                                    |                                     |
    .size   .L.str.2, 4                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  "Three"                                       // |                                    |                                     |
    .size   .L.str.3, 6                                   // |                                    |                                     |
    .type   .L.str.4,@object                              // |                                    |                                     |
.L.str.4:                                                 // |                                    |                                     |
    .asciz  "Four"                                        // |                                    |                                     |
    .size   .L.str.4, 5                                   // |                                    |                                     |
    .type   .L.str.5,@object                              // |                                    |                                     |
.L.str.5:                                                 // |                                    |                                     |
    .asciz  "Five"                                        // |                                    |                                     |
    .size   .L.str.5, 5                                   // |                                    |                                     |
    .type   .L.str.6,@object                              // |                                    |                                     |
.L.str.6:                                                 // |                                    |                                     |
    .asciz  "Six"                                         // |                                    |                                     |
    .size   .L.str.6, 4                                   // |                                    |                                     |
    .type   .L.str.7,@object                              // |                                    |                                     |
.L.str.7:                                                 // |                                    |                                     |
    .asciz  "Seven"                                       // |                                    |                                     |
    .size   .L.str.7, 6                                   // |                                    |                                     |
    .type   .L.str.8,@object                              // |                                    |                                     |
.L.str.8:                                                 // |                                    |                                     |
    .asciz  "Eight"                                       // |                                    |                                     |
    .size   .L.str.8, 6                                   // |                                    |                                     |
    .type   .L.str.9,@object                              // |                                    |                                     |
.L.str.9:                                                 // |                                    |                                     |
    .asciz  "Nine"                                        // |                                    |                                     |
    .size   .L.str.9, 5                                   // |                                    |                                     |
    .type   .Lreltable.func0,@object                      // |                                    |                                     |
    .section    .rodata,"a",@progbits                     // |                                    |                                     |
    .p2align    2                                         // |                                    |                                     |
.Lreltable.func0:                                         // |                                    |                                     |
    .word   .L.str-.Lreltable.func0                       // |                                    |                                     |
    .word   .L.str.1-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.2-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.3-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.4-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.5-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.6-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.7-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.8-.Lreltable.func0                     // |                                    |                                     |
    .word   .L.str.9-.Lreltable.func0                     // |                                    |                                     |
    .size   .Lreltable.func0, 40                          // |                                    |                                     |
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
