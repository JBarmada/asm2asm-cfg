                                                    // +---------------------+---------------------+-----------+
                                                    // |         GPR         |        VECTOR       |   FLAGS   |
                                                    // |                     |                     |           |
                                                    // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                    // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                    // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                    // |                     |    0123456789111111 |           |
                                                    // |  #                  |  #           012345 |  #        |
                                                    // +---------------------+---------------------+-----------+
    .text                                           // |                     |                     |           |
    .file   "code.c"                                // |                     |                     |           |
    .section    .rodata.cst16,"aM",@progbits,16     // |                     |                     |           |
    .p2align    4                                   // |                     |                     |           |
.LCPI0_0:                                           // |                     |                     |           |
    .long   0                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   2                                       // |                     |                     |           |
    .long   3                                       // |                     |                     |           |
.LCPI0_1:                                           // |                     |                     |           |
    .long   4                                       // |                     |                     |           |
    .long   4                                       // |                     |                     |           |
    .long   4                                       // |                     |                     |           |
    .long   4                                       // |                     |                     |           |
.LCPI0_2:                                           // |                     |                     |           |
    .long   8                                       // |                     |                     |           |
    .long   8                                       // |                     |                     |           |
    .long   8                                       // |                     |                     |           |
    .long   8                                       // |                     |                     |           |
.LCPI0_3:                                           // |                     |                     |           |
    .long   12                                      // |                     |                     |           |
    .long   12                                      // |                     |                     |           |
    .long   12                                      // |                     |                     |           |
    .long   12                                      // |                     |                     |           |
.LCPI0_4:                                           // |                     |                     |           |
    .long   16                                      // |                     |                     |           |
    .long   16                                      // |                     |                     |           |
    .long   16                                      // |                     |                     |           |
    .long   16                                      // |                     |                     |           |
.LCPI0_5:                                           // |                     |                     |           |
    .long   20                                      // |                     |                     |           |
    .long   20                                      // |                     |                     |           |
    .long   20                                      // |                     |                     |           |
    .long   20                                      // |                     |                     |           |
.LCPI0_6:                                           // |                     |                     |           |
    .long   24                                      // |                     |                     |           |
    .long   24                                      // |                     |                     |           |
    .long   24                                      // |                     |                     |           |
    .long   24                                      // |                     |                     |           |
.LCPI0_7:                                           // |                     |                     |           |
    .long   28                                      // |                     |                     |           |
    .long   28                                      // |                     |                     |           |
    .long   28                                      // |                     |                     |           |
    .long   28                                      // |                     |                     |           |
.LCPI0_8:                                           // |                     |                     |           |
    .long   32                                      // |                     |                     |           |
    .long   32                                      // |                     |                     |           |
    .long   32                                      // |                     |                     |           |
    .long   32                                      // |                     |                     |           |
    .text                                           // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %r13                                    // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    subq    $24, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 80                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movl    %ecx, %r14d                             // |  3   v    :      ^  |  0                  |  0        |
    movl    %edx, 4(%rsp)                           // |  3    v   v      :  |  0                  |  0        |
    movq    %rsi, %r12                              // |  4     v  :    ^ :  |  0                  |  0        |
    movq    %rdi, 8(%rsp)                           // |  4      v v    : :  |  0                  |  0        |
    movslq  %ecx, %rbp                              // |  5   v   ^:    : :  |  0                  |  0        |
    leaq    (,%rbp,4), %rbx                         // |  5  ^    v:    : :  |  0                  |  0        |
    movq    %rbx, %rdi                              // |  6  v   ^::    : :  |  0                  |  0        |
    callq   malloc@PLT                              // |  5  :    :x    : :  |  0                  |  0        |
    movq    %rax, %r15                              // |  7 v:    ::    : :^ |  0                  |  0        |
    movq    %rbx, %rdi                              // |  7  v   ^::    : :: |  0                  |  0        |
    callq   malloc@PLT                              // |  5       :x    : :: |  0                  |  0        |
    movq    %rax, %rbx                              // |  7 v^    ::    : :: |  0                  |  0        |
    testl   %ebp, %ebp                              // |  6  :    v:    : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_12                                    // |  5  :     :    : :: |  0                  |  3  vvv   |
    movl    %r14d, %ebp                             // |  6  :    ^:    : v: |  0                  |  0        |
    leaq    (,%rbp,4), %rdx                         // |  7  : ^  v:    : :: |  0                  |  0        |
    movq    %r15, %rdi                              // |  7  :   ^::    : :v |  0                  |  0        |
    movq    %r12, %rsi                              // |  7  :  ^ ::    v :: |  0                  |  0        |
    callq   memcpy@PLT                              // |  5  :    :x      :: |  0                  |  0        |
    cmpl    $8, %r14d                               // |  5  :    ::      v: |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                     // |  4  :    ::       : |  0                  |  1 v      |
    xorl    %eax, %eax                              // |  5 ^:    ::       : |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                     // |  4  :    ::       : |  0                  |  0        |
.LBB0_4:                                            // |                     |                     |           |
    movl    %ebp, %eax                              // |  5 ^:    v:       : |  0                  |  0        |
    andl    $-8, %eax                               // |  5 x:    ::       : |  0                  |  5 ^^^^^  |
    leaq    -8(%rax), %rsi                          // |  6 v:  ^ ::       : |  0                  |  0        |
    movq    %rsi, %rdx                              // |  7 :: ^v ::       : |  0                  |  0        |
    shrq    $3, %rdx                                // |  7 :: x: ::       : |  0                  |  5 ^^^^^  |
    incq    %rdx                                    // |  7 :: x: ::       : |  0                  |  5  ^^^^^ |
    movl    %edx, %ecx                              // |  8 ::^v: ::       : |  0                  |  0        |
    andl    $3, %ecx                                // |  8 ::x:: ::       : |  0                  |  5 ^^^^^  |
    cmpq    $24, %rsi                               // |  8 ::::v ::       : |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                     // |  7 ::::  ::       : |  0                  |  1 v      |
    movdqa  .LCPI0_0(%rip), %xmm0                   // |  7 ::::  ::       : |  1 ^                |  0        |
    xorl    %esi, %esi                              // |  8 ::::^ ::       : |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                     // |  7 ::::  ::       : |  0                  |  0        |
.LBB0_6:                                            // |                     |                     |           |
    andq    $-4, %rdx                               // |  7 :::x  ::       : |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm0                   // |  7 ::::  ::       : |  1 ^                |  0        |
    xorl    %esi, %esi                              // |  8 ::::^ ::       : |  1 :                |  5 ^^^^^  |
    movdqa  .LCPI0_1(%rip), %xmm8                   // |  8 ::::: ::       : |  2 :       ^        |  0        |
    movdqa  .LCPI0_2(%rip), %xmm9                   // |  8 ::::: ::       : |  3 :       :^       |  0        |
    movdqa  .LCPI0_3(%rip), %xmm10                  // |  8 ::::: ::       : |  4 :       ::^      |  0        |
    movdqa  .LCPI0_4(%rip), %xmm4                   // |  8 ::::: ::       : |  5 :   ^   :::      |  0        |
    movdqa  .LCPI0_5(%rip), %xmm5                   // |  8 ::::: ::       : |  6 :   :^  :::      |  0        |
    movdqa  .LCPI0_6(%rip), %xmm6                   // |  8 ::::: ::       : |  7 :   ::^ :::      |  0        |
    movdqa  .LCPI0_7(%rip), %xmm7                   // |  8 ::::: ::       : |  8 :   :::^:::      |  0        |
    movdqa  .LCPI0_8(%rip), %xmm1                   // |  8 ::::: ::       : |  9 :^  :::::::      |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    movdqa  %xmm0, %xmm2                            // |  8 ::::: ::       : | 10 v:^ :::::::      |  0        |
    paddd   %xmm8, %xmm2                            // |  8 ::::: ::       : | 10 ::^ ::::v::      |  0        |
    movdqu  %xmm0, (%rbx,%rsi,4)                    // |  8 :v::v ::       : |  9 v:: :::: ::      |  0        |
    movdqu  %xmm2, 16(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  9 ::v :::: ::      |  0        |
    movdqa  %xmm0, %xmm2                            // |  8 ::::: ::       : |  9 v:^ :::: ::      |  0        |
    paddd   %xmm9, %xmm2                            // |  8 ::::: ::       : |  9 ::^ :::: v:      |  0        |
    movdqa  %xmm0, %xmm3                            // |  8 ::::: ::       : |  9 v::^::::  :      |  0        |
    paddd   %xmm10, %xmm3                           // |  8 ::::: ::       : |  9 :::^::::  v      |  0        |
    movdqu  %xmm2, 32(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  8 ::v:::::         |  0        |
    movdqu  %xmm3, 48(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  7 :: v::::         |  0        |
    movdqa  %xmm0, %xmm2                            // |  8 ::::: ::       : |  7 v:^ ::::         |  0        |
    paddd   %xmm4, %xmm2                            // |  8 ::::: ::       : |  7 ::^ v:::         |  0        |
    movdqa  %xmm0, %xmm3                            // |  8 ::::: ::       : |  7 v::^ :::         |  0        |
    paddd   %xmm5, %xmm3                            // |  8 ::::: ::       : |  7 :::^ v::         |  0        |
    movdqu  %xmm2, 64(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  6 ::v:  ::         |  0        |
    movdqu  %xmm3, 80(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  5 :: v  ::         |  0        |
    movdqa  %xmm0, %xmm2                            // |  8 ::::: ::       : |  5 v:^   ::         |  0        |
    paddd   %xmm6, %xmm2                            // |  8 ::::: ::       : |  5 ::^   v:         |  0        |
    movdqa  %xmm0, %xmm3                            // |  8 ::::: ::       : |  5 v::^   :         |  0        |
    paddd   %xmm7, %xmm3                            // |  8 ::::: ::       : |  4  ::^   v         |  0        |
    movdqu  %xmm2, 96(%rbx,%rsi,4)                  // |  8 :v::v ::       : |  3  :v:             |  0        |
    movdqu  %xmm3, 112(%rbx,%rsi,4)                 // |  8 :v::v ::       : |  2  : v             |  0        |
    addq    $32, %rsi                               // |  8 ::::x ::       : |  1  :               |  6 ^^^^^^ |
    paddd   %xmm1, %xmm0                            // |  8 ::::: ::       : |  2 ^v               |  0        |
    addq    $-4, %rdx                               // |  8 :::x: ::       : |  1 :                |  6 ^^^^^^ |
    jne .LBB0_7                                     // |  7 ::: : ::       : |  1 :                |  1  v     |
.LBB0_8:                                            // |                     |                     |           |
    testq   %rcx, %rcx                              // |  7 ::v : ::       : |  1 :                |  6 ^^^^^^ |
    je  .LBB0_11                                    // |  7 ::: : ::       : |  1 :                |  1  v     |
    leaq    (%rbx,%rsi,4), %rdx                     // |  8 :v:^v ::       : |  1 :                |  0        |
    addq    $16, %rdx                               // |  7 :::x  ::       : |  1 :                |  6 ^^^^^^ |
    shlq    $5, %rcx                                // |  7 ::x:  ::       : |  1 :                |  5 ^^^^^  |
    xorl    %esi, %esi                              // |  8 ::::^ ::       : |  1 :                |  5 ^^^^^  |
    movdqa  .LCPI0_1(%rip), %xmm1                   // |  8 ::::: ::       : |  2 :^               |  0        |
    movdqa  .LCPI0_2(%rip), %xmm2                   // |  8 ::::: ::       : |  3 ::^              |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_10:                                           // |                     |                     |           |
    movdqa  %xmm0, %xmm3                            // |  8 ::::: ::       : |  4 v::^             |  0        |
    paddd   %xmm1, %xmm3                            // |  8 ::::: ::       : |  4 :v:^             |  0        |
    movdqu  %xmm0, -16(%rdx,%rsi)                   // |  8 :::vv ::       : |  3 v ::             |  0        |
    movdqu  %xmm3, (%rdx,%rsi)                      // |  8 :::vv ::       : |  2   :v             |  0        |
    paddd   %xmm2, %xmm0                            // |  7 ::: : ::       : |  2 ^ v              |  0        |
    addq    $32, %rsi                               // |  7 ::: x ::       : |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %rcx                              // |  7 ::v v ::       : |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                    // |  6 :::   ::       : |  0                  |  1  v     |
.LBB0_11:                                           // |                     |                     |           |
    cmpq    %rbp, %rax                              // |  6 v::   v:       : |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                    // |  6 :::   ::       : |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_3:                                            // |                     |                     |           |
    movl    %eax, (%rbx,%rax,4)                     // |  6 vv:   ::       : |  0                  |  0        |
    incq    %rax                                    // |  6 x::   ::       : |  0                  |  5  ^^^^^ |
    cmpq    %rax, %rbp                              // |  6 v::   v:       : |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                     // |  4  ::    :       : |  0                  |  1  v     |
.LBB0_12:                                           // |                     |                     |           |
    movl    4(%rsp), %eax                           // |  5 ^::    v       : |  0                  |  0        |
    testl   %eax, %eax                              // |  5 v::    :       : |  0                  |  6 ^^^^^^ |
    jle .LBB0_49                                    // |  5 :::    :       : |  0                  |  3  vvv   |
    movl    %eax, %r14d                             // |  6 v::    :      ^: |  0                  |  0        |
    xorl    %ebp, %ebp                              // |  7 :::   ^:      :: |  0                  |  5 ^^^^^  |
    leaq    .L.str(%rip), %r12                      // |  8 :::   ::    ^ :: |  0                  |  0        |
    movq    %r14, 16(%rsp)                          // |  7 :::   :v      v: |  0                  |  0        |
    jmp .LBB0_14                                    // |  7 :::   ::      :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_27:                                           // |                     |                     |           |
    leaq    1(%rbp), %r13                           // |  8 :::   v:     ^:: |  0                  |  0        |
    movslq  %eax, %r12                              // |  9 v::   ::    ^::: |  0                  |  0        |
    xorps   %xmm0, %xmm0                            // |  8  ::   ::    :::: |  1 ^                |  5 ^^^^^  |
    cvtsi2sdl   (%r15,%r12,4), %xmm0                // |  8  ::   ::    v::v |  1 ^                |  0        |
    xorps   %xmm1, %xmm1                            // |  8  ::   ::    :::: |  2 :^               |  5 ^^^^^  |
    cvtsi2sdl   (%r15,%rcx,4), %xmm1                // |  8  :v   ::    :::v |  2 :^               |  0        |
    callq   pow@PLT                                 // |  7  :    :x    :::: |  1 :                |  0        |
    cvttsd2si   %xmm0, %eax                         // |  8 ^:    ::    :::: |  1 v                |  0        |
    movl    %eax, (%r15,%r12,4)                     // |  8 v:    ::    v::v |  0                  |  0        |
    movl    %r12d, 4(%rbx,%rbp,4)                   // |  7  v    v:    v::: |  0                  |  0        |
    movq    %r13, %rbp                              // |  6  :    ^:     v:: |  0                  |  0        |
    movq    %r14, %r12                              // |  6  :    ::    ^ v: |  0                  |  0        |
    movq    16(%rsp), %r14                          // |  6  :    :v    : ^: |  0                  |  0        |
.LBB0_28:                                           // |                     |                     |           |
    cmpq    %r14, %rbp                              // |  6  :    v:    : v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                    // |  5  :    ::    :  : |  0                  |  1  v     |
.LBB0_14:                                           // |                     |                     |           |
    movq    8(%rsp), %rax                           // |  6 ^:    :v    :  : |  0                  |  0        |
    movq    (%rax,%rbp,8), %rdi                     // |  7 v:   ^v:    :  : |  0                  |  0        |
    movq    %r12, %rsi                              // |  7 ::  ^ ::    v  : |  0                  |  0        |
    callq   strcmp@PLT                              // |  6 ::    :x    :  : |  0                  |  0        |
    testl   %eax, %eax                              // |  6 v:    ::    :  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_22                                    // |  5  :    ::    :  : |  0                  |  1  v     |
    incq    %rbp                                    // |  5  :    x:    :  : |  0                  |  5  ^^^^^ |
    jmp .LBB0_28                                    // |  5  :    ::    :  : |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_22:                                           // |                     |                     |           |
    movslq  (%rbx,%rbp,4), %rax                     // |  6 ^v    v:    :  : |  0                  |  0        |
    movl    (%rbx,%rax,4), %ecx                     // |  7 vv^   ::    :  : |  0                  |  0        |
    cmpl    %eax, %ecx                              // |  7 v:v   ::    :  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                    // |  6  ::   ::    :  : |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_24:                                           // |                     |                     |           |
    movl    %ecx, (%rbx,%rbp,4)                     // |  6  vv   v:    :  : |  0                  |  0        |
    movslq  %ecx, %rdx                              // |  7  :v^  ::    :  : |  0                  |  0        |
    movl    %ecx, %eax                              // |  8 ^:v:  ::    :  : |  0                  |  0        |
    movl    (%rbx,%rdx,4), %esi                     // |  7  v v^ ::    :  : |  0                  |  0        |
    movl    %esi, %ecx                              // |  8  :^:v ::    :  : |  0                  |  0        |
    cmpl    %edx, %esi                              // |  7  : vv ::    :  : |  0                  |  6 ^^^^^^ |
    jne .LBB0_24                                    // |  6  :  : ::    :  : |  0                  |  1  v     |
.LBB0_23:                                           // |                     |                     |           |
    movq    %r12, %r14                              // |  7  :  : ::    v ^: |  0                  |  0        |
    movslq  4(%rbx,%rbp,4), %rcx                    // |  7  v^ : v:      :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_26:                                           // |                     |                     |           |
    movl    (%rbx,%rcx,4), %edx                     // |  8  vv^: ::      :: |  0                  |  0        |
    cmpl    %ecx, %edx                              // |  8  :vv: ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_27                                    // |  7  : :: ::      :: |  0                  |  1  v     |
    movl    %edx, 4(%rbx,%rbp,4)                    // |  7  v v: v:      :: |  0                  |  0        |
    movslq  %edx, %rcx                              // |  7  :^v:  :      :: |  0                  |  0        |
    jmp .LBB0_26                                    // |  7  ::::  :      :: |  0                  |  0        |
.LBB0_16:                                           // |                     |                     |           |
    cmpl    $0, 4(%rsp)                             // |  7  ::::  v      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_49                                    // |  7  ::::  :      :: |  0                  |  3  vvv   |
    xorl    %ebp, %ebp                              // |  8  :::: ^:      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_18                                    // |  8  :::: ::      :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_38:                                           // |                     |                     |           |
    imull   %esi, %eax                              // |  9 ^::xv ::      :: |  0                  |  2 ^  ^   |
.LBB0_40:                                           // |                     |                     |           |
    movl    %eax, (%r15,%rcx,4)                     // |  7 v:v   ::      :v |  0                  |  0        |
    movl    %ecx, 4(%rbx,%rbp,4)                    // |  6  vv   v:      :: |  0                  |  0        |
.LBB0_41:                                           // |                     |                     |           |
    incq    %rbp                                    // |  5  :    x:      :: |  0                  |  5  ^^^^^ |
    cmpq    %r14, %rbp                              // |  5  :    v:      v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_29                                    // |  5  :    ::      :: |  0                  |  1  v     |
.LBB0_18:                                           // |                     |                     |           |
    movq    8(%rsp), %rax                           // |  6 ^:    :v      :: |  0                  |  0        |
    movq    (%rax,%rbp,8), %r13                     // |  7 v:    v:     ^:: |  0                  |  0        |
    movq    %r13, %rdi                              // |  8 ::   ^::     v:: |  0                  |  0        |
    leaq    .L.str.1(%rip), %rsi                    // |  8 ::  ^ ::     ::: |  0                  |  0        |
    callq   strcmp@PLT                              // |  7 ::    :x     ::: |  0                  |  0        |
    movl    %eax, %r12d                             // |  8 v:    ::    ^::: |  0                  |  0        |
    testl   %eax, %eax                              // |  8 v:    ::    :::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_20                                    // |  8 ::    ::    :::: |  0                  |  1  v     |
    movq    %r13, %rdi                              // |  9 ::   ^::    :v:: |  0                  |  0        |
    leaq    .L.str.2(%rip), %rsi                    // |  8 ::  ^ ::    : :: |  0                  |  0        |
    callq   strcmp@PLT                              // |  7 ::    :x    : :: |  0                  |  0        |
    testl   %eax, %eax                              // |  7 v:    ::    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_41                                    // |  6  :    ::    : :: |  0                  |  1  v     |
.LBB0_20:                                           // |                     |                     |           |
    movslq  (%rbx,%rbp,4), %rax                     // |  7 ^v    v:    : :: |  0                  |  0        |
    movl    (%rbx,%rax,4), %ecx                     // |  8 vv^   ::    : :: |  0                  |  0        |
    cmpl    %eax, %ecx                              // |  8 v:v   ::    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                    // |  7  ::   ::    : :: |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_34:                                           // |                     |                     |           |
    movl    %ecx, (%rbx,%rbp,4)                     // |  7  vv   v:    : :: |  0                  |  0        |
    movslq  %ecx, %rdx                              // |  8  :v^  ::    : :: |  0                  |  0        |
    movl    %ecx, %eax                              // |  9 ^:v:  ::    : :: |  0                  |  0        |
    movl    (%rbx,%rdx,4), %esi                     // |  9 :v v^ ::    : :: |  0                  |  0        |
    movl    %esi, %ecx                              // | 10 ::^:v ::    : :: |  0                  |  0        |
    cmpl    %edx, %esi                              // |  9 :: vv ::    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_34                                    // |  7 ::    ::    : :: |  0                  |  1  v     |
.LBB0_21:                                           // |                     |                     |           |
    movslq  4(%rbx,%rbp,4), %rcx                    // |  8 :v^   v:    : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_36:                                           // |                     |                     |           |
    movl    (%rbx,%rcx,4), %edx                     // |  9 :vv^  ::    : :: |  0                  |  0        |
    cmpl    %ecx, %edx                              // |  9 ::vv  ::    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_37                                    // |  8 :: :  ::    : :: |  0                  |  1  v     |
    movl    %edx, 4(%rbx,%rbp,4)                    // |  8 :v v  v:    : :: |  0                  |  0        |
    movslq  %edx, %rcx                              // |  9 ::^v  ::    : :: |  0                  |  0        |
    jmp .LBB0_36                                    // |  9 ::::  ::    : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_37:                                           // |                     |                     |           |
    movl    (%r15,%rcx,4), %esi                     // | 10 ::v:^ ::    : :v |  0                  |  0        |
    movslq  %eax, %rcx                              // | 10 v:^:: ::    : :: |  0                  |  0        |
    movl    (%r15,%rcx,4), %eax                     // | 10 ^:v:: ::    : :v |  0                  |  0        |
    testl   %r12d, %r12d                            // |  9 :: :: ::    v :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_38                                    // |  8 :: :: ::      :: |  0                  |  1  v     |
    cltd                                            // |  8 :: :: ::      :: |  0                  |  0        |
    idivl   %esi                                    // |  8 x: xx ::      :: |  0                  |  0        |
    jmp .LBB0_40                                    // |  6 ::    ::      :: |  0                  |  0        |
.LBB0_29:                                           // |                     |                     |           |
    cmpl    $0, 4(%rsp)                             // |  6 ::    :v      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_49                                    // |  6 ::    ::      :: |  0                  |  3  vvv   |
    xorl    %r13d, %r13d                            // |  7 ::    ::     ^:: |  0                  |  5 ^^^^^  |
    jmp .LBB0_31                                    // |  7 ::    ::     ::: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_47:                                           // |                     |                     |           |
    cltq                                            // |  7 ::    ::     ::: |  0                  |  0        |
    movl    %eax, 4(%rbx,%r13,4)                    // |  7 vv    ::     v:: |  0                  |  0        |
    incq    %r13                                    // |  7 ::    ::     x:: |  0                  |  5  ^^^^^ |
    movl    (%r15,%rcx,4), %ecx                     // |  8 ::^   ::     ::v |  0                  |  0        |
    movl    %ecx, %edx                              // |  9 ::v^  ::     ::: |  0                  |  0        |
    negl    %edx                                    // |  9 :::x  ::     ::: |  0                  |  0        |
    testl   %ebp, %ebp                              // |  8 :::   v:     ::: |  0                  |  6 ^^^^^^ |
    cmovel  %ecx, %edx                              // |  8 ::v^   :     ::: |  0                  |  0        |
    addl    %edx, (%r15,%rax,4)                     // |  7 v: v   :     ::v |  0                  |  6 ^^^^^^ |
    cmpq    %r14, %r13                              // |  5  :     :     vv: |  0                  |  6 ^^^^^^ |
    je  .LBB0_49                                    // |  5  :     :     ::: |  0                  |  1  v     |
.LBB0_31:                                           // |                     |                     |           |
    movq    8(%rsp), %rax                           // |  6 ^:     v     ::: |  0                  |  0        |
    movq    (%rax,%r13,8), %r12                     // |  7 v:     :    ^v:: |  0                  |  0        |
    movq    %r12, %rdi                              // |  8 ::   ^ :    v::: |  0                  |  0        |
    leaq    .L.str.3(%rip), %rsi                    // |  8 ::  ^  :    :::: |  0                  |  0        |
    callq   strcmp@PLT                              // |  7 ::     x    :::: |  0                  |  0        |
    movl    %eax, %ebp                              // |  8 v:    ^:    :::: |  0                  |  0        |
    testl   %eax, %eax                              // |  7 v:     :    :::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_42                                    // |  7 ::     :    :::: |  0                  |  1  v     |
    movq    %r12, %rdi                              // |  8 ::   ^ :    v::: |  0                  |  0        |
    leaq    .L.str.4(%rip), %rsi                    // |  7 ::  ^  :     ::: |  0                  |  0        |
    callq   strcmp@PLT                              // |  6 ::     x     ::: |  0                  |  0        |
    testl   %eax, %eax                              // |  6 v:     :     ::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_42                                    // |  5  :     :     ::: |  0                  |  1  v     |
    incq    %r13                                    // |  5  :     :     x:: |  0                  |  5  ^^^^^ |
    cmpq    %r14, %r13                              // |  5  :     :     vv: |  0                  |  6 ^^^^^^ |
    jne .LBB0_31                                    // |  4  :     :     : : |  0                  |  1  v     |
    jmp .LBB0_49                                    // |  4  :     :     : : |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_42:                                           // |                     |                     |           |
    movslq  (%rbx,%r13,4), %rax                     // |  5 ^v     :     v : |  0                  |  0        |
    movl    (%rbx,%rax,4), %ecx                     // |  6 vv^    :     : : |  0                  |  0        |
    cmpl    %eax, %ecx                              // |  6 v:v    :     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_43                                    // |  5  ::    :     : : |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_44:                                           // |                     |                     |           |
    movl    %ecx, (%rbx,%r13,4)                     // |  5  vv    :     v : |  0                  |  0        |
    movslq  %ecx, %rdx                              // |  6  :v^   :     : : |  0                  |  0        |
    movl    %ecx, %eax                              // |  7 ^:v:   :     : : |  0                  |  0        |
    movl    (%rbx,%rdx,4), %esi                     // |  6  v v^  :     : : |  0                  |  0        |
    movl    %esi, %ecx                              // |  7  :^:v  :     : : |  0                  |  0        |
    cmpl    %edx, %esi                              // |  6  : vv  :     : : |  0                  |  6 ^^^^^^ |
    jne .LBB0_44                                    // |  4  :     :     : : |  0                  |  1  v     |
.LBB0_43:                                           // |                     |                     |           |
    movslq  4(%rbx,%r13,4), %rcx                    // |  5  v^    :     v : |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_46:                                           // |                     |                     |           |
    movl    (%rbx,%rcx,4), %edx                     // |  6  vv^   :     : : |  0                  |  0        |
    cmpl    %ecx, %edx                              // |  6  :vv   :     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_47                                    // |  5  : :   :     : : |  0                  |  1  v     |
    movl    %edx, 4(%rbx,%r13,4)                    // |  5  v v   :     v : |  0                  |  0        |
    movslq  %edx, %rcx                              // |  5  :^v   :       : |  0                  |  0        |
    jmp .LBB0_46                                    // |  3  :     :       : |  0                  |  0        |
.LBB0_49:                                           // |                     |                     |           |
    movl    (%r15), %ebp                            // |  4  :    ^:       v |  0                  |  0        |
    movq    %r15, %rdi                              // |  5  :   ^::       v |  0                  |  0        |
    callq   free@PLT                                // |  3  :    :x         |  0                  |  0        |
    movq    %rbx, %rdi                              // |  4  v   ^::         |  0                  |  0        |
    callq   free@PLT                                // |  2       :x         |  0                  |  0        |
    movl    %ebp, %eax                              // |  3 ^     v:         |  0                  |  0        |
    addq    $24, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "**"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "*"                                     // |                     |                     |           |
    .size   .L.str.1, 2                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "                                       // |                     |                     |           |
    .size   .L.str.2, 3                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "+"                                     // |                     |                     |           |
    .size   .L.str.3, 2                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "-"                                     // |                     |                     |           |
    .size   .L.str.4, 2                             // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
