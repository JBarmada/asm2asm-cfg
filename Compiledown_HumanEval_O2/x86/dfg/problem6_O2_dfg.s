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
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %edx, %r14d                           // |  3    v   :      ^  |  0                  |  0        |
    movl    %esi, %ebp                            // |  4     v ^:      :  |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^     ::      :  |  0                  |  5 ^^^^^  |
    testl   %esi, %esi                            // |  5 :   v ::      :  |  0                  |  6 ^^^^^^ |
    leal    -1(%rbp,%rbp), %edx                   // |  5 :  ^  v:      :  |  0                  |  0        |
    cmovlel %eax, %edx                            // |  5 v  ^  ::      :  |  0                  |  0        |
    movq    %rdi, %rbx                            // |  7 :^ : v::      :  |  0                  |  0        |
    movl    %edx, (%rcx)                          // |  7 ::vv  ::      :  |  0                  |  0        |
    movslq  %edx, %rdi                            // |  7 :: v ^::      :  |  0                  |  0        |
    shlq    $2, %rdi                              // |  6 ::   x::      :  |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                            // |  5 ::    :x      :  |  0                  |  0        |
    testl   %ebp, %ebp                            // |  5 ::    v:      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_13                                  // |  5 ::    ::      :  |  0                  |  3  vvv   |
    movl    (%rbx), %ecx                          // |  6 :v^   ::      :  |  0                  |  0        |
    movl    %ecx, (%rax)                          // |  6 v:v   ::      :  |  0                  |  0        |
    cmpl    $1, %ebp                              // |  5 ::    v:      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  5 ::    ::      :  |  0                  |  1  v     |
    movl    %ebp, %ecx                            // |  6 ::^   v:      :  |  0                  |  0        |
    leaq    -1(%rcx), %r8                         // |  6 ::v    :^     :  |  0                  |  0        |
    movl    $1, %edi                              // |  7 :::  ^ ::     :  |  0                  |  0        |
    movl    $1, %esi                              // |  7 ::: ^  ::     :  |  0                  |  0        |
    cmpq    $4, %r8                               // |  6 :::    :v     :  |  0                  |  6 ^^^^^^ |
    jb  .LBB0_11                                  // |  6 :::    ::     :  |  0                  |  1 v      |
    movq    %r8, %rsi                             // |  7 ::: ^  :v     :  |  0                  |  0        |
    andq    $-4, %rsi                             // |  7 ::: x  ::     :  |  0                  |  5 ^^^^^  |
    movd    %r14d, %xmm0                          // |  7 ::: :  ::     v  |  1 ^                |  0        |
    pshufd  $80, %xmm0, %xmm0                     // |  7 ::: :  ::     :  |  1 :                |  0        |
    leaq    -4(%rsi), %rdi                        // |  8 ::: v^ ::     :  |  1 :                |  0        |
    movq    %rdi, %rdx                            // |  9 :::^:v ::     :  |  1 :                |  0        |
    shrq    $2, %rdx                              // |  9 :::x:: ::     :  |  1 :                |  5 ^^^^^  |
    incq    %rdx                                  // |  9 :::x:: ::     :  |  1 :                |  5  ^^^^^ |
    testq   %rdi, %rdi                            // |  9 :::::v ::     :  |  1 :                |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  8 :::::  ::     :  |  1 :                |  1  v     |
    movq    %rdx, %rbp                            // |  9 :::v: ^::     :  |  1 :                |  0        |
    andq    $-2, %rbp                             // |  9 ::::: x::     :  |  1 :                |  5 ^^^^^  |
    xorl    %edi, %edi                            // | 10 :::::^:::     :  |  1 :                |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movq    4(%rbx,%rdi,4), %xmm1                 // | 10 :v:::v:::     :  |  2 :^               |  0        |
    movq    12(%rbx,%rdi,4), %xmm2                // | 10 :v:::v:::     :  |  3 ::^              |  0        |
    movdqa  %xmm0, %xmm3                          // | 10 :::::::::     :  |  4 v::^             |  0        |
    punpckldq   %xmm1, %xmm3                      // | 10 :::::::::     :  |  4 :v:^             |  0        |
    movdqu  %xmm3, 4(%rax,%rdi,8)                 // | 10 v::::v:::     :  |  3 : :v             |  0        |
    movdqa  %xmm0, %xmm1                          // | 10 :::::::::     :  |  3 v^:              |  0        |
    punpckldq   %xmm2, %xmm1                      // | 10 :::::::::     :  |  3 :^v              |  0        |
    movdqu  %xmm1, 20(%rax,%rdi,8)                // | 10 v::::v:::     :  |  2 :v               |  0        |
    movq    20(%rbx,%rdi,4), %xmm1                // | 10 :v:::v:::     :  |  2 :^               |  0        |
    movq    28(%rbx,%rdi,4), %xmm2                // | 10 :v:::v:::     :  |  3 ::^              |  0        |
    movdqa  %xmm0, %xmm3                          // | 10 :::::::::     :  |  4 v::^             |  0        |
    punpckldq   %xmm1, %xmm3                      // | 10 :::::::::     :  |  4 :v:^             |  0        |
    movdqu  %xmm3, 36(%rax,%rdi,8)                // | 10 v::::v:::     :  |  3 : :v             |  0        |
    movdqa  %xmm0, %xmm1                          // | 10 :::::::::     :  |  3 v^:              |  0        |
    punpckldq   %xmm2, %xmm1                      // | 10 :::::::::     :  |  3 :^v              |  0        |
    movdqu  %xmm1, 52(%rax,%rdi,8)                // | 10 v::::v:::     :  |  2 :v               |  0        |
    addq    $8, %rdi                              // | 10 :::::x:::     :  |  1 :                |  6 ^^^^^^ |
    addq    $-2, %rbp                             // | 10 ::::::x::     :  |  1 :                |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  9 :::::: ::     :  |  1 :                |  1  v     |
    testb   $1, %dl                               // |  9 :::v:: ::     :  |  1 :                |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  8 ::: :: ::     :  |  1 :                |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    leaq    (,%rdi,4), %rdx                       // |  9 :::^:v ::     :  |  1 :                |  0        |
    shlq    $3, %rdi                              // |  9 :::::x ::     :  |  1 :                |  5 ^^^^^  |
    orq $4, %rdx                                  // |  9 :::x:: ::     :  |  1 :                |  5 ^^^^^  |
    movq    (%rbx,%rdx), %xmm1                    // |  9 :v:v:: ::     :  |  2 :^               |  0        |
    movq    8(%rbx,%rdx), %xmm2                   // |  9 :v:v:: ::     :  |  3 ::^              |  0        |
    movq    %rdi, %rdx                            // |  9 :::^:v ::     :  |  3 :::              |  0        |
    orq $8, %rdx                                  // |  9 :::x:: ::     :  |  3 :::              |  5 ^^^^^  |
    orq $24, %rdi                                 // |  9 :::::x ::     :  |  3 :::              |  5 ^^^^^  |
    movdqa  %xmm0, %xmm3                          // |  9 :::::: ::     :  |  4 v::^             |  0        |
    punpckldq   %xmm1, %xmm3                      // |  9 :::::: ::     :  |  3  v:^             |  0        |
    movdqu  %xmm3, -4(%rax,%rdx)                  // |  9 v::v:: ::     :  |  2   :v             |  0        |
    punpckldq   %xmm2, %xmm0                      // |  8 ::: :: ::     :  |  2 ^ v              |  0        |
    movdqu  %xmm0, -4(%rax,%rdi)                  // |  8 v:: :v ::     :  |  1 v                |  0        |
.LBB0_9:                                          // |                     |                     |           |
    cmpq    %rsi, %r8                             // |  7 ::: v  :v     :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  6 ::: :  :      :  |  0                  |  1  v     |
    leaq    1(%rsi), %rdi                         // |  7 ::: v^ :      :  |  0                  |  0        |
    addq    %rsi, %rsi                            // |  7 ::: x: :      :  |  0                  |  6 ^^^^^^ |
    incq    %rsi                                  // |  7 ::: x: :      :  |  0                  |  5  ^^^^^ |
.LBB0_11:                                         // |                     |                     |           |
    leaq    (%rbx,%rdi,4), %rdx                   // |  7 :v:^ v :      :  |  0                  |  0        |
    subq    %rdi, %rcx                            // |  6 : x: v :      :  |  0                  |  6 ^^^^^^ |
    leaq    (%rax,%rsi,4), %rsi                   // |  6 v ::^  :      :  |  0                  |  0        |
    addq    $4, %rsi                              // |  5   ::x  :      :  |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                            // |  6   :::^ :      :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    movl    %r14d, -4(%rsi,%rdi,8)                // |  6   ::vv :      v  |  0                  |  0        |
    movl    (%rdx,%rdi,4), %ebp                   // |  6   :v:v^:         |  0                  |  0        |
    movl    %ebp, (%rsi,%rdi,8)                   // |  6   ::vvv:         |  0                  |  0        |
    incq    %rdi                                  // |  4   :: x :         |  0                  |  5  ^^^^^ |
    cmpq    %rdi, %rcx                            // |  4   v: v :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  2    :   :         |  0                  |  1  v     |
.LBB0_13:                                         // |                     |                     |           |
    popq    %rbx                                  // |  3  ^ :   x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  3    :   x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  3    :  ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  2    :   x         |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    xorl    %edi, %edi                            // |  2    : ^           |  0                  |  5 ^^^^^  |
    testb   $1, %dl                               // |  1    v             |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  0                  |  0                  |  1  v     |
    jmp .LBB0_9                                   // |  0                  |  0                  |  0        |
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
