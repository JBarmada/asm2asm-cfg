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
    movb    $1, %al                               // |  1 ^                |  0                  |  0        |
    cmpl    $2, %esi                              // |  1     v            |  0                  |  6 ^^^^^^ |
    jl  .LBB0_10                                  // |  0                  |  0                  |  2   vv   |
    movl    %esi, %r9d                            // |  2     v    ^       |  0                  |  0        |
    movss   (%rdi), %xmm1                         // |  2      v   :       |  1  ^               |  0        |
    leaq    -1(%r9), %r8                          // |  2         ^v       |  1  :               |  0        |
    cmpq    $8, %r8                               // |  2         v:       |  1  :               |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  2         ::       |  1  :               |  1 v      |
    xorl    %eax, %eax                            // |  3 ^       ::       |  1  :               |  5 ^^^^^  |
    movl    $1, %ecx                              // |  3   ^     ::       |  1  :               |  0        |
    xorl    %edx, %edx                            // |  3    ^    ::       |  1  :               |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  2         ::       |  1  :               |  0        |
.LBB0_3:                                          // |                     |                     |           |
    movq    %r8, %rsi                             // |  3     ^   v:       |  1  :               |  0        |
    andq    $-8, %rsi                             // |  3     x   ::       |  1  :               |  5 ^^^^^  |
    leaq    1(%rsi), %rcx                         // |  4   ^ v   ::       |  1  :               |  0        |
    shufps  $0, %xmm1, %xmm1                      // |  4   : :   ::       |  1  :               |  0        |
    xorps   %xmm8, %xmm8                          // |  4   : :   ::       |  2  :      ^        |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  5 ^ : :   ::       |  2  :      :        |  5 ^^^^^  |
    xorps   %xmm9, %xmm9                          // |  5 : : :   ::       |  3  :      :^       |  5 ^^^^^  |
    xorps   %xmm3, %xmm3                          // |  5 : : :   ::       |  4  : ^    ::       |  5 ^^^^^  |
    xorps   %xmm4, %xmm4                          // |  5 : : :   ::       |  5  : :^   ::       |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movaps  %xmm1, %xmm0                          // |  5 : : :   ::       |  6 ^v ::   ::       |  0        |
    movups  4(%rdi,%rax,4), %xmm5                 // |  6 v : :v  ::       |  6 :  ::^  ::       |  0        |
    shufps  $3, %xmm5, %xmm0                      // |  5 : : :   ::       |  6 :  :::  ::       |  0        |
    shufps  $152, %xmm5, %xmm0                    // |  5 : : :   ::       |  6 :  :::  ::       |  0        |
    movaps  %xmm5, %xmm6                          // |  5 : : :   ::       |  7 :  ::v^ ::       |  0        |
    movaps  %xmm0, %xmm2                          // |  5 : : :   ::       |  8 v ^:::: ::       |  0        |
    cmpltps %xmm5, %xmm2                          // |  5 : : :   ::       |  8 : v::v: ::       |  6 ^^^^^^ |
    cmpltps %xmm0, %xmm5                          // |  5 : : :   ::       |  8 v :::v: ::       |  6 ^^^^^^ |
    movups  20(%rdi,%rax,4), %xmm1                // |  6 v : :v  ::       |  8  ^::::: ::       |  0        |
    shufps  $3, %xmm1, %xmm6                      // |  5 : : :   ::       |  8  :::::: ::       |  0        |
    shufps  $152, %xmm1, %xmm6                    // |  5 : : :   ::       |  8  :::::: ::       |  0        |
    movaps  %xmm1, %xmm0                          // |  5 : : :   ::       |  9 ^v::::: ::       |  0        |
    cmpltps %xmm6, %xmm0                          // |  5 : : :   ::       |  9 v:::::v ::       |  6 ^^^^^^ |
    cmpltps %xmm1, %xmm6                          // |  5 : : :   ::       |  9 :v::::v ::       |  6 ^^^^^^ |
    movaps  %xmm2, %xmm7                          // |  5 : : :   ::       | 10 ::v::::^::       |  0        |
    andnps  %xmm3, %xmm7                          // |  5 : : :   ::       | 10 :::v:::x::       |  5 ^^^^^  |
    movaps  %xmm7, %xmm3                          // |  5 : : :   ::       | 10 :::^:::v::       |  0        |
    psubd   %xmm2, %xmm3                          // |  5 : : :   ::       |  9 ::v^::: ::       |  0        |
    movaps  %xmm6, %xmm2                          // |  5 : : :   ::       |  9 ::^:::v ::       |  0        |
    andnps  %xmm4, %xmm2                          // |  5 : : :   ::       |  9 ::x:v:: ::       |  5 ^^^^^  |
    movaps  %xmm2, %xmm4                          // |  5 : : :   ::       |  9 ::v:^:: ::       |  0        |
    psubd   %xmm6, %xmm4                          // |  5 : : :   ::       |  8 :: :^:v ::       |  0        |
    movaps  %xmm5, %xmm2                          // |  5 : : :   ::       |  8 ::^::v  ::       |  0        |
    andnps  %xmm8, %xmm2                          // |  5 : : :   ::       |  8 ::x:::  v:       |  5 ^^^^^  |
    movaps  %xmm2, %xmm8                          // |  5 : : :   ::       |  8 ::v:::  ^:       |  0        |
    psubd   %xmm5, %xmm8                          // |  5 : : :   ::       |  7 :: ::v  ^:       |  0        |
    movaps  %xmm0, %xmm2                          // |  5 : : :   ::       |  7 v:^::   ::       |  0        |
    andnps  %xmm9, %xmm2                          // |  5 : : :   ::       |  7 ::x::   :v       |  5 ^^^^^  |
    movaps  %xmm2, %xmm9                          // |  5 : : :   ::       |  7 ::v::   :^       |  0        |
    psubd   %xmm0, %xmm9                          // |  5 : : :   ::       |  6 v: ::   :^       |  0        |
    addq    $8, %rax                              // |  5 x : :   ::       |  5  : ::   ::       |  6 ^^^^^^ |
    cmpq    %rax, %rsi                            // |  5 v : v   ::       |  5  : ::   ::       |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  4   : :   ::       |  5  : ::   ::       |  1  v     |
    orps    %xmm4, %xmm3                          // |  4   : :   ::       |  5  : xv   ::       |  5 ^^^^^  |
    pxor    %xmm0, %xmm0                          // |  4   : :   ::       |  4 ^:      ::       |  0        |
    pcmpeqd %xmm0, %xmm3                          // |  4   : :   ::       |  5 v: ^    ::       |  0        |
    movmskps    %xmm3, %eax                       // |  5 ^ : :   ::       |  5 :: v    ::       |  0        |
    xorl    %edx, %edx                            // |  6 : :^:   ::       |  4 ::      ::       |  5 ^^^^^  |
    cmpl    $15, %eax                             // |  6 v :::   ::       |  4 ::      ::       |  6 ^^^^^^ |
    setne   %dl                                   // |  5   :x:   ::       |  4 ::      ::       |  1  v     |
    orps    %xmm9, %xmm8                          // |  4   : :   ::       |  4 ::      xv       |  5 ^^^^^  |
    pcmpeqd %xmm0, %xmm8                          // |  4   : :   ::       |  3 v:      ^        |  0        |
    movmskps    %xmm8, %r10d                      // |  5   : :   ::^      |  2  :      v        |  0        |
    xorl    %eax, %eax                            // |  6 ^ : :   :::      |  1  :               |  5 ^^^^^  |
    cmpl    $15, %r10d                            // |  6 : : :   ::v      |  1  :               |  6 ^^^^^^ |
    setne   %al                                   // |  5 x : :   ::       |  1  :               |  1  v     |
    cmpq    %rsi, %r8                             // |  4   : v   v:       |  1  :               |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  2   :      :       |  1  :               |  1  v     |
    shufps  $255, %xmm1, %xmm1                    // |  2   :      :       |  1  :               |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movl    $1, %esi                              // |  3   : ^    :       |  1  :               |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    movss   (%rdi,%rcx,4), %xmm0                  // |  4   v :v   :       |  2 ^:               |  0        |
    ucomiss %xmm1, %xmm0                          // |  3   : :    :       |  2 ^v               |  0        |
    cmoval  %esi, %edx                            // |  4   :^v    :       |  1 :                |  0        |
    ucomiss %xmm0, %xmm1                          // |  4   :::    :       |  2 v^               |  0        |
    cmoval  %esi, %eax                            // |  5 ^ ::v    :       |  1 :                |  0        |
    incq    %rcx                                  // |  4 : x:     :       |  1 :                |  5  ^^^^^ |
    movaps  %xmm0, %xmm1                          // |  4 : ::     :       |  2 v^               |  0        |
    cmpq    %rcx, %r9                             // |  4 : v:     v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  2 :  :             |  0                  |  1  v     |
.LBB0_9:                                          // |                     |                     |           |
    addl    %eax, %edx                            // |  2 v  x             |  0                  |  6 ^^^^^^ |
    cmpl    $2, %edx                              // |  2 :  v             |  0                  |  6 ^^^^^^ |
    setne   %al                                   // |  1 x                |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
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
