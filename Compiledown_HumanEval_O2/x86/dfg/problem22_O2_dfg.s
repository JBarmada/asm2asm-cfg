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
    movss   (%rdi), %xmm2                         // |  1      v           |  1   ^              |  0        |
    movl    %esi, %r8d                            // |  2     v   ^        |  1   :              |  0        |
    cmpl    $2, %esi                              // |  2     v   :        |  1   :              |  6 ^^^^^^ |
    jl  .LBB0_1                                   // |  1         :        |  1   :              |  2   vv   |
    leaq    -1(%r8), %rcx                         // |  2   ^     v        |  1   :              |  0        |
    leaq    -2(%r8), %rdx                         // |  3   :^    v        |  1   :              |  0        |
    movl    %ecx, %eax                            // |  4 ^ v:    :        |  1   :              |  0        |
    andl    $3, %eax                              // |  4 x ::    :        |  1   :              |  5 ^^^^^  |
    cmpq    $3, %rdx                              // |  4 : :v    :        |  1   :              |  6 ^^^^^^ |
    jae .LBB0_20                                  // |  3 : :     :        |  1   :              |  1 v      |
    movl    $1, %edx                              // |  4 : :^    :        |  1   :              |  0        |
    movaps  %xmm2, %xmm3                          // |  3 : :     :        |  2   v^             |  0        |
    jmp .LBB0_5                                   // |  3 : :     :        |  1   :              |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movaps  %xmm2, %xmm0                          // |  3 : :     :        |  2 ^ v              |  0        |
    movaps  %xmm2, %xmm1                          // |  3 : :     :        |  2  ^v              |  0        |
    jmp .LBB0_8                                   // |  3 : :     :        |  1   :              |  0        |
.LBB0_20:                                         // |                     |                     |           |
    andq    $-4, %rcx                             // |  3 : x     :        |  1   :              |  5 ^^^^^  |
    xorl    %edx, %edx                            // |  4 : :^    :        |  1   :              |  5 ^^^^^  |
    movaps  %xmm2, %xmm3                          // |  4 : ::    :        |  2   v^             |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_21:                                         // |                     |                     |           |
    movss   4(%rdi,%rdx,4), %xmm0                 // |  5 : :v v  :        |  3 ^ ::             |  0        |
    movss   8(%rdi,%rdx,4), %xmm1                 // |  5 : :v v  :        |  4 :^::             |  0        |
    movaps  %xmm0, %xmm4                          // |  4 : ::    :        |  5 v:::^            |  0        |
    minss   %xmm3, %xmm4                          // |  4 : ::    :        |  4  ::v^            |  0        |
    maxss   %xmm2, %xmm0                          // |  4 : ::    :        |  4 ^:v :            |  0        |
    movaps  %xmm1, %xmm2                          // |  4 : ::    :        |  4 :v^ :            |  0        |
    minss   %xmm4, %xmm2                          // |  4 : ::    :        |  3 : ^ v            |  0        |
    maxss   %xmm0, %xmm1                          // |  4 : ::    :        |  3 v^:              |  0        |
    movss   12(%rdi,%rdx,4), %xmm0                // |  5 : :v v  :        |  3 ^::              |  0        |
    movaps  %xmm0, %xmm4                          // |  4 : ::    :        |  4 v:: ^            |  0        |
    minss   %xmm2, %xmm4                          // |  4 : ::    :        |  3  :v ^            |  0        |
    maxss   %xmm1, %xmm0                          // |  4 : ::    :        |  3 ^v  :            |  0        |
    movss   16(%rdi,%rdx,4), %xmm2                // |  5 : :v v  :        |  3 : ^ :            |  0        |
    movaps  %xmm2, %xmm3                          // |  4 : ::    :        |  4 : v^:            |  0        |
    minss   %xmm4, %xmm3                          // |  4 : ::    :        |  3 :  ^v            |  0        |
    maxss   %xmm0, %xmm2                          // |  4 : ::    :        |  3 v ^:             |  0        |
    addq    $4, %rdx                              // |  4 : :x    :        |  2   ::             |  6 ^^^^^^ |
    cmpq    %rdx, %rcx                            // |  4 : vv    :        |  2   ::             |  6 ^^^^^^ |
    jne .LBB0_21                                  // |  3 :  :    :        |  2   ::             |  1  v     |
    incq    %rdx                                  // |  3 :  x    :        |  2   ::             |  5  ^^^^^ |
.LBB0_5:                                          // |                     |                     |           |
    movaps  %xmm3, %xmm0                          // |  3 :  :    :        |  3 ^ :v             |  0        |
    movaps  %xmm2, %xmm1                          // |  3 :  :    :        |  3  ^v:             |  0        |
    testq   %rax, %rax                            // |  3 v  :    :        |  2   ::             |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  3 :  :    :        |  2   ::             |  1  v     |
    leaq    (%rdi,%rdx,4), %rcx                   // |  5 : ^v v  :        |  2   ::             |  0        |
    xorl    %edx, %edx                            // |  4 : :^    :        |  2   ::             |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movss   (%rcx,%rdx,4), %xmm1                  // |  4 : vv    :        |  3  ^::             |  0        |
    movaps  %xmm1, %xmm0                          // |  3 :  :    :        |  4 ^v::             |  0        |
    minss   %xmm3, %xmm0                          // |  3 :  :    :        |  3 ^ :v             |  0        |
    maxss   %xmm2, %xmm1                          // |  3 :  :    :        |  3 :^v              |  0        |
    incq    %rdx                                  // |  3 :  x    :        |  2 ::               |  5  ^^^^^ |
    movaps  %xmm1, %xmm2                          // |  3 :  :    :        |  3 :v^              |  0        |
    movaps  %xmm0, %xmm3                          // |  3 :  :    :        |  3 v: ^             |  0        |
    cmpq    %rdx, %rax                            // |  3 v  v    :        |  2 ::               |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  1         :        |  2 ::               |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v   :        |  2 ::               |  6 ^^^^^^ |
    jle .LBB0_19                                  // |  1         :        |  2 ::               |  3  vvv   |
    subss   %xmm0, %xmm1                          // |  1         :        |  2 vx               |  6 ^^^^^^ |
    cmpl    $4, %esi                              // |  2     v   :        |  2 ::               |  6 ^^^^^^ |
    jae .LBB0_12                                  // |  1         :        |  2 ::               |  1 v      |
    xorl    %ecx, %ecx                            // |  2   ^     :        |  2 ::               |  5 ^^^^^  |
    jmp .LBB0_11                                  // |  1         :        |  2 ::               |  0        |
.LBB0_12:                                         // |                     |                     |           |
    movl    %r8d, %ecx                            // |  2   ^     v        |  2 ::               |  0        |
    andl    $-4, %ecx                             // |  2   x     :        |  2 ::               |  5 ^^^^^  |
    movaps  %xmm0, %xmm2                          // |  2   :     :        |  3 v:^              |  0        |
    shufps  $0, %xmm0, %xmm2                      // |  2   :     :        |  3 :::              |  0        |
    movaps  %xmm1, %xmm3                          // |  2   :     :        |  4 :v:^             |  0        |
    shufps  $0, %xmm1, %xmm3                      // |  2   :     :        |  4 ::::             |  0        |
    leaq    -4(%rcx), %rdx                        // |  3   v^    :        |  4 ::::             |  0        |
    movq    %rdx, %rax                            // |  4 ^ :v    :        |  4 ::::             |  0        |
    shrq    $2, %rax                              // |  4 x ::    :        |  4 ::::             |  5 ^^^^^  |
    incq    %rax                                  // |  4 x ::    :        |  4 ::::             |  5  ^^^^^ |
    testq   %rdx, %rdx                            // |  4 : :v    :        |  4 ::::             |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  3 : :     :        |  4 ::::             |  1  v     |
    movq    %rax, %rsi                            // |  4 v : ^   :        |  4 ::::             |  0        |
    andq    $-2, %rsi                             // |  4 : : x   :        |  4 ::::             |  5 ^^^^^  |
    xorl    %edx, %edx                            // |  5 : :^:   :        |  4 ::::             |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_15:                                         // |                     |                     |           |
    movups  (%rdi,%rdx,4), %xmm4                  // |  6 : :v:v  :        |  5 ::::^            |  0        |
    movups  16(%rdi,%rdx,4), %xmm5                // |  6 : :v:v  :        |  6 :::::^           |  0        |
    subps   %xmm2, %xmm4                          // |  5 : :::   :        |  6 ::v:x:           |  6 ^^^^^^ |
    divps   %xmm3, %xmm4                          // |  5 x :x:   :        |  6 :::v^:           |  0        |
    movups  %xmm4, (%rdi,%rdx,4)                  // |  6 : :v:v  :        |  6 ::::v:           |  0        |
    subps   %xmm2, %xmm5                          // |  5 : :::   :        |  5 ::v: x           |  6 ^^^^^^ |
    divps   %xmm3, %xmm5                          // |  5 x :x:   :        |  5 :::v ^           |  0        |
    movups  %xmm5, 16(%rdi,%rdx,4)                // |  6 : :v:v  :        |  5 :::: v           |  0        |
    addq    $8, %rdx                              // |  5 : :x:   :        |  4 ::::             |  6 ^^^^^^ |
    addq    $-2, %rsi                             // |  5 : ::x   :        |  4 ::::             |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  4 : ::    :        |  4 ::::             |  1  v     |
    testb   $1, %al                               // |  4 v ::    :        |  4 ::::             |  6 ^^^^^^ |
    je  .LBB0_18                                  // |  4 : ::    :        |  4 ::::             |  1  v     |
.LBB0_17:                                         // |                     |                     |           |
    movups  (%rdi,%rdx,4), %xmm4                  // |  5 : :v v  :        |  5 ::::^            |  0        |
    subps   %xmm2, %xmm4                          // |  4 : ::    :        |  5 ::v:x            |  6 ^^^^^^ |
    divps   %xmm3, %xmm4                          // |  4 x :x    :        |  4 :: v^            |  0        |
    movups  %xmm4, (%rdi,%rdx,4)                  // |  5 : :v v  :        |  3 ::  v            |  0        |
.LBB0_18:                                         // |                     |                     |           |
    cmpq    %r8, %rcx                             // |  4 : v:    v        |  2 ::               |  6 ^^^^^^ |
    je  .LBB0_19                                  // |  4 : ::    :        |  2 ::               |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    movss   (%rdi,%rcx,4), %xmm2                  // |  5 : v: v  :        |  3 ::^              |  0        |
    subss   %xmm0, %xmm2                          // |  4 : ::    :        |  3 v:x              |  6 ^^^^^^ |
    divss   %xmm1, %xmm2                          // |  4 x :x    :        |  2  v^              |  0        |
    movss   %xmm2, (%rdi,%rcx,4)                  // |  4 : v  v  :        |  1   v              |  0        |
    incq    %rcx                                  // |  3 : x     :        |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %r8                             // |  3 : v     v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  1 :                |  0                  |  1  v     |
.LBB0_19:                                         // |                     |                     |           |
    retq                                          // |  2 :      x         |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    xorl    %edx, %edx                            // |  2 :  ^             |  0                  |  5 ^^^^^  |
    testb   $1, %al                               // |  1 v                |  0                  |  6 ^^^^^^ |
    jne .LBB0_17                                  // |  0                  |  0                  |  1  v     |
    jmp .LBB0_18                                  // |  0                  |  0                  |  0        |
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
