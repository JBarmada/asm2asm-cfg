                                                   // +---------------------+---------------------+-----------+
                                                   // |         GPR         |        VECTOR       |   FLAGS   |
                                                   // |                     |                     |           |
                                                   // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                   // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                   // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                   // |                     |    0123456789111111 |           |
                                                   // |  #                  |  #           012345 |  #        |
                                                   // +---------------------+---------------------+-----------+
    .text                                          // |                     |                     |           |
    .file   "code.c"                               // |                     |                     |           |
    .section    .rodata.cst4,"aM",@progbits,4      // |                     |                     |           |
    .p2align    2                                  // |                     |                     |           |
.LCPI0_0:                                          // |                     |                     |           |
    .long   0x7f7fffff                             // |                     |                     |           |
    .section    .rodata.cst16,"aM",@progbits,16    // |                     |                     |           |
    .p2align    4                                  // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    movss   (%rdi), %xmm1                          // |  1      v           |  1  ^               |  0        |
    movss   %xmm1, (%rdx)                          // |  1    v             |  1  v               |  0        |
    movss   4(%rdi), %xmm0                         // |  1      v           |  1 ^                |  0        |
    movss   %xmm0, 4(%rdx)                         // |  1    v             |  1 v                |  0        |
    testl   %esi, %esi                             // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                    // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                             // |  2     v   ^        |  0                  |  0        |
    movss   .LCPI0_0(%rip), %xmm3                  // |  1         :        |  1    ^             |  0        |
    xorl    %r9d, %r9d                             // |  2         :^       |  0                  |  5 ^^^^^  |
    movaps  .LCPI0_1(%rip), %xmm2                  // |  2         ::       |  1   ^              |  0        |
    movq    %r8, %r10                              // |  3         v:^      |  1   :              |  0        |
    movq    %rdi, %rsi                             // |  5     ^v  :::      |  1   :              |  0        |
    jmp .LBB0_3                                    // |  4     :   :::      |  1   :              |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_2:                                           // |                     |                     |           |
    addq    $4, %rsi                               // |  4     x   :::      |  1   :              |  6 ^^^^^^ |
    decq    %r10                                   // |  4     :   ::x      |  1   :              |  5  ^^^^^ |
    cmpq    %r8, %r9                               // |  4     :   vv:      |  1   :              |  6 ^^^^^^ |
    je  .LBB0_8                                    // |  4     :   :::      |  1   :              |  1  v     |
.LBB0_3:                                           // |                     |                     |           |
    movq    %r9, %rax                              // |  5 ^   :   :v:      |  1   :              |  0        |
    incq    %r9                                    // |  5 :   :   :x:      |  1   :              |  5  ^^^^^ |
    cmpq    %r8, %r9                               // |  5 :   :   vv:      |  1   :              |  6 ^^^^^^ |
    jae .LBB0_2                                    // |  3 :   :     :      |  1   :              |  1 v      |
    movl    $1, %ecx                               // |  4 : ^ :     :      |  1   :              |  0        |
    jmp .LBB0_5                                    // |  4 : : :     :      |  1   :              |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    incq    %rcx                                   // |  4 : x :     :      |  1   :              |  5  ^^^^^ |
    cmpq    %rcx, %r10                             // |  4 : v :     v      |  1   :              |  6 ^^^^^^ |
    je  .LBB0_2                                    // |  3 : : :            |  1   :              |  1  v     |
.LBB0_5:                                           // |                     |                     |           |
    movss   (%rdi,%rax,4), %xmm4                   // |  4 v : :v           |  2   : ^            |  0        |
    movaps  %xmm4, %xmm5                           // |  2   : :            |  3   : v^           |  0        |
    subss   (%rsi,%rcx,4), %xmm5                   // |  2   v v            |  3   : :x           |  6 ^^^^^^ |
    andps   %xmm2, %xmm5                           // |  2   : :            |  3   v :x           |  5 ^^^^^  |
    ucomiss %xmm5, %xmm3                           // |  2   : :            |  3    ^:v           |  2 ::     |
    jbe .LBB0_7                                    // |  2   : :            |  2     ::           |  2 vv     |
    movss   %xmm4, (%rdx)                          // |  3   :v:            |  2     v:           |  2 ::     |
    movss   (%rsi,%rcx,4), %xmm0                   // |  2   v v            |  3 ^   ::           |  2 ::     |
    movss   %xmm0, 4(%rdx)                         // |  1    v             |  3 v   ::           |  2 ::     |
    movaps  %xmm4, %xmm1                           // |  0                  |  4 :^  v:           |  2 ::     |
    movaps  %xmm5, %xmm3                           // |  0                  |  3 :  ^ v           |  2 ::     |
    jmp .LBB0_7                                    // |  0                  |  1 :                |  2 ::     |
.LBB0_8:                                           // |                     |                     |           |
    ucomiss %xmm0, %xmm1                           // |  0                  |  2 v^               |  2 ::     |
    jbe .LBB0_10                                   // |  0                  |  2 ::               |  2 vv     |
    movss   %xmm0, (%rdx)                          // |  1    v             |  2 v:               |  0        |
    movss   %xmm1, 4(%rdx)                         // |  1    v             |  1  v               |  0        |
.LBB0_10:                                          // |                     |                     |           |
    retq                                           // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                       // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0               // |                     |                     |           |
    .cfi_endproc                                   // |                     |                     |           |
    .ident  "clang version 15.0.4"                 // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits     // |                     |                     |           |
    .addrsig                                       // |                     |                     |           |
                                                   // +.....................+.....................+...........+
                                                   // Legend:
                                                   //     ^       : Register assignment (write)
                                                   //     v       : Register usage (read)
                                                   //     x       : Register usage and reassignment (R/W)
                                                   //     :       : Register in use (live)
                                                   //     <space> : Register not in use
                                                   //     #       : Number of occupied registers
