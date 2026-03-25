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
    addi    sp, sp, -112                                  // |  1  ^                              |  0                                  |
    sd  ra, 104(sp)                                       // |  2 vv                              |  0                                  |
    sd  s0, 96(sp)                                        // |  2  v         v                    |  0                                  |
    sd  s1, 88(sp)                                        // |  2  v          v                   |  0                                  |
    sd  s2, 80(sp)                                        // |  2  v           v                  |  0                                  |
    sd  s3, 72(sp)                                        // |  2  v            v                 |  0                                  |
    sd  s4, 64(sp)                                        // |  2  v             v                |  0                                  |
    sd  s5, 56(sp)                                        // |  2  v              v               |  0                                  |
    sd  s6, 48(sp)                                        // |  2  v               v              |  0                                  |
    sd  s7, 40(sp)                                        // |  2  v                v             |  0                                  |
    sd  s8, 32(sp)                                        // |  2  v                 v            |  0                                  |
    sd  s9, 24(sp)                                        // |  2  v                  v           |  0                                  |
    sd  s10, 16(sp)                                       // |  2  v                   v          |  0                                  |
    sd  s11, 8(sp)                                        // |  2  v                    v         |  0                                  |
    sd  a2, 0(sp)                                         // |  2  v                       v      |  0                                  |
    mv  s3, a1                                            // |  3  :            ^         v       |  0                                  |
    mv  s4, a0                                            // |  4  :            :^       v        |  0                                  |
    call    strlen@plt                                    // |  4 ^:            ::                |  0                                  |
    addi    s5, a0, 1                                     // |  5  :            ::^      v        |  0                                  |
    mv  a0, s5                                            // |  5  :            ::v      ^        |  0                                  |
    call    malloc@plt                                    // |  6 ^:            :::      :        |  0                                  |
    mv  s10, a0                                           // |  6  :            :::    ^ v        |  0                                  |
    call    __ctype_b_loc@plt                             // |  7 ^:            :::    : :        |  0                                  |
    mv  s8, a0                                            // |  7  :            :::  ^ : v        |  0                                  |
    li  s1, 0                                             // |  7  :          ^ :::  : :          |  0                                  |
    li  s6, 0                                             // |  8  :          : :::^ : :          |  0                                  |
    li  s0, 0                                             // |  9  :         ^: :::: : :          |  0                                  |
    li  s11, 0                                            // |  9  :          : :::: : :^         |  0                                  |
    li  s9, 0                                             // |  9  :          : :::: :^:          |  0                                  |
.LBB0_9:                                                  // |                                    |                                     |
    auipc   s7, %pcrel_hi(.L.str)                         // | 10  :          : ::::^:::          |  0                                  |
    addi    s7, s7, %pcrel_lo(.LBB0_9)                    // | 10  :          : ::::^:::          |  0                                  |
    j   .LBB0_3                                           // | 10  :          : ::::::::          |  0                                  |
.LBB0_1:                                                  // |                                    |                                     |
    li  s0, 0                                             // | 11  :         ^: ::::::::          |  0                                  |
    addiw   s11, s1, 1                                    // | 12  :         :v ::::::::^         |  0                                  |
.LBB0_2:                                                  // |                                    |                                     |
    addi    s1, s1, 1                                     // | 12  :         :^ :::::::::         |  0                                  |
    beq s5, s1, .LBB0_8                                   // | 12  :         :v ::v::::::         |  0                                  |
.LBB0_3:                                                  // |                                    |                                     |
    add a0, s4, s1                                        // | 12  :         :v :v ::::::^        |  0                                  |
    lbu a1, 0(a0)                                         // | 12  :         :: :  ::::::v^       |  0                                  |
    ld  a0, 0(s8)                                         // | 12  :         :: :  ::v:::^:       |  0                                  |
    slli    a2, a1, 1                                     // | 11  :         :: :  :: ::: v^      |  0                                  |
    add a0, a0, a2                                        // | 12  :         :: :  :: :::^:v      |  0                                  |
    lhu s2, 0(a0)                                         // | 12  :         ::^:  :: :::v:       |  0                                  |
    seqz    a0, a1                                        // | 12  :         ::::  :: :::^v       |  0                                  |
    slli    a2, s2, 50                                    // | 11  :         ::v:  :: :::  ^      |  0                                  |
    srli    a2, a2, 63                                    // | 11  :         ::::  :: :::  ^      |  0                                  |
    or  a0, a0, a2                                        // | 12  :         ::::  :: :::^ v      |  0                                  |
    beqz    a0, .LBB0_6                                   // | 11  :         ::::  :: :::v        |  0                                  |
    bne s0, s3, .LBB0_1                                   // | 10  :         v::v  :: :::         |  0                                  |
    subw    a0, s1, s11                                   // |  9  :          v:   :: ::v^        |  0                                  |
    add a0, a0, s10                                       // |  9  :          ::   :: :v:^        |  0                                  |
    sb  zero, 0(a0)                                       // |  9  :          ::   :: :::v        |  0                                  |
    addiw   s0, s9, 1                                     // |  9  :         ^::   :: v::         |  0                                  |
    slli    a1, s0, 3                                     // | 10  :         v::   :: ::: ^       |  0                                  |
    mv  a0, s6                                            // | 10  :         :::   v: :::^        |  0                                  |
    call    realloc@plt                                   // | 10 ^:         :::    : ::::        |  0                                  |
    mv  s6, a0                                            // | 10  :         :::   ^: :::v        |  0                                  |
    mv  a0, s10                                           // | 10  :         :::   :: :v:^        |  0                                  |
    call    strlen@plt                                    // | 10 ^:         :::   :: :::         |  0                                  |
    addi    a0, a0, 1                                     // | 10  :         :::   :: :::^        |  0                                  |
    call    malloc@plt                                    // | 11 ^:         :::   :: ::::        |  0                                  |
    slli    a1, s9, 3                                     // | 11  :         :::   :: v:::^       |  0                                  |
    add a1, a1, s6                                        // | 10  :         :::   v:  :::^       |  0                                  |
    sd  a0, 0(a1)                                         // | 10  :         :::   ::  ::vv       |  0                                  |
    mv  a1, s10                                           // |  9  :         :::   ::  v: ^       |  0                                  |
    call    strcpy@plt                                    // | 10 ^:         :::   ::  :: :       |  0                                  |
    mv  s9, s0                                            // | 10  :         v::   :: ^:: :       |  0                                  |
    j   .LBB0_1                                           // |  9  :          ::   :: ::: :       |  0                                  |
.LBB0_6:                                                  // |                                    |                                     |
    subw    a0, s1, s11                                   // | 10  :          v:   :: ::v^:       |  0                                  |
    add a0, a0, s10                                       // |  8  :           :   :: :v ^:       |  0                                  |
    sb  a1, 0(a0)                                         // |  8  :           :   :: :: vv       |  0                                  |
    li  a2, 11                                            // |  7  :           :   :: ::   ^      |  0                                  |
    mv  a0, s7                                            // |  7  :           :   :v :: ^        |  0                                  |
    call    memchr@plt                                    // |  7 ^:           :   :  :: :        |  0                                  |
    bnez    a0, .LBB0_2                                   // |  6  :           :   :  :: v        |  0                                  |
    slli    a0, s2, 53                                    // |  6  :           v   :  :: ^        |  0                                  |
    srli    a0, a0, 63                                    // |  5  :               :  :: ^        |  0                                  |
    addw    s0, s0, a0                                    // |  6  :         ^     :  :: v        |  0                                  |
    j   .LBB0_2                                           // |  4  :               :  ::          |  0                                  |
.LBB0_8:                                                  // |                                    |                                     |
    mv  a0, s10                                           // |  5  :               :  :v ^        |  0                                  |
    call    free@plt                                      // |  4 ^:               :  :           |  0                                  |
    ld  a0, 0(sp)                                         // |  4  v               :  :  ^        |  0                                  |
    sw  s9, 0(a0)                                         // |  4  :               :  v  v        |  0                                  |
    mv  a0, s6                                            // |  3  :               v     ^        |  0                                  |
    ld  ra, 104(sp)                                       // |  2 ^v                              |  0                                  |
    ld  s0, 96(sp)                                        // |  3 :v         ^                    |  0                                  |
    ld  s1, 88(sp)                                        // |  3 :v          ^                   |  0                                  |
    ld  s2, 80(sp)                                        // |  3 :v           ^                  |  0                                  |
    ld  s3, 72(sp)                                        // |  3 :v            ^                 |  0                                  |
    ld  s4, 64(sp)                                        // |  3 :v             ^                |  0                                  |
    ld  s5, 56(sp)                                        // |  3 :v              ^               |  0                                  |
    ld  s6, 48(sp)                                        // |  3 :v               ^              |  0                                  |
    ld  s7, 40(sp)                                        // |  3 :v                ^             |  0                                  |
    ld  s8, 32(sp)                                        // |  3 :v                 ^            |  0                                  |
    ld  s9, 24(sp)                                        // |  3 :v                  ^           |  0                                  |
    ld  s10, 16(sp)                                       // |  3 :v                   ^          |  0                                  |
    ld  s11, 8(sp)                                        // |  3 :v                    ^         |  0                                  |
    addi    sp, sp, 112                                   // |  2 :^                              |  0                                  |
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
