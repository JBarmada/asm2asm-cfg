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
    .section    .rodata.cst16,"aM",@progbits,16    // |                     |                     |           |
    .p2align    4                                  // |                     |                     |           |
.LCPI0_0:                                          // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .long   18                                     // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .long   100000000                              // |                     |                     |           |
    .long   100000000                              // |                     |                     |           |
    .long   100000000                              // |                     |                     |           |
    .long   100000000                              // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .long   10                                     // |                     |                     |           |
    .long   10                                     // |                     |                     |           |
    .long   10                                     // |                     |                     |           |
    .long   10                                     // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    testl   %edi, %edi                             // |  1      v           |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                    // |  0                  |  0                  |  3  vvv   |
    movl    $1, %eax                               // |  1 ^                |  0                  |  0        |
    cmpl    $1, %edi                               // |  1      v           |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                   // |  0                  |  0                  |  1  v     |
    movl    $18, %eax                              // |  1 ^                |  0                  |  0        |
    cmpl    $3, %edi                               // |  1      v           |  0                  |  6 ^^^^^^ |
    jb  .LBB0_17                                   // |  0                  |  0                  |  1 v      |
    leal    -2(%rdi), %r8d                         // |  2      v  ^        |  0                  |  0        |
    cmpl    $8, %r8d                               // |  1         v        |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                    // |  1         :        |  0                  |  1 v      |
    movl    $18, %eax                              // |  2 ^       :        |  0                  |  0        |
    movl    $2, %ecx                               // |  2   ^     :        |  0                  |  0        |
    jmp .LBB0_15                                   // |  1         :        |  0                  |  0        |
.LBB0_1:                                           // |                     |                     |           |
    xorl    %eax, %eax                             // |  2 ^       :        |  0                  |  5 ^^^^^  |
    retq                                           // |  2        x:        |  0                  |  0        |
.LBB0_6:                                           // |                     |                     |           |
    movl    %r8d, %ecx                             // |  3   ^    :v        |  0                  |  0        |
    andl    $-8, %ecx                              // |  3   x    ::        |  0                  |  5 ^^^^^  |
    leal    -8(%rcx), %edx                         // |  4   v^   ::        |  0                  |  0        |
    movl    %edx, %esi                             // |  5   :v^  ::        |  0                  |  0        |
    shrl    $3, %esi                               // |  5   ::x  ::        |  0                  |  5 ^^^^^  |
    incl    %esi                                   // |  5   ::x  ::        |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                             // |  6 ^ ::v  ::        |  0                  |  0        |
    andl    $7, %eax                               // |  6 x :::  ::        |  0                  |  5 ^^^^^  |
    cmpl    $56, %edx                              // |  6 : :v:  ::        |  0                  |  6 ^^^^^^ |
    jae .LBB0_8                                    // |  5 : : :  ::        |  0                  |  1 v      |
    movdqa  .LCPI0_0(%rip), %xmm0                  // |  5 : : :  ::        |  1 ^                |  0        |
    movdqa  .LCPI0_1(%rip), %xmm1                  // |  5 : : :  ::        |  1  ^               |  0        |
    jmp .LBB0_10                                   // |  5 : : :  ::        |  0                  |  0        |
.LBB0_8:                                           // |                     |                     |           |
    andl    $-8, %esi                              // |  5 : : x  ::        |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm0                  // |  5 : : :  ::        |  1 ^                |  0        |
    movdqa  .LCPI0_1(%rip), %xmm1                  // |  5 : : :  ::        |  1  ^               |  0        |
    movdqa  .LCPI0_2(%rip), %xmm2                  // |  5 : : :  ::        |  1   ^              |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_9:                                           // |                     |                     |           |
    pshufd  $245, %xmm1, %xmm3                     // |  5 : : :  ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm1                           // |  5 : : :  ::        |  2  ^v              |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  5 : : :  ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm3                           // |  5 : : :  ::        |  2   v^             |  0        |
    pshufd  $232, %xmm3, %xmm3                     // |  5 : : :  ::        |  2   ::             |  0        |
    punpckldq   %xmm3, %xmm1                       // |  5 : : :  ::        |  3  ^:v             |  0        |
    pshufd  $245, %xmm0, %xmm3                     // |  5 : : :  ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm0                           // |  5 : : :  ::        |  2 ^ v              |  0        |
    pshufd  $232, %xmm0, %xmm0                     // |  5 : : :  ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm3                           // |  5 : : :  ::        |  2   v^             |  0        |
    pshufd  $232, %xmm3, %xmm3                     // |  5 : : :  ::        |  1    :             |  0        |
    punpckldq   %xmm3, %xmm0                       // |  5 : : :  ::        |  2 ^  v             |  0        |
    addl    $-8, %esi                              // |  5 : : x  ::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                    // |  4 : :    ::        |  0                  |  1  v     |
.LBB0_10:                                          // |                     |                     |           |
    testl   %eax, %eax                             // |  4 v :    ::        |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                   // |  4 : :    ::        |  0                  |  1  v     |
    movdqa  .LCPI0_3(%rip), %xmm2                  // |  4 : :    ::        |  1   ^              |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_12:                                          // |                     |                     |           |
    pshufd  $245, %xmm1, %xmm3                     // |  4 : :    ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm1                           // |  4 : :    ::        |  2  ^v              |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  4 : :    ::        |  1   :              |  0        |
    pmuludq %xmm2, %xmm3                           // |  4 : :    ::        |  2   v^             |  0        |
    pshufd  $232, %xmm3, %xmm3                     // |  4 : :    ::        |  2   ::             |  0        |
    punpckldq   %xmm3, %xmm1                       // |  4 : :    ::        |  3  ^:v             |  0        |
    pshufd  $245, %xmm0, %xmm3                     // |  4 : :    ::        |  2  ::              |  0        |
    pmuludq %xmm2, %xmm0                           // |  4 : :    ::        |  3 ^:v              |  0        |
    pshufd  $232, %xmm0, %xmm0                     // |  4 : :    ::        |  2  ::              |  0        |
    pmuludq %xmm2, %xmm3                           // |  4 : :    ::        |  3  :v^             |  0        |
    pshufd  $232, %xmm3, %xmm3                     // |  4 : :    ::        |  3  :::             |  0        |
    punpckldq   %xmm3, %xmm0                       // |  4 : :    ::        |  4 ^::v             |  0        |
    decl    %eax                                   // |  4 x :    ::        |  2  ::              |  5  ^^^^^ |
    jne .LBB0_12                                   // |  3   :    ::        |  2  ::              |  1  v     |
.LBB0_13:                                          // |                     |                     |           |
    pshufd  $245, %xmm1, %xmm2                     // |  3   :    ::        |  2  ::              |  0        |
    pshufd  $245, %xmm0, %xmm3                     // |  3   :    ::        |  2  ::              |  0        |
    pmuludq %xmm2, %xmm3                           // |  3   :    ::        |  3  :v^             |  0        |
    pmuludq %xmm1, %xmm0                           // |  3   :    ::        |  3 ^v :             |  0        |
    pshufd  $238, %xmm0, %xmm1                     // |  3   :    ::        |  2 :  :             |  0        |
    pmuludq %xmm0, %xmm1                           // |  3   :    ::        |  3 v^ :             |  0        |
    pshufd  $170, %xmm3, %xmm0                     // |  3   :    ::        |  2  : :             |  0        |
    pmuludq %xmm3, %xmm0                           // |  3   :    ::        |  3 ^: v             |  0        |
    pmuludq %xmm1, %xmm0                           // |  3   :    ::        |  2 ^v               |  0        |
    movd    %xmm0, %eax                            // |  4 ^ :    ::        |  1 v                |  0        |
    cmpl    %ecx, %r8d                             // |  4 : v    :v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                   // |  3 : :    :         |  0                  |  1  v     |
    orl $2, %ecx                                   // |  3 : x    :         |  0                  |  5 ^^^^^  |
.LBB0_15:                                          // |                     |                     |           |
    subl    %ecx, %edi                             // |  4 : v  x :         |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_16:                                          // |                     |                     |           |
    addl    %eax, %eax                             // |  3 x    : :         |  0                  |  6 ^^^^^^ |
    leal    (%rax,%rax,4), %eax                    // |  3 ^    : :         |  0                  |  0        |
    decl    %edi                                   // |  2      x :         |  0                  |  5  ^^^^^ |
    jne .LBB0_16                                   // |  1        :         |  0                  |  1  v     |
.LBB0_17:                                          // |                     |                     |           |
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
