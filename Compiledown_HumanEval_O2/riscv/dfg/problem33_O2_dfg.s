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
    .quad   0x3ff0000000000000                            // |                                    |                                     |
.LCPI0_1:                                                 // |                                    |                                     |
    .quad   0x3eb0c6f7a0b5ed8d                            // |                                    |                                     |
    .text                                                 // |                                    |                                     |
    .globl  func0                                         // |                                    |                                     |
    .p2align    1                                         // |                                    |                                     |
    .type   func0,@function                               // |                                    |                                     |
func0:                                                    // |                                    |                                     |
    fld ft0, 0(a0)                                        // |  1                        v        |  1 ^                                |
    li  a2, 2                                             // |  1                          ^      |  1 :                                |
.LBB0_23:                                                 // |                                    |                                     |
    auipc   a3, %pcrel_hi(.LCPI0_0)                       // |  2                          :^     |  1 :                                |
    addi    a3, a3, %pcrel_lo(.LBB0_23)                   // |  2                          :^     |  1 :                                |
    fmv.d   ft1, ft0                                      // |  2                          ::     |  2 v^                               |
    blt a1, a2, .LBB0_5                                   // |  3                         vv:     |  1 :                                |
    fld ft2, 0(a3)                                        // |  1                           v     |  2 : ^                              |
    li  a2, 1                                             // |  2                          ^:     |  2 : :                              |
    fmv.d.x ft3, zero                                     // |  2                          ::     |  3 : :^                             |
    fmv.d   ft1, ft0                                      // |  2                          ::     |  4 v^::                             |
.LBB0_2:                                                  // |                                    |                                     |
    li  a4, 0                                             // |  3                          ::^    |  3 : ::                             |
    fmv.d   ft4, ft2                                      // |  2                          ::     |  4 : v:^                            |
.LBB0_3:                                                  // |                                    |                                     |
    addiw   a4, a4, 1                                     // |  3                          ::^    |  2 :  :                             |
    slli    a5, a4, 32                                    // |  4                          ::v^   |  2 :  :                             |
    srli    a5, a5, 32                                    // |  3                          :: ^   |  2 :  :                             |
    fmul.d  ft4, ft4, ft3                                 // |  3                          :: :   |  3 :  v^                            |
    bltu    a5, a2, .LBB0_3                               // |  3                          v: v   |  2 :   :                            |
    slli    a4, a2, 3                                     // |  3                          v:^    |  2 :   :                            |
    add a4, a4, a0                                        // |  3                        v  :^    |  2 :   :                            |
    fld ft5, 0(a4)                                        // |  2                           :v    |  3 :   :^                           |
    addi    a2, a2, 1                                     // |  2                          ^:     |  3 :   ::                           |
    fmadd.d ft1, ft5, ft4, ft1                            // |  2                          ::     |  4 :^  vv                           |
    bne a2, a1, .LBB0_2                                   // |  3                         vv:     |  2 ::                               |
.LBB0_5:                                                  // |                                    |                                     |
.LBB0_24:                                                 // |                                    |                                     |
    auipc   a2, %pcrel_hi(.LCPI0_1)                       // |  2                          ^:     |  2 ::                               |
    addi    a2, a2, %pcrel_lo(.LBB0_24)                   // |  2                          ^:     |  2 ::                               |
    fld ft2, 0(a2)                                        // |  2                          v:     |  3 ::^                              |
    fabs.d  ft3, ft1                                      // |  1                           :     |  4 :v:^                             |
    flt.d   a2, ft2, ft3                                  // |  2                          ^:     |  3 : vv                             |
    beqz    a2, .LBB0_21                                  // |  2                          v:     |  2 : :                              |
    slli    a2, a1, 32                                    // |  3                         v^:     |  2 : :                              |
    srli    a2, a2, 32                                    // |  2                          ^:     |  2 : :                              |
    fld ft3, 0(a3)                                        // |  2                          :v     |  3 : :^                             |
    fmv.d.x ft4, zero                                     // |  1                          :      |  4 : ::^                            |
    li  a6, 2                                             // |  2                          :   ^  |  4 : :::                            |
    fneg.d  ft5, ft4                                      // |  2                          :   :  |  5 : ::v^                           |
    fmv.d   fa0, ft4                                      // |  2                          :   :  |  6 : ::v:      ^                    |
    j   .LBB0_10                                          // |  2                          :   :  |  5 : ::::                           |
.LBB0_7:                                                  // |                                    |                                     |
    fdiv.d  ft1, ft1, ft5                                 // |  2                          :   :  |  6 :^:::v                           |
    fadd.d  fa0, fa0, ft1                                 // |  2                          :   :  |  6 :v:::       ^                    |
.LBB0_8:                                                  // |                                    |                                     |
    fmv.d   ft1, ft0                                      // |  2                          :   :  |  6 v^:::       :                    |
.LBB0_9:                                                  // |                                    |                                     |
    fabs.d  ft6, ft1                                      // |  2                          :   :  |  7 :v::: ^     :                    |
    flt.d   a4, ft2, ft6                                  // |  3                          : ^ :  |  6 : v:: v     :                    |
    beqz    a4, .LBB0_22                                  // |  3                          : v :  |  4 :  ::       :                    |
.LBB0_10:                                                 // |                                    |                                     |
    blt a1, a6, .LBB0_7                                   // |  3                         v:   v  |  4 :  ::       :                    |
    li  a4, 1                                             // |  3                          : ^ :  |  4 :  ::       :                    |
    fmv.d   ft6, ft4                                      // |  3                          : : :  |  5 :  :v ^     :                    |
    j   .LBB0_13                                          // |  3                          : : :  |  3 :  :        :                    |
.LBB0_12:                                                 // |                                    |                                     |
    slli    a5, a4, 3                                     // |  4                          : v^:  |  3 :  :        :                    |
    add a5, a5, a0                                        // |  5                        v : :^:  |  3 :  :        :                    |
    fld fa1, 0(a5)                                        // |  4                          : :v:  |  4 :  :        :^                   |
    fcvt.d.w    fa2, a4                                   // |  3                          : v :  |  4 :  :        : ^                  |
    fmul.d  fa1, fa1, fa2                                 // |  2                          :   :  |  5 :  :        :^v                  |
    addi    a4, a4, 1                                     // |  3                          : ^ :  |  4 :  :        ::                   |
    fmadd.d ft6, fa1, ft7, ft6                            // |  3                          : : :  |  6 :  :  ^v    :v                   |
    beq a4, a2, .LBB0_16                                  // |  3                          v v :  |  4 :  :  :     :                    |
.LBB0_13:                                                 // |                                    |                                     |
    fmv.d   ft7, ft3                                      // |  3                          : : :  |  5 :  v  :^    :                    |
    bltu    a4, a6, .LBB0_12                              // |  3                          : v v  |  4 :  :  :     :                    |
    li  a5, 1                                             // |  4                          : :^:  |  4 :  :  :     :                    |
    fmv.d   ft7, ft3                                      // |  3                          : : :  |  5 :  v  :^    :                    |
.LBB0_15:                                                 // |                                    |                                     |
    addiw   a5, a5, 1                                     // |  4                          : :^:  |  4 :  :  :     :                    |
    slli    a3, a5, 32                                    // |  5                          :^:v:  |  4 :  :  :     :                    |
    srli    a3, a3, 32                                    // |  4                          :^: :  |  4 :  :  :     :                    |
    fmul.d  ft7, fa0, ft7                                 // |  4                          ::: :  |  5 :  :  :^    v                    |
    bltu    a3, a4, .LBB0_15                              // |  4                          :vv :  |  3 :  :  :                          |
    j   .LBB0_12                                          // |  2                          :   :  |  3 :  :  :                          |
.LBB0_16:                                                 // |                                    |                                     |
    fdiv.d  ft1, ft1, ft6                                 // |  2                          :   :  |  4 :^ :  v                          |
    fsub.d  fa0, fa0, ft1                                 // |  2                          :   :  |  4 :v :        ^                    |
    blt a1, a6, .LBB0_8                                   // |  3                         v:   v  |  3 :  :        :                    |
    li  a4, 1                                             // |  2                          : ^    |  3 :  :        :                    |
    fmv.d   ft1, ft0                                      // |  2                          : :    |  4 v^ :        :                    |
.LBB0_18:                                                 // |                                    |                                     |
    li  a5, 0                                             // |  3                          : :^   |  2    :        :                    |
    fmv.d   ft6, ft3                                      // |  2                          : :    |  3    v  ^     :                    |
.LBB0_19:                                                 // |                                    |                                     |
    addiw   a5, a5, 1                                     // |  3                          : :^   |  1             :                    |
    slli    a3, a5, 32                                    // |  4                          :^:v   |  1             :                    |
    srli    a3, a3, 32                                    // |  3                          :^:    |  1             :                    |
    fmul.d  ft6, fa0, ft6                                 // |  3                          :::    |  2       ^     v                    |
    bltu    a3, a4, .LBB0_19                              // |  3                          :vv    |  1       :                          |
    slli    a3, a4, 3                                     // |  3                          :^v    |  1       :                          |
    add a3, a3, a0                                        // |  3                        v :^     |  1       :                          |
    fld ft7, 0(a3)                                        // |  2                          :v     |  2       :^                         |
    addi    a4, a4, 1                                     // |  2                          : ^    |  2       ::                         |
    fmadd.d ft1, ft7, ft6, ft1                            // |  2                          : :    |  3  ^    vv                         |
    bne a4, a2, .LBB0_18                                  // |  2                          v v    |  0                                  |
    j   .LBB0_9                                           // |  0                                 |  0                                  |
.LBB0_21:                                                 // |                                    |                                     |
    fmv.d.x fa0, zero                                     // |  0                                 |  1             ^                    |
.LBB0_22:                                                 // |                                    |                                     |
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
