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
    .long   99                                     // |                     |                     |           |
    .long   99                                     // |                     |                     |           |
    .long   99                                     // |                     |                     |           |
    .long   99                                     // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .long   2147483648                             // |                     |                     |           |
    .long   2147483648                             // |                     |                     |           |
    .long   2147483648                             // |                     |                     |           |
    .long   2147483648                             // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .long   2147483847                             // |                     |                     |           |
    .long   2147483847                             // |                     |                     |           |
    .long   2147483847                             // |                     |                     |           |
    .long   2147483847                             // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    testl   %esi, %esi                             // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                    // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r10d                            // |  2     v     ^      |  0                  |  0        |
    xorl    %r9d, %r9d                             // |  2          ^:      |  0                  |  5 ^^^^^  |
    cmpl    $8, %esi                               // |  3     v    ::      |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                    // |  2          ::      |  0                  |  1 v      |
    xorl    %esi, %esi                             // |  3     ^    ::      |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                             // |  3 ^        ::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_11                                   // |  2          ::      |  0                  |  0        |
.LBB0_1:                                           // |                     |                     |           |
    xorl    %eax, %eax                             // |  3 ^        ::      |  0                  |  5 ^^^^^  |
    retq                                           // |  3        x ::      |  0                  |  0        |
.LBB0_4:                                           // |                     |                     |           |
    movl    %r10d, %esi                            // |  4     ^  : :v      |  0                  |  0        |
    andl    $-8, %esi                              // |  4     x  : ::      |  0                  |  5 ^^^^^  |
    leaq    -8(%rsi), %rax                         // |  5 ^   v  : ::      |  0                  |  0        |
    movq    %rax, %r8                              // |  6 v   :  :^::      |  0                  |  0        |
    shrq    $3, %r8                                // |  6 :   :  :x::      |  0                  |  5 ^^^^^  |
    incq    %r8                                    // |  6 :   :  :x::      |  0                  |  5  ^^^^^ |
    testq   %rax, %rax                             // |  6 v   :  ::::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                    // |  5     :  ::::      |  0                  |  1  v     |
    movq    %r8, %rdx                              // |  6    ^:  :v::      |  0                  |  0        |
    andq    $-2, %rdx                              // |  6    x:  ::::      |  0                  |  5 ^^^^^  |
    pxor    %xmm0, %xmm0                           // |  6    ::  ::::      |  1 ^                |  0        |
    xorl    %eax, %eax                             // |  7 ^  ::  ::::      |  1 :                |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm8                  // |  7 :  ::  ::::      |  2 :       ^        |  0        |
    movdqa  .LCPI0_1(%rip), %xmm9                  // |  7 :  ::  ::::      |  3 :       :^       |  0        |
    movdqa  .LCPI0_2(%rip), %xmm10                 // |  7 :  ::  ::::      |  4 :       ::^      |  0        |
    pxor    %xmm1, %xmm1                           // |  7 :  ::  ::::      |  5 :^      :::      |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    movdqu  (%rdi,%rax,4), %xmm3                   // |  8 v  ::v ::::      |  6 :: ^    :::      |  0        |
    movdqu  16(%rdi,%rax,4), %xmm4                 // |  8 v  ::v ::::      |  7 :: :^   :::      |  0        |
    movdqu  32(%rdi,%rax,4), %xmm6                 // |  8 v  ::v ::::      |  8 :: :: ^ :::      |  0        |
    movdqu  48(%rdi,%rax,4), %xmm11                // |  8 v  ::v ::::      |  9 :: :: : :::^     |  0        |
    movdqa  %xmm3, %xmm7                           // |  7 :  ::  ::::      | 10 :: v: :^::::     |  0        |
    paddd   %xmm8, %xmm7                           // |  7 :  ::  ::::      | 10 :: :: :^v:::     |  0        |
    movdqa  %xmm4, %xmm2                           // |  7 :  ::  ::::      | 10 ::^:v : ::::     |  0        |
    paddd   %xmm8, %xmm2                           // |  7 :  ::  ::::      | 10 ::^:: : v:::     |  0        |
    pxor    %xmm9, %xmm7                           // |  7 :  ::  ::::      | 10 :: :: :^:v::     |  0        |
    movdqa  %xmm10, %xmm5                          // |  7 :  ::  ::::      | 11 :: ::^::::v:     |  0        |
    pcmpgtd %xmm7, %xmm5                           // |  7 :  ::  ::::      | 11 :: ::^:v::::     |  0        |
    pxor    %xmm9, %xmm2                           // |  7 :  ::  ::::      | 10 ::^:: : :v::     |  0        |
    movdqa  %xmm10, %xmm7                          // |  7 :  ::  ::::      | 11 ::::: :^::v:     |  0        |
    pcmpgtd %xmm2, %xmm7                           // |  7 :  ::  ::::      | 11 ::v:: :^::::     |  0        |
    pand    %xmm3, %xmm5                           // |  7 :  ::  ::::      | 10 :: v:^: ::::     |  0        |
    paddd   %xmm0, %xmm5                           // |  7 :  ::  ::::      |  9 v:  :^: ::::     |  0        |
    pand    %xmm4, %xmm7                           // |  7 :  ::  ::::      |  9  :  v::^::::     |  0        |
    paddd   %xmm1, %xmm7                           // |  7 :  ::  ::::      |  8  v   ::^::::     |  0        |
    movdqa  %xmm6, %xmm1                           // |  7 :  ::  ::::      |  8  ^   :v:::::     |  0        |
    paddd   %xmm8, %xmm1                           // |  7 :  ::  ::::      |  8  ^   :::v:::     |  0        |
    movdqa  %xmm11, %xmm2                          // |  7 :  ::  ::::      |  8   ^  ::::::v     |  0        |
    paddd   %xmm8, %xmm2                           // |  7 :  ::  ::::      |  8   ^  :::v:::     |  0        |
    pxor    %xmm9, %xmm1                           // |  7 :  ::  ::::      |  7  ^   ::: v::     |  0        |
    movdqa  %xmm10, %xmm0                          // |  7 :  ::  ::::      |  8 ^:   ::: :v:     |  0        |
    pcmpgtd %xmm1, %xmm0                           // |  7 :  ::  ::::      |  8 ^v   ::: :::     |  0        |
    pxor    %xmm9, %xmm2                           // |  7 :  ::  ::::      |  7   ^  ::: v::     |  0        |
    movdqa  %xmm10, %xmm1                          // |  7 :  ::  ::::      |  7  ^:  :::  v:     |  0        |
    pcmpgtd %xmm2, %xmm1                           // |  7 :  ::  ::::      |  6  ^v  :::   :     |  0        |
    pand    %xmm6, %xmm0                           // |  7 :  ::  ::::      |  5 ^    :v:   :     |  0        |
    paddd   %xmm5, %xmm0                           // |  7 :  ::  ::::      |  4 ^    v :   :     |  0        |
    pand    %xmm11, %xmm1                          // |  7 :  ::  ::::      |  3  ^     :   v     |  0        |
    paddd   %xmm7, %xmm1                           // |  7 :  ::  ::::      |  2  ^     v         |  0        |
    addq    $16, %rax                              // |  7 x  ::  ::::      |  0                  |  6 ^^^^^^ |
    addq    $-2, %rdx                              // |  7 :  x:  ::::      |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                    // |  6 :   :  ::::      |  0                  |  1  v     |
    testb   $1, %r8b                               // |  6 :   :  :v::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                   // |  6 :   :  ::::      |  0                  |  1  v     |
.LBB0_9:                                           // |                     |                     |           |
    movdqu  (%rdi,%rax,4), %xmm2                   // |  7 v   :v ::::      |  1   ^              |  0        |
    movdqu  16(%rdi,%rax,4), %xmm3                 // |  7 v   :v ::::      |  2   :^             |  0        |
    movdqa  .LCPI0_0(%rip), %xmm4                  // |  5     :  ::::      |  3   ::^            |  0        |
    movdqa  %xmm2, %xmm5                           // |  5     :  ::::      |  4   v::^           |  0        |
    paddd   %xmm4, %xmm5                           // |  5     :  ::::      |  4   ::v^           |  0        |
    paddd   %xmm3, %xmm4                           // |  5     :  ::::      |  3   :v^            |  0        |
    movdqa  .LCPI0_1(%rip), %xmm8                  // |  5     :  ::::      |  3   ::    ^        |  0        |
    pxor    %xmm8, %xmm5                           // |  5     :  ::::      |  4   :: ^  v        |  0        |
    movdqa  .LCPI0_2(%rip), %xmm7                  // |  5     :  ::::      |  5   :: : ^:        |  0        |
    movdqa  %xmm7, %xmm6                           // |  5     :  ::::      |  6   :: :^v:        |  0        |
    pcmpgtd %xmm5, %xmm6                           // |  5     :  ::::      |  5   :: v^ :        |  0        |
    pxor    %xmm8, %xmm4                           // |  5     :  ::::      |  4   ::^   v        |  0        |
    pcmpgtd %xmm4, %xmm7                           // |  5     :  ::::      |  4   ::v  ^         |  0        |
    pand    %xmm2, %xmm6                           // |  5     :  ::::      |  3   v:  ^          |  0        |
    paddd   %xmm6, %xmm0                           // |  5     :  ::::      |  3 ^  :  v          |  0        |
    pand    %xmm3, %xmm7                           // |  5     :  ::::      |  2    v   ^         |  0        |
    paddd   %xmm7, %xmm1                           // |  5     :  ::::      |  2  ^     v         |  0        |
.LBB0_10:                                          // |                     |                     |           |
    paddd   %xmm1, %xmm0                           // |  5     :  ::::      |  2 ^v               |  0        |
    pshufd  $238, %xmm0, %xmm1                     // |  5     :  ::::      |  1 :                |  0        |
    paddd   %xmm0, %xmm1                           // |  5     :  ::::      |  2 v^               |  0        |
    pshufd  $85, %xmm1, %xmm0                      // |  5     :  ::::      |  1  :               |  0        |
    paddd   %xmm1, %xmm0                           // |  5     :  ::::      |  2 ^v               |  0        |
    movd    %xmm0, %eax                            // |  6 ^   :  ::::      |  1 v                |  0        |
    cmpq    %r10, %rsi                             // |  6 :   v  :::v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                   // |  6 :   :  ::::      |  0                  |  1  v     |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_11:                                          // |                     |                     |           |
    movl    (%rdi,%rsi,4), %edx                    // |  8 :  ^vv ::::      |  0                  |  0        |
    leal    99(%rdx), %ecx                         // |  8 : ^v:  ::::      |  0                  |  0        |
    cmpl    $199, %ecx                             // |  7 : v :  ::::      |  0                  |  6 ^^^^^^ |
    cmovael %r9d, %edx                             // |  7 :  ^:  ::v:      |  0                  |  0        |
    addl    %edx, %eax                             // |  6 x  v:  :: :      |  0                  |  6 ^^^^^^ |
    incq    %rsi                                   // |  4     x  :: :      |  0                  |  5  ^^^^^ |
    cmpq    %rsi, %r10                             // |  4     v  :: v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                   // |  2        ::        |  0                  |  1  v     |
.LBB0_12:                                          // |                     |                     |           |
    retq                                           // |  2        x:        |  0                  |  0        |
.LBB0_5:                                           // |                     |                     |           |
    pxor    %xmm0, %xmm0                           // |  1         :        |  1 ^                |  0        |
    xorl    %eax, %eax                             // |  2 ^       :        |  0                  |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                           // |  1         :        |  1  ^               |  0        |
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
