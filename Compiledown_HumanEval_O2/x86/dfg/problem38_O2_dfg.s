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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -40                         // |                     |                     |           |
    .cfi_offset %r12, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %r15, -16                         // |                     |                     |           |
    movq    %rdx, %r14                            // |  3    v   :      ^  |  0                  |  0        |
    movl    %esi, %r15d                           // |  4     v  :      :^ |  0                  |  0        |
    movq    %rdi, %r12                            // |  5      v :    ^ :: |  0                  |  0        |
    movl    %esi, %eax                            // |  6 ^   v  :    : :: |  0                  |  0        |
    shrl    $31, %eax                             // |  5 x      :    : :: |  0                  |  5 ^^^^^  |
    addl    %esi, %eax                            // |  6 x   v  :    : :: |  0                  |  6 ^^^^^^ |
    sarl    %eax                                  // |  5 x      :    : :: |  0                  |  5 ^^^^^  |
    cltq                                          // |  5 :      :    : :: |  0                  |  0        |
    leaq    4(,%rax,4), %rdi                      // |  6 v    ^ :    : :: |  0                  |  0        |
    callq   malloc@PLT                            // |  5 :      x    : :: |  0                  |  0        |
    testl   %r15d, %r15d                          // |  5 :      :    : :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_31                                  // |  5 :      :    : :: |  0                  |  3  vvv   |
    leal    -1(%r15), %edx                        // |  6 :  ^   :    : :v |  0                  |  0        |
    movl    %edx, %r8d                            // |  7 :  v   :^   : :: |  0                  |  0        |
    shrl    %r8d                                  // |  7 :  :   :x   : :: |  0                  |  5 ^^^^^  |
    cmpl    $15, %edx                             // |  7 :  v   ::   : :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_10                                  // |  7 :  :   ::   : :: |  0                  |  2 vv     |
    xorl    %esi, %esi                            // |  8 :  :^  ::   : :: |  0                  |  5 ^^^^^  |
    xorl    %edi, %edi                            // |  8 :  : ^ ::   : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                   // |  7 :  :   ::   : :: |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    leal    1(%r8), %esi                          // |  8 :  :^  :v   : :: |  0                  |  0        |
    movl    %esi, %ecx                            // |  9 : ^:v  ::   : :: |  0                  |  0        |
    andl    $7, %ecx                              // |  9 : x::  ::   : :: |  0                  |  5 ^^^^^  |
    movl    $8, %edi                              // | 10 : :::^ ::   : :: |  0                  |  0        |
    cmovneq %rcx, %rdi                            // | 10 : v::^ ::   : :: |  0                  |  0        |
    subq    %rdi, %rsi                            // |  9 :  :xv ::   : :: |  0                  |  6 ^^^^^^ |
    leaq    (%rsi,%rsi), %rdi                     // |  9 :  :v^ ::   : :: |  0                  |  0        |
    xorl    %ecx, %ecx                            // | 10 : ^::: ::   : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    movups  (%r12,%rcx,8), %xmm0                  // | 10 : v::: ::   v :: |  1 ^                |  0        |
    movups  16(%r12,%rcx,8), %xmm1                // | 10 : v::: ::   v :: |  2 :^               |  0        |
    shufps  $136, %xmm1, %xmm0                    // | 10 : :::: ::   : :: |  1 :                |  0        |
    movups  32(%r12,%rcx,8), %xmm1                // | 10 : v::: ::   v :: |  2 :^               |  0        |
    movups  48(%r12,%rcx,8), %xmm2                // | 10 : v::: ::   v :: |  3 ::^              |  0        |
    shufps  $136, %xmm2, %xmm1                    // | 10 : :::: ::   : :: |  2 ::               |  0        |
    movups  %xmm0, (%rax,%rcx,4)                  // | 10 v v::: ::   : :: |  2 v:               |  0        |
    movups  %xmm1, 16(%rax,%rcx,4)                // | 10 v v::: ::   : :: |  1  v               |  0        |
    addq    $8, %rcx                              // | 10 : x::: ::   : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %rsi                            // | 10 : v:v: ::   : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  9 :  ::: ::   : :: |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    leaq    (%rax,%rsi,4), %rcx                   // | 10 v ^:v: ::   : :: |  0                  |  0        |
    movl    %edx, %ebx                            // | 11 :^:v:: ::   : :: |  0                  |  0        |
    shrq    %rbx                                  // | 11 :x:::: ::   : :: |  0                  |  5 ^^^^^  |
    subq    %rsi, %rbx                            // | 11 :x::v: ::   : :: |  0                  |  6 ^^^^^^ |
    incq    %rbx                                  // | 10 :x:: : ::   : :: |  0                  |  5  ^^^^^ |
    leaq    (%r12,%rdi,4), %rsi                   // | 11 ::::^v ::   v :: |  0                  |  0        |
    xorl    %edi, %edi                            // | 11 :::::^ ::   : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movss   (%rsi,%rdi,8), %xmm0                  // | 11 ::::vv ::   : :: |  1 ^                |  0        |
    movss   %xmm0, (%rcx,%rdi,4)                  // | 10 ::v: v ::   : :: |  1 v                |  0        |
    incq    %rdi                                  // |  9 :: : x ::   : :: |  0                  |  5  ^^^^^ |
    cmpq    %rdi, %rbx                            // |  9 :v : v ::   : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  7 :  :   ::   : :: |  0                  |  1  v     |
    cmpl    $2, %edx                              // |  7 :  v   ::   : :: |  0                  |  6 ^^^^^^ |
    jae .LBB0_6                                   // |  6 :      ::   : :: |  0                  |  1 v      |
.LBB0_12:                                         // |                     |                     |           |
    testl   %r15d, %r15d                          // |  6 :      ::   : :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_31                                  // |  6 :      ::   : :: |  0                  |  3  vvv   |
    movl    %r15d, %edx                           // |  7 :  ^   ::   : :v |  0                  |  0        |
    cmpl    $1, %r15d                             // |  6 :      ::   : :v |  0                  |  6 ^^^^^^ |
    jne .LBB0_27                                  // |  5 :      ::   : :  |  0                  |  1  v     |
    xorl    %ecx, %ecx                            // |  6 : ^    ::   : :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_29                                  // |  5 :      ::   : :  |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  6 :  ^   ::   : :  |  0                  |  5 ^^^^^  |
    movl    %r8d, %esi                            // |  7 :  :^  :v   : :  |  0                  |  0        |
    jmp .LBB0_7                                   // |  7 :  ::  ::   : :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_26:                                         // |                     |                     |           |
    incl    %edx                                  // |  7 :  x:  ::   : :  |  0                  |  5  ^^^^^ |
    decl    %esi                                  // |  7 :  :x  ::   : :  |  0                  |  5  ^^^^^ |
    cmpl    %r8d, %edx                            // |  6 :  v   :v   : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  6 :  :   ::   : :  |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    movl    %esi, %esi                            // |  7 :  :^  ::   : :  |  0                  |  0        |
    cmpl    %edx, %r8d                            // |  7 :  v:  :v   : :  |  0                  |  6 ^^^^^^ |
    jbe .LBB0_26                                  // |  6 :  ::  :    : :  |  0                  |  2 vv     |
    movss   (%rax), %xmm0                         // |  6 v  ::  :    : :  |  1 ^                |  0        |
    cmpl    $1, %esi                              // |  6 :  :v  :    : :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  6 :  ::  :    : :  |  0                  |  1  v     |
    xorl    %ebx, %ebx                            // |  7 :^ ::  :    : :  |  0                  |  5 ^^^^^  |
.LBB0_23:                                         // |                     |                     |           |
    testb   $1, %sil                              // |  7 :: :v  :    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_26                                  // |  7 :: ::  :    : :  |  0                  |  2 :v     |
    movss   4(%rax,%rbx,4), %xmm1                 // |  7 vv ::  :    : :  |  1  ^               |  2 ::     |
    ucomiss %xmm1, %xmm0                          // |  7 :: ::  :    : :  |  2 ^v               |  2 ::     |
    jbe .LBB0_26                                  // |  7 :: ::  :    : :  |  2 ::               |  2 vv     |
    movss   %xmm1, (%rax,%rbx,4)                  // |  7 vv ::  :    : :  |  2 :v               |  0        |
    movss   %xmm0, 4(%rax,%rbx,4)                 // |  7 vv ::  :    : :  |  2 v:               |  0        |
    jmp .LBB0_26                                  // |  7 :: ::  :    : :  |  2 ::               |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_15:                                         // |                     |                     |           |
    movl    %esi, %edi                            // |  8 :: :v^ :    : :  |  2 ::               |  0        |
    andl    $-2, %edi                             // |  7 :: : x :    : :  |  2 ::               |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // |  8 ::^: : :    : :  |  2 ::               |  5 ^^^^^  |
    jmp .LBB0_16                                  // |  8 :::: : :    : :  |  2 ::               |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_21:                                         // |                     |                     |           |
    movss   %xmm1, 4(%rax,%rcx,4)                 // |  8 v:v: : :    : :  |  2 :v               |  0        |
    movss   %xmm0, 8(%rax,%rcx,4)                 // |  8 v:v: : :    : :  |  1 v                |  0        |
.LBB0_22:                                         // |                     |                     |           |
    movq    %rbx, %rcx                            // |  8 :v^: : :    : :  |  0                  |  0        |
    cmpq    %rbx, %rdi                            // |  8 :v:: v :    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                  // |  6 : ::   :    : :  |  0                  |  2 :v     |
.LBB0_16:                                         // |                     |                     |           |
    movss   4(%rax,%rcx,4), %xmm1                 // |  6 v v:   :    : :  |  1  ^               |  2 ::     |
    ucomiss %xmm1, %xmm0                          // |  6 : ::   :    : :  |  2 ^v               |  2 ::     |
    jbe .LBB0_17                                  // |  6 : ::   :    : :  |  2 ::               |  2 vv     |
    movss   %xmm1, (%rax,%rcx,4)                  // |  6 v v:   :    : :  |  2 :v               |  2 ::     |
    movss   %xmm0, 4(%rax,%rcx,4)                 // |  6 v v:   :    : :  |  2 v:               |  2 ::     |
    jmp .LBB0_19                                  // |  6 : ::   :    : :  |  1  :               |  2 ::     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    movaps  %xmm1, %xmm0                          // |  6 : ::   :    : :  |  2 ^v               |  2 ::     |
.LBB0_19:                                         // |                     |                     |           |
    leaq    2(%rcx), %rbx                         // |  7 :^v:   :    : :  |  0                  |  2 ::     |
    movss   8(%rax,%rcx,4), %xmm1                 // |  6 v v:   :    : :  |  1  ^               |  2 ::     |
    ucomiss %xmm1, %xmm0                          // |  5 :  :   :    : :  |  2 ^v               |  2 ::     |
    ja  .LBB0_21                                  // |  5 :  :   :    : :  |  1  :               |  2 vv     |
    movaps  %xmm1, %xmm0                          // |  5 :  :   :    : :  |  2 ^v               |  0        |
    jmp .LBB0_22                                  // |  5 :  :   :    : :  |  0                  |  0        |
.LBB0_27:                                         // |                     |                     |           |
    movl    %edx, %esi                            // |  6 :  v^  :    : :  |  0                  |  0        |
    andl    $-2, %esi                             // |  6 :  :x  :    : :  |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  7 :^ ::  :    : :  |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // |  8 ::^::  :    : :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_28:                                         // |                     |                     |           |
    movl    %ebx, %edi                            // |  9 :v:::^ :    : :  |  0                  |  0        |
    andl    $2147483647, %edi                     // |  9 :::::x :    : :  |  0                  |  5 ^^^^^  |
    movss   (%rax,%rdi,4), %xmm0                  // |  9 v::::v :    : :  |  1 ^                |  0        |
    movss   %xmm0, (%r14,%rcx,4)                  // |  8 ::v::  :    : v  |  1 v                |  0        |
    movss   4(%r12,%rcx,4), %xmm0                 // |  8 ::v::  :    v :  |  1 ^                |  0        |
    movss   %xmm0, 4(%r14,%rcx,4)                 // |  8 ::v::  :    : v  |  1 v                |  0        |
    addq    $2, %rcx                              // |  8 ::x::  :    : :  |  0                  |  6 ^^^^^^ |
    incq    %rbx                                  // |  8 :x:::  :    : :  |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rsi                            // |  7 : v:v  :    : :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_28                                  // |  6 : ::   :    : :  |  0                  |  1  v     |
.LBB0_29:                                         // |                     |                     |           |
    testb   $1, %dl                               // |  6 : :v   :    : :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_31                                  // |  5 : :    :    : :  |  0                  |  1  v     |
    movl    %ecx, %edx                            // |  6 : v^   :    : :  |  0                  |  0        |
    andl    $-2, %edx                             // |  6 : :x   :    : :  |  0                  |  5 ^^^^^  |
    testb   $1, %cl                               // |  5 : v    :    : :  |  0                  |  6 ^^^^^^ |
    leaq    (%rax,%rdx,2), %rdx                   // |  6 v :^   :    : :  |  0                  |  0        |
    leaq    (%r12,%rcx,4), %rsi                   // |  7 : v:^  :    v :  |  0                  |  0        |
    cmoveq  %rdx, %rsi                            // |  6 : :v^  :      :  |  0                  |  0        |
    movss   (%rsi), %xmm0                         // |  5 : : v  :      :  |  1 ^                |  0        |
    movss   %xmm0, (%r14,%rcx,4)                  // |  4 : v    :      v  |  1 v                |  0        |
.LBB0_31:                                         // |                     |                     |           |
    movq    %rax, %rdi                            // |  3 v    ^ :         |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    jmp free@PLT                                  // |  0                  |  0                  |  0        |
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
