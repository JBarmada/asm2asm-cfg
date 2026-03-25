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
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .long   1                                      // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    xorl    %eax, %eax                             // |  1 ^                |  0                  |  5 ^^^^^  |
    cmpl    $2, %esi                               // |  1     v            |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                    // |  0                  |  0                  |  2   vv   |
    addl    $-2, %esi                              // |  1     x            |  0                  |  6 ^^^^^^ |
    xorl    %r9d, %r9d                             // |  2     :    ^       |  0                  |  5 ^^^^^  |
    cmpl    $16, %esi                              // |  2     v    :       |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                    // |  2     :    :       |  0                  |  1 v      |
    movl    $1, %r8d                               // |  3     :   ^:       |  0                  |  0        |
    xorl    %edx, %edx                             // |  3    ^:    :       |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                             // |  3 ^   :    :       |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                    // |  2     :    :       |  0                  |  0        |
.LBB0_3:                                           // |                     |                     |           |
    movl    %esi, %edx                             // |  3    ^v    :       |  0                  |  0        |
    shrl    %edx                                   // |  2    x     :       |  0                  |  5 ^^^^^  |
    incl    %edx                                   // |  2    x     :       |  0                  |  5  ^^^^^ |
    movl    %edx, %r8d                             // |  3    v    ^:       |  0                  |  0        |
    andl    $7, %r8d                               // |  3    :    x:       |  0                  |  5 ^^^^^  |
    movl    $8, %eax                               // |  4 ^  :    ::       |  0                  |  0        |
    cmovneq %r8, %rax                              // |  4 ^  :    v:       |  0                  |  0        |
    subq    %rax, %rdx                             // |  3 v  x     :       |  0                  |  6 ^^^^^^ |
    leaq    (%rdx,%rdx), %r8                       // |  3    v    ^:       |  0                  |  0        |
    incq    %r8                                    // |  3    :    x:       |  0                  |  5  ^^^^^ |
    pxor    %xmm0, %xmm0                           // |  3    :    ::       |  1 ^                |  0        |
    xorl    %eax, %eax                             // |  4 ^  :    ::       |  1 :                |  5 ^^^^^  |
    movaps  .LCPI0_0(%rip), %xmm3                  // |  4 :  :    ::       |  2 :  ^             |  0        |
    pxor    %xmm2, %xmm2                           // |  4 :  :    ::       |  3 : ^:             |  0        |
    pxor    %xmm1, %xmm1                           // |  4 :  :    ::       |  3 :^ :             |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_4:                                           // |                     |                     |           |
    movups  4(%rdi,%rax,8), %xmm4                  // |  5 v  : v  ::       |  3 :  :^            |  0        |
    movups  20(%rdi,%rax,8), %xmm5                 // |  5 v  : v  ::       |  4 :  ::^           |  0        |
    shufps  $136, %xmm5, %xmm4                     // |  4 :  :    ::       |  3 :  ::            |  0        |
    movups  36(%rdi,%rax,8), %xmm5                 // |  5 v  : v  ::       |  4 :  ::^           |  0        |
    movups  52(%rdi,%rax,8), %xmm6                 // |  5 v  : v  ::       |  5 :  :::^          |  0        |
    shufps  $136, %xmm6, %xmm5                     // |  4 :  :    ::       |  4 :  :::           |  0        |
    movaps  %xmm4, %xmm6                           // |  4 :  :    ::       |  5 :  :v:^          |  0        |
    andps   %xmm3, %xmm6                           // |  4 :  :    ::       |  5 :  v::x          |  5 ^^^^^  |
    movaps  %xmm5, %xmm7                           // |  4 :  :    ::       |  5 :  ::v ^         |  0        |
    andps   %xmm3, %xmm7                           // |  4 :  :    ::       |  5 :  v:: x         |  5 ^^^^^  |
    pcmpeqd %xmm0, %xmm6                           // |  4 :  :    ::       |  4 v   ::^          |  0        |
    pand    %xmm4, %xmm6                           // |  4 :  :    ::       |  4 :   v:^          |  0        |
    paddd   %xmm6, %xmm2                           // |  4 :  :    ::       |  4 : ^  :v          |  0        |
    pcmpeqd %xmm0, %xmm7                           // |  4 :  :    ::       |  4 v :  : ^         |  0        |
    pand    %xmm5, %xmm7                           // |  4 :  :    ::       |  3   :  v ^         |  0        |
    paddd   %xmm7, %xmm1                           // |  4 :  :    ::       |  3  ^:    v         |  0        |
    addq    $8, %rax                               // |  4 x  :    ::       |  1   :              |  6 ^^^^^^ |
    cmpq    %rax, %rdx                             // |  4 v  v    ::       |  1   :              |  6 ^^^^^^ |
    jne .LBB0_4                                    // |  3    :    ::       |  1   :              |  1  v     |
    paddd   %xmm2, %xmm1                           // |  3    :    ::       |  2  ^v              |  0        |
    pshufd  $238, %xmm1, %xmm0                     // |  3    :    ::       |  1  :               |  0        |
    paddd   %xmm1, %xmm0                           // |  3    :    ::       |  2 ^v               |  0        |
    pshufd  $85, %xmm0, %xmm1                      // |  3    :    ::       |  1 :                |  0        |
    paddd   %xmm0, %xmm1                           // |  3    :    ::       |  2 v^               |  0        |
    movd    %xmm1, %eax                            // |  4 ^  :    ::       |  1  v               |  0        |
.LBB0_6:                                           // |                     |                     |           |
    movl    %esi, %esi                             // |  5 :  :^   ::       |  0                  |  0        |
    shrq    %rsi                                   // |  5 :  :x   ::       |  0                  |  5 ^^^^^  |
    subq    %rdx, %rsi                             // |  5 :  vx   ::       |  0                  |  6 ^^^^^^ |
    incq    %rsi                                   // |  4 :   x   ::       |  0                  |  5  ^^^^^ |
    leaq    (%rdi,%r8,4), %rdx                     // |  6 :  ^:v  v:       |  0                  |  0        |
    xorl    %edi, %edi                             // |  5 :  ::^   :       |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_7:                                           // |                     |                     |           |
    movl    (%rdx,%rdi,8), %ecx                    // |  6 : ^v:v   :       |  0                  |  0        |
    testb   $1, %cl                                // |  5 : v ::   :       |  0                  |  6 ^^^^^^ |
    cmovnel %r9d, %ecx                             // |  5 : ^ ::   v       |  0                  |  0        |
    addl    %ecx, %eax                             // |  4 x v ::           |  0                  |  6 ^^^^^^ |
    incq    %rdi                                   // |  2     :x           |  0                  |  5  ^^^^^ |
    cmpq    %rdi, %rsi                             // |  2     vv           |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                    // |  0                  |  0                  |  1  v     |
.LBB0_8:                                           // |                     |                     |           |
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
