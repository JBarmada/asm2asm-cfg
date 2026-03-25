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
    .long   1321528399                             // |                     |                     |           |
    .long   1321528399                             // |                     |                     |           |
    .long   1321528399                             // |                     |                     |           |
    .long   1321528399                             // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .long   26                                     // |                     |                     |           |
    .long   26                                     // |                     |                     |           |
    .long   26                                     // |                     |                     |           |
    .long   26                                     // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .byte   255                                    // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   255                                    // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   255                                    // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   255                                    // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .zero   16,97                                  // |                     |                     |           |
.LCPI0_4:                                          // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .byte   97                                     // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    pushq   %rbp                                   // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    pushq   %rbx                                   // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    pushq   %rax                                   // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    .cfi_offset %rbx, -24                          // |                     |                     |           |
    .cfi_offset %rbp, -16                          // |                     |                     |           |
    movl    %esi, %ebp                             // |  3     v ^:         |  0                  |  0        |
    movq    %rdi, %rbx                             // |  4  ^   v::         |  0                  |  0        |
    callq   strlen@PLT                             // |  3  :    :x         |  0                  |  0        |
    testq   %rax, %rax                             // |  4 v:    ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                   // |  3  :    ::         |  0                  |  1  v     |
    xorl    %ecx, %ecx                             // |  4  :^   ::         |  0                  |  5 ^^^^^  |
    testl   %ebp, %ebp                             // |  4  ::   v:         |  0                  |  6 ^^^^^^ |
    sete    %cl                                    // |  3  :x    :         |  0                  |  1  v     |
    shll    $4, %ecx                               // |  3  :x    :         |  0                  |  5 ^^^^^  |
    orl $-92, %ecx                                 // |  3  :x    :         |  0                  |  5 ^^^^^  |
    cmpq    $8, %rax                               // |  4 v::    :         |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                    // |  3  ::    :         |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  4  ::^   :         |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                    // |  3  ::    :         |  0                  |  0        |
.LBB0_4:                                           // |                     |                     |           |
    movd    %ecx, %xmm8                            // |  3  :v    :         |  1         ^        |  0        |
    cmpq    $16, %rax                              // |  4 v::    :         |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                    // |  3  ::    :         |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  4  ::^   :         |  0                  |  5 ^^^^^  |
.LBB0_14:                                          // |                     |                     |           |
    movq    %rdx, %rsi                             // |  5  ::v^  :         |  0                  |  0        |
    movq    %rax, %rdx                             // |  6 v::^:  :         |  0                  |  0        |
    andq    $-8, %rdx                              // |  5  ::x:  :         |  0                  |  5 ^^^^^  |
    pshufd  $0, %xmm8, %xmm0                       // |  5  ::::  :         |  0                  |  0        |
    movdqa  .LCPI0_0(%rip), %xmm1                  // |  5  ::::  :         |  1  ^               |  0        |
    movdqa  .LCPI0_1(%rip), %xmm2                  // |  5  ::::  :         |  2  :^              |  0        |
    movdqa  .LCPI0_2(%rip), %xmm3                  // |  5  ::::  :         |  3  ::^             |  0        |
    movdqa  .LCPI0_4(%rip), %xmm8                  // |  5  ::::  :         |  4  :::    ^        |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_15:                                          // |                     |                     |           |
    movq    (%rbx,%rsi), %xmm5                     // |  5  v::v  :         |  5  ::: ^  :        |  0        |
    punpcklbw   %xmm5, %xmm6                       // |  5  ::::  :         |  6  ::: v^ :        |  0        |
    punpcklwd   %xmm6, %xmm5                       // |  5  ::::  :         |  6  ::: ^v :        |  0        |
    psrad   $24, %xmm5                             // |  5  ::::  :         |  5  ::: ^  :        |  0        |
    punpckhwd   %xmm6, %xmm6                       // |  5  ::::  :         |  5  :::  ^ :        |  0        |
    psrad   $24, %xmm6                             // |  5  ::::  :         |  5  :::  ^ :        |  0        |
    paddd   %xmm0, %xmm6                           // |  5  ::::  :         |  6 v:::  ^ :        |  0        |
    paddd   %xmm0, %xmm5                           // |  5  ::::  :         |  7 v::: ^: :        |  0        |
    movdqa  %xmm5, %xmm7                           // |  5  ::::  :         |  7  ::: v:^:        |  0        |
    pmuludq %xmm1, %xmm7                           // |  5  ::::  :         |  7  v:: ::^:        |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  5  ::::  :         |  6  ::: :: :        |  0        |
    pshufd  $245, %xmm5, %xmm4                     // |  5  ::::  :         |  6  ::: :: :        |  0        |
    pmuludq %xmm1, %xmm4                           // |  5  ::::  :         |  7  v::^:: :        |  0        |
    pshufd  $237, %xmm4, %xmm4                     // |  5  ::::  :         |  7  :::::: :        |  0        |
    punpckldq   %xmm4, %xmm7                       // |  5  ::::  :         |  8  :::v::^:        |  0        |
    pxor    %xmm4, %xmm4                           // |  5  ::::  :         |  7  :::^:: :        |  0        |
    pcmpgtd %xmm5, %xmm4                           // |  5  ::::  :         |  7  :::^v: :        |  0        |
    pand    %xmm1, %xmm4                           // |  5  ::::  :         |  6  v::^ : :        |  0        |
    psubd   %xmm4, %xmm7                           // |  5  ::::  :         |  7  :::v :^:        |  0        |
    movdqa  %xmm7, %xmm4                           // |  5  ::::  :         |  7  :::^ :v:        |  0        |
    psrld   $31, %xmm4                             // |  5  ::::  :         |  6  :::^ : :        |  0        |
    psrld   $3, %xmm7                              // |  5  ::::  :         |  7  :::: :^:        |  0        |
    paddd   %xmm4, %xmm7                           // |  5  ::::  :         |  7  :::v :^:        |  0        |
    pshufd  $245, %xmm7, %xmm4                     // |  5  ::::  :         |  5  :::  : :        |  0        |
    pmuludq %xmm2, %xmm7                           // |  5  ::::  :         |  6  :v:  :^:        |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  5  ::::  :         |  5  :::  : :        |  0        |
    pmuludq %xmm2, %xmm4                           // |  5  ::::  :         |  6  :v:^ : :        |  0        |
    pshufd  $232, %xmm4, %xmm4                     // |  5  ::::  :         |  6  :::: : :        |  0        |
    punpckldq   %xmm4, %xmm7                       // |  5  ::::  :         |  7  :::v :^:        |  0        |
    psubd   %xmm7, %xmm5                           // |  5  ::::  :         |  7  ::: ^:v:        |  0        |
    movdqa  %xmm6, %xmm4                           // |  5  ::::  :         |  6  :::^ v :        |  0        |
    pmuludq %xmm1, %xmm4                           // |  5  ::::  :         |  6  v::^ : :        |  0        |
    pshufd  $237, %xmm4, %xmm4                     // |  5  ::::  :         |  5  :::  : :        |  0        |
    pshufd  $245, %xmm6, %xmm7                     // |  5  ::::  :         |  5  :::  : :        |  0        |
    pmuludq %xmm1, %xmm7                           // |  5  ::::  :         |  6  v::  :^:        |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  5  ::::  :         |  6  :::  :::        |  0        |
    punpckldq   %xmm7, %xmm4                       // |  5  ::::  :         |  7  :::^ :v:        |  0        |
    pxor    %xmm7, %xmm7                           // |  5  ::::  :         |  6  :::  :^:        |  0        |
    pcmpgtd %xmm6, %xmm7                           // |  5  ::::  :         |  6  :::  v^:        |  0        |
    pand    %xmm1, %xmm7                           // |  5  ::::  :         |  5  v::   ^:        |  0        |
    psubd   %xmm7, %xmm4                           // |  5  ::::  :         |  5   ::^  v:        |  0        |
    movdqa  %xmm4, %xmm7                           // |  5  ::::  :         |  5   ::v  ^:        |  0        |
    psrld   $31, %xmm7                             // |  5  ::::  :         |  4   ::   ^:        |  0        |
    psrld   $3, %xmm4                              // |  5  ::::  :         |  5   ::^  ::        |  0        |
    paddd   %xmm7, %xmm4                           // |  5  ::::  :         |  5   ::^  v:        |  0        |
    pshufd  $245, %xmm4, %xmm7                     // |  5  ::::  :         |  3   ::    :        |  0        |
    pmuludq %xmm2, %xmm4                           // |  5  ::::  :         |  4   v:^   :        |  0        |
    pshufd  $232, %xmm4, %xmm4                     // |  5  ::::  :         |  3   ::    :        |  0        |
    pmuludq %xmm2, %xmm7                           // |  5  ::::  :         |  4   v:   ^:        |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  5  ::::  :         |  3    :   ::        |  0        |
    punpckldq   %xmm7, %xmm4                       // |  5  ::::  :         |  4    :^  v:        |  0        |
    psubd   %xmm4, %xmm6                           // |  5  ::::  :         |  4    :v ^ :        |  0        |
    pand    %xmm3, %xmm6                           // |  5  ::::  :         |  3    v  ^ :        |  0        |
    pand    %xmm3, %xmm5                           // |  5  ::::  :         |  4    v ^: :        |  0        |
    packuswb    %xmm6, %xmm5                       // |  5  ::::  :         |  3      ^v :        |  0        |
    packuswb    %xmm5, %xmm5                       // |  5  ::::  :         |  2      ^  :        |  0        |
    paddb   %xmm8, %xmm5                           // |  5  ::::  :         |  2      ^  v        |  0        |
    movq    %xmm5, (%rbx,%rsi)                     // |  5  v::v  :         |  1      v           |  0        |
    addq    $8, %rsi                               // |  5  :::x  :         |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                             // |  5  ::vv  :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                   // |  3  ::    :         |  0                  |  1  v     |
    jmp .LBB0_16                                   // |  3  ::    :         |  0                  |  0        |
.LBB0_6:                                           // |                     |                     |           |
    movq    %rax, %rdx                             // |  5 v::^   :         |  0                  |  0        |
    andq    $-16, %rdx                             // |  4  ::x   :         |  0                  |  5 ^^^^^  |
    pshufd  $0, %xmm8, %xmm12                      // |  4  :::   :         |  0                  |  0        |
    leaq    -16(%rdx), %rsi                        // |  5  ::v^  :         |  0                  |  0        |
    movq    %rsi, %rbp                             // |  6  :::v ^:         |  0                  |  0        |
    shrq    $4, %rbp                               // |  6  :::: x:         |  0                  |  5 ^^^^^  |
    incq    %rbp                                   // |  6  :::: x:         |  0                  |  5  ^^^^^ |
    testq   %rsi, %rsi                             // |  6  :::v ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                    // |  5  :::  ::         |  0                  |  1  v     |
    movq    %rbp, %rdi                             // |  6  ::: ^v:         |  0                  |  0        |
    andq    $-2, %rdi                              // |  6  ::: x::         |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                             // |  7  :::^:::         |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm2                  // |  7  :::::::         |  1   ^              |  0        |
    movdqa  .LCPI0_1(%rip), %xmm3                  // |  7  :::::::         |  2   :^             |  0        |
    movdqa  .LCPI0_2(%rip), %xmm10                 // |  7  :::::::         |  3   ::      ^      |  0        |
    movdqa  .LCPI0_3(%rip), %xmm9                  // |  7  :::::::         |  4   ::     ^:      |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_9:                                           // |                     |                     |           |
    movdqu  (%rbx,%rsi), %xmm4                     // |  7  v::v:::         |  5   ::^    ::      |  0        |
    movdqu  16(%rbx,%rsi), %xmm11                  // |  7  v::v:::         |  6   :::    ::^     |  0        |
    punpcklbw   %xmm4, %xmm0                       // |  7  :::::::         |  7 ^ ::v    :::     |  0        |
    punpcklwd   %xmm0, %xmm6                       // |  7  :::::::         |  7 v ::  ^  :::     |  0        |
    psrad   $24, %xmm6                             // |  7  :::::::         |  6   ::  ^  :::     |  0        |
    punpckhwd   %xmm0, %xmm0                       // |  7  :::::::         |  6 ^ ::     :::     |  0        |
    psrad   $24, %xmm0                             // |  7  :::::::         |  6 ^ ::     :::     |  0        |
    punpckhbw   %xmm4, %xmm4                       // |  7  :::::::         |  6   ::^    :::     |  0        |
    punpcklwd   %xmm4, %xmm5                       // |  7  :::::::         |  7   ::v^   :::     |  0        |
    psrad   $24, %xmm5                             // |  7  :::::::         |  6   :: ^   :::     |  0        |
    punpckhwd   %xmm4, %xmm4                       // |  7  :::::::         |  6   ::^    :::     |  0        |
    psrad   $24, %xmm4                             // |  7  :::::::         |  6   ::^    :::     |  0        |
    paddd   %xmm12, %xmm4                          // |  7  :::::::         |  7   ::^    :::v    |  0        |
    paddd   %xmm12, %xmm5                          // |  7  :::::::         |  8   :::^   :::v    |  0        |
    paddd   %xmm12, %xmm0                          // |  7  :::::::         |  9 ^ ::::   :::v    |  0        |
    paddd   %xmm12, %xmm6                          // |  7  :::::::         | 10 : ::::^  :::v    |  0        |
    movdqa  %xmm6, %xmm7                           // |  7  :::::::         | 10 : ::::v^ :::     |  0        |
    pmuludq %xmm2, %xmm7                           // |  7  :::::::         | 10 : v::::^ :::     |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  9 : :::::  :::     |  0        |
    pshufd  $245, %xmm6, %xmm1                     // |  7  :::::::         |  9 : :::::  :::     |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         | 10 :^v::::  :::     |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         | 10 :::::::  :::     |  0        |
    punpckldq   %xmm1, %xmm7                       // |  7  :::::::         | 11 :v:::::^ :::     |  0        |
    pxor    %xmm1, %xmm1                           // |  7  :::::::         | 10 :^:::::  :::     |  0        |
    pcmpgtd %xmm6, %xmm1                           // |  7  :::::::         | 10 :^::::v  :::     |  0        |
    pand    %xmm2, %xmm1                           // |  7  :::::::         |  9 :^v:::   :::     |  0        |
    psubd   %xmm1, %xmm7                           // |  7  :::::::         | 10 :v:::: ^ :::     |  0        |
    movdqa  %xmm7, %xmm1                           // |  7  :::::::         | 10 :^:::: v :::     |  0        |
    psrld   $31, %xmm1                             // |  7  :::::::         |  9 :^::::   :::     |  0        |
    psrld   $3, %xmm7                              // |  7  :::::::         | 10 :::::: ^ :::     |  0        |
    paddd   %xmm1, %xmm7                           // |  7  :::::::         | 10 :v:::: ^ :::     |  0        |
    pshufd  $245, %xmm7, %xmm1                     // |  7  :::::::         |  8 : ::::   :::     |  0        |
    pmuludq %xmm3, %xmm7                           // |  7  :::::::         |  9 : :v:: ^ :::     |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  8 : ::::   :::     |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  9 :^:v::   :::     |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  9 ::::::   :::     |  0        |
    punpckldq   %xmm1, %xmm7                       // |  7  :::::::         | 10 :v:::: ^ :::     |  0        |
    psubd   %xmm7, %xmm6                           // |  7  :::::::         | 10 : ::::^v :::     |  0        |
    movdqa  %xmm0, %xmm1                           // |  7  :::::::         |  9 v^::::   :::     |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  9 :^v:::   :::     |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  8 : ::::   :::     |  0        |
    pshufd  $245, %xmm0, %xmm7                     // |  7  :::::::         |  8 : ::::   :::     |  0        |
    pmuludq %xmm2, %xmm7                           // |  7  :::::::         |  9 : v::: ^ :::     |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  9 : :::: : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         | 10 :^:::: v :::     |  0        |
    pxor    %xmm7, %xmm7                           // |  7  :::::::         |  9 : :::: ^ :::     |  0        |
    pcmpgtd %xmm0, %xmm7                           // |  7  :::::::         |  9 v :::: ^ :::     |  0        |
    pand    %xmm2, %xmm7                           // |  7  :::::::         |  8   v::: ^ :::     |  0        |
    psubd   %xmm7, %xmm1                           // |  7  :::::::         |  9  ^:::: v :::     |  0        |
    movdqa  %xmm1, %xmm7                           // |  7  :::::::         |  9  v:::: ^ :::     |  0        |
    psrld   $31, %xmm7                             // |  7  :::::::         |  8   :::: ^ :::     |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  9  ^:::: : :::     |  0        |
    paddd   %xmm7, %xmm1                           // |  7  :::::::         |  9  ^:::: v :::     |  0        |
    pshufd  $245, %xmm1, %xmm7                     // |  7  :::::::         |  7   ::::   :::     |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  8  ^:v::   :::     |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  7   ::::   :::     |  0        |
    pmuludq %xmm3, %xmm7                           // |  7  :::::::         |  8   :v:: ^ :::     |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  8   :::: : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         |  9  ^:::: v :::     |  0        |
    psubd   %xmm1, %xmm0                           // |  7  :::::::         |  9 ^v::::   :::     |  0        |
    movdqa  %xmm5, %xmm1                           // |  7  :::::::         |  8  ^:::v   :::     |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  8  ^v:::   :::     |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  7   ::::   :::     |  0        |
    pshufd  $245, %xmm5, %xmm7                     // |  7  :::::::         |  7   ::::   :::     |  0        |
    pmuludq %xmm2, %xmm7                           // |  7  :::::::         |  8   v::: ^ :::     |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  8   :::: : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         |  9  ^:::: v :::     |  0        |
    pxor    %xmm7, %xmm7                           // |  7  :::::::         |  8   :::: ^ :::     |  0        |
    pcmpgtd %xmm5, %xmm7                           // |  7  :::::::         |  8   :::v ^ :::     |  0        |
    pand    %xmm2, %xmm7                           // |  7  :::::::         |  7   v::  ^ :::     |  0        |
    psubd   %xmm7, %xmm1                           // |  7  :::::::         |  8  ^:::  v :::     |  0        |
    movdqa  %xmm1, %xmm7                           // |  7  :::::::         |  8  v:::  ^ :::     |  0        |
    psrld   $31, %xmm7                             // |  7  :::::::         |  7   :::  ^ :::     |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  8  ^:::  : :::     |  0        |
    paddd   %xmm7, %xmm1                           // |  7  :::::::         |  8  ^:::  v :::     |  0        |
    pshufd  $245, %xmm1, %xmm7                     // |  7  :::::::         |  6   :::    :::     |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  7  ^:v:    :::     |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  6   :::    :::     |  0        |
    pmuludq %xmm3, %xmm7                           // |  7  :::::::         |  7   :v:  ^ :::     |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  7   :::  : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         |  8  ^:::  v :::     |  0        |
    psubd   %xmm1, %xmm5                           // |  7  :::::::         |  8  v:::^   :::     |  0        |
    movdqa  %xmm4, %xmm1                           // |  7  :::::::         |  7  ^::v    :::     |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  7  ^v::    :::     |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  6   :::    :::     |  0        |
    pshufd  $245, %xmm4, %xmm7                     // |  7  :::::::         |  6   :::    :::     |  0        |
    pmuludq %xmm2, %xmm7                           // |  7  :::::::         |  7   v::  ^ :::     |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  7   :::  : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         |  8  ^:::  v :::     |  0        |
    pxor    %xmm7, %xmm7                           // |  7  :::::::         |  7   :::  ^ :::     |  0        |
    pcmpgtd %xmm4, %xmm7                           // |  7  :::::::         |  7   ::v  ^ :::     |  0        |
    pand    %xmm2, %xmm7                           // |  7  :::::::         |  6   v:   ^ :::     |  0        |
    psubd   %xmm7, %xmm1                           // |  7  :::::::         |  7  ^::   v :::     |  0        |
    movdqa  %xmm1, %xmm7                           // |  7  :::::::         |  7  v::   ^ :::     |  0        |
    psrld   $31, %xmm7                             // |  7  :::::::         |  6   ::   ^ :::     |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  7  ^::   : :::     |  0        |
    paddd   %xmm7, %xmm1                           // |  7  :::::::         |  7  ^::   v :::     |  0        |
    pshufd  $245, %xmm1, %xmm7                     // |  7  :::::::         |  5   ::     :::     |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  6  ^:v     :::     |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  5   ::     :::     |  0        |
    pmuludq %xmm3, %xmm7                           // |  7  :::::::         |  6   :v   ^ :::     |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  6   ::   : :::     |  0        |
    punpckldq   %xmm7, %xmm1                       // |  7  :::::::         |  7  ^::   v :::     |  0        |
    psubd   %xmm1, %xmm4                           // |  7  :::::::         |  7  v::^    :::     |  0        |
    pand    %xmm10, %xmm4                          // |  7  :::::::         |  6   ::^    :v:     |  0        |
    pand    %xmm10, %xmm5                          // |  7  :::::::         |  7   :::^   :v:     |  0        |
    packuswb    %xmm4, %xmm5                       // |  7  :::::::         |  7   ::v^   :::     |  0        |
    pand    %xmm10, %xmm0                          // |  7  :::::::         |  7 ^ :: :   :v:     |  0        |
    pand    %xmm10, %xmm6                          // |  7  :::::::         |  8 : :: :^  :v:     |  0        |
    packuswb    %xmm0, %xmm6                       // |  7  :::::::         |  8 v :: :^  :::     |  0        |
    packuswb    %xmm5, %xmm6                       // |  7  :::::::         |  7   :: v^  :::     |  0        |
    paddb   %xmm9, %xmm6                           // |  7  :::::::         |  6   ::  ^  v::     |  0        |
    movdqu  %xmm6, (%rbx,%rsi)                     // |  7  v::v:::         |  6   ::  v  :::     |  0        |
    punpcklbw   %xmm11, %xmm0                      // |  7  :::::::         |  6 ^ ::     ::v     |  0        |
    punpcklwd   %xmm0, %xmm7                       // |  7  :::::::         |  7 v ::   ^ :::     |  0        |
    psrad   $24, %xmm7                             // |  7  :::::::         |  6   ::   ^ :::     |  0        |
    punpckhwd   %xmm0, %xmm0                       // |  7  :::::::         |  6 ^ ::     :::     |  0        |
    psrad   $24, %xmm0                             // |  7  :::::::         |  6 ^ ::     :::     |  0        |
    punpckhbw   %xmm11, %xmm1                      // |  7  :::::::         |  6  ^::     ::v     |  0        |
    punpcklwd   %xmm1, %xmm5                       // |  7  :::::::         |  6  v:: ^   ::      |  0        |
    psrad   $24, %xmm5                             // |  7  :::::::         |  6  ::: ^   ::      |  0        |
    punpckhwd   %xmm1, %xmm4                       // |  7  :::::::         |  6  v::^    ::      |  0        |
    psrad   $24, %xmm4                             // |  7  :::::::         |  5   ::^    ::      |  0        |
    paddd   %xmm12, %xmm4                          // |  7  :::::::         |  6   ::^    :: v    |  0        |
    paddd   %xmm12, %xmm5                          // |  7  :::::::         |  7   :::^   :: v    |  0        |
    paddd   %xmm12, %xmm0                          // |  7  :::::::         |  8 ^ ::::   :: v    |  0        |
    paddd   %xmm12, %xmm7                          // |  7  :::::::         |  9 : :::: ^ :: v    |  0        |
    movdqa  %xmm7, %xmm1                           // |  7  :::::::         |  9 :^:::: v ::      |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  9 :^v::: : ::      |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  8 : :::: : ::      |  0        |
    pshufd  $245, %xmm7, %xmm6                     // |  7  :::::::         |  8 : :::: : ::      |  0        |
    pmuludq %xmm2, %xmm6                           // |  7  :::::::         |  9 : v:::^: ::      |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  9 : :::::: ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         | 10 :^::::v: ::      |  0        |
    pxor    %xmm6, %xmm6                           // |  7  :::::::         |  9 : ::::^: ::      |  0        |
    pcmpgtd %xmm7, %xmm6                           // |  7  :::::::         |  9 : ::::^v ::      |  0        |
    pand    %xmm2, %xmm6                           // |  7  :::::::         |  8 : v:::^  ::      |  0        |
    psubd   %xmm6, %xmm1                           // |  7  :::::::         |  9 :^::::v  ::      |  0        |
    movdqa  %xmm1, %xmm6                           // |  7  :::::::         |  9 :v::::^  ::      |  0        |
    psrld   $31, %xmm6                             // |  7  :::::::         |  8 : ::::^  ::      |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  9 :^:::::  ::      |  0        |
    paddd   %xmm6, %xmm1                           // |  7  :::::::         |  9 :^::::v  ::      |  0        |
    pshufd  $245, %xmm1, %xmm6                     // |  7  :::::::         |  7 : ::::   ::      |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  8 :^:v::   ::      |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  7 : ::::   ::      |  0        |
    pmuludq %xmm3, %xmm6                           // |  7  :::::::         |  8 : :v::^  ::      |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  8 : :::::  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  9 :^::::v  ::      |  0        |
    psubd   %xmm1, %xmm7                           // |  7  :::::::         |  9 :v:::: ^ ::      |  0        |
    movdqa  %xmm0, %xmm1                           // |  7  :::::::         |  8 v^::::   ::      |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  8 :^v:::   ::      |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  7 : ::::   ::      |  0        |
    pshufd  $245, %xmm0, %xmm6                     // |  7  :::::::         |  7 : ::::   ::      |  0        |
    pmuludq %xmm2, %xmm6                           // |  7  :::::::         |  8 : v:::^  ::      |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  8 : :::::  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  9 :^::::v  ::      |  0        |
    pxor    %xmm6, %xmm6                           // |  7  :::::::         |  8 : ::::^  ::      |  0        |
    pcmpgtd %xmm0, %xmm6                           // |  7  :::::::         |  8 v ::::^  ::      |  0        |
    pand    %xmm2, %xmm6                           // |  7  :::::::         |  7   v:::^  ::      |  0        |
    psubd   %xmm6, %xmm1                           // |  7  :::::::         |  8  ^::::v  ::      |  0        |
    movdqa  %xmm1, %xmm6                           // |  7  :::::::         |  8  v::::^  ::      |  0        |
    psrld   $31, %xmm6                             // |  7  :::::::         |  7   ::::^  ::      |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  8  ^:::::  ::      |  0        |
    paddd   %xmm6, %xmm1                           // |  7  :::::::         |  8  ^::::v  ::      |  0        |
    pshufd  $245, %xmm1, %xmm6                     // |  7  :::::::         |  6   ::::   ::      |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  7  ^:v::   ::      |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  6   ::::   ::      |  0        |
    pmuludq %xmm3, %xmm6                           // |  7  :::::::         |  7   :v::^  ::      |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  7   :::::  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  8  ^::::v  ::      |  0        |
    psubd   %xmm1, %xmm0                           // |  7  :::::::         |  8 ^v::::   ::      |  0        |
    movdqa  %xmm5, %xmm1                           // |  7  :::::::         |  7  ^:::v   ::      |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  7  ^v:::   ::      |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  6   ::::   ::      |  0        |
    pshufd  $245, %xmm5, %xmm6                     // |  7  :::::::         |  6   ::::   ::      |  0        |
    pmuludq %xmm2, %xmm6                           // |  7  :::::::         |  7   v:::^  ::      |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  7   :::::  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  8  ^::::v  ::      |  0        |
    pxor    %xmm6, %xmm6                           // |  7  :::::::         |  7   ::::^  ::      |  0        |
    pcmpgtd %xmm5, %xmm6                           // |  7  :::::::         |  7   :::v^  ::      |  0        |
    pand    %xmm2, %xmm6                           // |  7  :::::::         |  6   v:: ^  ::      |  0        |
    psubd   %xmm6, %xmm1                           // |  7  :::::::         |  7  ^::: v  ::      |  0        |
    movdqa  %xmm1, %xmm6                           // |  7  :::::::         |  7  v::: ^  ::      |  0        |
    psrld   $31, %xmm6                             // |  7  :::::::         |  6   ::: ^  ::      |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  7  ^::: :  ::      |  0        |
    paddd   %xmm6, %xmm1                           // |  7  :::::::         |  7  ^::: v  ::      |  0        |
    pshufd  $245, %xmm1, %xmm6                     // |  7  :::::::         |  5   :::    ::      |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  6  ^:v:    ::      |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  5   :::    ::      |  0        |
    pmuludq %xmm3, %xmm6                           // |  7  :::::::         |  6   :v: ^  ::      |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  6   ::: :  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  7  ^::: v  ::      |  0        |
    psubd   %xmm1, %xmm5                           // |  7  :::::::         |  7  v:::^   ::      |  0        |
    movdqa  %xmm4, %xmm1                           // |  7  :::::::         |  6  ^::v    ::      |  0        |
    pmuludq %xmm2, %xmm1                           // |  7  :::::::         |  6  ^v::    ::      |  0        |
    pshufd  $237, %xmm1, %xmm1                     // |  7  :::::::         |  5   :::    ::      |  0        |
    pshufd  $245, %xmm4, %xmm6                     // |  7  :::::::         |  5   :::    ::      |  0        |
    pmuludq %xmm2, %xmm6                           // |  7  :::::::         |  6   v:: ^  ::      |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  6   ::: :  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  7  ^::: v  ::      |  0        |
    pxor    %xmm6, %xmm6                           // |  7  :::::::         |  6   ::: ^  ::      |  0        |
    pcmpgtd %xmm4, %xmm6                           // |  7  :::::::         |  6   ::v ^  ::      |  0        |
    pand    %xmm2, %xmm6                           // |  7  :::::::         |  5   v:  ^  ::      |  0        |
    psubd   %xmm6, %xmm1                           // |  7  :::::::         |  5  ^ :  v  ::      |  0        |
    movdqa  %xmm1, %xmm6                           // |  7  :::::::         |  5  v :  ^  ::      |  0        |
    psrld   $31, %xmm6                             // |  7  :::::::         |  4    :  ^  ::      |  0        |
    psrld   $3, %xmm1                              // |  7  :::::::         |  5  ^ :  :  ::      |  0        |
    paddd   %xmm6, %xmm1                           // |  7  :::::::         |  5  ^ :  v  ::      |  0        |
    pshufd  $245, %xmm1, %xmm6                     // |  7  :::::::         |  3    :     ::      |  0        |
    pmuludq %xmm3, %xmm1                           // |  7  :::::::         |  4  ^ v     ::      |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  3    :     ::      |  0        |
    pmuludq %xmm3, %xmm6                           // |  7  :::::::         |  4    v  ^  ::      |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  3       :  ::      |  0        |
    punpckldq   %xmm6, %xmm1                       // |  7  :::::::         |  4  ^    v  ::      |  0        |
    psubd   %xmm1, %xmm4                           // |  7  :::::::         |  4  v  ^    ::      |  0        |
    pand    %xmm10, %xmm4                          // |  7  :::::::         |  3     ^    :v      |  0        |
    pand    %xmm10, %xmm5                          // |  7  :::::::         |  4     :^   :v      |  0        |
    packuswb    %xmm4, %xmm5                       // |  7  :::::::         |  4     v^   ::      |  0        |
    pand    %xmm10, %xmm0                          // |  7  :::::::         |  4 ^    :   :v      |  0        |
    pand    %xmm10, %xmm7                          // |  7  :::::::         |  5 :    : ^ :v      |  0        |
    packuswb    %xmm0, %xmm7                       // |  7  :::::::         |  4 v    : ^ :       |  0        |
    packuswb    %xmm5, %xmm7                       // |  7  :::::::         |  3      v ^ :       |  0        |
    paddb   %xmm9, %xmm7                           // |  7  :::::::         |  2        ^ v       |  0        |
    movdqu  %xmm7, 16(%rbx,%rsi)                   // |  7  v::v:::         |  1        v         |  0        |
    addq    $32, %rsi                              // |  7  :::x:::         |  0                  |  6 ^^^^^^ |
    addq    $-2, %rdi                              // |  7  ::::x::         |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                    // |  7  :::::::         |  0                  |  1  v     |
    testb   $1, %bpl                               // |  7  :::::v:         |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                   // |  7  :::::::         |  0                  |  1  v     |
.LBB0_11:                                          // |                     |                     |           |
    movdqu  (%rbx,%rsi), %xmm0                     // |  7  v::v:::         |  1 ^                |  0        |
    punpcklbw   %xmm0, %xmm1                       // |  7  :::::::         |  2 v^               |  0        |
    punpcklwd   %xmm1, %xmm2                       // |  7  :::::::         |  2  v^              |  0        |
    psrad   $24, %xmm2                             // |  7  :::::::         |  2  :^              |  0        |
    punpckhwd   %xmm1, %xmm3                       // |  7  :::::::         |  2  v ^             |  0        |
    psrad   $24, %xmm3                             // |  7  :::::::         |  1    ^             |  0        |
    punpckhbw   %xmm0, %xmm0                       // |  7  :::::::         |  1 ^                |  0        |
    punpcklwd   %xmm0, %xmm4                       // |  7  :::::::         |  2 v   ^            |  0        |
    psrad   $24, %xmm4                             // |  7  :::::::         |  1     ^            |  0        |
    punpckhwd   %xmm0, %xmm0                       // |  7  :::::::         |  1 ^                |  0        |
    psrad   $24, %xmm0                             // |  7  :::::::         |  1 ^                |  0        |
    paddd   %xmm12, %xmm0                          // |  7  :::::::         |  2 ^           v    |  0        |
    paddd   %xmm12, %xmm4                          // |  7  :::::::         |  3 :   ^       v    |  0        |
    paddd   %xmm12, %xmm3                          // |  7  :::::::         |  4 :  ^:       v    |  0        |
    paddd   %xmm12, %xmm2                          // |  7  :::::::         |  5 : ^::       v    |  0        |
    movdqa  .LCPI0_0(%rip), %xmm1                  // |  7  :::::::         |  5 :^:::            |  0        |
    movdqa  %xmm2, %xmm5                           // |  7  :::::::         |  6 ::v::^           |  0        |
    pmuludq %xmm1, %xmm5                           // |  7  :::::::         |  6 :v:::^           |  0        |
    pshufd  $237, %xmm5, %xmm7                     // |  7  :::::::         |  5 :::::            |  0        |
    pshufd  $245, %xmm2, %xmm5                     // |  7  :::::::         |  5 :::::            |  0        |
    pmuludq %xmm1, %xmm5                           // |  7  :::::::         |  6 :v:::^           |  0        |
    pshufd  $237, %xmm5, %xmm5                     // |  7  :::::::         |  6 ::::::           |  0        |
    punpckldq   %xmm5, %xmm7                       // |  7  :::::::         |  7 :::::v ^         |  0        |
    pxor    %xmm5, %xmm5                           // |  7  :::::::         |  6 :::::^           |  0        |
    pxor    %xmm6, %xmm6                           // |  7  :::::::         |  6 ::::: ^          |  0        |
    pcmpgtd %xmm2, %xmm6                           // |  7  :::::::         |  6 ::v:: ^          |  0        |
    pand    %xmm1, %xmm6                           // |  7  :::::::         |  5 :v :: ^          |  0        |
    psubd   %xmm6, %xmm7                           // |  7  :::::::         |  6 :: :: v^         |  0        |
    movdqa  %xmm7, %xmm6                           // |  7  :::::::         |  6 :: :: ^v         |  0        |
    psrld   $31, %xmm6                             // |  7  :::::::         |  5 :: :: ^          |  0        |
    psrld   $3, %xmm7                              // |  7  :::::::         |  6 :: :: :^         |  0        |
    paddd   %xmm6, %xmm7                           // |  7  :::::::         |  6 :: :: v^         |  0        |
    movdqa  .LCPI0_1(%rip), %xmm9                  // |  7  :::::::         |  5 :: ::    ^       |  0        |
    pshufd  $245, %xmm7, %xmm6                     // |  7  :::::::         |  5 :: ::    :       |  0        |
    pmuludq %xmm9, %xmm7                           // |  7  :::::::         |  6 :: ::  ^ v       |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  5 :: ::    :       |  0        |
    pmuludq %xmm9, %xmm6                           // |  7  :::::::         |  6 :: :: ^  v       |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  6 :: :: :  :       |  0        |
    punpckldq   %xmm6, %xmm7                       // |  7  :::::::         |  7 :: :: v^ :       |  0        |
    psubd   %xmm7, %xmm2                           // |  7  :::::::         |  7 ::^::  v :       |  0        |
    movdqa  %xmm3, %xmm6                           // |  7  :::::::         |  6 :: v: ^  :       |  0        |
    pmuludq %xmm1, %xmm6                           // |  7  :::::::         |  6 :v :: ^  :       |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  5 :: ::    :       |  0        |
    pshufd  $245, %xmm3, %xmm7                     // |  7  :::::::         |  5 :: ::    :       |  0        |
    pmuludq %xmm1, %xmm7                           // |  7  :::::::         |  6 :v ::  ^ :       |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  6 :: ::  : :       |  0        |
    punpckldq   %xmm7, %xmm6                       // |  7  :::::::         |  7 :: :: ^v :       |  0        |
    pxor    %xmm7, %xmm7                           // |  7  :::::::         |  6 :: ::  ^ :       |  0        |
    pcmpgtd %xmm3, %xmm7                           // |  7  :::::::         |  6 :: v:  ^ :       |  0        |
    pand    %xmm1, %xmm7                           // |  7  :::::::         |  5 :v  :  ^ :       |  0        |
    psubd   %xmm7, %xmm6                           // |  7  :::::::         |  6 ::  : ^v :       |  0        |
    movdqa  %xmm6, %xmm7                           // |  7  :::::::         |  6 ::  : v^ :       |  0        |
    psrld   $31, %xmm7                             // |  7  :::::::         |  5 ::  :  ^ :       |  0        |
    psrld   $3, %xmm6                              // |  7  :::::::         |  6 ::  : ^: :       |  0        |
    paddd   %xmm7, %xmm6                           // |  7  :::::::         |  6 ::  : ^v :       |  0        |
    pshufd  $245, %xmm6, %xmm7                     // |  7  :::::::         |  4 ::  :    :       |  0        |
    pmuludq %xmm9, %xmm6                           // |  7  :::::::         |  5 ::  : ^  v       |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  4 ::  :    :       |  0        |
    pmuludq %xmm9, %xmm7                           // |  7  :::::::         |  5 ::  :  ^ v       |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  5 ::  :  : :       |  0        |
    punpckldq   %xmm7, %xmm6                       // |  7  :::::::         |  6 ::  : ^v :       |  0        |
    psubd   %xmm6, %xmm3                           // |  7  :::::::         |  6 :: ^: v  :       |  0        |
    movdqa  %xmm4, %xmm6                           // |  7  :::::::         |  5 ::  v ^  :       |  0        |
    pmuludq %xmm1, %xmm6                           // |  7  :::::::         |  5 :v  : ^  :       |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  4 ::  :    :       |  0        |
    pshufd  $245, %xmm4, %xmm7                     // |  7  :::::::         |  4 ::  :    :       |  0        |
    pmuludq %xmm1, %xmm7                           // |  7  :::::::         |  5 :v  :  ^ :       |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  5 ::  :  : :       |  0        |
    punpckldq   %xmm7, %xmm6                       // |  7  :::::::         |  6 ::  : ^v :       |  0        |
    pxor    %xmm7, %xmm7                           // |  7  :::::::         |  5 ::  :  ^ :       |  0        |
    pcmpgtd %xmm4, %xmm7                           // |  7  :::::::         |  5 ::  v  ^ :       |  0        |
    pand    %xmm1, %xmm7                           // |  7  :::::::         |  4 :v     ^ :       |  0        |
    psubd   %xmm7, %xmm6                           // |  7  :::::::         |  5 ::    ^v :       |  0        |
    movdqa  %xmm6, %xmm7                           // |  7  :::::::         |  5 ::    v^ :       |  0        |
    psrld   $31, %xmm7                             // |  7  :::::::         |  4 ::     ^ :       |  0        |
    psrld   $3, %xmm6                              // |  7  :::::::         |  5 ::    ^: :       |  0        |
    paddd   %xmm7, %xmm6                           // |  7  :::::::         |  5 ::    ^v :       |  0        |
    pshufd  $245, %xmm6, %xmm7                     // |  7  :::::::         |  3 ::       :       |  0        |
    pmuludq %xmm9, %xmm6                           // |  7  :::::::         |  4 ::    ^  v       |  0        |
    pshufd  $232, %xmm6, %xmm6                     // |  7  :::::::         |  3 ::       :       |  0        |
    pmuludq %xmm9, %xmm7                           // |  7  :::::::         |  4 ::     ^ v       |  0        |
    pshufd  $232, %xmm7, %xmm7                     // |  7  :::::::         |  4 ::     : :       |  0        |
    punpckldq   %xmm7, %xmm6                       // |  7  :::::::         |  5 ::    ^v :       |  0        |
    psubd   %xmm6, %xmm4                           // |  7  :::::::         |  5 ::  ^ v  :       |  0        |
    movdqa  %xmm0, %xmm6                           // |  7  :::::::         |  4 v:    ^  :       |  0        |
    pmuludq %xmm1, %xmm6                           // |  7  :::::::         |  4 :v    ^  :       |  0        |
    pshufd  $237, %xmm6, %xmm6                     // |  7  :::::::         |  3 ::       :       |  0        |
    pshufd  $245, %xmm0, %xmm7                     // |  7  :::::::         |  3 ::       :       |  0        |
    pmuludq %xmm1, %xmm7                           // |  7  :::::::         |  4 :v     ^ :       |  0        |
    pshufd  $237, %xmm7, %xmm7                     // |  7  :::::::         |  4 ::     : :       |  0        |
    punpckldq   %xmm7, %xmm6                       // |  7  :::::::         |  5 ::    ^v :       |  0        |
    pcmpgtd %xmm0, %xmm5                           // |  7  :::::::         |  4 v:   ^   :       |  0        |
    pand    %xmm1, %xmm5                           // |  7  :::::::         |  3  v   ^   :       |  0        |
    psubd   %xmm5, %xmm6                           // |  7  :::::::         |  3      v^  :       |  0        |
    movdqa  %xmm6, %xmm1                           // |  7  :::::::         |  3  ^    v  :       |  0        |
    psrld   $31, %xmm1                             // |  7  :::::::         |  2  ^       :       |  0        |
    psrld   $3, %xmm6                              // |  7  :::::::         |  3  :    ^  :       |  0        |
    paddd   %xmm1, %xmm6                           // |  7  :::::::         |  3  v    ^  :       |  0        |
    pshufd  $245, %xmm6, %xmm1                     // |  7  :::::::         |  1          :       |  0        |
    pmuludq %xmm9, %xmm6                           // |  7  :::::::         |  2       ^  v       |  0        |
    pshufd  $232, %xmm6, %xmm5                     // |  7  :::::::         |  1          :       |  0        |
    pmuludq %xmm9, %xmm1                           // |  7  :::::::         |  2  ^       v       |  0        |
    pshufd  $232, %xmm1, %xmm1                     // |  7  :::::::         |  1  :               |  0        |
    punpckldq   %xmm1, %xmm5                       // |  7  :::::::         |  2  v   ^           |  0        |
    psubd   %xmm5, %xmm0                           // |  7  :::::::         |  2 ^    v           |  0        |
    movdqa  .LCPI0_2(%rip), %xmm1                  // |  7  :::::::         |  1  ^               |  0        |
    pand    %xmm1, %xmm0                           // |  7  :::::::         |  2 ^v               |  0        |
    pand    %xmm1, %xmm4                           // |  7  :::::::         |  3 :v  ^            |  0        |
    packuswb    %xmm0, %xmm4                       // |  7  :::::::         |  3 v:  ^            |  0        |
    pand    %xmm1, %xmm3                           // |  7  :::::::         |  3  v ^:            |  0        |
    pand    %xmm1, %xmm2                           // |  7  :::::::         |  4  v^::            |  0        |
    packuswb    %xmm3, %xmm2                       // |  7  :::::::         |  3   ^v:            |  0        |
    packuswb    %xmm4, %xmm2                       // |  7  :::::::         |  2   ^ v            |  0        |
    paddb   .LCPI0_3(%rip), %xmm2                  // |  7  :::::::         |  1   ^              |  0        |
    movdqu  %xmm2, (%rbx,%rsi)                     // |  7  v::v:::         |  1   v              |  0        |
.LBB0_12:                                          // |                     |                     |           |
    cmpq    %rdx, %rax                             // |  7 v::v :::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                   // |  6  ::: :::         |  0                  |  1  v     |
    testb   $8, %al                                // |  7 v::: :::         |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                   // |  6  ::: :::         |  0                  |  1  v     |
    jmp .LBB0_3                                    // |  6  ::: :::         |  0                  |  0        |
.LBB0_7:                                           // |                     |                     |           |
    xorl    %esi, %esi                             // |  7  :::^:::         |  0                  |  5 ^^^^^  |
    testb   $1, %bpl                               // |  6  ::: :v:         |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                   // |  5  ::: : :         |  0                  |  1  v     |
    jmp .LBB0_12                                   // |  5  ::: : :         |  0                  |  0        |
.LBB0_3:                                           // |                     |                     |           |
    movsbl  (%rbx,%rdx), %esi                      // |  6  v:v^: :         |  0                  |  0        |
    addl    %ecx, %esi                             // |  6  :v:x: :         |  0                  |  6 ^^^^^^ |
    movslq  %esi, %rsi                             // |  5  : :^: :         |  0                  |  0        |
    imulq   $1321528399, %rsi, %rdi                // |  6 x: x:: :         |  0                  |  2 ^  ^   |
    movq    %rdi, %rbp                             // |  7 :: ::v^:         |  0                  |  0        |
    shrq    $63, %rbp                              // |  6 :: :: x:         |  0                  |  5 ^^^^^  |
    sarq    $35, %rdi                              // |  7 :: ::^::         |  0                  |  5 ^^^^^  |
    addl    %ebp, %edi                             // |  7 :: ::xv:         |  0                  |  6 ^^^^^^ |
    leal    (%rdi,%rdi,4), %ebp                    // |  7 :: ::v^:         |  0                  |  0        |
    leal    (%rbp,%rbp,4), %ebp                    // |  7 :: :::^:         |  0                  |  0        |
    addl    %edi, %ebp                             // |  7 :: ::vx:         |  0                  |  6 ^^^^^^ |
    subl    %ebp, %esi                             // |  6 :: :x v:         |  0                  |  6 ^^^^^^ |
    addb    $97, %sil                              // |  5 :: :x  :         |  0                  |  6 ^^^^^^ |
    movb    %sil, (%rbx,%rdx)                      // |  5 :v vv  :         |  0                  |  0        |
    incq    %rdx                                   // |  3 :  x   :         |  0                  |  5  ^^^^^ |
.LBB0_16:                                          // |                     |                     |           |
    cmpq    %rdx, %rax                             // |  3 v  v   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                    // |  1        :         |  0                  |  1  v     |
.LBB0_17:                                          // |                     |                     |           |
    addq    $8, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    popq    %rbx                                   // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    popq    %rbp                                   // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
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
