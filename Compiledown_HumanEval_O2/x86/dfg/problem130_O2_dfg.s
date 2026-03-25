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
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   1                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
    .byte   0                                      // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .quad   2                                      // |                     |                     |           |
    .quad   3                                      // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .quad   1                                      // |                     |                     |           |
    .quad   1                                      // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .quad   16                                     // |                     |                     |           |
    .quad   16                                     // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    pushq   %rbp                                   // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    pushq   %r15                                   // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    pushq   %r14                                   // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    pushq   %r13                                   // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    pushq   %r12                                   // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                         // |                     |                     |           |
    pushq   %rbx                                   // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                         // |                     |                     |           |
    pushq   %rax                                   // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                         // |                     |                     |           |
    .cfi_offset %rbx, -56                          // |                     |                     |           |
    .cfi_offset %r12, -48                          // |                     |                     |           |
    .cfi_offset %r13, -40                          // |                     |                     |           |
    .cfi_offset %r14, -32                          // |                     |                     |           |
    .cfi_offset %r15, -24                          // |                     |                     |           |
    .cfi_offset %rbp, -16                          // |                     |                     |           |
    movl    %edx, %r14d                            // |  3    v   :      ^  |  0                  |  0        |
    testl   %esi, %esi                             // |  3     v  :      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                    // |  2        :      :  |  0                  |  3  vvv   |
    movl    %esi, %r9d                             // |  4     v  : ^    :  |  0                  |  0        |
    leaq    -1(%r9), %r8                           // |  4        :^v    :  |  0                  |  0        |
    movl    %r9d, %r10d                            // |  5        ::v^   :  |  0                  |  0        |
    andl    $3, %r10d                              // |  5        :::x   :  |  0                  |  5 ^^^^^  |
    movl    %r9d, %r11d                            // |  6        ::v:^  :  |  0                  |  0        |
    andl    $-4, %r11d                             // |  6        ::::x  :  |  0                  |  5 ^^^^^  |
    xorl    %r15d, %r15d                           // |  7        :::::  :^ |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                    // |  7        :::::  :: |  0                  |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_8:                                           // |                     |                     |           |
    incq    %r15                                   // |  7        :::::  :x |  0                  |  5  ^^^^^ |
    cmpq    %r9, %r15                              // |  7        ::v::  :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                    // |  6        :: ::  :: |  0                  |  1  v     |
.LBB0_3:                                           // |                     |                     |           |
    movq    (%rdi,%r15,8), %r12                    // |  8      v :: ::^ :v |  0                  |  0        |
    xorl    %ebp, %ebp                             // |  8       ^:: ::: :: |  0                  |  5 ^^^^^  |
    cmpq    $3, %r8                                // |  8       ::v ::: :: |  0                  |  6 ^^^^^^ |
    jb  .LBB0_5                                    // |  7       ::  ::: :: |  0                  |  1 v      |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_4:                                           // |                     |                     |           |
    leal    1(%rbp), %ebx                          // |  8  ^    v:  ::: :: |  0                  |  0        |
    cmpl    $1, (%r12,%rbp,4)                      // |  8  :    v:  ::v :: |  0                  |  6 ^^^^^^ |
    cmovel  %ebp, %eax                             // |  9 ^:    v:  ::: :: |  0                  |  0        |
    cmovel  %r15d, %edx                            // |  9  : ^  ::  ::: :v |  0                  |  0        |
    cmpl    $1, 4(%r12,%rbp,4)                     // |  8  :    v:  ::v :: |  0                  |  6 ^^^^^^ |
    cmovel  %ebx, %eax                             // |  9 ^v    ::  ::: :: |  0                  |  0        |
    cmovel  %r15d, %edx                            // |  9 :  ^  ::  ::: :v |  0                  |  0        |
    cmpl    $1, 8(%r12,%rbp,4)                     // |  8 :     v:  ::v :: |  0                  |  6 ^^^^^^ |
    leal    2(%rbp), %r13d                         // |  9 :     v:  :::^:: |  0                  |  0        |
    movl    %eax, %ebx                             // | 10 v^    ::  :::::: |  0                  |  0        |
    cmovel  %r13d, %ebx                            // |  9  ^    ::  :::v:: |  0                  |  0        |
    cmovel  %r15d, %edx                            // |  9  : ^  ::  ::: :v |  0                  |  0        |
    leal    3(%rbp), %eax                          // |  9 ^:    v:  ::: :: |  0                  |  0        |
    cmpl    $1, 12(%r12,%rbp,4)                    // |  8  :    v:  ::v :: |  0                  |  6 ^^^^^^ |
    cmovel  %r15d, %edx                            // |  9  : ^  ::  ::: :v |  0                  |  0        |
    cmovnel %ebx, %eax                             // |  9 ^v    ::  ::: :: |  0                  |  0        |
    addq    $4, %rbp                               // |  7       x:  ::: :: |  0                  |  6 ^^^^^^ |
    cmpq    %r11, %rbp                             // |  7       v:  :v: :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                    // |  6       ::  : : :: |  0                  |  1  v     |
.LBB0_5:                                           // |                     |                     |           |
    testq   %r10, %r10                             // |  6       ::  v : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                    // |  6       ::  : : :: |  0                  |  1  v     |
    movq    %r10, %rbx                             // |  7  ^    ::  v : :: |  0                  |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    cmpl    $1, (%r12,%rbp,4)                      // |  6  :    v:    v :: |  0                  |  6 ^^^^^^ |
    cmovel  %r15d, %edx                            // |  6  : ^  ::      :v |  0                  |  0        |
    cmovel  %ebp, %eax                             // |  6 ^: :  v:      :  |  0                  |  0        |
    incq    %rbp                                   // |  6 :: :  x:      :  |  0                  |  5  ^^^^^ |
    decq    %rbx                                   // |  5 :x :   :      :  |  0                  |  5  ^^^^^ |
    jne .LBB0_7                                    // |  4 :  :   :      :  |  0                  |  1  v     |
    jmp .LBB0_8                                    // |  4 :  :   :      :  |  0                  |  0        |
.LBB0_9:                                           // |                     |                     |           |
    movl    %esi, %ebp                             // |  6 :  :v ^:      :  |  0                  |  0        |
    imull   %esi, %ebp                             // |  6 x  xv ^:      :  |  0                  |  2 ^  ^   |
    movslq  %eax, %r8                              // |  6 v  :  ::^     :  |  0                  |  0        |
    testl   %edx, %edx                             // |  6 :  v  :::     :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                   // |  6 :  :  :::     :  |  0                  |  3  vvv   |
    leal    -1(%rdx), %ebx                         // |  7 :^ v  :::     :  |  0                  |  0        |
    movq    (%rdi,%rbx,8), %rbx                    // |  8 :^ : v:::     :  |  0                  |  0        |
    movl    (%rbx,%r8,4), %ebx                     // |  7 :^ :  ::v     :  |  0                  |  0        |
    cmpl    %ebp, %ebx                             // |  7 :v :  v::     :  |  0                  |  6 ^^^^^^ |
    cmovll  %ebx, %ebp                             // |  7 :v :  ^::     :  |  0                  |  0        |
.LBB0_11:                                          // |                     |                     |           |
    decl    %esi                                   // |  7 :  :x :::     :  |  0                  |  5  ^^^^^ |
    movslq  %edx, %rbx                             // |  8 :^ v: :::     :  |  0                  |  0        |
    cmpl    %esi, %edx                             // |  8 :: vv :::     :  |  0                  |  6 ^^^^^^ |
    jge .LBB0_13                                   // |  7 ::  : :::     :  |  0                  |  2   vv   |
    movq    8(%rdi,%rbx,8), %rdx                   // |  9 :v ^:v:::     :  |  0                  |  0        |
    movl    (%rdx,%r8,4), %edx                     // |  8 :: ^: ::v     :  |  0                  |  0        |
    cmpl    %ebp, %edx                             // |  8 :: v: v::     :  |  0                  |  6 ^^^^^^ |
    cmovll  %edx, %ebp                             // |  8 :: v: ^::     :  |  0                  |  0        |
.LBB0_13:                                          // |                     |                     |           |
    testl   %eax, %eax                             // |  7 v:  : :::     :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_15                                   // |  7 ::  : :::     :  |  0                  |  3  vvv   |
    movq    (%rdi,%rbx,8), %r9                     // |  9 :v  :v:::^    :  |  0                  |  0        |
    leal    -1(%rax), %edx                         // |  9 v: ^: ::::    :  |  0                  |  0        |
    movl    (%r9,%rdx,4), %edx                     // |  9 :: ^: :::v    :  |  0                  |  0        |
    cmpl    %ebp, %edx                             // |  8 :: v: v::     :  |  0                  |  6 ^^^^^^ |
    cmovll  %edx, %ebp                             // |  8 :: v: ^::     :  |  0                  |  0        |
.LBB0_15:                                          // |                     |                     |           |
    cmpl    %esi, %eax                             // |  8 v: :v :::     :  |  0                  |  6 ^^^^^^ |
    jge .LBB0_17                                   // |  6  : :  :::     :  |  0                  |  2   vv   |
    movq    (%rdi,%rbx,8), %rax                    // |  8 ^v : v:::     :  |  0                  |  0        |
    movl    4(%rax,%r8,4), %eax                    // |  6 ^  :  ::v     :  |  0                  |  0        |
    cmpl    %ebp, %eax                             // |  5 v  :  v:      :  |  0                  |  6 ^^^^^^ |
    cmovll  %eax, %ebp                             // |  5 v  :  ^:      :  |  0                  |  0        |
    jmp .LBB0_17                                   // |  4 :  :   :      :  |  0                  |  0        |
.LBB0_1:                                           // |                     |                     |           |
    imull   %esi, %esi                             // |  5 x  x^  :      :  |  0                  |  2 ^  ^   |
    movl    %esi, %ebp                             // |  5 :   v ^:      :  |  0                  |  0        |
.LBB0_17:                                          // |                     |                     |           |
    movl    %r14d, (%rcx)                          // |  5 : v   ::      v  |  0                  |  0        |
    movslq  %r14d, %rbx                            // |  5 :^    ::      v  |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                        // |  6 :v   ^::      :  |  0                  |  0        |
    callq   malloc@PLT                             // |  5 ::    :x      :  |  0                  |  0        |
    testl   %ebx, %ebx                             // |  5 :v    ::      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_29                                   // |  4 :     ::      :  |  0                  |  3  vvv   |
    movl    %r14d, %ecx                            // |  5 : ^   ::      v  |  0                  |  0        |
    cmpl    $8, %r14d                              // |  5 : :   ::      v  |  0                  |  6 ^^^^^^ |
    jae .LBB0_20                                   // |  4 : :   ::         |  0                  |  1 v      |
    xorl    %edx, %edx                             // |  5 : :^  ::         |  0                  |  5 ^^^^^  |
    jmp .LBB0_27                                   // |  4 : :   ::         |  0                  |  0        |
.LBB0_20:                                          // |                     |                     |           |
    movl    %ecx, %edx                             // |  5 : v^  ::         |  0                  |  0        |
    andl    $-8, %edx                              // |  5 : :x  ::         |  0                  |  5 ^^^^^  |
    movd    %ebp, %xmm0                            // |  5 : ::  v:         |  1 ^                |  0        |
    pshufd  $0, %xmm0, %xmm8                       // |  5 : ::  ::         |  0                  |  0        |
    leaq    -8(%rdx), %rsi                         // |  6 : :v^ ::         |  0                  |  0        |
    movq    %rsi, %rbx                             // |  7 :^::v ::         |  0                  |  0        |
    shrq    $3, %rbx                               // |  7 :x::: ::         |  0                  |  5 ^^^^^  |
    incq    %rbx                                   // |  7 :x::: ::         |  0                  |  5  ^^^^^ |
    testq   %rsi, %rsi                             // |  7 ::::v ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                   // |  6 ::::  ::         |  0                  |  1  v     |
    movq    %rbx, %rdi                             // |  7 :v:: ^::         |  0                  |  0        |
    andq    $-2, %rdi                              // |  7 :::: x::         |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_1(%rip), %xmm5                  // |  7 :::: :::         |  1      ^           |  0        |
    movdqa  .LCPI0_0(%rip), %xmm0                  // |  7 :::: :::         |  2 ^    :           |  0        |
    xorl    %esi, %esi                             // |  8 ::::^:::         |  2 :    :           |  5 ^^^^^  |
    movdqa  .LCPI0_2(%rip), %xmm9                  // |  8 ::::::::         |  3 :    :   ^       |  0        |
    pxor    %xmm10, %xmm10                         // |  8 ::::::::         |  4 :    :   :^      |  0        |
    movdqa  .LCPI0_3(%rip), %xmm7                  // |  8 ::::::::         |  5 :    : ^ ::      |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_23:                                          // |                     |                     |           |
    movdqa  %xmm5, %xmm3                           // |  8 ::::::::         |  6 :  ^ v : ::      |  0        |
    pand    %xmm9, %xmm3                           // |  8 ::::::::         |  5 :  ^   : v:      |  0        |
    movdqa  %xmm0, %xmm4                           // |  8 ::::::::         |  6 v  :^  : ::      |  0        |
    pand    %xmm9, %xmm4                           // |  8 ::::::::         |  5    :^  : v:      |  0        |
    movdqa  %xmm4, %xmm1                           // |  8 ::::::::         |  5  ^ :v  :  :      |  0        |
    pcmpeqd %xmm10, %xmm1                          // |  8 ::::::::         |  4  ^ :   :  v      |  0        |
    movdqa  %xmm3, %xmm2                           // |  8 ::::::::         |  5  :^v   :  :      |  0        |
    pcmpeqd %xmm10, %xmm2                          // |  8 ::::::::         |  4  :^    :  v      |  0        |
    movdqa  %xmm1, %xmm6                           // |  8 ::::::::         |  3  v    ^:         |  0        |
    shufps  $221, %xmm2, %xmm6                     // |  8 ::::::::         |  3  :    ::         |  0        |
    shufps  $136, %xmm2, %xmm1                     // |  8 ::::::::         |  3  :    ::         |  0        |
    andps   %xmm6, %xmm1                           // |  8 ::::::::         |  3  x    v:         |  5 ^^^^^  |
    movaps  %xmm1, %xmm2                           // |  8 ::::::::         |  3  v^    :         |  0        |
    andnps  %xmm8, %xmm2                           // |  8 ::::::::         |  4  :x    :v        |  5 ^^^^^  |
    movaps  %xmm2, %xmm6                           // |  8 ::::::::         |  4  :v   ^:         |  0        |
    psubd   %xmm1, %xmm6                           // |  8 ::::::::         |  4  v:   ^:         |  0        |
    psrld   $31, %xmm1                             // |  8 ::::::::         |  4  ^:   ::         |  0        |
    por %xmm2, %xmm1                               // |  8 ::::::::         |  4  ^v   ::         |  0        |
    movdqu  %xmm6, (%rax,%rsi,4)                   // |  8 v:::v:::         |  3  :    v:         |  0        |
    movdqu  %xmm1, 16(%rax,%rsi,4)                 // |  8 v:::v:::         |  3  v    ::         |  0        |
    movdqu  %xmm6, 32(%rax,%rsi,4)                 // |  8 v:::v:::         |  3  :    v:         |  0        |
    movdqu  %xmm1, 48(%rax,%rsi,4)                 // |  8 v:::v:::         |  2  v     :         |  0        |
    addq    $16, %rsi                              // |  8 ::::x:::         |  1        :         |  6 ^^^^^^ |
    paddq   %xmm7, %xmm0                           // |  8 ::::::::         |  2 ^      v         |  0        |
    paddq   %xmm7, %xmm5                           // |  8 ::::::::         |  2      ^ v         |  0        |
    addq    $-2, %rdi                              // |  8 :::::x::         |  0                  |  6 ^^^^^^ |
    jne .LBB0_23                                   // |  7 ::::: ::         |  0                  |  1  v     |
    testb   $1, %bl                                // |  7 :v::: ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_26                                   // |  6 : ::: ::         |  0                  |  1  v     |
.LBB0_25:                                          // |                     |                     |           |
    pxor    %xmm0, %xmm0                           // |  6 : ::: ::         |  1 ^                |  0        |
    pcmpeqd %xmm0, %xmm4                           // |  6 : ::: ::         |  2 v   ^            |  0        |
    pcmpeqd %xmm0, %xmm3                           // |  6 : ::: ::         |  3 v  ^:            |  0        |
    movdqa  %xmm4, %xmm0                           // |  6 : ::: ::         |  2 ^   v            |  0        |
    shufps  $221, %xmm3, %xmm0                     // |  6 : ::: ::         |  2 :   :            |  0        |
    shufps  $136, %xmm3, %xmm4                     // |  6 : ::: ::         |  2 :   :            |  0        |
    andps   %xmm0, %xmm4                           // |  6 : ::: ::         |  2 v   x            |  5 ^^^^^  |
    movaps  %xmm4, %xmm0                           // |  6 : ::: ::         |  2 ^   v            |  0        |
    andnps  %xmm8, %xmm0                           // |  6 : ::: ::         |  3 x   :   v        |  5 ^^^^^  |
    movaps  %xmm0, %xmm1                           // |  6 : ::: ::         |  3 v^  :            |  0        |
    psubd   %xmm4, %xmm1                           // |  6 : ::: ::         |  3 :^  v            |  0        |
    psrld   $31, %xmm4                             // |  6 : ::: ::         |  3 ::  ^            |  0        |
    por %xmm0, %xmm4                               // |  6 : ::: ::         |  3 v:  ^            |  0        |
    movdqu  %xmm1, (%rax,%rsi,4)                   // |  6 v ::v ::         |  2  v  :            |  0        |
    movdqu  %xmm4, 16(%rax,%rsi,4)                 // |  6 v ::v ::         |  1     v            |  0        |
.LBB0_26:                                          // |                     |                     |           |
    cmpq    %rcx, %rdx                             // |  5 : vv  ::         |  0                  |  6 ^^^^^^ |
    je  .LBB0_29                                   // |  5 : ::  ::         |  0                  |  1  v     |
.LBB0_27:                                          // |                     |                     |           |
    movl    $1, %esi                               // |  6 : ::^ ::         |  0                  |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_28:                                          // |                     |                     |           |
    testb   $1, %dl                                // |  6 : :v: ::         |  0                  |  6 ^^^^^^ |
    movl    %ebp, %edi                             // |  7 : :::^v:         |  0                  |  0        |
    cmovel  %esi, %edi                             // |  6 : ::v^ :         |  0                  |  0        |
    movl    %edi, (%rax,%rdx,4)                    // |  5 v :v v :         |  0                  |  0        |
    incq    %rdx                                   // |  3   :x   :         |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rcx                             // |  3   vv   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_28                                   // |  1        :         |  0                  |  1  v     |
.LBB0_29:                                          // |                     |                     |           |
    addq    $8, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                         // |                     |                     |           |
    popq    %rbx                                   // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                         // |                     |                     |           |
    popq    %r12                                   // |  3  :     x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                         // |                     |                     |           |
    popq    %r13                                   // |  3  :     x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                         // |                     |                     |           |
    popq    %r14                                   // |  3  :     x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                         // |                     |                     |           |
    popq    %r15                                   // |  3  :     x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                         // |                     |                     |           |
    popq    %rbp                                   // |  3  :    ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                          // |                     |                     |           |
    retq                                           // |  2  :     x         |  0                  |  0        |
.LBB0_21:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 64                         // |                     |                     |           |
    movdqa  .LCPI0_0(%rip), %xmm4                  // |  1  :               |  1     ^            |  0        |
    xorl    %esi, %esi                             // |  2  :  ^            |  1     :            |  5 ^^^^^  |
    movdqa  %xmm4, %xmm3                           // |  1  :               |  2    ^v            |  0        |
    testb   $1, %bl                                // |  1  v               |  0                  |  6 ^^^^^^ |
    jne .LBB0_25                                   // |  0                  |  0                  |  1  v     |
    jmp .LBB0_26                                   // |  0                  |  0                  |  0        |
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
