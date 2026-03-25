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
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .long   0x7fffffff                             // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    testl   %esi, %esi                             // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_3                                    // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r9d                             // |  2     v    ^       |  0                  |  0        |
    leaq    -1(%r9), %r8                           // |  2         ^v       |  0                  |  0        |
    movl    %r9d, %ecx                             // |  3   ^     :v       |  0                  |  0        |
    andl    $7, %ecx                               // |  3   x     ::       |  0                  |  5 ^^^^^  |
    cmpq    $7, %r8                                // |  3   :     v:       |  0                  |  6 ^^^^^^ |
    jae .LBB0_4                                    // |  3   :     ::       |  0                  |  1 v      |
    xorps   %xmm1, %xmm1                           // |  3   :     ::       |  1  ^               |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  4   :^    ::       |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                    // |  3   :     ::       |  0                  |  0        |
.LBB0_3:                                           // |                     |                     |           |
    cvtsi2ss    %esi, %xmm2                        // |  4   : v   ::       |  1   ^              |  0        |
    jmp .LBB0_12                                   // |  3   :     ::       |  0                  |  0        |
.LBB0_4:                                           // |                     |                     |           |
    movl    %r9d, %eax                             // |  4 ^ :     :v       |  0                  |  0        |
    andl    $-8, %eax                              // |  4 x :     ::       |  0                  |  5 ^^^^^  |
    xorps   %xmm1, %xmm1                           // |  4 : :     ::       |  1  ^               |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  5 : :^    ::       |  1  :               |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_5:                                           // |                     |                     |           |
    addss   (%rdi,%rdx,4), %xmm1                   // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   4(%rdi,%rdx,4), %xmm1                  // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   8(%rdi,%rdx,4), %xmm1                  // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   12(%rdi,%rdx,4), %xmm1                 // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   16(%rdi,%rdx,4), %xmm1                 // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   20(%rdi,%rdx,4), %xmm1                 // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   24(%rdi,%rdx,4), %xmm1                 // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addss   28(%rdi,%rdx,4), %xmm1                 // |  6 : :v v  ::       |  1  x               |  6 ^^^^^^ |
    addq    $8, %rdx                               // |  5 : :x    ::       |  1  :               |  6 ^^^^^^ |
    cmpq    %rdx, %rax                             // |  5 v :v    ::       |  1  :               |  6 ^^^^^^ |
    jne .LBB0_5                                    // |  4   ::    ::       |  1  :               |  1  v     |
.LBB0_6:                                           // |                     |                     |           |
    testq   %rcx, %rcx                             // |  4   v:    ::       |  1  :               |  6 ^^^^^^ |
    je  .LBB0_9                                    // |  4   ::    ::       |  1  :               |  1  v     |
    leaq    (%rdi,%rdx,4), %rax                    // |  6 ^ :v v  ::       |  1  :               |  0        |
    xorl    %edx, %edx                             // |  5 : :^    ::       |  1  :               |  5 ^^^^^  |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_8:                                           // |                     |                     |           |
    addss   (%rax,%rdx,4), %xmm1                   // |  5 v :v    ::       |  1  x               |  6 ^^^^^^ |
    incq    %rdx                                   // |  5 : :x    ::       |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rcx                             // |  5 : vv    ::       |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                    // |  4 :  :    ::       |  0                  |  1  v     |
.LBB0_9:                                           // |                     |                     |           |
    cvtsi2ss    %esi, %xmm2                        // |  5 :  :v   ::       |  1   ^              |  0        |
    testl   %esi, %esi                             // |  5 :  :v   ::       |  1   :              |  6 ^^^^^^ |
    jle .LBB0_12                                   // |  4 :  :    ::       |  1   :              |  3  vvv   |
    divss   %xmm2, %xmm1                           // |  4 x  x    ::       |  2  ^v              |  0        |
    movl    %r9d, %ecx                             // |  4 : ^     :v       |  2  ::              |  0        |
    andl    $3, %ecx                               // |  4 : x     ::       |  2  ::              |  5 ^^^^^  |
    cmpq    $3, %r8                                // |  4 : :     v:       |  2  ::              |  6 ^^^^^^ |
    jae .LBB0_13                                   // |  3 : :      :       |  2  ::              |  1 v      |
    xorps   %xmm0, %xmm0                           // |  3 : :      :       |  3 ^::              |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  4 : :^     :       |  2  ::              |  5 ^^^^^  |
    jmp .LBB0_15                                   // |  4 : ::     :       |  2  ::              |  0        |
.LBB0_12:                                          // |                     |                     |           |
    xorps   %xmm0, %xmm0                           // |  4 : ::     :       |  3 ^::              |  5 ^^^^^  |
    divss   %xmm2, %xmm0                           // |  4 x :x     :       |  3 ^:v              |  0        |
    retq                                           // |  3   :    x :       |  2  ::              |  0        |
.LBB0_13:                                          // |                     |                     |           |
    andl    $-4, %r9d                              // |  3   :    : x       |  2  ::              |  5 ^^^^^  |
    xorps   %xmm0, %xmm0                           // |  3   :    : :       |  3 ^::              |  5 ^^^^^  |
    xorl    %edx, %edx                             // |  4   :^   : :       |  3 :::              |  5 ^^^^^  |
    movaps  .LCPI0_0(%rip), %xmm3                  // |  4   ::   : :       |  4 :::^             |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_14:                                          // |                     |                     |           |
    movss   (%rdi,%rdx,4), %xmm4                   // |  5   :v v : :       |  5 ::::^            |  0        |
    movss   4(%rdi,%rdx,4), %xmm5                  // |  5   :v v : :       |  6 :::::^           |  0        |
    subss   %xmm1, %xmm4                           // |  4   ::   : :       |  6 :v::x:           |  6 ^^^^^^ |
    andps   %xmm3, %xmm4                           // |  4   ::   : :       |  6 :::vx:           |  5 ^^^^^  |
    addss   %xmm0, %xmm4                           // |  4   ::   : :       |  6 v:::x:           |  6 ^^^^^^ |
    subss   %xmm1, %xmm5                           // |  4   ::   : :       |  5  v:::x           |  6 ^^^^^^ |
    andps   %xmm3, %xmm5                           // |  4   ::   : :       |  5  ::v:x           |  5 ^^^^^  |
    addss   %xmm4, %xmm5                           // |  4   ::   : :       |  5  :::vx           |  6 ^^^^^^ |
    movss   8(%rdi,%rdx,4), %xmm4                  // |  5   :v v : :       |  5  :::^:           |  0        |
    subss   %xmm1, %xmm4                           // |  4   ::   : :       |  5  v::x:           |  6 ^^^^^^ |
    andps   %xmm3, %xmm4                           // |  4   ::   : :       |  5  ::vx:           |  5 ^^^^^  |
    addss   %xmm5, %xmm4                           // |  4   ::   : :       |  5  :::xv           |  6 ^^^^^^ |
    movss   12(%rdi,%rdx,4), %xmm0                 // |  5   :v v : :       |  5 ^::::            |  0        |
    subss   %xmm1, %xmm0                           // |  4   ::   : :       |  5 xv:::            |  6 ^^^^^^ |
    andps   %xmm3, %xmm0                           // |  4   ::   : :       |  5 x::v:            |  5 ^^^^^  |
    addss   %xmm4, %xmm0                           // |  4   ::   : :       |  4 x:: v            |  6 ^^^^^^ |
    addq    $4, %rdx                               // |  4   :x   : :       |  3 :::              |  6 ^^^^^^ |
    cmpq    %rdx, %r9                              // |  4   :v   : v       |  3 :::              |  6 ^^^^^^ |
    jne .LBB0_14                                   // |  3   ::   :         |  3 :::              |  1  v     |
.LBB0_15:                                          // |                     |                     |           |
    testq   %rcx, %rcx                             // |  3   v:   :         |  3 :::              |  6 ^^^^^^ |
    je  .LBB0_18                                   // |  3   ::   :         |  3 :::              |  1  v     |
    leaq    (%rdi,%rdx,4), %rax                    // |  5 ^ :v v :         |  3 :::              |  0        |
    xorl    %edx, %edx                             // |  4 : :^   :         |  3 :::              |  5 ^^^^^  |
    movaps  .LCPI0_0(%rip), %xmm3                  // |  4 : ::   :         |  4 :::^             |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_17:                                          // |                     |                     |           |
    movss   (%rax,%rdx,4), %xmm4                   // |  4 v :v   :         |  5 ::::^            |  0        |
    subss   %xmm1, %xmm4                           // |  4 : ::   :         |  5 :v::x            |  6 ^^^^^^ |
    andps   %xmm3, %xmm4                           // |  4 : ::   :         |  4 : :vx            |  5 ^^^^^  |
    addss   %xmm4, %xmm0                           // |  4 : ::   :         |  3 x : v            |  6 ^^^^^^ |
    incq    %rdx                                   // |  4 : :x   :         |  1   :              |  5  ^^^^^ |
    cmpq    %rdx, %rcx                             // |  4 : vv   :         |  1   :              |  6 ^^^^^^ |
    jne .LBB0_17                                   // |  3 :  :   :         |  1   :              |  1  v     |
.LBB0_18:                                          // |                     |                     |           |
    divss   %xmm2, %xmm0                           // |  3 x  x   :         |  2 ^ v              |  0        |
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
