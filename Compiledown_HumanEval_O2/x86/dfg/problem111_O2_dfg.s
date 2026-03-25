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
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .long   1                                       // |                     |                     |           |
    .text                                           // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    testl   %esi, %esi                              // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                     // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                              // |  2     v   ^        |  0                  |  0        |
    cmpl    $8, %esi                                // |  2     v   :        |  0                  |  6 ^^^^^^ |
    jae .LBB0_5                                     // |  1         :        |  0                  |  1 v      |
    xorl    %r9d, %r9d                              // |  2         :^       |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                            // |  2         : ^      |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                     // |  1         :        |  0                  |  0        |
.LBB0_1:                                            // |                     |                     |           |
    xorl    %r10d, %r10d                            // |  2         : ^      |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                    // |  1         :        |  0                  |  0        |
.LBB0_5:                                            // |                     |                     |           |
    movl    %r8d, %r9d                              // |  2         v^       |  0                  |  0        |
    andl    $-8, %r9d                               // |  2         :x       |  0                  |  5 ^^^^^  |
    leaq    -8(%r9), %rax                           // |  3 ^       :v       |  0                  |  0        |
    movq    %rax, %r10                              // |  4 v       ::^      |  0                  |  0        |
    shrq    $3, %r10                                // |  4 :       ::x      |  0                  |  5 ^^^^^  |
    incq    %r10                                    // |  4 :       ::x      |  0                  |  5  ^^^^^ |
    testq   %rax, %rax                              // |  4 v       :::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                     // |  3         :::      |  0                  |  1  v     |
    movq    %r10, %r11                              // |  4         ::v^     |  0                  |  0        |
    andq    $-2, %r11                               // |  4         :::x     |  0                  |  5 ^^^^^  |
    pxor    %xmm3, %xmm3                            // |  4         ::::     |  1    ^             |  0        |
    xorl    %eax, %eax                              // |  5 ^       ::::     |  1    :             |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm2                   // |  5 :       ::::     |  2   ^:             |  0        |
    pxor    %xmm4, %xmm4                            // |  5 :       ::::     |  3   ::^            |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_8:                                            // |                     |                     |           |
    movdqu  (%rdi,%rax,4), %xmm5                    // |  6 v    v  ::::     |  4   :::^           |  0        |
    movdqu  16(%rdi,%rax,4), %xmm6                  // |  6 v    v  ::::     |  4   ::: ^          |  0        |
    movdqu  32(%rdi,%rax,4), %xmm0                  // |  6 v    v  ::::     |  4 ^ :::            |  0        |
    movdqu  48(%rdi,%rax,4), %xmm1                  // |  6 v    v  ::::     |  4  ^:::            |  0        |
    pandn   %xmm2, %xmm5                            // |  5 :       ::::     |  4   v::^           |  0        |
    paddd   %xmm3, %xmm5                            // |  5 :       ::::     |  4   :v:^           |  0        |
    pandn   %xmm2, %xmm6                            // |  5 :       ::::     |  4   v ::^          |  0        |
    paddd   %xmm4, %xmm6                            // |  5 :       ::::     |  4   : v:^          |  0        |
    pandn   %xmm2, %xmm0                            // |  5 :       ::::     |  4 ^ v  ::          |  0        |
    paddd   %xmm5, %xmm0                            // |  5 :       ::::     |  4 ^ :  v:          |  0        |
    pandn   %xmm2, %xmm1                            // |  5 :       ::::     |  4 :^v   :          |  0        |
    paddd   %xmm6, %xmm1                            // |  5 :       ::::     |  3 :^    v          |  0        |
    addq    $16, %rax                               // |  5 x       ::::     |  2 ::               |  6 ^^^^^^ |
    movdqa  %xmm0, %xmm3                            // |  5 :       ::::     |  3 v: ^             |  0        |
    movdqa  %xmm1, %xmm4                            // |  5 :       ::::     |  2  v  ^            |  0        |
    addq    $-2, %r11                               // |  5 :       :::x     |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                     // |  4 :       :::      |  0                  |  1  v     |
    testb   $1, %r10b                               // |  4 :       ::v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                    // |  3 :       ::       |  0                  |  1  v     |
.LBB0_10:                                           // |                     |                     |           |
    movdqu  (%rdi,%rax,4), %xmm2                    // |  4 v    v  ::       |  1   ^              |  0        |
    movdqu  16(%rdi,%rax,4), %xmm3                  // |  4 v    v  ::       |  1    ^             |  0        |
    movdqa  .LCPI0_0(%rip), %xmm4                   // |  2         ::       |  1     ^            |  0        |
    pandn   %xmm4, %xmm2                            // |  2         ::       |  2   ^ v            |  0        |
    paddd   %xmm2, %xmm0                            // |  2         ::       |  3 ^ v :            |  0        |
    pandn   %xmm4, %xmm3                            // |  2         ::       |  2    ^v            |  0        |
    paddd   %xmm3, %xmm1                            // |  2         ::       |  2  ^ v             |  0        |
.LBB0_11:                                           // |                     |                     |           |
    paddd   %xmm1, %xmm0                            // |  2         ::       |  2 ^v               |  0        |
    pshufd  $238, %xmm0, %xmm1                      // |  2         ::       |  1 :                |  0        |
    paddd   %xmm0, %xmm1                            // |  2         ::       |  2 v^               |  0        |
    pshufd  $85, %xmm1, %xmm0                       // |  2         ::       |  1  :               |  0        |
    paddd   %xmm1, %xmm0                            // |  2         ::       |  2 ^v               |  0        |
    movd    %xmm0, %r10d                            // |  3         ::^      |  1 v                |  0        |
    cmpq    %r8, %r9                                // |  3         vv:      |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                    // |  3         :::      |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_4:                                            // |                     |                     |           |
    movl    (%rdi,%r9,4), %eax                      // |  5 ^    v  :v:      |  0                  |  0        |
    notl    %eax                                    // |  4 x       :::      |  0                  |  0        |
    andl    $1, %eax                                // |  4 x       :::      |  0                  |  5 ^^^^^  |
    addl    %eax, %r10d                             // |  4 v       ::x      |  0                  |  6 ^^^^^^ |
    incq    %r9                                     // |  3         :x:      |  0                  |  5  ^^^^^ |
    cmpq    %r9, %r8                                // |  3         vv:      |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  1           :      |  0                  |  1  v     |
.LBB0_12:                                           // |                     |                     |           |
    testl   %ecx, %ecx                              // |  2   v       :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_23                                    // |  1           :      |  0                  |  3  vvv   |
    movl    %ecx, %r9d                              // |  3   v      ^:      |  0                  |  0        |
    cmpl    $8, %ecx                                // |  3   v      ::      |  0                  |  6 ^^^^^^ |
    jae .LBB0_15                                    // |  2          ::      |  0                  |  1 v      |
    xorl    %ecx, %ecx                              // |  3   ^      ::      |  0                  |  5 ^^^^^  |
    jmp .LBB0_22                                    // |  2          ::      |  0                  |  0        |
.LBB0_15:                                           // |                     |                     |           |
    movl    %r9d, %ecx                              // |  3   ^      v:      |  0                  |  0        |
    andl    $-8, %ecx                               // |  3   x      ::      |  0                  |  5 ^^^^^  |
    movd    %r10d, %xmm0                            // |  3   :      :v      |  1 ^                |  0        |
    leaq    -8(%rcx), %rax                          // |  3 ^ v      :       |  1 :                |  0        |
    movq    %rax, %r8                               // |  4 v :     ^:       |  1 :                |  0        |
    shrq    $3, %r8                                 // |  4 : :     x:       |  1 :                |  5 ^^^^^  |
    incq    %r8                                     // |  4 : :     x:       |  1 :                |  5  ^^^^^ |
    testq   %rax, %rax                              // |  4 v :     ::       |  1 :                |  6 ^^^^^^ |
    je  .LBB0_16                                    // |  3   :     ::       |  1 :                |  1  v     |
    movq    %r8, %rdi                               // |  4   :  ^  v:       |  1 :                |  0        |
    andq    $-2, %rdi                               // |  4   :  x  ::       |  1 :                |  5 ^^^^^  |
    pxor    %xmm3, %xmm3                            // |  4   :  :  ::       |  2 :  ^             |  0        |
    xorl    %eax, %eax                              // |  5 ^ :  :  ::       |  2 :  :             |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm2                   // |  5 : :  :  ::       |  3 : ^:             |  0        |
    movdqa  %xmm0, %xmm4                            // |  5 : :  :  ::       |  4 v ::^            |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_18:                                           // |                     |                     |           |
    movdqu  (%rdx,%rax,4), %xmm5                    // |  6 v :v :  ::       |  4   :::^           |  0        |
    movdqu  16(%rdx,%rax,4), %xmm6                  // |  6 v :v :  ::       |  4   ::: ^          |  0        |
    movdqu  32(%rdx,%rax,4), %xmm0                  // |  6 v :v :  ::       |  4 ^ :::            |  0        |
    movdqu  48(%rdx,%rax,4), %xmm1                  // |  6 v :v :  ::       |  4  ^:::            |  0        |
    pandn   %xmm2, %xmm5                            // |  5 : :  :  ::       |  4   v::^           |  0        |
    paddd   %xmm4, %xmm5                            // |  5 : :  :  ::       |  4   ::v^           |  0        |
    pandn   %xmm2, %xmm6                            // |  5 : :  :  ::       |  4   v: :^          |  0        |
    paddd   %xmm3, %xmm6                            // |  5 : :  :  ::       |  4   :v :^          |  0        |
    pandn   %xmm2, %xmm0                            // |  5 : :  :  ::       |  4 ^ v  ::          |  0        |
    paddd   %xmm5, %xmm0                            // |  5 : :  :  ::       |  4 ^ :  v:          |  0        |
    pandn   %xmm2, %xmm1                            // |  5 : :  :  ::       |  4 :^v   :          |  0        |
    paddd   %xmm6, %xmm1                            // |  5 : :  :  ::       |  3 :^    v          |  0        |
    addq    $16, %rax                               // |  5 x :  :  ::       |  2 ::               |  6 ^^^^^^ |
    movdqa  %xmm0, %xmm4                            // |  5 : :  :  ::       |  3 v:  ^            |  0        |
    movdqa  %xmm1, %xmm3                            // |  5 : :  :  ::       |  2  v ^             |  0        |
    addq    $-2, %rdi                               // |  5 : :  x  ::       |  0                  |  6 ^^^^^^ |
    jne .LBB0_18                                    // |  4 : :     ::       |  0                  |  1  v     |
    testb   $1, %r8b                                // |  4 : :     v:       |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                    // |  4 : :     ::       |  0                  |  1  v     |
.LBB0_20:                                           // |                     |                     |           |
    movdqu  (%rdx,%rax,4), %xmm2                    // |  5 v :v    ::       |  1   ^              |  0        |
    movdqu  16(%rdx,%rax,4), %xmm3                  // |  5 v :v    ::       |  1    ^             |  0        |
    movdqa  .LCPI0_0(%rip), %xmm4                   // |  3   :     ::       |  1     ^            |  0        |
    pandn   %xmm4, %xmm2                            // |  3   :     ::       |  2   ^ v            |  0        |
    paddd   %xmm2, %xmm0                            // |  3   :     ::       |  3 ^ v :            |  0        |
    pandn   %xmm4, %xmm3                            // |  3   :     ::       |  2    ^v            |  0        |
    paddd   %xmm3, %xmm1                            // |  3   :     ::       |  2  ^ v             |  0        |
.LBB0_21:                                           // |                     |                     |           |
    paddd   %xmm1, %xmm0                            // |  3   :     ::       |  2 ^v               |  0        |
    pshufd  $238, %xmm0, %xmm1                      // |  3   :     ::       |  1 :                |  0        |
    paddd   %xmm0, %xmm1                            // |  3   :     ::       |  2 v^               |  0        |
    pshufd  $85, %xmm1, %xmm0                       // |  3   :     ::       |  1  :               |  0        |
    paddd   %xmm1, %xmm0                            // |  3   :     ::       |  2 ^v               |  0        |
    movd    %xmm0, %r10d                            // |  4   :     ::^      |  1 v                |  0        |
    cmpq    %r9, %rcx                               // |  4   v     :v:      |  0                  |  6 ^^^^^^ |
    je  .LBB0_23                                    // |  4   :     :::      |  0                  |  1  v     |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_22:                                           // |                     |                     |           |
    movl    (%rdx,%rcx,4), %eax                     // |  6 ^ vv    :::      |  0                  |  0        |
    notl    %eax                                    // |  5 x :     :::      |  0                  |  0        |
    andl    $1, %eax                                // |  5 x :     :::      |  0                  |  5 ^^^^^  |
    addl    %eax, %r10d                             // |  5 v :     ::x      |  0                  |  6 ^^^^^^ |
    incq    %rcx                                    // |  4   x     :::      |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %r9                               // |  4   v     :v:      |  0                  |  6 ^^^^^^ |
    jne .LBB0_22                                    // |  2         : :      |  0                  |  1  v     |
.LBB0_23:                                           // |                     |                     |           |
    cmpl    %esi, %r10d                             // |  3     v   : v      |  0                  |  6 ^^^^^^ |
    leaq    .L.str.1(%rip), %rcx                    // |  3   ^     : :      |  0                  |  0        |
    leaq    .L.str(%rip), %rax                      // |  4 ^ :     : :      |  0                  |  0        |
    cmovlq  %rcx, %rax                              // |  4 ^ v     : :      |  0                  |  0        |
    retq                                            // |  3        x: :      |  0                  |  0        |
.LBB0_6:                                            // |                     |                     |           |
    pxor    %xmm0, %xmm0                            // |  2         : :      |  1 ^                |  0        |
    xorl    %eax, %eax                              // |  3 ^       : :      |  0                  |  5 ^^^^^  |
    pxor    %xmm1, %xmm1                            // |  2         : :      |  1  ^               |  0        |
    testb   $1, %r10b                               // |  2         : v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                    // |  1         :        |  0                  |  1  v     |
    jmp .LBB0_11                                    // |  1         :        |  0                  |  0        |
.LBB0_16:                                           // |                     |                     |           |
    pxor    %xmm1, %xmm1                            // |  1         :        |  1  ^               |  0        |
    xorl    %eax, %eax                              // |  2 ^       :        |  0                  |  5 ^^^^^  |
    testb   $1, %r8b                                // |  1         v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_20                                    // |  0                  |  0                  |  1  v     |
    jmp .LBB0_21                                    // |  0                  |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "YES"                                   // |                     |                     |           |
    .size   .L.str, 4                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "NO"                                    // |                     |                     |           |
    .size   .L.str.1, 3                             // |                     |                     |           |
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
