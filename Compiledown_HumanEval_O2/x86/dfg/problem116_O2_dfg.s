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
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %edx, %r8d                            // |  3    v   :^        |  0                  |  0        |
    leal    -1(%rcx), %eax                        // |  4 ^ v    ::        |  0                  |  0        |
    movl    %eax, -12(%rsp)                       // |  3 v      v:        |  0                  |  0        |
    movl    %esi, %r11d                           // |  4     v  ::  ^     |  0                  |  0        |
    movl    %edx, %esi                            // |  5    v^  ::  :     |  0                  |  0        |
    movl    %esi, %r13d                           // |  5     v  ::  : ^   |  0                  |  0        |
    andl    $-8, %r13d                            // |  5     :  ::  : x   |  0                  |  5 ^^^^^  |
    leaq    -8(%r13), %r9                         // |  6     :  ::^ : v   |  0                  |  0        |
    movq    %r9, -8(%rsp)                         // |  6     :  v:v : :   |  0                  |  0        |
    shrq    $3, %r9                               // |  6     :  ::x : :   |  0                  |  5 ^^^^^  |
    incq    %r9                                   // |  6     :  ::x : :   |  0                  |  5  ^^^^^ |
    movl    %r9d, %r14d                           // |  7     :  ::v : :^  |  0                  |  0        |
    andl    $3, %r14d                             // |  7     :  ::: : :x  |  0                  |  5 ^^^^^  |
    andq    $-4, %r9                              // |  7     :  ::x : ::  |  0                  |  5 ^^^^^  |
    movq    %r14, %r12                            // |  8     :  ::: :^:v  |  0                  |  0        |
    shlq    $5, %r12                              // |  8     :  ::: :x::  |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  9     : ^::: ::::  |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // | 10     : ::::^::::  |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                   // | 10     : :::::::::  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    incq    %rbp                                  // | 10     : x::::::::  |  0                  |  5  ^^^^^ |
    cmpq    %r11, %rbp                            // | 10     : v::::v:::  |  0                  |  6 ^^^^^^ |
    je  .LBB0_18                                  // |  9     : ::::: :::  |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testl   %r8d, %r8d                            // |  9     : ::v:: :::  |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  9     : ::::: :::  |  0                  |  3  vvv   |
    movq    (%rdi,%rbp,8), %rdx                   // | 11    ^:vv:::: :::  |  0                  |  0        |
    cmpl    $8, %r8d                              // |  9    ::  :v:: :::  |  0                  |  6 ^^^^^^ |
    jae .LBB0_7                                   // |  8    ::  : :: :::  |  0                  |  1 v      |
    xorl    %ebx, %ebx                            // |  9  ^ ::  : :: :::  |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  9 ^  ::  : :: :::  |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                   // |  8    ::  : :: :::  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    cmpq    $24, -8(%rsp)                         // |  8    ::  v :: :::  |  0                  |  6 ^^^^^^ |
    jae .LBB0_9                                   // |  8    ::  : :: :::  |  0                  |  1 v      |
    pxor    %xmm0, %xmm0                          // |  8    ::  : :: :::  |  1 ^                |  0        |
    xorl    %eax, %eax                            // |  9 ^  ::  : :: :::  |  0                  |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                          // |  8    ::  : :: :::  |  1  ^               |  0        |
    jmp .LBB0_11                                  // |  8    ::  : :: :::  |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    pxor    %xmm0, %xmm0                          // |  8    ::  : :: :::  |  1 ^                |  0        |
    movq    %r9, %r15                             // |  9    ::  : v: :::^ |  1 :                |  0        |
    xorl    %eax, %eax                            // |  9 ^  ::  :  : :::: |  1 :                |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                          // |  9 :  ::  :  : :::: |  2 :^               |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    movdqu  (%rdx,%rax,4), %xmm2                  // |  9 v  v:  :  : :::: |  3 ::^              |  0        |
    paddd   %xmm0, %xmm2                          // |  9 :  ::  :  : :::: |  3 v:^              |  0        |
    movdqu  16(%rdx,%rax,4), %xmm0                // |  9 v  v:  :  : :::: |  3 ^::              |  0        |
    paddd   %xmm1, %xmm0                          // |  9 :  ::  :  : :::: |  3 ^v:              |  0        |
    movdqu  32(%rdx,%rax,4), %xmm1                // |  9 v  v:  :  : :::: |  3 :^:              |  0        |
    movdqu  48(%rdx,%rax,4), %xmm3                // |  9 v  v:  :  : :::: |  4 :::^             |  0        |
    movdqu  64(%rdx,%rax,4), %xmm4                // |  9 v  v:  :  : :::: |  5 ::::^            |  0        |
    paddd   %xmm1, %xmm4                          // |  9 :  ::  :  : :::: |  5 :v::^            |  0        |
    paddd   %xmm2, %xmm4                          // |  9 :  ::  :  : :::: |  4 : v:^            |  0        |
    movdqu  80(%rdx,%rax,4), %xmm2                // |  9 v  v:  :  : :::: |  4 : ^::            |  0        |
    paddd   %xmm3, %xmm2                          // |  9 :  ::  :  : :::: |  4 : ^v:            |  0        |
    paddd   %xmm0, %xmm2                          // |  9 :  ::  :  : :::: |  3 v ^ :            |  0        |
    movdqu  96(%rdx,%rax,4), %xmm0                // |  9 v  v:  :  : :::: |  3 ^ : :            |  0        |
    paddd   %xmm4, %xmm0                          // |  9 :  ::  :  : :::: |  3 ^ : v            |  0        |
    movdqu  112(%rdx,%rax,4), %xmm1               // |  9 v  v:  :  : :::: |  2  ^:              |  0        |
    paddd   %xmm2, %xmm1                          // |  9 :  ::  :  : :::: |  2  ^v              |  0        |
    addq    $32, %rax                             // |  9 x  ::  :  : :::: |  0                  |  6 ^^^^^^ |
    addq    $-4, %r15                             // |  8    ::  :  : :::x |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                  // |  7    ::  :  : :::  |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    testq   %r14, %r14                            // |  7    ::  :  : ::v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  6    ::  :  : ::   |  0                  |  1  v     |
    leaq    (%rdx,%rax,4), %rax                   // |  7 ^  v:  :  : ::   |  0                  |  0        |
    addq    $16, %rax                             // |  7 x  ::  :  : ::   |  0                  |  6 ^^^^^^ |
    xorl    %ebx, %ebx                            // |  8 :^ ::  :  : ::   |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    movdqu  -16(%rax,%rbx), %xmm2                 // |  8 vv ::  :  : ::   |  1   ^              |  0        |
    paddd   %xmm2, %xmm0                          // |  8 :: ::  :  : ::   |  2 ^ v              |  0        |
    movdqu  (%rax,%rbx), %xmm2                    // |  8 vv ::  :  : ::   |  1   ^              |  0        |
    paddd   %xmm2, %xmm1                          // |  7  : ::  :  : ::   |  2  ^v              |  0        |
    addq    $32, %rbx                             // |  7  x ::  :  : ::   |  1  :               |  6 ^^^^^^ |
    cmpq    %rbx, %r12                            // |  7  v ::  :  : v:   |  1  :               |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  5    ::  :  :  :   |  1  :               |  1  v     |
.LBB0_14:                                         // |                     |                     |           |
    paddd   %xmm1, %xmm0                          // |  5    ::  :  :  :   |  2 ^v               |  0        |
    pshufd  $238, %xmm0, %xmm1                    // |  5    ::  :  :  :   |  1 :                |  0        |
    paddd   %xmm0, %xmm1                          // |  5    ::  :  :  :   |  2 v^               |  0        |
    pshufd  $85, %xmm1, %xmm0                     // |  5    ::  :  :  :   |  1  :               |  0        |
    paddd   %xmm1, %xmm0                          // |  5    ::  :  :  :   |  2 ^v               |  0        |
    movd    %xmm0, %eax                           // |  6 ^  ::  :  :  :   |  1 v                |  0        |
    movq    %r13, %rbx                            // |  7 :^ ::  :  :  v   |  0                  |  0        |
    cmpq    %rsi, %r13                            // |  7 :: :v  :  :  v   |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                  // |  6 :: ::  :  :      |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    addl    (%rdx,%rbx,4), %eax                   // |  6 xv v:  :  :      |  0                  |  6 ^^^^^^ |
    incq    %rbx                                  // |  6 :x ::  :  :      |  0                  |  5  ^^^^^ |
    cmpq    %rbx, %rsi                            // |  6 :v :v  :  :      |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  4 :  :   :  :      |  0                  |  1  v     |
.LBB0_15:                                         // |                     |                     |           |
    testl   %eax, %eax                            // |  4 v  :   :  :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  4 :  :   :  :      |  0                  |  3  vvv   |
    addl    -12(%rsp), %eax                       // |  4 x  :   v  :      |  0                  |  6 ^^^^^^ |
    cltd                                          // |  4 :  :   :  :      |  0                  |  0        |
    idivl   %ecx                                  // |  5 x xx   :  :      |  0                  |  0        |
    addl    %eax, %r10d                           // |  3 v      :  x      |  0                  |  6 ^^^^^^ |
    jmp .LBB0_17                                  // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r10d, %r10d                          // |  2        :  ^      |  0                  |  5 ^^^^^  |
.LBB0_18:                                         // |                     |                     |           |
    movl    %r10d, %eax                           // |  3 ^      :  v      |  0                  |  0        |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
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
