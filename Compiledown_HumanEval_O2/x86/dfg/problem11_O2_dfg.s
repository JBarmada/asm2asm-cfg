                                                  // +---------------------+---------------------+-----------+
                                                  // |         GPR         |        VECTOR       |   FLAGS   |
                                                  // |                     |                     |           |
                                                  // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                  // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                  // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                  // |                     |    0123456789111111 |           |
                                                  // |  #                  |  #           012345 |  #        |
                                                  // +---------------------+---------------------+-----------+
    .text                                         // |                     |                     |           |
    .file   "code.c"                              // |                     |                     |           |
    .globl  func0                                 // |                     |                     |           |
    .p2align    4, 0x90                           // |                     |                     |           |
    .type   func0,@function                       // |                     |                     |           |
func0:                                            // |                     |                     |           |
    .cfi_startproc                                // |                     |                     |           |
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    subq    $72, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 128                       // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rdi, %r14                            // |  3      v :      ^  |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x      :  |  0                  |  0        |
    movq    %rax, 16(%rsp)                        // |  3 v      v      :  |  0                  |  0        |
    cltq                                          // |  2        :      :  |  0                  |  0        |
    addq    %rax, %rax                            // |  3 x      :      :  |  0                  |  6 ^^^^^^ |
    movq    %rax, 8(%rsp)                         // |  3 v      v      :  |  0                  |  0        |
    incl    %eax                                  // |  3 x      :      :  |  0                  |  5  ^^^^^ |
    movslq  %eax, %rdi                            // |  4 v    ^ :      :  |  0                  |  0        |
    callq   malloc@PLT                            // |  3 :      x      :  |  0                  |  0        |
    movq    %rax, %rdi                            // |  4 v    ^ :      :  |  0                  |  0        |
    testq   %rax, %rax                            // |  4 v    : :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_46                                  // |  3      : :      :  |  0                  |  1  v     |
    movq    16(%rsp), %rax                        // |  4 ^    : v      :  |  0                  |  0        |
    movslq  %eax, %rdx                            // |  5 v  ^ : :      :  |  0                  |  0        |
    testl   %eax, %eax                            // |  4 v    : :      :  |  0                  |  6 ^^^^^^ |
    movq    %rdi, (%rsp)                          // |  4 :    v v      :  |  0                  |  3  :::   |
    jle .LBB0_2                                   // |  4 :    : :      :  |  0                  |  3  vvv   |
    movabsq $-4294967296, %r13                    // |  5 :    : :     ^:  |  0                  |  0        |
    movq    %rax, %rcx                            // |  6 v ^  : :     ::  |  0                  |  0        |
    shlq    $32, %rcx                             // |  6 : x  : :     ::  |  0                  |  5 ^^^^^  |
    movslq  %eax, %r10                            // |  7 v :  : :  ^  ::  |  0                  |  0        |
    movl    %r10d, %r9d                           // |  7   :  : : ^v  ::  |  0                  |  0        |
    movq    %rcx, 32(%rsp)                        // |  7   v  : v ::  ::  |  0                  |  0        |
    leaq    (%rcx,%r13), %rax                     // |  8 ^ v  : : ::  v:  |  0                  |  0        |
    movq    %rax, 48(%rsp)                        // |  7 v    : v ::  ::  |  0                  |  0        |
    leaq    16(%rdi,%r10), %rax                   // |  7 ^    v : :v  ::  |  0                  |  0        |
    movq    %rax, 40(%rsp)                        // |  7 v    : v ::  ::  |  0                  |  0        |
    leaq    (%rdi,%r10), %rax                     // |  7 ^    v : :v  ::  |  0                  |  0        |
    movq    %rax, 24(%rsp)                        // |  6 v      v ::  ::  |  0                  |  0        |
    xorl    %r15d, %r15d                          // |  6        : ::  ::^ |  0                  |  5 ^^^^^  |
    movq    %r14, %r12                            // |  7        : :: ^:v: |  0                  |  0        |
    movq    %r9, 64(%rsp)                         // |  7        v v: :::: |  0                  |  0        |
    movq    %r10, 56(%rsp)                        // |  6        v  v :::: |  0                  |  0        |
    jmp .LBB0_4                                   // |  6        :  : :::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_24:                                         // |                     |                     |           |
    leaq    (%r15,%r10), %rax                     // |  7 ^      :  v :::v |  0                  |  0        |
    movq    (%rsp), %rdi                          // |  8 :    ^ v  : :::: |  0                  |  0        |
    movb    $0, (%rdi,%rax)                       // |  8 v    v :  : :::: |  0                  |  0        |
    testb   %bl, %bl                              // |  7  v     :  : :::: |  0                  |  6 ^^^^^^ |
    movq    64(%rsp), %r9                         // |  7        v ^: :::: |  0                  |  1  :     |
    movq    %rbp, %rdx                            // |  9    ^  v: :: :::: |  0                  |  1  :     |
    je  .LBB0_46                                  // |  8    :   : :: :::: |  0                  |  1  v     |
.LBB0_25:                                         // |                     |                     |           |
    incq    %r15                                  // |  8    :   : :: :::x |  0                  |  5  ^^^^^ |
    incq    %r12                                  // |  8    :   : :: x::: |  0                  |  5  ^^^^^ |
    cmpq    %r9, %r15                             // |  8    :   : v: :::v |  0                  |  6 ^^^^^^ |
    je  .LBB0_26                                  // |  7    :   :  : :::: |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movq    %r10, %rcx                            // |  8   ^:   :  v :::: |  0                  |  0        |
    subq    %r15, %rcx                            // |  7   x:   :    :::v |  0                  |  6 ^^^^^^ |
    cmpq    $2, %rcx                              // |  7   v:   :    :::: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                   // |  7   ::   :    :::: |  0                  |  2   vv   |
    movl    %ecx, %eax                            // |  8 ^ v:   :    :::: |  0                  |  0        |
    shrl    $31, %eax                             // |  8 x ::   :    :::: |  0                  |  5 ^^^^^  |
    addl    %ecx, %eax                            // |  8 x v:   :    :::: |  0                  |  6 ^^^^^^ |
    sarl    %eax                                  // |  7 x  :   :    :::: |  0                  |  5 ^^^^^  |
    movslq  %eax, %r8                             // |  8 v  :   :^   :::: |  0                  |  0        |
    movq    48(%rsp), %rbp                        // |  9 :  :  ^v:   :::: |  0                  |  0        |
    xorl    %ebx, %ebx                            // | 10 :^ :  :::   :::: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    movzbl  (%r12,%rbx), %ecx                     // | 11 :v^:  :::   v::: |  0                  |  0        |
    movq    %rbp, %rsi                            // | 12 ::::^ v::   :::: |  0                  |  0        |
    sarq    $32, %rsi                             // | 12 ::::^ :::   :::: |  0                  |  5 ^^^^^  |
    cmpb    (%r14,%rsi), %cl                      // | 12 ::v:v :::   ::v: |  0                  |  6 ^^^^^^ |
    jne .LBB0_25                                  // | 10 :: :  :::   :::: |  0                  |  1  v     |
    incq    %rbx                                  // | 10 :x :  :::   :::: |  0                  |  5  ^^^^^ |
    addq    %r13, %rbp                            // | 10 :: :  x::   :v:: |  0                  |  6 ^^^^^^ |
    cmpq    %rbx, %rax                            // |  8 vv :   ::   : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  7  : :   ::   : :: |  0                  |  1  v     |
    cmpq    %r8, %rbx                             // |  7  v :   :v   : :: |  0                  |  6 ^^^^^^ |
    setl    %bl                                   // |  6  x :   :    : :: |  0                  |  2   vv   |
    jmp .LBB0_10                                  // |  5    :   :    : :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    xorl    %ebx, %ebx                            // |  6  ^ :   :    : :: |  0                  |  5 ^^^^^  |
.LBB0_10:                                         // |                     |                     |           |
    movq    %r14, %rsi                            // |  6    :^  :    : v: |  0                  |  0        |
    movq    %rdx, %rbp                            // |  6    v  ^:    : :: |  0                  |  0        |
    callq   strncpy@PLT                           // |  4        x    : :: |  0                  |  0        |
    testq   %r15, %r15                            // |  4        :    : :v |  0                  |  6 ^^^^^^ |
    movq    56(%rsp), %r10                        // |  5        v  ^ : :: |  0                  |  1  :     |
    pxor    %xmm3, %xmm3                          // |  4        :    : :: |  1    ^             |  1  :     |
    je  .LBB0_24                                  // |  4        :    : :: |  1    :             |  1  v     |
    cmpq    $8, %r15                              // |  4        :    : :v |  1    :             |  6 ^^^^^^ |
    jae .LBB0_13                                  // |  4        :    : :: |  1    :             |  1 v      |
    xorl    %eax, %eax                            // |  5 ^      :    : :: |  1    :             |  5 ^^^^^  |
    jmp .LBB0_22                                  // |  4        :    : :: |  1    :             |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    cmpq    $32, %r15                             // |  4        :    : :v |  1    :             |  6 ^^^^^^ |
    jae .LBB0_15                                  // |  4        :    : :: |  1    :             |  1 v      |
    xorl    %eax, %eax                            // |  5 ^      :    : :: |  1    :             |  5 ^^^^^  |
    jmp .LBB0_19                                  // |  4        :    : :: |  1    :             |  0        |
.LBB0_15:                                         // |                     |                     |           |
    movq    %r15, %rcx                            // |  5   ^    :    : :v |  1    :             |  0        |
    andq    $-32, %rcx                            // |  5   x    :    : :: |  1    :             |  5 ^^^^^  |
    negq    %rcx                                  // |  5   x    :    : :: |  1    :             |  0        |
    movq    %r15, %rax                            // |  6 ^ :    :    : :v |  1    :             |  0        |
    movabsq $9223372036854775776, %rdx            // |  7 : :^   :    : :: |  1    :             |  0        |
    andq    %rdx, %rax                            // |  7 x :v   :    : :: |  1    :             |  5 ^^^^^  |
    movq    40(%rsp), %rdx                        // |  7 : :^   v    : :: |  1    :             |  0        |
    xorl    %esi, %esi                            // |  8 : ::^  :    : :: |  1    :             |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_16:                                         // |                     |                     |           |
    movdqu  -32(%r12,%rsi), %xmm0                 // |  8 : ::v  :    v :: |  2 ^  :             |  0        |
    movdqu  -16(%r12,%rsi), %xmm1                 // |  8 : ::v  :    v :: |  3 :^ :             |  0        |
    movdqa  %xmm1, %xmm2                          // |  8 : :::  :    : :: |  4 :v^:             |  0        |
    punpcklbw   %xmm3, %xmm2                      // |  8 : :::  :    : :: |  3 : ^v             |  0        |
    pshufd  $78, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    pshuflw $27, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    pshufhw $27, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    punpckhbw   %xmm3, %xmm1                      // |  8 : :::  :    : :: |  4 :^:v             |  0        |
    pshufd  $78, %xmm1, %xmm1                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    pshuflw $27, %xmm1, %xmm1                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    pshufhw $27, %xmm1, %xmm1                     // |  8 : :::  :    : :: |  3 : ::             |  0        |
    packuswb    %xmm2, %xmm1                      // |  8 : :::  :    : :: |  4 :^v:             |  0        |
    movdqa  %xmm0, %xmm2                          // |  8 : :::  :    : :: |  4 v:^:             |  0        |
    punpcklbw   %xmm3, %xmm2                      // |  8 : :::  :    : :: |  3  :^v             |  0        |
    pshufd  $78, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    pshuflw $27, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    pshufhw $27, %xmm2, %xmm2                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    punpckhbw   %xmm3, %xmm0                      // |  8 : :::  :    : :: |  4 ^::v             |  0        |
    pshufd  $78, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    pshuflw $27, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    pshufhw $27, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  3  :::             |  0        |
    packuswb    %xmm2, %xmm0                      // |  8 : :::  :    : :: |  4 ^:v:             |  0        |
    movdqu  %xmm1, -16(%rdx)                      // |  8 : :v:  :    : :: |  3 :v :             |  0        |
    movdqu  %xmm0, (%rdx)                         // |  8 : :v:  :    : :: |  2 v  :             |  0        |
    addq    $-32, %rsi                            // |  8 : ::x  :    : :: |  1    :             |  6 ^^^^^^ |
    addq    $32, %rdx                             // |  8 : :x:  :    : :: |  1    :             |  6 ^^^^^^ |
    cmpq    %rsi, %rcx                            // |  7 : v v  :    : :: |  1    :             |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  5 :      :    : :: |  1    :             |  1  v     |
    cmpq    %rax, %r15                            // |  5 v      :    : :v |  1    :             |  6 ^^^^^^ |
    je  .LBB0_24                                  // |  5 :      :    : :: |  1    :             |  1  v     |
    testb   $24, %r15b                            // |  5 :      :    : :v |  1    :             |  6 ^^^^^^ |
    je  .LBB0_22                                  // |  5 :      :    : :: |  1    :             |  1  v     |
.LBB0_19:                                         // |                     |                     |           |
    movq    %rax, %rcx                            // |  6 v ^    :    : :: |  1    :             |  0        |
    movq    %r15, %rdx                            // |  6   :^   :    : :v |  1    :             |  0        |
    andq    $-8, %rdx                             // |  6   :x   :    : :: |  1    :             |  5 ^^^^^  |
    negq    %rdx                                  // |  6   :x   :    : :: |  1    :             |  0        |
    movabsq $9223372036854775776, %rax            // |  7 ^ ::   :    : :: |  1    :             |  0        |
    addq    $24, %rax                             // |  7 x ::   :    : :: |  1    :             |  6 ^^^^^^ |
    andq    %r15, %rax                            // |  7 x ::   :    : :v |  1    :             |  5 ^^^^^  |
    movq    24(%rsp), %rsi                        // |  8 : ::^  v    : :: |  1    :             |  0        |
    addq    %rcx, %rsi                            // |  8 : v:x  :    : :: |  1    :             |  6 ^^^^^^ |
    negq    %rcx                                  // |  8 : x::  :    : :: |  1    :             |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_20:                                         // |                     |                     |           |
    movq    -8(%r12,%rcx), %xmm0                  // |  8 : v::  :    v :: |  2 ^  :             |  0        |
    punpcklbw   %xmm3, %xmm0                      // |  8 : :::  :    : :: |  2 ^  v             |  0        |
    pshufd  $78, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  0                  |  0        |
    pshuflw $27, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  0                  |  0        |
    pshufhw $27, %xmm0, %xmm0                     // |  8 : :::  :    : :: |  0                  |  0        |
    packuswb    %xmm0, %xmm0                      // |  8 : :::  :    : :: |  1 ^                |  0        |
    movq    %xmm0, (%rsi)                         // |  8 : ::v  :    : :: |  1 v                |  0        |
    addq    $-8, %rcx                             // |  8 : x::  :    : :: |  0                  |  6 ^^^^^^ |
    addq    $8, %rsi                              // |  8 : ::x  :    : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %rdx                            // |  7 : vv   :    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_20                                  // |  5 :      :    : :: |  0                  |  1  v     |
    cmpq    %rax, %r15                            // |  5 v      :    : :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_24                                  // |  5 :      :    : :: |  0                  |  1  v     |
.LBB0_22:                                         // |                     |                     |           |
    movq    24(%rsp), %rcx                        // |  6 : ^    v    : :: |  0                  |  0        |
    addq    %rax, %rcx                            // |  6 v x    :    : :: |  0                  |  6 ^^^^^^ |
    negq    %rax                                  // |  6 x :    :    : :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_23:                                         // |                     |                     |           |
    movzbl  -1(%r12,%rax), %edx                   // |  7 v :^   :    v :: |  0                  |  0        |
    movb    %dl, (%rcx)                           // |  6 : vv   :      :: |  0                  |  0        |
    incq    %rcx                                  // |  5 : x    :      :: |  0                  |  5  ^^^^^ |
    decq    %rax                                  // |  4 x      :      :: |  0                  |  5  ^^^^^ |
    movq    %r15, %rdx                            // |  5 :  ^   :      :v |  0                  |  0        |
    addq    %rax, %rdx                            // |  4 v  x   :      :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_23                                  // |  2        :      :  |  0                  |  1  v     |
    jmp .LBB0_24                                  // |  2        :      :  |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    movq    %r14, %rsi                            // |  3     ^  :      v  |  0                  |  0        |
    callq   strncpy@PLT                           // |  2        x      :  |  0                  |  0        |
    movq    (%rsp), %rdi                          // |  3      ^ v      :  |  0                  |  0        |
    movq    8(%rsp), %r9                          // |  3        v ^    :  |  0                  |  0        |
    jmp .LBB0_45                                  // |  3        : :    :  |  0                  |  0        |
.LBB0_26:                                         // |                     |                     |           |
    movq    %r14, %rsi                            // |  4     ^  : :    v  |  0                  |  0        |
    movq    %r9, %rbx                             // |  4  ^     : v    :  |  0                  |  0        |
    callq   strncpy@PLT                           // |  3  :     x      :  |  0                  |  0        |
    movq    (%rsp), %rdi                          // |  4  :   ^ v      :  |  0                  |  0        |
    movq    16(%rsp), %r11                        // |  5  :   : v   ^  :  |  0                  |  0        |
    testl   %r11d, %r11d                          // |  5  :   : :   v  :  |  0                  |  6 ^^^^^^ |
    movq    8(%rsp), %r9                          // |  6  :   : v ^ :  :  |  0                  |  3  :::   |
    jle .LBB0_45                                  // |  6  :   : : : :  :  |  0                  |  3  vvv   |
    movslq  %r11d, %r8                            // |  7  :   : :^: v  :  |  0                  |  0        |
    cmpl    $8, %ebx                              // |  7  v   : ::: :  :  |  0                  |  6 ^^^^^^ |
    movq    %rbx, %r15                            // |  8  v   : ::: :  :^ |  0                  |  1 :      |
    jae .LBB0_29                                  // |  7      : ::: :  :: |  0                  |  1 v      |
    xorl    %r10d, %r10d                          // |  8      : :::^:  :: |  0                  |  5 ^^^^^  |
.LBB0_40:                                         // |                     |                     |           |
    movl    %r11d, %eax                           // |  9 ^    : ::::v  :: |  0                  |  0        |
    subl    %r10d, %eax                           // |  9 x    : :::v:  :: |  0                  |  6 ^^^^^^ |
    leaq    1(%r10), %rdx                         // | 10 :  ^ : :::v:  :: |  0                  |  0        |
    testb   $1, %al                               // | 10 v  : : :::::  :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_42                                  // |  9    : : :::::  :: |  0                  |  1  v     |
    movl    %r10d, %eax                           // | 10 ^  : : :::v:  :: |  0                  |  0        |
    notl    %eax                                  // | 10 x  : : :::::  :: |  0                  |  0        |
    addl    %r11d, %eax                           // | 10 x  : : ::::v  :: |  0                  |  6 ^^^^^^ |
    cltq                                          // |  9    : : :::::  :: |  0                  |  0        |
    movzbl  (%r14,%rax), %eax                     // | 10 ^  : : :::::  v: |  0                  |  0        |
    addq    %r8, %r10                             // | 10 :  : : :v:x:  :: |  0                  |  6 ^^^^^^ |
    movb    %al, (%rdi,%r10)                      // | 10 v  : v :::v:  :: |  0                  |  0        |
    movq    %rdx, %r10                            // |  9    v : :::^:  :: |  0                  |  0        |
.LBB0_42:                                         // |                     |                     |           |
    cmpq    %rdx, %r15                            // |  9    v : :::::  :v |  0                  |  6 ^^^^^^ |
    je  .LBB0_45                                  // |  8      : :::::  :: |  0                  |  1  v     |
    movabsq $-8589934592, %rdx                    // |  9    ^ : :::::  :: |  0                  |  0        |
    movl    %r11d, %esi                           // | 10    :^: ::::v  :: |  0                  |  0        |
    subl    %r10d, %esi                           // | 10    :x: :::v:  :: |  0                  |  6 ^^^^^^ |
    addl    $-2, %esi                             // | 10    :x: :::::  :: |  0                  |  6 ^^^^^^ |
    shlq    $32, %rsi                             // | 10    :x: :::::  :: |  0                  |  5 ^^^^^  |
    movl    %r10d, %ebp                           // | 11    :::^:::v:  :: |  0                  |  0        |
    notl    %ebp                                  // | 11    :::x:::::  :: |  0                  |  0        |
    addl    %r11d, %ebp                           // | 11    :::x::::v  :: |  0                  |  6 ^^^^^^ |
    shlq    $32, %rbp                             // | 11    :::x:::::  :: |  0                  |  5 ^^^^^  |
    leaq    (%r8,%rdi), %rax                      // | 12 ^  ::v::v:::  :: |  0                  |  0        |
    incq    %rax                                  // | 12 x  :::::::::  :: |  0                  |  5  ^^^^^ |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_44:                                         // |                     |                     |           |
    movq    %rbp, %rcx                            // | 13 : ^:::v:::::  :: |  0                  |  0        |
    sarq    $32, %rcx                             // | 13 : ^:::::::::  :: |  0                  |  5 ^^^^^  |
    movzbl  (%r14,%rcx), %ebx                     // | 14 :^v:::::::::  v: |  0                  |  0        |
    movb    %bl, -1(%rax,%r10)                    // | 13 vv :::::::v:  :: |  0                  |  0        |
    movq    %rsi, %rcx                            // | 13 : ^:v:::::::  :: |  0                  |  0        |
    sarq    $32, %rcx                             // | 13 : ^:::::::::  :: |  0                  |  5 ^^^^^  |
    movzbl  (%r14,%rcx), %ebx                     // | 14 :^v:::::::::  v: |  0                  |  0        |
    movb    %bl, (%rax,%r10)                      // | 12 vv :::::::v:   : |  0                  |  0        |
    addq    $2, %r10                              // | 10    :::::::x:   : |  0                  |  6 ^^^^^^ |
    addq    %rdx, %rsi                            // | 10    vx:::::::   : |  0                  |  6 ^^^^^^ |
    addq    %rdx, %rbp                            // |  9    v :x:::::   : |  0                  |  6 ^^^^^^ |
    cmpq    %r10, %r15                            // |  7      : :::v:   v |  0                  |  6 ^^^^^^ |
    jne .LBB0_44                                  // |  5      : ::: :     |  0                  |  1  v     |
.LBB0_45:                                         // |                     |                     |           |
    movb    $0, (%rdi,%r9)                        // |  5      v ::v :     |  0                  |  0        |
.LBB0_46:                                         // |                     |                     |           |
    movq    %rdi, %rax                            // |  5 ^    v ::  :     |  0                  |  0        |
    addq    $72, %rsp                             // |  4      : x:  :     |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  5  ^   : x:  :     |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  6  :   : x:  :^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  6  :   : x:  : ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  7  :   : x:  : :^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  8  :   : x:  : ::^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  9  :   :^x:  : ::: |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  8  :   : x:  : ::: |  0                  |  0        |
.LBB0_29:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 128                       // |                     |                     |           |
    leaq    -1(%rbx), %rdx                        // |  9  v ^ : ::  : ::: |  0                  |  0        |
    leal    -1(%r11), %esi                        // |  9    :^: ::  v ::: |  0                  |  0        |
    movl    %esi, %eax                            // | 10 ^  :v: ::  : ::: |  0                  |  0        |
    subl    %edx, %eax                            // | 10 x  v:: ::  : ::: |  0                  |  6 ^^^^^^ |
    xorl    %r10d, %r10d                          // | 11 :  ::: :: ^: ::: |  0                  |  5 ^^^^^  |
    cmpl    %esi, %eax                            // | 10 v  :v: ::  : ::: |  0                  |  6 ^^^^^^ |
    jg  .LBB0_40                                  // |  8    : : ::  : ::: |  0                  |  3  vvv   |
    shrq    $32, %rdx                             // |  8    x : ::  : ::: |  0                  |  5 ^^^^^  |
    jne .LBB0_40                                  // |  7      : ::  : ::: |  0                  |  1  v     |
    movq    %r15, %rax                            // |  8 ^    : ::  : ::v |  0                  |  0        |
    cmpl    $32, %eax                             // |  8 v    : ::  : ::: |  0                  |  6 ^^^^^^ |
    movq    %r15, %r10                            // |  8      : :: ^: ::v |  0                  |  1 :      |
    jae .LBB0_33                                  // |  8      : :: :: ::: |  0                  |  1 v      |
    movq    %r10, %rax                            // |  9 ^    : :: v: ::: |  0                  |  0        |
    xorl    %r10d, %r10d                          // |  8      : :: ^: ::: |  0                  |  5 ^^^^^  |
    jmp .LBB0_37                                  // |  8      : :: :: ::: |  0                  |  0        |
.LBB0_33:                                         // |                     |                     |           |
    movl    %r11d, %edx                           // |  9    ^ : :: :v ::: |  0                  |  0        |
    andl    $31, %edx                             // |  9    x : :: :: ::: |  0                  |  5 ^^^^^  |
    subq    %rdx, %r10                            // |  9    v : :: x: ::: |  0                  |  6 ^^^^^^ |
    movq    32(%rsp), %rbp                        // | 10    : :^v: :: ::: |  0                  |  0        |
    addq    %r13, %rbp                            // |  9    : :x : :: v:: |  0                  |  6 ^^^^^^ |
    leaq    (%r8,%rdi), %rsi                      // |  9    :^v: v ::  :: |  0                  |  0        |
    addq    $16, %rsi                             // |  9    :x:: : ::  :: |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // | 10   ^:::: : ::  :: |  0                  |  5 ^^^^^  |
    pxor    %xmm0, %xmm0                          // | 10   ::::: : ::  :: |  1 ^                |  0        |
    movabsq $-137438953472, %rax                  // | 11 ^ ::::: : ::  :: |  1 :                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_34:                                         // |                     |                     |           |
    movq    %rbp, %rbx                            // | 12 :^::::v : ::  :: |  1 :                |  0        |
    sarq    $32, %rbx                             // | 12 :^::::: : ::  :: |  1 :                |  5 ^^^^^  |
    movdqu  -31(%r14,%rbx), %xmm1                 // | 12 :v::::: : ::  v: |  2 :^               |  0        |
    movdqu  -15(%r14,%rbx), %xmm2                 // | 12 :v::::: : ::  v: |  3 ::^              |  0        |
    movdqa  %xmm2, %xmm3                          // | 11 : ::::: : ::  :: |  4 ::v^             |  0        |
    punpcklbw   %xmm0, %xmm3                      // | 11 : ::::: : ::  :: |  3 v: ^             |  0        |
    pshufd  $78, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    pshuflw $27, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    pshufhw $27, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    punpckhbw   %xmm0, %xmm2                      // | 11 : ::::: : ::  :: |  4 v:^:             |  0        |
    pshufd  $78, %xmm2, %xmm2                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    pshuflw $27, %xmm2, %xmm2                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    pshufhw $27, %xmm2, %xmm2                     // | 11 : ::::: : ::  :: |  3 :: :             |  0        |
    packuswb    %xmm3, %xmm2                      // | 11 : ::::: : ::  :: |  4 ::^v             |  0        |
    movdqa  %xmm1, %xmm3                          // | 11 : ::::: : ::  :: |  4 :v:^             |  0        |
    punpcklbw   %xmm0, %xmm3                      // | 11 : ::::: : ::  :: |  3 v :^             |  0        |
    pshufd  $78, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 : ::             |  0        |
    pshuflw $27, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 : ::             |  0        |
    pshufhw $27, %xmm3, %xmm3                     // | 11 : ::::: : ::  :: |  3 : ::             |  0        |
    punpckhbw   %xmm0, %xmm1                      // | 11 : ::::: : ::  :: |  4 v^::             |  0        |
    pshufd  $78, %xmm1, %xmm1                     // | 11 : ::::: : ::  :: |  2   ::             |  0        |
    pshuflw $27, %xmm1, %xmm1                     // | 11 : ::::: : ::  :: |  2   ::             |  0        |
    pshufhw $27, %xmm1, %xmm1                     // | 11 : ::::: : ::  :: |  2   ::             |  0        |
    packuswb    %xmm3, %xmm1                      // | 11 : ::::: : ::  :: |  3  ^:v             |  0        |
    movdqu  %xmm2, -16(%rsi,%rcx)                 // | 11 : v:v:: : ::  :: |  2  :v              |  0        |
    movdqu  %xmm1, (%rsi,%rcx)                    // | 11 : v:v:: : ::  :: |  1  v               |  0        |
    addq    $32, %rcx                             // | 10 : x: :: : ::  :: |  0                  |  6 ^^^^^^ |
    addq    %rax, %rbp                            // | 10 v :: :x : ::  :: |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %r10                            // |  8   v: :  : v:  :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_34                                  // |  7    : :  : ::  :: |  0                  |  1  v     |
    testq   %rdx, %rdx                            // |  7    v :  : ::  :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_45                                  // |  7    : :  : ::  :: |  0                  |  1  v     |
    movq    %r15, %rax                            // |  8 ^  : :  : ::  :v |  0                  |  0        |
    cmpl    $8, %edx                              // |  7 :  v :  : ::  :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_40                                  // |  6 :    :  : ::  :  |  0                  |  1 v      |
.LBB0_37:                                         // |                     |                     |           |
    movq    %r10, %rsi                            // |  7 :   ^:  : v:  :  |  0                  |  0        |
    movl    %r11d, %ebp                           // |  7 :   ::^ :  v  :  |  0                  |  0        |
    andl    $7, %ebp                              // |  7 :   ::x :  :  :  |  0                  |  5 ^^^^^  |
    movq    %rax, %r10                            // |  8 v   ::: : ^:  :  |  0                  |  0        |
    subq    %rbp, %r10                            // |  7     ::v : x:  :  |  0                  |  6 ^^^^^^ |
    movl    %esi, %eax                            // |  8 ^   v:: : ::  :  |  0                  |  0        |
    notl    %eax                                  // |  8 x   ::: : ::  :  |  0                  |  0        |
    addl    %r11d, %eax                           // |  8 x   ::: : :v  :  |  0                  |  6 ^^^^^^ |
    shlq    $32, %rax                             // |  7 x   ::: : :   :  |  0                  |  5 ^^^^^  |
    leaq    (%rdi,%r8), %rcx                      // |  8 : ^ :v: v :   :  |  0                  |  0        |
    pxor    %xmm0, %xmm0                          // |  6 : : : :   :   :  |  1 ^                |  0        |
    movabsq $-34359738368, %rbx                   // |  7 :^: : :   :   :  |  1 :                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_38:                                         // |                     |                     |           |
    movq    %rax, %rdx                            // |  8 v::^: :   :   :  |  1 :                |  0        |
    sarq    $32, %rdx                             // |  8 :::^: :   :   :  |  1 :                |  5 ^^^^^  |
    movq    -7(%r14,%rdx), %xmm1                  // |  8 :::v: :   :   v  |  2 :^               |  0        |
    punpcklbw   %xmm0, %xmm1                      // |  6 ::: : :   :      |  2 v^               |  0        |
    pshufd  $78, %xmm1, %xmm1                     // |  6 ::: : :   :      |  0                  |  0        |
    pshuflw $27, %xmm1, %xmm1                     // |  6 ::: : :   :      |  0                  |  0        |
    pshufhw $27, %xmm1, %xmm1                     // |  6 ::: : :   :      |  0                  |  0        |
    packuswb    %xmm1, %xmm1                      // |  6 ::: : :   :      |  1  ^               |  0        |
    movq    %xmm1, (%rcx,%rsi)                    // |  6 ::v v :   :      |  1  v               |  0        |
    addq    $8, %rsi                              // |  5 ::  x :   :      |  0                  |  6 ^^^^^^ |
    addq    %rbx, %rax                            // |  5 xv  : :   :      |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %r10                            // |  3     v :   v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_38                                  // |  1       :          |  0                  |  1  v     |
    testq   %rbp, %rbp                            // |  1       v          |  0                  |  6 ^^^^^^ |
    jne .LBB0_40                                  // |  0                  |  0                  |  1  v     |
    jmp .LBB0_45                                  // |  0                  |  0                  |  0        |
.Lfunc_end0:                                      // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0              // |                     |                     |           |
    .cfi_endproc                                  // |                     |                     |           |
    .ident  "clang version 15.0.4"                // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits    // |                     |                     |           |
    .addrsig                                      // |                     |                     |           |
                                                  // +.....................+.....................+...........+
                                                  // Legend:
                                                  //     ^       : Register assignment (write)
                                                  //     v       : Register usage (read)
                                                  //     x       : Register usage and reassignment (R/W)
                                                  //     :       : Register in use (live)
                                                  //     <space> : Register not in use
                                                  //     #       : Number of occupied registers
