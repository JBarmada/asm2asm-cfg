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
    .quad   0x400fffcb923a29c7                            // |                                    |                                     |
.LCPI0_1:                                                 // |                                    |                                     |
    .quad   0x400d99ce075f6fd2                            // |                                    |                                     |
.LCPI0_2:                                                 // |                                    |                                     |
    .quad   0x400a669ad42c3c9f                            // |                                    |                                     |
.LCPI0_3:                                                 // |                                    |                                     |
    .quad   0x400800346dc5d639                            // |                                    |                                     |
.LCPI0_4:                                                 // |                                    |                                     |
    .quad   0x400599ce075f6fd2                            // |                                    |                                     |
.LCPI0_5:                                                 // |                                    |                                     |
    .quad   0x4002669ad42c3c9f                            // |                                    |                                     |
.LCPI0_6:                                                 // |                                    |                                     |
    .quad   0x400000346dc5d639                            // |                                    |                                     |
.LCPI0_7:                                                 // |                                    |                                     |
    .quad   0x3ffb339c0ebedfa4                            // |                                    |                                     |
.LCPI0_8:                                                 // |                                    |                                     |
    .quad   0x3ff4cd35a858793e                            // |                                    |                                     |
.LCPI0_9:                                                 // |                                    |                                     |
    .quad   0x3ff00068db8bac71                            // |                                    |                                     |
.LCPI0_10:                                                // |                                    |                                     |
    .quad   0x3fe667381d7dbf48                            // |                                    |                                     |
.LCPI0_11:                                                // |                                    |                                     |
    .quad   0x3f1a36e2eb1c432d                            // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    addi    sp, sp, -32                                   // |  1  ^                              |  0                                  |
    sd  ra, 24(sp)                                        // |  2 vv                              |  0                                  |
    sd  s0, 16(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 8(sp)                                         // |  2  v          v                   |  0                                  |
    sd  s2, 0(sp)                                         // |  2  v           v                  |  0                                  |
    mv  s0, a1                                            // |  3  :         ^            v       |  0                                  |
    mv  s1, a0                                            // |  4  :         :^          v        |  0                                  |
    slli    a0, a1, 3                                     // |  4  :         :           ^v       |  0                                  |
    call    malloc@plt                                    // |  4 ^:         :           :        |  0                                  |
    blez    s0, .LBB0_28                                  // |  3  :         v           :        |  0                                  |
.LBB0_29:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.LCPI0_0)                       // |  3  :                     :^       |  0                                  |
    addi    a1, a1, %pcrel_lo(.LBB0_29)                   // |  3  :                     :^       |  0                                  |
    fld ft0, 0(a1)                                        // |  3  :                     :v       |  1 ^                                |
.LBB0_30:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.LCPI0_1)                       // |  3  :                     :^       |  1 :                                |
    addi    a1, a1, %pcrel_lo(.LBB0_30)                   // |  3  :                     :^       |  1 :                                |
    fld ft1, 0(a1)                                        // |  3  :                     :v       |  2 :^                               |
.LBB0_31:                                                 // |                                    |                                     |
    auipc   a1, %pcrel_hi(.L.str.1)                       // |  3  :                     :^       |  2 ::                               |
    addi    a1, a1, %pcrel_lo(.LBB0_31)                   // |  3  :                     :^       |  2 ::                               |
.LBB0_32:                                                 // |                                    |                                     |
    auipc   a2, %pcrel_hi(.LCPI0_2)                       // |  4  :                     ::^      |  2 ::                               |
    addi    a2, a2, %pcrel_lo(.LBB0_32)                   // |  4  :                     ::^      |  2 ::                               |
    fld ft2, 0(a2)                                        // |  4  :                     ::v      |  3 ::^                              |
.LBB0_33:                                                 // |                                    |                                     |
    auipc   a2, %pcrel_hi(.L.str.2)                       // |  4  :                     ::^      |  3 :::                              |
    addi    a2, a2, %pcrel_lo(.LBB0_33)                   // |  4  :                     ::^      |  3 :::                              |
.LBB0_34:                                                 // |                                    |                                     |
    auipc   a3, %pcrel_hi(.LCPI0_3)                       // |  5  :                     :::^     |  3 :::                              |
    addi    a3, a3, %pcrel_lo(.LBB0_34)                   // |  5  :                     :::^     |  3 :::                              |
    fld ft3, 0(a3)                                        // |  5  :                     :::v     |  4 :::^                             |
.LBB0_35:                                                 // |                                    |                                     |
    auipc   s2, %pcrel_hi(.L.str.3)                       // |  5  :           ^         :::      |  4 ::::                             |
    addi    s2, s2, %pcrel_lo(.LBB0_35)                   // |  5  :           ^         :::      |  4 ::::                             |
.LBB0_36:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_4)                       // |  6  :           :         ::: ^    |  4 ::::                             |
    addi    a4, a4, %pcrel_lo(.LBB0_36)                   // |  6  :           :         ::: ^    |  4 ::::                             |
    fld ft4, 0(a4)                                        // |  6  :           :         ::: v    |  5 ::::^                            |
.LBB0_37:                                                 // |                                    |                                     |
    auipc   t6, %pcrel_hi(.L.str.4)                       // |  6  :        ^  :         :::      |  5 :::::                            |
    addi    t6, t6, %pcrel_lo(.LBB0_37)                   // |  6  :        ^  :         :::      |  5 :::::                            |
.LBB0_38:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_5)                       // |  7  :        :  :         ::: ^    |  5 :::::                            |
    addi    a4, a4, %pcrel_lo(.LBB0_38)                   // |  7  :        :  :         ::: ^    |  5 :::::                            |
    fld ft5, 0(a4)                                        // |  7  :        :  :         ::: v    |  6 :::::^                           |
.LBB0_39:                                                 // |                                    |                                     |
    auipc   t5, %pcrel_hi(.L.str.5)                       // |  7  :       ^:  :         :::      |  6 ::::::                           |
    addi    t5, t5, %pcrel_lo(.LBB0_39)                   // |  7  :       ^:  :         :::      |  6 ::::::                           |
.LBB0_40:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_6)                       // |  8  :       ::  :         ::: ^    |  6 ::::::                           |
    addi    a4, a4, %pcrel_lo(.LBB0_40)                   // |  8  :       ::  :         ::: ^    |  6 ::::::                           |
    fld ft6, 0(a4)                                        // |  8  :       ::  :         ::: v    |  7 ::::::^                          |
.LBB0_41:                                                 // |                                    |                                     |
    auipc   a6, %pcrel_hi(.L.str.6)                       // |  8  :       ::  :         :::   ^  |  7 :::::::                          |
    addi    a6, a6, %pcrel_lo(.LBB0_41)                   // |  8  :       ::  :         :::   ^  |  7 :::::::                          |
.LBB0_42:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_7)                       // |  9  :       ::  :         ::: ^ :  |  7 :::::::                          |
    addi    a4, a4, %pcrel_lo(.LBB0_42)                   // |  9  :       ::  :         ::: ^ :  |  7 :::::::                          |
    fld ft7, 0(a4)                                        // |  9  :       ::  :         ::: v :  |  8 :::::::^                         |
.LBB0_43:                                                 // |                                    |                                     |
    auipc   a7, %pcrel_hi(.L.str.7)                       // |  9  :       ::  :         :::   :^ |  8 ::::::::                         |
    addi    a7, a7, %pcrel_lo(.LBB0_43)                   // |  9  :       ::  :         :::   :^ |  8 ::::::::                         |
.LBB0_44:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_8)                       // | 10  :       ::  :         ::: ^ :: |  8 ::::::::                         |
    addi    a4, a4, %pcrel_lo(.LBB0_44)                   // | 10  :       ::  :         ::: ^ :: |  8 ::::::::                         |
    fld fa0, 0(a4)                                        // | 10  :       ::  :         ::: v :: |  9 ::::::::    ^                    |
.LBB0_45:                                                 // |                                    |                                     |
    auipc   t0, %pcrel_hi(.L.str.8)                       // | 10  :  ^    ::  :         :::   :: |  9 ::::::::    :                    |
    addi    t0, t0, %pcrel_lo(.LBB0_45)                   // | 10  :  ^    ::  :         :::   :: |  9 ::::::::    :                    |
.LBB0_46:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_9)                       // | 11  :  :    ::  :         ::: ^ :: |  9 ::::::::    :                    |
    addi    a4, a4, %pcrel_lo(.LBB0_46)                   // | 11  :  :    ::  :         ::: ^ :: |  9 ::::::::    :                    |
    fld fa1, 0(a4)                                        // | 11  :  :    ::  :         ::: v :: | 10 ::::::::    :^                   |
.LBB0_47:                                                 // |                                    |                                     |
    auipc   t1, %pcrel_hi(.L.str.9)                       // | 11  :  :^   ::  :         :::   :: | 10 ::::::::    ::                   |
    addi    t1, t1, %pcrel_lo(.LBB0_47)                   // | 11  :  :^   ::  :         :::   :: | 10 ::::::::    ::                   |
.LBB0_48:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_10)                      // | 12  :  ::   ::  :         ::: ^ :: | 10 ::::::::    ::                   |
    addi    a4, a4, %pcrel_lo(.LBB0_48)                   // | 12  :  ::   ::  :         ::: ^ :: | 10 ::::::::    ::                   |
    fld fa2, 0(a4)                                        // | 12  :  ::   ::  :         ::: v :: | 11 ::::::::    ::^                  |
.LBB0_49:                                                 // |                                    |                                     |
    auipc   t2, %pcrel_hi(.L.str.10)                      // | 12  :  ::^  ::  :         :::   :: | 11 ::::::::    :::                  |
    addi    t2, t2, %pcrel_lo(.LBB0_49)                   // | 12  :  ::^  ::  :         :::   :: | 11 ::::::::    :::                  |
.LBB0_50:                                                 // |                                    |                                     |
    auipc   a4, %pcrel_hi(.LCPI0_11)                      // | 13  :  :::  ::  :         ::: ^ :: | 11 ::::::::    :::                  |
    addi    a4, a4, %pcrel_lo(.LBB0_50)                   // | 13  :  :::  ::  :         ::: ^ :: | 11 ::::::::    :::                  |
    fld fa3, 0(a4)                                        // | 13  :  :::  ::  :         ::: v :: | 12 ::::::::    :::^                 |
.LBB0_51:                                                 // |                                    |                                     |
    auipc   t3, %pcrel_hi(.L.str.11)                      // | 13  :  :::^ ::  :         :::   :: | 12 ::::::::    ::::                 |
    addi    t3, t3, %pcrel_lo(.LBB0_51)                   // | 13  :  :::^ ::  :         :::   :: | 12 ::::::::    ::::                 |
.LBB0_52:                                                 // |                                    |                                     |
    auipc   t4, %pcrel_hi(.L.str.12)                      // | 14  :  ::::^::  :         :::   :: | 12 ::::::::    ::::                 |
    addi    t4, t4, %pcrel_lo(.LBB0_52)                   // | 14  :  ::::^::  :         :::   :: | 12 ::::::::    ::::                 |
.LBB0_53:                                                 // |                                    |                                     |
    auipc   a5, %pcrel_hi(.L.str)                         // | 15  :  :::::::  :         :::  ^:: | 12 ::::::::    ::::                 |
    addi    a5, a5, %pcrel_lo(.LBB0_53)                   // | 15  :  :::::::  :         :::  ^:: | 12 ::::::::    ::::                 |
    mv  a4, a0                                            // | 16  :  :::::::  :         v:: ^::: | 12 ::::::::    ::::                 |
    j   .LBB0_4                                           // | 15  :  :::::::  :          :: :::: | 12 ::::::::    ::::                 |
.LBB0_2:                                                  // |                                    |                                     |
    sd  a5, 0(a4)                                         // | 15  :  :::::::  :          :: vv:: | 12 ::::::::    ::::                 |
.LBB0_3:                                                  // |                                    |                                     |
    addi    a4, a4, 8                                     // | 14  :  :::::::  :          :: ^ :: | 12 ::::::::    ::::                 |
    addi    s0, s0, -1                                    // | 15  :  :::::::^ :          :: : :: | 12 ::::::::    ::::                 |
    addi    s1, s1, 4                                     // | 16  :  ::::::::^:          :: : :: | 12 ::::::::    ::::                 |
    beqz    s0, .LBB0_28                                  // | 16  :  :::::::v::          :: : :: | 12 ::::::::    ::::                 |
.LBB0_4:                                                  // |                                    |                                     |
    flw fa4, 0(s1)                                        // | 15  :  ::::::: v:          :: : :: | 13 ::::::::    ::::^                |
    fcvt.d.s    fa4, fa4                                  // | 14  :  :::::::  :          :: : :: | 13 ::::::::    ::::^                |
    fle.d   a3, ft0, fa4                                  // | 15  :  :::::::  :          ::^: :: | 13 v:::::::    ::::v                |
    bnez    a3, .LBB0_2                                   // | 15  :  :::::::  :          ::v: :: | 12  :::::::    :::::                |
    flt.d   a3, ft1, fa4                                  // | 15  :  :::::::  :          ::^: :: | 12  v::::::    ::::v                |
    beqz    a3, .LBB0_7                                   // | 15  :  :::::::  :          ::v: :: | 11   ::::::    :::::                |
    sd  a1, 0(a4)                                         // | 14  :  :::::::  :          v: v :: | 11   ::::::    :::::                |
    j   .LBB0_3                                           // | 13  :  :::::::  :           : : :: | 11   ::::::    :::::                |
.LBB0_7:                                                  // |                                    |                                     |
    flt.d   a3, ft2, fa4                                  // | 14  :  :::::::  :           :^: :: | 11   v:::::    ::::v                |
    beqz    a3, .LBB0_9                                   // | 14  :  :::::::  :           :v: :: | 10    :::::    :::::                |
    sd  a2, 0(a4)                                         // | 13  :  :::::::  :           v v :: | 10    :::::    :::::                |
    j   .LBB0_3                                           // | 12  :  :::::::  :             : :: | 10    :::::    :::::                |
.LBB0_9:                                                  // |                                    |                                     |
    flt.d   a3, ft3, fa4                                  // | 13  :  :::::::  :            ^: :: | 10    v::::    ::::v                |
    beqz    a3, .LBB0_11                                  // | 13  :  :::::::  :            v: :: |  9     ::::    :::::                |
    sd  s2, 0(a4)                                         // | 12  :  :::::::  v             v :: |  9     ::::    :::::                |
    j   .LBB0_3                                           // | 11  :  :::::::                : :: |  9     ::::    :::::                |
.LBB0_11:                                                 // |                                    |                                     |
    flt.d   a3, ft4, fa4                                  // | 12  :  :::::::               ^: :: |  9     v:::    ::::v                |
    beqz    a3, .LBB0_13                                  // | 12  :  :::::::               v: :: |  8      :::    :::::                |
    sd  t6, 0(a4)                                         // | 11  :  ::::::v                v :: |  8      :::    :::::                |
    j   .LBB0_3                                           // | 10  :  ::::::                 : :: |  8      :::    :::::                |
.LBB0_13:                                                 // |                                    |                                     |
    flt.d   a3, ft5, fa4                                  // | 11  :  ::::::                ^: :: |  8      v::    ::::v                |
    beqz    a3, .LBB0_15                                  // | 11  :  ::::::                v: :: |  7       ::    :::::                |
    sd  t5, 0(a4)                                         // | 10  :  :::::v                 v :: |  7       ::    :::::                |
    j   .LBB0_3                                           // |  9  :  :::::                  : :: |  7       ::    :::::                |
.LBB0_15:                                                 // |                                    |                                     |
    flt.d   a3, ft6, fa4                                  // | 10  :  :::::                 ^: :: |  7       v:    ::::v                |
    beqz    a3, .LBB0_17                                  // | 10  :  :::::                 v: :: |  6        :    :::::                |
    sd  a6, 0(a4)                                         // |  9  :  :::::                  v v: |  6        :    :::::                |
    j   .LBB0_3                                           // |  8  :  :::::                  :  : |  6        :    :::::                |
.LBB0_17:                                                 // |                                    |                                     |
    flt.d   a3, ft7, fa4                                  // |  9  :  :::::                 ^:  : |  6        v    ::::v                |
    beqz    a3, .LBB0_19                                  // |  9  :  :::::                 v:  : |  5             :::::                |
    sd  a7, 0(a4)                                         // |  8  :  :::::                  v  v |  5             :::::                |
    j   .LBB0_3                                           // |  7  :  :::::                  :    |  5             :::::                |
.LBB0_19:                                                 // |                                    |                                     |
    flt.d   a3, fa0, fa4                                  // |  8  :  :::::                 ^:    |  5             v:::v                |
    beqz    a3, .LBB0_21                                  // |  8  :  :::::                 v:    |  4              ::::                |
    sd  t0, 0(a4)                                         // |  7  :  v::::                  v    |  4              ::::                |
    j   .LBB0_3                                           // |  6  :   ::::                  :    |  4              ::::                |
.LBB0_21:                                                 // |                                    |                                     |
    flt.d   a3, fa1, fa4                                  // |  7  :   ::::                 ^:    |  4              v::v                |
    beqz    a3, .LBB0_23                                  // |  7  :   ::::                 v:    |  3               :::                |
    sd  t1, 0(a4)                                         // |  6  :   v:::                  v    |  3               :::                |
    j   .LBB0_3                                           // |  5  :    :::                  :    |  3               :::                |
.LBB0_23:                                                 // |                                    |                                     |
    flt.d   a3, fa2, fa4                                  // |  6  :    :::                 ^:    |  3               v:v                |
    beqz    a3, .LBB0_25                                  // |  6  :    :::                 v:    |  2                ::                |
    sd  t2, 0(a4)                                         // |  5  :    v::                  v    |  2                ::                |
    j   .LBB0_3                                           // |  4  :     ::                  :    |  2                ::                |
.LBB0_25:                                                 // |                                    |                                     |
    flt.d   a3, fa3, fa4                                  // |  5  :     ::                 ^:    |  2                vv                |
    beqz    a3, .LBB0_27                                  // |  5  :     ::                 v:    |  0                                  |
    sd  t3, 0(a4)                                         // |  4  :     v:                  v    |  0                                  |
    j   .LBB0_3                                           // |  3  :      :                  :    |  0                                  |
.LBB0_27:                                                 // |                                    |                                     |
    sd  t4, 0(a4)                                         // |  3  :      v                  v    |  0                                  |
    j   .LBB0_3                                           // |  1  :                              |  0                                  |
.LBB0_28:                                                 // |                                    |                                     |
    ld  ra, 24(sp)                                        // |  2 ^v                              |  0                                  |
    ld  s0, 16(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 8(sp)                                         // |  3 :v          ^                   |  0                                  |
    ld  s2, 0(sp)                                         // |  3 :v           ^                  |  0                                  |
    addi    sp, sp, 32                                    // |  2 :^                              |  0                                  |
    ret                                                   // |  1 v                               |  0                                  |
.Lfunc_end0:                                              // |                                    |                                     |
    .size   func0, .Lfunc_end0-func0                      // |                                    |                                     |
    .type   .L.str,@object                                // |                                    |                                     |
    .section    .rodata.str1.1,"aMS",@progbits,1          // |                                    |                                     |
.L.str:                                                   // |                                    |                                     |
    .asciz  "A+"                                          // |                                    |                                     |
    .size   .L.str, 3                                     // |                                    |                                     |
    .type   .L.str.1,@object                              // |                                    |                                     |
.L.str.1:                                                 // |                                    |                                     |
    .asciz  "A"                                           // |                                    |                                     |
    .size   .L.str.1, 2                                   // |                                    |                                     |
    .type   .L.str.2,@object                              // |                                    |                                     |
.L.str.2:                                                 // |                                    |                                     |
    .asciz  "A-"                                          // |                                    |                                     |
    .size   .L.str.2, 3                                   // |                                    |                                     |
    .type   .L.str.3,@object                              // |                                    |                                     |
.L.str.3:                                                 // |                                    |                                     |
    .asciz  "B+"                                          // |                                    |                                     |
    .size   .L.str.3, 3                                   // |                                    |                                     |
    .type   .L.str.4,@object                              // |                                    |                                     |
.L.str.4:                                                 // |                                    |                                     |
    .asciz  "B"                                           // |                                    |                                     |
    .size   .L.str.4, 2                                   // |                                    |                                     |
    .type   .L.str.5,@object                              // |                                    |                                     |
.L.str.5:                                                 // |                                    |                                     |
    .asciz  "B-"                                          // |                                    |                                     |
    .size   .L.str.5, 3                                   // |                                    |                                     |
    .type   .L.str.6,@object                              // |                                    |                                     |
.L.str.6:                                                 // |                                    |                                     |
    .asciz  "C+"                                          // |                                    |                                     |
    .size   .L.str.6, 3                                   // |                                    |                                     |
    .type   .L.str.7,@object                              // |                                    |                                     |
.L.str.7:                                                 // |                                    |                                     |
    .asciz  "C"                                           // |                                    |                                     |
    .size   .L.str.7, 2                                   // |                                    |                                     |
    .type   .L.str.8,@object                              // |                                    |                                     |
.L.str.8:                                                 // |                                    |                                     |
    .asciz  "C-"                                          // |                                    |                                     |
    .size   .L.str.8, 3                                   // |                                    |                                     |
    .type   .L.str.9,@object                              // |                                    |                                     |
.L.str.9:                                                 // |                                    |                                     |
    .asciz  "D+"                                          // |                                    |                                     |
    .size   .L.str.9, 3                                   // |                                    |                                     |
    .type   .L.str.10,@object                             // |                                    |                                     |
.L.str.10:                                                // |                                    |                                     |
    .asciz  "D"                                           // |                                    |                                     |
    .size   .L.str.10, 2                                  // |                                    |                                     |
    .type   .L.str.11,@object                             // |                                    |                                     |
.L.str.11:                                                // |                                    |                                     |
    .asciz  "D-"                                          // |                                    |                                     |
    .size   .L.str.11, 3                                  // |                                    |                                     |
    .type   .L.str.12,@object                             // |                                    |                                     |
.L.str.12:                                                // |                                    |                                     |
    .asciz  "E"                                           // |                                    |                                     |
    .size   .L.str.12, 2                                  // |                                    |                                     |
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
