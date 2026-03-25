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
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                  // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %eax                            // |  2 ^   v            |  0                  |  0        |
    cmpl    $8, %esi                              // |  2 :   v            |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  1 :                |  0                  |  1 v      |
    xorl    %ecx, %ecx                            // |  2 : ^              |  0                  |  5 ^^^^^  |
    jmp .LBB0_10                                  // |  1 :                |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    movl    %eax, %ecx                            // |  2 v ^              |  0                  |  0        |
    andl    $-8, %ecx                             // |  2 : x              |  0                  |  5 ^^^^^  |
    leaq    -8(%rcx), %rdx                        // |  3 : v^             |  0                  |  0        |
    movq    %rdx, %r8                             // |  4 : :v    ^        |  0                  |  0        |
    shrq    $3, %r8                               // |  4 : ::    x        |  0                  |  5 ^^^^^  |
    incq    %r8                                   // |  4 : ::    x        |  0                  |  5  ^^^^^ |
    testq   %rdx, %rdx                            // |  4 : :v    :        |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  3 : :     :        |  0                  |  1  v     |
    movq    %r8, %rsi                             // |  4 : : ^   v        |  0                  |  0        |
    andq    $-2, %rsi                             // |  4 : : x   :        |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                            // |  5 : :^:   :        |  0                  |  5 ^^^^^  |
    pcmpeqd %xmm0, %xmm0                          // |  5 : :::   :        |  1 ^                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movdqu  (%rdi,%rdx,4), %xmm1                  // |  6 : :v:v  :        |  2 :^               |  0        |
    movdqu  16(%rdi,%rdx,4), %xmm2                // |  6 : :v:v  :        |  2 : ^              |  0        |
    movdqu  32(%rdi,%rdx,4), %xmm3                // |  6 : :v:v  :        |  2 :  ^             |  0        |
    movdqu  48(%rdi,%rdx,4), %xmm4                // |  6 : :v:v  :        |  2 :   ^            |  0        |
    psubd   %xmm0, %xmm1                          // |  5 : :::   :        |  2 v^               |  0        |
    psubd   %xmm0, %xmm2                          // |  5 : :::   :        |  3 v:^              |  0        |
    movdqu  %xmm1, (%rdi,%rdx,4)                  // |  6 : :v:v  :        |  3 :v:              |  0        |
    movdqu  %xmm2, 16(%rdi,%rdx,4)                // |  6 : :v:v  :        |  2 : v              |  0        |
    psubd   %xmm0, %xmm3                          // |  5 : :::   :        |  2 v  ^             |  0        |
    psubd   %xmm0, %xmm4                          // |  5 : :::   :        |  3 v  :^            |  0        |
    movdqu  %xmm3, 32(%rdi,%rdx,4)                // |  6 : :v:v  :        |  2    v:            |  0        |
    movdqu  %xmm4, 48(%rdi,%rdx,4)                // |  6 : :v:v  :        |  1     v            |  0        |
    addq    $16, %rdx                             // |  5 : :x:   :        |  0                  |  6 ^^^^^^ |
    addq    $-2, %rsi                             // |  5 : ::x   :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  4 : ::    :        |  0                  |  1  v     |
    testb   $1, %r8b                              // |  4 : ::    v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  4 : ::    :        |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movdqu  (%rdi,%rdx,4), %xmm0                  // |  5 : :v v  :        |  1 ^                |  0        |
    movdqu  16(%rdi,%rdx,4), %xmm1                // |  5 : :v v  :        |  1  ^               |  0        |
    pcmpeqd %xmm2, %xmm2                          // |  4 : ::    :        |  1   ^              |  0        |
    psubd   %xmm2, %xmm0                          // |  4 : ::    :        |  2 ^ v              |  0        |
    psubd   %xmm2, %xmm1                          // |  4 : ::    :        |  3 :^v              |  0        |
    movdqu  %xmm0, (%rdi,%rdx,4)                  // |  5 : :v v  :        |  2 v:               |  0        |
    movdqu  %xmm1, 16(%rdi,%rdx,4)                // |  5 : :v v  :        |  1  v               |  0        |
.LBB0_9:                                          // |                     |                     |           |
    cmpq    %rax, %rcx                            // |  3 v v     :        |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  3 : :     :        |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    incl    (%rdi,%rcx,4)                         // |  4 : v  v  :        |  0                  |  5  ^^^^^ |
    incq    %rcx                                  // |  3 : x     :        |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rax                            // |  3 v v     :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                  // |  1         :        |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    retq                                          // |  2        x:        |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  2    ^    :        |  0                  |  5 ^^^^^  |
    testb   $1, %r8b                              // |  1         v        |  0                  |  6 ^^^^^^ |
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
