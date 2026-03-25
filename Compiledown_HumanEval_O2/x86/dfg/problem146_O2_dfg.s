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
    .long   4294967200                              // |                     |                     |           |
    .long   4294967200                              // |                     |                     |           |
    .long   4294967200                              // |                     |                     |           |
    .long   4294967200                              // |                     |                     |           |
.LCPI0_1:                                           // |                     |                     |           |
    .long   4294967248                              // |                     |                     |           |
    .long   4294967248                              // |                     |                     |           |
    .long   4294967248                              // |                     |                     |           |
    .long   4294967248                              // |                     |                     |           |
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
    movl    %esi, %r14d                             // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %rbx                              // |  4  ^   v :      :  |  0                  |  0        |
    movslq  %esi, %r15                              // |  5  :  v  :      :^ |  0                  |  0        |
    leaq    (,%r15,4), %rdi                         // |  5  :   ^ :      :v |  0                  |  0        |
    callq   malloc@PLT                              // |  4  :     x      :: |  0                  |  0        |
    movq    %rax, %rbp                              // |  6 v:    ^:      :: |  0                  |  0        |
    testl   %r15d, %r15d                            // |  5  :    ::      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_22                                    // |  4  :    ::      :  |  0                  |  3  vvv   |
    movl    %r14d, %r13d                            // |  5  :    ::     ^v  |  0                  |  0        |
    leaq    12(%rsp), %r12                          // |  6  :    :v    ^::  |  0                  |  0        |
    xorl    %r15d, %r15d                            // |  7  :    ::    :::^ |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                     // |  7  :    ::    :::: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_20:                                           // |                     |                     |           |
    movsbl  12(%rsp), %eax                          // |  8 ^:    :v    :::: |  0                  |  0        |
    movl    %edx, %ecx                              // | 10 ::^v  ::    :::: |  0                  |  0        |
    subl    %eax, %ecx                              // |  9 v:x   ::    :::: |  0                  |  6 ^^^^^^ |
    addl    $48, %ecx                               // |  8  :x   ::    :::: |  0                  |  6 ^^^^^^ |
    cmpl    $0, (%rbx,%r15,4)                       // |  8  v:   ::    :::v |  0                  |  6 ^^^^^^ |
    leal    -48(%rdx,%rax), %eax                    // | 10 ^::v  ::    :::: |  0                  |  0        |
    cmovlel %ecx, %eax                              // |  9 ^:v   ::    :::: |  0                  |  0        |
    movl    %eax, (%rbp,%r15,4)                     // |  8 v:    v:    :::v |  0                  |  0        |
    incq    %r15                                    // |  7  :    ::    :::x |  0                  |  5  ^^^^^ |
    cmpq    %r13, %r15                              // |  7  :    ::    :v:v |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                     // |  7  :    ::    :::: |  0                  |  1  v     |
.LBB0_2:                                            // |                     |                     |           |
    movl    (%rbx,%r15,4), %eax                     // |  8 ^v    ::    :::v |  0                  |  0        |
    movl    %eax, %edx                              // |  8 v: ^  ::    :::  |  0                  |  0        |
    negl    %edx                                    // |  8 :: x  ::    :::  |  0                  |  0        |
    cmovsl  %eax, %edx                              // |  8 v: ^  ::    :::  |  0                  |  0        |
    movq    %r12, %rdi                              // |  7  :   ^::    v::  |  0                  |  0        |
    leaq    .L.str(%rip), %rsi                      // |  7  :  ^ ::    :::  |  0                  |  0        |
    xorl    %eax, %eax                              // |  7 ^:    ::    :::  |  0                  |  5 ^^^^^  |
    callq   sprintf@PLT                             // |  7 ::    :x    :::  |  0                  |  0        |
    movq    %r12, %rdi                              // |  8 ::   ^::    v::  |  0                  |  0        |
    callq   strlen@PLT                              // |  6 ::    :x     ::  |  0                  |  0        |
    movl    $0, %edx                                // |  7 :: ^  ::     ::  |  0                  |  0        |
    cmpl    $2, %eax                                // |  6 v:    ::     ::  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_20                                    // |  5  :    ::     ::  |  0                  |  2   vv   |
    movl    %eax, %eax                              // |  6 ^:    ::     ::  |  0                  |  0        |
    leaq    -1(%rax), %r8                           // |  7 v:    ::^    ::  |  0                  |  0        |
    cmpq    $8, %r8                                 // |  7 ::    ::v    ::  |  0                  |  6 ^^^^^^ |
    jae .LBB0_11                                    // |  7 ::    :::    ::  |  0                  |  1 v      |
    xorl    %edx, %edx                              // |  8 :: ^  :::    ::  |  0                  |  5 ^^^^^  |
    movl    $1, %ecx                                // |  8 ::^   :::    ::  |  0                  |  0        |
    jmp .LBB0_19                                    // |  7 ::    :::    ::  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_11:                                           // |                     |                     |           |
    movq    %r8, %rcx                               // |  8 ::^   ::v    ::  |  0                  |  0        |
    andq    $-8, %rcx                               // |  8 ::x   :::    ::  |  0                  |  5 ^^^^^  |
    leaq    -8(%rcx), %rsi                          // |  9 ::v ^ :::    ::  |  0                  |  0        |
    movq    %rsi, %rdx                              // | 10 :::^v :::    ::  |  0                  |  0        |
    shrq    $3, %rdx                                // | 10 :::x: :::    ::  |  0                  |  5 ^^^^^  |
    incq    %rdx                                    // | 10 :::x: :::    ::  |  0                  |  5  ^^^^^ |
    testq   %rsi, %rsi                              // | 10 ::::v :::    ::  |  0                  |  6 ^^^^^^ |
    movdqa  .LCPI0_0(%rip), %xmm4                   // |  9 ::::  :::    ::  |  1     ^            |  1  :     |
    je  .LBB0_12                                    // |  9 ::::  :::    ::  |  1     :            |  1  v     |
    movq    %rdx, %rsi                              // | 10 :::v^ :::    ::  |  1     :            |  0        |
    andq    $-2, %rsi                               // | 10 ::::x :::    ::  |  1     :            |  5 ^^^^^  |
    pxor    %xmm0, %xmm0                            // | 10 ::::: :::    ::  |  2 ^   :            |  0        |
    xorl    %edi, %edi                              // | 11 :::::^:::    ::  |  2 :   :            |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                            // | 11 :::::::::    ::  |  3 :^  :            |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_14:                                           // |                     |                     |           |
    movd    13(%rsp,%rdi), %xmm2                    // | 11 :::::v:v:    ::  |  4 ::^ :            |  0        |
    punpcklbw   %xmm2, %xmm2                        // | 11 :::::::::    ::  |  4 ::^ :            |  0        |
    punpcklwd   %xmm2, %xmm2                        // | 11 :::::::::    ::  |  4 ::^ :            |  0        |
    movd    17(%rsp,%rdi), %xmm3                    // | 11 :::::v:v:    ::  |  4 :: ^:            |  0        |
    punpcklbw   %xmm3, %xmm3                        // | 11 :::::::::    ::  |  4 :: ^:            |  0        |
    punpcklwd   %xmm3, %xmm3                        // | 11 :::::::::    ::  |  4 :: ^:            |  0        |
    psrad   $24, %xmm2                              // | 11 :::::::::    ::  |  4 ::^ :            |  0        |
    paddd   %xmm0, %xmm2                            // | 11 :::::::::    ::  |  4 v:^ :            |  0        |
    psrad   $24, %xmm3                              // | 11 :::::::::    ::  |  4  ::^:            |  0        |
    paddd   %xmm1, %xmm3                            // | 11 :::::::::    ::  |  4  v:^:            |  0        |
    movd    21(%rsp,%rdi), %xmm0                    // | 11 :::::v:v:    ::  |  4 ^ :::            |  0        |
    punpcklbw   %xmm0, %xmm0                        // | 11 :::::::::    ::  |  4 ^ :::            |  0        |
    punpcklwd   %xmm0, %xmm0                        // | 11 :::::::::    ::  |  4 ^ :::            |  0        |
    psrad   $24, %xmm0                              // | 11 :::::::::    ::  |  4 ^ :::            |  0        |
    movd    25(%rsp,%rdi), %xmm1                    // | 11 :::::v:v:    ::  |  4  ^:::            |  0        |
    punpcklbw   %xmm1, %xmm1                        // | 11 :::::::::    ::  |  4  ^:::            |  0        |
    punpcklwd   %xmm1, %xmm1                        // | 11 :::::::::    ::  |  4  ^:::            |  0        |
    psrad   $24, %xmm1                              // | 11 :::::::::    ::  |  4  ^:::            |  0        |
    paddd   %xmm4, %xmm0                            // | 11 :::::::::    ::  |  4 ^ ::v            |  0        |
    paddd   %xmm2, %xmm0                            // | 11 :::::::::    ::  |  4 ^ v::            |  0        |
    paddd   %xmm4, %xmm1                            // | 11 :::::::::    ::  |  3  ^ :v            |  0        |
    paddd   %xmm3, %xmm1                            // | 11 :::::::::    ::  |  2  ^ v             |  0        |
    addq    $16, %rdi                               // | 11 :::::x:::    ::  |  0                  |  6 ^^^^^^ |
    addq    $-2, %rsi                               // | 11 ::::x::::    ::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                    // | 10 :::: ::::    ::  |  0                  |  1  v     |
    testb   $1, %dl                                 // | 10 :::v ::::    ::  |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                    // |  9 :::  ::::    ::  |  0                  |  1  v     |
.LBB0_16:                                           // |                     |                     |           |
    orq $1, %rdi                                    // |  9 :::  x:::    ::  |  0                  |  5 ^^^^^  |
    movd    12(%rsp,%rdi), %xmm2                    // |  9 :::  v:v:    ::  |  1   ^              |  0        |
    punpcklbw   %xmm2, %xmm2                        // |  9 :::  ::::    ::  |  1   ^              |  0        |
    punpcklwd   %xmm2, %xmm2                        // |  9 :::  ::::    ::  |  1   ^              |  0        |
    movd    16(%rsp,%rdi), %xmm3                    // |  9 :::  v:v:    ::  |  1    ^             |  0        |
    punpcklbw   %xmm3, %xmm3                        // |  8 :::   :::    ::  |  1    ^             |  0        |
    punpcklwd   %xmm3, %xmm3                        // |  8 :::   :::    ::  |  1    ^             |  0        |
    psrad   $24, %xmm2                              // |  8 :::   :::    ::  |  1   ^              |  0        |
    paddd   %xmm2, %xmm0                            // |  8 :::   :::    ::  |  2 ^ v              |  0        |
    psrad   $24, %xmm3                              // |  8 :::   :::    ::  |  1    ^             |  0        |
    paddd   %xmm3, %xmm1                            // |  8 :::   :::    ::  |  2  ^ v             |  0        |
    movdqa  .LCPI0_1(%rip), %xmm2                   // |  8 :::   :::    ::  |  1   ^              |  0        |
    paddd   %xmm2, %xmm0                            // |  8 :::   :::    ::  |  2 ^ v              |  0        |
    paddd   %xmm2, %xmm1                            // |  8 :::   :::    ::  |  2  ^v              |  0        |
.LBB0_17:                                           // |                     |                     |           |
    paddd   %xmm1, %xmm0                            // |  8 :::   :::    ::  |  2 ^v               |  0        |
    pshufd  $238, %xmm0, %xmm1                      // |  8 :::   :::    ::  |  1 :                |  0        |
    paddd   %xmm0, %xmm1                            // |  8 :::   :::    ::  |  2 v^               |  0        |
    pshufd  $85, %xmm1, %xmm0                       // |  8 :::   :::    ::  |  1  :               |  0        |
    paddd   %xmm1, %xmm0                            // |  8 :::   :::    ::  |  2 ^v               |  0        |
    movd    %xmm0, %edx                             // |  9 :::^  :::    ::  |  1 v                |  0        |
    cmpq    %rcx, %r8                               // |  9 ::v:  ::v    ::  |  0                  |  6 ^^^^^^ |
    je  .LBB0_20                                    // |  8 ::::  ::     ::  |  0                  |  1  v     |
    orq $1, %rcx                                    // |  8 ::x:  ::     ::  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_19:                                           // |                     |                     |           |
    movsbl  12(%rsp,%rcx), %esi                     // |  9 ::v:^ :v     ::  |  0                  |  0        |
    addl    %esi, %edx                              // |  9 :::xv ::     ::  |  0                  |  6 ^^^^^^ |
    addl    $-48, %edx                              // |  9 :::x: ::     ::  |  0                  |  6 ^^^^^^ |
    incq    %rcx                                    // |  9 ::x:: ::     ::  |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rax                              // |  9 v:v:: ::     ::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_19                                    // |  7  : :: ::     ::  |  0                  |  1  v     |
    jmp .LBB0_20                                    // |  7  : :: ::     ::  |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    pxor    %xmm0, %xmm0                            // |  7  : :: ::     ::  |  1 ^                |  0        |
    xorl    %edi, %edi                              // |  8  : ::^::     ::  |  0                  |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                            // |  7  : :: ::     ::  |  1  ^               |  0        |
    testb   $1, %dl                                 // |  7  : v: ::     ::  |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                    // |  6  :  : ::     ::  |  0                  |  1  v     |
    jmp .LBB0_17                                    // |  6  :  : ::     ::  |  0                  |  0        |
.LBB0_5:                                            // |                     |                     |           |
    testl   %r14d, %r14d                            // |  6  :  : ::     :v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_22                                    // |  6  :  : ::     ::  |  0                  |  3  vvv   |
    decq    %r13                                    // |  6  :  : ::     x:  |  0                  |  5  ^^^^^ |
    xorl    %eax, %eax                              // |  7 ^:  : ::     ::  |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                     // |  7 ::  : ::     ::  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_21:                                           // |                     |                     |           |
    incl    %eax                                    // |  7 x:  : ::     ::  |  0                  |  5  ^^^^^ |
    cmpl    %r14d, %eax                             // |  7 v:  : ::     :v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_22                                    // |  6  :  : ::     ::  |  0                  |  1  v     |
.LBB0_7:                                            // |                     |                     |           |
    cmpl    $1, %r14d                               // |  6  :  : ::     :v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                    // |  5  :  : ::     :   |  0                  |  1  v     |
    movl    (%rbp), %ecx                            // |  6  :^ : v:     :   |  0                  |  0        |
    xorl    %edx, %edx                              // |  7  ::^: ::     :   |  0                  |  5 ^^^^^  |
    jmp .LBB0_9                                     // |  7  :::: ::     :   |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_23:                                           // |                     |                     |           |
    movl    %ecx, 4(%rbp,%rdx,4)                    // |  7  :vv: v:     :   |  0                  |  0        |
    movl    %esi, (%rbp,%rdx,4)                     // |  7  ::vv v:     :   |  0                  |  0        |
    movq    (%rbx,%rdx,4), %xmm0                    // |  6  v:v  ::     :   |  1 ^                |  0        |
    pshufd  $225, %xmm0, %xmm0                      // |  6  :::  ::     :   |  1 :                |  0        |
    movq    %xmm0, (%rbx,%rdx,4)                    // |  6  v:v  ::     :   |  1 v                |  0        |
.LBB0_24:                                           // |                     |                     |           |
    incq    %rdx                                    // |  6  ::x  ::     :   |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %r13                              // |  6  ::v  ::     v   |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                    // |  5  :::  ::         |  0                  |  1  v     |
.LBB0_9:                                            // |                     |                     |           |
    movl    4(%rbp,%rdx,4), %esi                    // |  6  ::v^ v:         |  0                  |  0        |
    cmpl    %esi, %ecx                              // |  5  :v v ::         |  0                  |  6 ^^^^^^ |
    jg  .LBB0_23                                    // |  4  :  : ::         |  0                  |  3  vvv   |
    movl    %esi, %ecx                              // |  5  :^ v ::         |  0                  |  0        |
    jmp .LBB0_24                                    // |  3  :    ::         |  0                  |  0        |
.LBB0_22:                                           // |                     |                     |           |
    movq    %rbp, %rdi                              // |  4  :   ^v:         |  0                  |  0        |
    callq   free@PLT                                // |  2  :     x         |  0                  |  0        |
    movq    %rbx, %rax                              // |  3 ^v     :         |  0                  |  0        |
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
    .asciz  "%d"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
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
