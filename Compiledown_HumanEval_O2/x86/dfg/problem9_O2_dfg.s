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
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    testl   %esi, %esi                             // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                    // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r9d                             // |  2     v    ^       |  0                  |  0        |
    cmpl    $8, %esi                               // |  2     v    :       |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                    // |  1          :       |  0                  |  1 v      |
    xorl    %r10d, %r10d                           // |  2          :^      |  0                  |  5 ^^^^^  |
    movl    $1, %esi                               // |  2     ^    :       |  0                  |  0        |
    xorl    %eax, %eax                             // |  2 ^        :       |  0                  |  5 ^^^^^  |
    jmp .LBB0_11                                   // |  1          :       |  0                  |  0        |
.LBB0_1:                                           // |                     |                     |           |
    movl    $1, %esi                               // |  2     ^    :       |  0                  |  0        |
    xorl    %eax, %eax                             // |  2 ^        :       |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                   // |  1          :       |  0                  |  0        |
.LBB0_4:                                           // |                     |                     |           |
    movl    %r9d, %r10d                            // |  2          v^      |  0                  |  0        |
    andl    $-8, %r10d                             // |  2          :x      |  0                  |  5 ^^^^^  |
    leaq    -8(%r10), %rax                         // |  3 ^        :v      |  0                  |  0        |
    movq    %rax, %r8                              // |  4 v       ^::      |  0                  |  0        |
    shrq    $3, %r8                                // |  4 :       x::      |  0                  |  5 ^^^^^  |
    incq    %r8                                    // |  4 :       x::      |  0                  |  5  ^^^^^ |
    testq   %rax, %rax                             // |  4 v       :::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                    // |  3         :::      |  0                  |  1  v     |
    movq    %r8, %rax                              // |  4 ^       v::      |  0                  |  0        |
    andq    $-2, %rax                              // |  4 x       :::      |  0                  |  5 ^^^^^  |
    pxor    %xmm9, %xmm9                           // |  4 :       :::      |  1          ^       |  0        |
    movdqa  .LCPI0_0(%rip), %xmm1                  // |  4 :       :::      |  1  ^               |  0        |
    xorl    %esi, %esi                             // |  5 :   ^   :::      |  1  :               |  5 ^^^^^  |
    movdqa  %xmm1, %xmm3                           // |  5 :   :   :::      |  2  v ^             |  0        |
    pxor    %xmm2, %xmm2                           // |  5 :   :   :::      |  3  :^:             |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    movdqu  (%rdi,%rsi,4), %xmm6                   // |  6 :   vv  :::      |  3  : :  ^          |  0        |
    movdqu  16(%rdi,%rsi,4), %xmm4                 // |  6 :   vv  :::      |  4  : :^ :          |  0        |
    movdqu  32(%rdi,%rsi,4), %xmm7                 // |  6 :   vv  :::      |  5  : :: :^         |  0        |
    movdqu  48(%rdi,%rsi,4), %xmm8                 // |  6 :   vv  :::      |  6  : :: ::^        |  0        |
    paddd   %xmm6, %xmm9                           // |  5 :   :   :::      |  7  : :: v::^       |  0        |
    paddd   %xmm4, %xmm2                           // |  5 :   :   :::      |  6  :^:v  ::        |  0        |
    pshufd  $245, %xmm6, %xmm5                     // |  5 :   :   :::      |  4  : :   ::        |  0        |
    pshufd  $245, %xmm1, %xmm0                     // |  5 :   :   :::      |  4  : :   ::        |  0        |
    pmuludq %xmm5, %xmm0                           // |  5 :   :   :::      |  6 ^: : v ::        |  0        |
    pmuludq %xmm1, %xmm6                           // |  5 :   :   :::      |  6 :v :  ^::        |  0        |
    pshufd  $245, %xmm4, %xmm1                     // |  5 :   :   :::      |  5 :: :   ::        |  0        |
    pshufd  $245, %xmm3, %xmm5                     // |  5 :   :   :::      |  5 :: :   ::        |  0        |
    pmuludq %xmm1, %xmm5                           // |  5 :   :   :::      |  6 :v : ^ ::        |  0        |
    pmuludq %xmm3, %xmm4                           // |  5 :   :   :::      |  6 :  v^: ::        |  0        |
    paddd   %xmm7, %xmm9                           // |  5 :   :   :::      |  5 :    : v:^       |  0        |
    paddd   %xmm8, %xmm2                           // |  5 :   :   :::      |  5 : ^  : :v        |  0        |
    pmuludq %xmm7, %xmm6                           // |  5 :   :   :::      |  5 :    :^v:        |  0        |
    pshufd  $232, %xmm6, %xmm1                     // |  5 :   :   :::      |  3 :    :  :        |  0        |
    pshufd  $245, %xmm7, %xmm3                     // |  5 :   :   :::      |  3 :    :  :        |  0        |
    pmuludq %xmm0, %xmm3                           // |  5 :   :   :::      |  4 v  ^ :  :        |  0        |
    pshufd  $232, %xmm3, %xmm0                     // |  5 :   :   :::      |  3 :    :  :        |  0        |
    punpckldq   %xmm0, %xmm1                       // |  5 :   :   :::      |  4 v^   :  :        |  0        |
    pmuludq %xmm8, %xmm4                           // |  5 :   :   :::      |  4  :  ^:  v        |  0        |
    pshufd  $232, %xmm4, %xmm3                     // |  5 :   :   :::      |  2  :   :           |  0        |
    pshufd  $245, %xmm8, %xmm0                     // |  5 :   :   :::      |  2  :   :           |  0        |
    pmuludq %xmm5, %xmm0                           // |  5 :   :   :::      |  3 ^:   v           |  0        |
    pshufd  $232, %xmm0, %xmm0                     // |  5 :   :   :::      |  3 ::   :           |  0        |
    punpckldq   %xmm0, %xmm3                       // |  5 :   :   :::      |  4 v: ^ :           |  0        |
    addq    $16, %rsi                              // |  5 :   x   :::      |  3  : : :           |  6 ^^^^^^ |
    addq    $-2, %rax                              // |  5 x   :   :::      |  3  : : :           |  6 ^^^^^^ |
    jne .LBB0_7                                    // |  4     :   :::      |  3  : : :           |  1  v     |
    testb   $1, %r8b                               // |  4     :   v::      |  3  : : :           |  6 ^^^^^^ |
    je  .LBB0_10                                   // |  4     :   :::      |  3  : : :           |  1  v     |
.LBB0_9:                                           // |                     |                     |           |
    movdqu  (%rdi,%rsi,4), %xmm0                   // |  5     vv  :::      |  4 ^: : :           |  0        |
    movdqu  16(%rdi,%rsi,4), %xmm4                 // |  5     vv  :::      |  5 :: :^:           |  0        |
    paddd   %xmm0, %xmm9                           // |  3         :::      |  6 v: :::   ^       |  0        |
    paddd   %xmm4, %xmm2                           // |  3         :::      |  5  :^:v:           |  0        |
    pshufd  $245, %xmm0, %xmm5                     // |  3         :::      |  4  ::: :           |  0        |
    pmuludq %xmm1, %xmm0                           // |  3         :::      |  5 ^v:: :           |  0        |
    pshufd  $245, %xmm1, %xmm1                     // |  3         :::      |  3   :: :           |  0        |
    pshufd  $232, %xmm0, %xmm0                     // |  3         :::      |  3   :: :           |  0        |
    pmuludq %xmm5, %xmm1                           // |  3         :::      |  4  ^:: v           |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  3         :::      |  3  :::             |  0        |
    punpckldq   %xmm1, %xmm0                       // |  3         :::      |  4 ^v::             |  0        |
    pshufd  $245, %xmm4, %xmm1                     // |  3         :::      |  4 ::::             |  0        |
    pmuludq %xmm3, %xmm4                           // |  3         :::      |  5 :::v^            |  0        |
    pshufd  $245, %xmm3, %xmm3                     // |  3         :::      |  3 :::              |  0        |
    pshufd  $232, %xmm4, %xmm4                     // |  3         :::      |  3 :::              |  0        |
    pmuludq %xmm1, %xmm3                           // |  3         :::      |  4 :v:^             |  0        |
    pshufd  $232, %xmm3, %xmm1                     // |  3         :::      |  3 :::              |  0        |
    punpckldq   %xmm1, %xmm4                       // |  3         :::      |  4 :v: ^            |  0        |
    movdqa  %xmm0, %xmm1                           // |  3         :::      |  4 v^: :            |  0        |
    movdqa  %xmm4, %xmm3                           // |  3         :::      |  4  ::^v            |  0        |
.LBB0_10:                                          // |                     |                     |           |
    paddd   %xmm2, %xmm9                           // |  3         :::      |  3  :v      ^       |  0        |
    pshufd  $238, %xmm9, %xmm0                     // |  3         :::      |  2  :       :       |  0        |
    paddd   %xmm9, %xmm0                           // |  3         :::      |  3 ^:       v       |  0        |
    pshufd  $85, %xmm0, %xmm2                      // |  3         :::      |  2 ::               |  0        |
    paddd   %xmm0, %xmm2                           // |  3         :::      |  3 v:^              |  0        |
    movd    %xmm2, %eax                            // |  4 ^       :::      |  3 ::v              |  0        |
    pshufd  $245, %xmm1, %xmm0                     // |  4 :       :::      |  2 ::               |  0        |
    pshufd  $245, %xmm3, %xmm2                     // |  4 :       :::      |  2 ::               |  0        |
    pmuludq %xmm0, %xmm2                           // |  4 :       :::      |  3 v:^              |  0        |
    pmuludq %xmm1, %xmm3                           // |  4 :       :::      |  3  v:^             |  0        |
    pshufd  $238, %xmm3, %xmm0                     // |  4 :       :::      |  2   ::             |  0        |
    pmuludq %xmm3, %xmm0                           // |  4 :       :::      |  3 ^ :v             |  0        |
    pshufd  $170, %xmm2, %xmm1                     // |  4 :       :::      |  2 : :              |  0        |
    pmuludq %xmm2, %xmm1                           // |  4 :       :::      |  3 :^v              |  0        |
    pmuludq %xmm0, %xmm1                           // |  4 :       :::      |  2 v^               |  0        |
    movd    %xmm1, %esi                            // |  5 :   ^   :::      |  1  v               |  0        |
    cmpq    %r9, %r10                              // |  4 :       :vv      |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                   // |  4 :       :::      |  0                  |  1  v     |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_11:                                          // |                     |                     |           |
    movl    (%rdi,%r10,4), %ecx                    // |  6 : ^  v  ::v      |  0                  |  0        |
    addl    %ecx, %eax                             // |  5 x v     :::      |  0                  |  6 ^^^^^^ |
    imull   %ecx, %esi                             // |  7 x vx^   :::      |  0                  |  2 ^  ^   |
    incq    %r10                                   // |  6 :  ::   ::x      |  0                  |  5  ^^^^^ |
    cmpq    %r10, %r9                              // |  6 :  ::   :vv      |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                   // |  4 :  ::   :        |  0                  |  1  v     |
.LBB0_12:                                          // |                     |                     |           |
    movl    %eax, (%rdx)                           // |  4 v  v:   :        |  0                  |  0        |
    movl    %esi, 4(%rdx)                          // |  3    vv   :        |  0                  |  0        |
    retq                                           // |  2        x:        |  0                  |  0        |
.LBB0_5:                                           // |                     |                     |           |
    pxor    %xmm9, %xmm9                           // |  1         :        |  1          ^       |  0        |
    movdqa  .LCPI0_0(%rip), %xmm1                  // |  1         :        |  1  ^               |  0        |
    xorl    %esi, %esi                             // |  2     ^   :        |  1  :               |  5 ^^^^^  |
    movdqa  %xmm1, %xmm3                           // |  1         :        |  2  v ^             |  0        |
    pxor    %xmm2, %xmm2                           // |  1         :        |  1   ^              |  0        |
    testb   $1, %r8b                               // |  1         v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                    // |  0                  |  0                  |  1  v     |
    jmp .LBB0_10                                   // |  0                  |  0                  |  0        |
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
