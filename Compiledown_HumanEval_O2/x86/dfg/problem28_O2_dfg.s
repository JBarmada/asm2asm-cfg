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
    .zero   16,133                                 // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .zero   16,229                                 // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .zero   16,191                                 // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .zero   16,25                                  // |                     |                     |           |
.LCPI0_4:                                          // |                     |                     |           |
    .zero   16,32                                  // |                     |                     |           |
.LCPI0_5:                                          // |                     |                     |           |
    .zero   16,224                                 // |                     |                     |           |
.LCPI0_6:                                          // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .byte   133                                    // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
.LCPI0_7:                                          // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .byte   230                                    // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
.LCPI0_8:                                          // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .byte   191                                    // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
.LCPI0_9:                                          // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .byte   26                                     // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
.LCPI0_10:                                         // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .byte   32                                     // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
    .zero   1                                      // |                     |                     |           |
.LCPI0_11:                                         // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
    .byte   224                                    // |                     |                     |           |
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
    pushq   %r14                                   // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    pushq   %rbx                                   // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    pushq   %rax                                   // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    .cfi_offset %rbx, -24                          // |                     |                     |           |
    .cfi_offset %r14, -16                          // |                     |                     |           |
    movq    %rsi, %r14                             // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                             // |  4  ^   v :      :  |  0                  |  0        |
    callq   strlen@PLT                             // |  3  :     x      :  |  0                  |  0        |
    testl   %eax, %eax                             // |  4 v:     :      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                   // |  3  :     :      :  |  0                  |  3  vvv   |
    movl    %eax, %r8d                             // |  5 v:     :^     :  |  0                  |  0        |
    xorl    %edx, %edx                             // |  5  : ^   ::     :  |  0                  |  5 ^^^^^  |
    cmpq    $8, %r8                                // |  4  :     :v     :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_12                                   // |  4  :     ::     :  |  0                  |  1 v      |
    movq    %r14, %rsi                             // |  5  :  ^  ::     v  |  0                  |  0        |
    subq    %rbx, %rsi                             // |  5  v  x  ::     :  |  0                  |  6 ^^^^^^ |
    cmpq    $32, %rsi                              // |  5  :  v  ::     :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_12                                   // |  4  :     ::     :  |  0                  |  1 v      |
    cmpl    $32, %r8d                              // |  4  :     :v     :  |  0                  |  6 ^^^^^^ |
    jae .LBB0_5                                    // |  4  :     ::     :  |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  5  : ^   ::     :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_9                                    // |  4  :     ::     :  |  0                  |  0        |
.LBB0_5:                                           // |                     |                     |           |
    movl    %eax, %esi                             // |  6 v:  ^  ::     :  |  0                  |  0        |
    andl    $31, %esi                              // |  5  :  x  ::     :  |  0                  |  5 ^^^^^  |
    movq    %r8, %rdx                              // |  6  : ^:  :v     :  |  0                  |  0        |
    subq    %rsi, %rdx                             // |  6  : xv  ::     :  |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                             // |  7  : ::^ ::     :  |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm8                  // |  7  : ::: ::     :  |  1         ^        |  0        |
    movdqa  .LCPI0_1(%rip), %xmm9                  // |  7  : ::: ::     :  |  2         :^       |  0        |
    movdqa  .LCPI0_2(%rip), %xmm10                 // |  7  : ::: ::     :  |  3         ::^      |  0        |
    movdqa  .LCPI0_3(%rip), %xmm11                 // |  7  : ::: ::     :  |  4         :::^     |  0        |
    movdqa  .LCPI0_4(%rip), %xmm12                 // |  7  : ::: ::     :  |  5         ::::^    |  0        |
    movdqa  .LCPI0_5(%rip), %xmm13                 // |  7  : ::: ::     :  |  6         :::::^   |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_6:                                           // |                     |                     |           |
    movdqu  (%rbx,%rdi), %xmm1                     // |  7  v ::v ::     :  |  7  ^      ::::::   |  0        |
    movdqu  16(%rbx,%rdi), %xmm5                   // |  7  v ::v ::     :  |  8  :   ^  ::::::   |  0        |
    movdqa  %xmm1, %xmm0                           // |  7  : ::: ::     :  |  9 ^v   :  ::::::   |  0        |
    paddb   %xmm8, %xmm0                           // |  7  : ::: ::     :  |  9 ^:   :  v:::::   |  0        |
    movdqa  %xmm0, %xmm6                           // |  7  : ::: ::     :  | 10 v:   :^ ::::::   |  0        |
    pminub  %xmm9, %xmm6                           // |  7  : ::: ::     :  | 10 ::   :^ :v::::   |  0        |
    pcmpeqb %xmm0, %xmm6                           // |  7  : ::: ::     :  | 10 v:   :^ ::::::   |  0        |
    movdqa  %xmm5, %xmm2                           // |  7  : ::: ::     :  | 10  :^  v: ::::::   |  0        |
    paddb   %xmm8, %xmm2                           // |  7  : ::: ::     :  | 10  :^  :: v:::::   |  0        |
    movdqa  %xmm2, %xmm0                           // |  7  : ::: ::     :  | 10 ^:v  ::  :::::   |  0        |
    pminub  %xmm9, %xmm0                           // |  7  : ::: ::     :  | 10 ^::  ::  v::::   |  0        |
    pcmpeqb %xmm2, %xmm0                           // |  7  : ::: ::     :  |  9 ^:v  ::   ::::   |  0        |
    movdqa  %xmm1, %xmm2                           // |  7  : ::: ::     :  |  9 :v^  ::   ::::   |  0        |
    paddb   %xmm10, %xmm2                          // |  7  : ::: ::     :  |  9 ::^  ::   v:::   |  0        |
    movdqa  %xmm5, %xmm7                           // |  7  : ::: ::     :  | 10 :::  v:^  ::::   |  0        |
    paddb   %xmm10, %xmm7                          // |  7  : ::: ::     :  | 10 :::  ::^  v:::   |  0        |
    movdqa  %xmm2, %xmm3                           // |  7  : ::: ::     :  | 10 ::v^ :::   :::   |  0        |
    pminub  %xmm11, %xmm3                          // |  7  : ::: ::     :  | 10 :::^ :::   v::   |  0        |
    pcmpeqb %xmm2, %xmm3                           // |  7  : ::: ::     :  | 10 ::v^ :::   :::   |  0        |
    movdqa  %xmm7, %xmm2                           // |  7  : ::: ::     :  | 10 ::^: ::v   :::   |  0        |
    pminub  %xmm11, %xmm2                          // |  7  : ::: ::     :  | 10 ::^: :::   v::   |  0        |
    pcmpeqb %xmm7, %xmm2                           // |  7  : ::: ::     :  |  9 ::^: ::v    ::   |  0        |
    movdqa  %xmm1, %xmm7                           // |  7  : ::: ::     :  |  9 :v:: ::^    ::   |  0        |
    paddb   %xmm12, %xmm7                          // |  7  : ::: ::     :  |  9 :::: ::^    v:   |  0        |
    movdqa  %xmm5, %xmm4                           // |  7  : ::: ::     :  |  9 ::::^v:     ::   |  0        |
    paddb   %xmm12, %xmm4                          // |  7  : ::: ::     :  |  9 ::::^::     v:   |  0        |
    pand    %xmm3, %xmm7                           // |  7  : ::: ::     :  |  8 :::v ::^     :   |  0        |
    pandn   %xmm1, %xmm3                           // |  7  : ::: ::     :  |  8 :v:^ :::     :   |  0        |
    por %xmm7, %xmm3                               // |  7  : ::: ::     :  |  7 : :^ ::v     :   |  0        |
    pand    %xmm2, %xmm4                           // |  7  : ::: ::     :  |  6 : v ^::      :   |  0        |
    pandn   %xmm5, %xmm2                           // |  7  : ::: ::     :  |  6 : ^ :v:      :   |  0        |
    por %xmm4, %xmm2                               // |  7  : ::: ::     :  |  5 : ^ v :      :   |  0        |
    paddb   %xmm13, %xmm1                          // |  7  : ::: ::     :  |  4 :^    :      v   |  0        |
    paddb   %xmm13, %xmm5                          // |  7  : ::: ::     :  |  5 ::   ^:      v   |  0        |
    pand    %xmm6, %xmm3                           // |  7  : ::: ::     :  |  5 :: ^ :v          |  0        |
    pandn   %xmm1, %xmm6                           // |  7  : ::: ::     :  |  5 :v : :^          |  0        |
    por %xmm3, %xmm6                               // |  7  : ::: ::     :  |  4 :  v :^          |  0        |
    pand    %xmm0, %xmm2                           // |  7  : ::: ::     :  |  4 v ^  ::          |  0        |
    pandn   %xmm5, %xmm0                           // |  7  : ::: ::     :  |  4 ^ :  v:          |  0        |
    por %xmm2, %xmm0                               // |  7  : ::: ::     :  |  3 ^ v   :          |  0        |
    movdqu  %xmm6, (%r14,%rdi)                     // |  7  : ::v ::     v  |  2 :     v          |  0        |
    movdqu  %xmm0, 16(%r14,%rdi)                   // |  7  : ::v ::     v  |  1 v                |  0        |
    addq    $32, %rdi                              // |  7  : ::x ::     :  |  0                  |  6 ^^^^^^ |
    cmpq    %rdi, %rdx                             // |  7  : v:v ::     :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                    // |  6  : ::  ::     :  |  0                  |  1  v     |
    testq   %rsi, %rsi                             // |  6  : :v  ::     :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                   // |  6  : ::  ::     :  |  0                  |  1  v     |
    cmpl    $8, %esi                               // |  6  : :v  ::     :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_12                                   // |  5  : :   ::     :  |  0                  |  1 v      |
.LBB0_9:                                           // |                     |                     |           |
    movq    %rdx, %rsi                             // |  6  : v^  ::     :  |  0                  |  0        |
    movl    %eax, %edi                             // |  7 v:  :^ ::     :  |  0                  |  0        |
    andl    $7, %edi                               // |  6  :  :x ::     :  |  0                  |  5 ^^^^^  |
    movq    %r8, %rdx                              // |  7  : ^:: :v     :  |  0                  |  0        |
    subq    %rdi, %rdx                             // |  7  : x:v ::     :  |  0                  |  6 ^^^^^^ |
    movdqa  .LCPI0_6(%rip), %xmm8                  // |  7  : ::: ::     :  |  1         ^        |  0        |
    movdqa  .LCPI0_7(%rip), %xmm9                  // |  7  : ::: ::     :  |  2         :^       |  0        |
    movdqa  .LCPI0_8(%rip), %xmm10                 // |  7  : ::: ::     :  |  3         ::^      |  0        |
    movdqa  .LCPI0_9(%rip), %xmm3                  // |  7  : ::: ::     :  |  4    ^    :::      |  0        |
    movdqa  .LCPI0_10(%rip), %xmm4                 // |  7  : ::: ::     :  |  5    :^   :::      |  0        |
    movdqa  .LCPI0_11(%rip), %xmm5                 // |  7  : ::: ::     :  |  6    ::^  :::      |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_10:                                          // |                     |                     |           |
    movq    (%rbx,%rsi), %xmm6                     // |  7  v :v: ::     :  |  7    :::^ :::      |  0        |
    movdqa  %xmm6, %xmm7                           // |  6    ::: ::     :  |  8    :::v^:::      |  0        |
    paddb   %xmm8, %xmm7                           // |  6    ::: ::     :  |  8    ::::^v::      |  0        |
    movdqa  %xmm7, %xmm0                           // |  6    ::: ::     :  |  8 ^  ::::v ::      |  0        |
    pmaxub  %xmm9, %xmm0                           // |  6    ::: ::     :  |  8 ^  ::::: v:      |  0        |
    pcmpeqb %xmm7, %xmm0                           // |  6    ::: ::     :  |  7 ^  ::::v  :      |  0        |
    movdqa  %xmm6, %xmm1                           // |  6    ::: ::     :  |  7 :^ :::v   :      |  0        |
    paddb   %xmm10, %xmm1                          // |  6    ::: ::     :  |  7 :^ ::::   v      |  0        |
    movdqa  %xmm1, %xmm7                           // |  6    ::: ::     :  |  7 :v ::::^         |  0        |
    pmaxub  %xmm3, %xmm7                           // |  6    ::: ::     :  |  7 :: v:::^         |  0        |
    pcmpeqb %xmm1, %xmm7                           // |  6    ::: ::     :  |  6 :v  :::^         |  0        |
    movdqa  %xmm6, %xmm1                           // |  6    ::: ::     :  |  6 :^  ::v:         |  0        |
    paddb   %xmm4, %xmm1                           // |  6    ::: ::     :  |  6 :^  v:::         |  0        |
    movdqa  %xmm7, %xmm2                           // |  6    ::: ::     :  |  6 ::^  ::v         |  0        |
    pand    %xmm6, %xmm2                           // |  6    ::: ::     :  |  5 ::^  :v          |  0        |
    pandn   %xmm1, %xmm7                           // |  6    ::: ::     :  |  5 :v:  : ^         |  0        |
    por %xmm2, %xmm7                               // |  6    ::: ::     :  |  4 : v  : ^         |  0        |
    paddb   %xmm5, %xmm6                           // |  6    ::: ::     :  |  4 :    v^:         |  0        |
    pand    %xmm0, %xmm6                           // |  6    ::: ::     :  |  3 v     ^:         |  0        |
    pandn   %xmm7, %xmm0                           // |  6    ::: ::     :  |  2 ^      v         |  0        |
    por %xmm0, %xmm6                               // |  6    ::: ::     :  |  2 v     ^          |  0        |
    movq    %xmm6, (%r14,%rsi)                     // |  6    :v: ::     v  |  1       v          |  0        |
    addq    $8, %rsi                               // |  6    :x: ::     :  |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rdx                             // |  6    vv: ::     :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                   // |  6    ::: ::     :  |  0                  |  1  v     |
    testq   %rdi, %rdi                             // |  6    ::v ::     :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                   // |  5    ::  ::     :  |  0                  |  1  v     |
.LBB0_16:                                          // |                     |                     |           |
    cltq                                           // |  5    ::  ::     :  |  0                  |  0        |
    movb    $0, (%r14,%rax)                        // |  6 v  ::  ::     v  |  0                  |  0        |
    addq    $8, %rsp                               // |  4    ::  x:        |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    popq    %rbx                                   // |  5  ^ ::  x:        |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    popq    %r14                                   // |  6  : ::  x:     ^  |  0                  |  0        |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
    retq                                           // |  6  : ::  x:     :  |  0                  |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_14:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    leal    -65(%rsi), %edi                        // |  6  : :v^  :     :  |  0                  |  0        |
    leal    32(%rsi), %ecx                         // |  7  :^:v:  :     :  |  0                  |  0        |
    cmpb    $26, %dil                              // |  7  ::::v  :     :  |  0                  |  6 ^^^^^^ |
    movzbl  %sil, %edi                             // |  7  :::v^  :     :  |  0                  |  0        |
    movzbl  %cl, %esi                              // |  7  :v:^:  :     :  |  0                  |  0        |
    cmovael %edi, %esi                             // |  6  : :^v  :     :  |  0                  |  0        |
.LBB0_15:                                          // |                     |                     |           |
    movb    %sil, (%r14,%rdx)                      // |  5  : vv   :     v  |  0                  |  0        |
    incq    %rdx                                   // |  3  : x    :        |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %r8                              // |  3  : v    v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                   // |  2  : :             |  0                  |  1  v     |
.LBB0_12:                                          // |                     |                     |           |
    movzbl  (%rbx,%rdx), %esi                      // |  3  v v^            |  0                  |  0        |
    leal    -97(%rsi), %edi                        // |  2     v^           |  0                  |  0        |
    cmpb    $25, %dil                              // |  2     :v           |  0                  |  6 ^^^^^^ |
    ja  .LBB0_14                                   // |  1     :            |  0                  |  2 vv     |
    addb    $-32, %sil                             // |  1     x            |  0                  |  6 ^^^^^^ |
    jmp .LBB0_15                                   // |  0                  |  0                  |  0        |
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
