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
    addi    sp, sp, -64                                   // |  1  ^                              |  0                                  |
    sd  ra, 56(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 48(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 40(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 32(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 24(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 16(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 8(sp)                                         // |  2  v              v               |  0                                  |
    sd  s6, 0(sp)                                         // |  2  v               v              |  0                                  |
    sb  zero, 0(a1)                                       // |  2  :                      v       |  0                                  |
    blez    a0, .LBB0_6                                   // |  2  :                     v        |  0                                  |
    mv  s2, a1                                            // |  3  :           ^          v       |  0                                  |
    mv  s1, a0                                            // |  4  :          ^:         v        |  0                                  |
    li  s3, 0                                             // |  4  :          ::^                 |  0                                  |
.LBB0_7:                                                  // |                                    |                                     |
    auipc   s4, %pcrel_hi(.L__const.func0.num)            // |  4  :          :: ^                |  0                                  |
    addi    s4, s4, %pcrel_lo(.LBB0_7)                    // |  4  :          :: ^                |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    auipc   s5, %pcrel_hi(.Lreltable.func0)               // |  5  :          :: :^               |  0                                  |
    addi    s5, s5, %pcrel_lo(.LBB0_8)                    // |  5  :          :: :^               |  0                                  |
    j   .LBB0_3                                           // |  5  :          :: ::               |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    sext.w  a0, s1                                        // |  6  :          v: ::      ^        |  0                                  |
    sgtz    a1, a0                                        // |  7  :          :: ::      v^       |  0                                  |
    addw    s3, s3, a1                                    // |  8  :          ::^::      :v       |  0                                  |
    blez    a0, .LBB0_6                                   // |  7  :          :::::      v        |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    slli    a0, s3, 32                                    // |  7  :          ::v::      ^        |  0                                  |
    srli    a1, a0, 30                                    // |  7  :          :: ::      v^       |  0                                  |
    add a1, a1, s4                                        // |  6  :          :: v:       ^       |  0                                  |
    lw  s0, 0(a1)                                         // |  6  :         ^::  :       v       |  0                                  |
    sext.w  a1, s1                                        // |  6  :         :v:  :       ^       |  0                                  |
    blt a1, s0, .LBB0_2                                   // |  5  :         v :  :       v       |  0                                  |
    srli    a0, a0, 32                                    // |  5  :         : :  :      ^        |  0                                  |
    slli    a0, a0, 2                                     // |  5  :         : :  :      ^        |  0                                  |
    add a0, a0, s5                                        // |  5  :         : :  v      ^        |  0                                  |
    lw  a0, 0(a0)                                         // |  5  :         : :  :      v        |  0                                  |
    add s6, s5, a0                                        // |  6  :         : :  v^     v        |  0                                  |
.LBB0_5:                                                  // |                                    |                                     |
    mv  a0, s2                                            // |  5  :         : v   :     ^        |  0                                  |
    mv  a1, s6                                            // |  4  :         :     v      ^       |  0                                  |
    call    strcat@plt                                    // |  3 ^:         :                    |  0                                  |
    subw    s1, s1, s0                                    // |  3  :         v^                   |  0                                  |
    bge s1, s0, .LBB0_5                                   // |  3  :         vv                   |  0                                  |
    j   .LBB0_2                                           // |  1  :                              |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    ld  ra, 56(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 48(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 40(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 32(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 24(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 16(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 8(sp)                                         // |  3 :v              ^               |  0                                  |
    ld  s6, 0(sp)                                         // |  3 :v               ^              |  0                                  |
    addi    sp, sp, 64                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "m"                                           // |                                    |                                     |
    .size   .L.str, 2                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "cm"                                          // |                                    |                                     |
    .size   .L.str.1, 3                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  "d"                                           // |                                    |                                     |
    .size   .L.str.2, 2                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  "cd"                                          // |                                    |                                     |
    .size   .L.str.3, 3                                   // |                                    |                                     |
    .type   .L.str.4,@object                              // |                                    |                                     |
.L.str.4:                                                 // |                                    |                                     |
    .asciz  "c"                                           // |                                    |                                     |
    .size   .L.str.4, 2                                   // |                                    |                                     |
    .type   .L.str.5,@object                              // |                                    |                                     |
.L.str.5:                                                 // |                                    |                                     |
    .asciz  "xc"                                          // |                                    |                                     |
    .size   .L.str.5, 3                                   // |                                    |                                     |
    .type   .L.str.6,@object                              // |                                    |                                     |
.L.str.6:                                                 // |                                    |                                     |
    .asciz  "l"                                           // |                                    |                                     |
    .size   .L.str.6, 2                                   // |                                    |                                     |
    .type   .L.str.7,@object                              // |                                    |                                     |
.L.str.7:                                                 // |                                    |                                     |
    .asciz  "xl"                                          // |                                    |                                     |
    .size   .L.str.7, 3                                   // |                                    |                                     |
    .type   .L.str.8,@object                              // |                                    |                                     |
.L.str.8:                                                 // |                                    |                                     |
    .asciz  "x"                                           // |                                    |                                     |
    .size   .L.str.8, 2                                   // |                                    |                                     |
    .type   .L.str.9,@object                              // |                                    |                                     |
.L.str.9:                                                 // |                                    |                                     |
    .asciz  "ix"                                          // |                                    |                                     |
    .size   .L.str.9, 3                                   // |                                    |                                     |
    .type   .L.str.10,@object                             // |                                    |                                     |
.L.str.10:                                                // |                                    |                                     |
    .asciz  "v"                                           // |                                    |                                     |
    .size   .L.str.10, 2                                  // |                                    |                                     |
    .type   .L.str.11,@object                             // |                                    |                                     |
.L.str.11:                                                // |                                    |                                     |
    .asciz  "iv"                                          // |                                    |                                     |
    .size   .L.str.11, 3                                  // |                                    |                                     |
    .type   .L.str.12,@object                             // |                                    |                                     |
.L.str.12:                                                // |                                    |                                     |
    .asciz  "i"                                           // |                                    |                                     |
    .size   .L.str.12, 2                                  // |                                    |                                     |
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
    .word   .L.str.10-.Lreltable.func0                    // |                                    |                                     |
    .word   .L.str.11-.Lreltable.func0                    // |                                    |                                     |
    .word   .L.str.12-.Lreltable.func0                    // |                                    |                                     |
    .size   .Lreltable.func0, 52                          // |                                    |                                     |
    .type   .L__const.func0.num,@object                   // |                                    |                                     |
    .p2align    2                                         // |                                    |                                     |
.L__const.func0.num:                                      // |                                    |                                     |
    .word   1000                                          // |                                    |                                     |
    .word   900                                           // |                                    |                                     |
    .word   500                                           // |                                    |                                     |
    .word   400                                           // |                                    |                                     |
    .word   100                                           // |                                    |                                     |
    .word   90                                            // |                                    |                                     |
    .word   50                                            // |                                    |                                     |
    .word   40                                            // |                                    |                                     |
    .word   10                                            // |                                    |                                     |
    .word   9                                             // |                                    |                                     |
    .word   5                                             // |                                    |                                     |
    .word   4                                             // |                                    |                                     |
    .word   1                                             // |                                    |                                     |
    .size   .L__const.func0.num, 52                       // |                                    |                                     |
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
