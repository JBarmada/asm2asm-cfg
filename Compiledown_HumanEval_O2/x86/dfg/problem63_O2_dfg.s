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
    .long   2                                      // |                     |                     |           |
    .long   3                                      // |                     |                     |           |
    .long   4                                      // |                     |                     |           |
.LCPI0_1:                                          // |                     |                     |           |
    .long   4                                      // |                     |                     |           |
    .long   4                                      // |                     |                     |           |
    .long   4                                      // |                     |                     |           |
    .long   4                                      // |                     |                     |           |
.LCPI0_2:                                          // |                     |                     |           |
    .long   8                                      // |                     |                     |           |
    .long   8                                      // |                     |                     |           |
    .long   8                                      // |                     |                     |           |
    .long   8                                      // |                     |                     |           |
.LCPI0_3:                                          // |                     |                     |           |
    .long   12                                     // |                     |                     |           |
    .long   12                                     // |                     |                     |           |
    .long   12                                     // |                     |                     |           |
    .long   12                                     // |                     |                     |           |
.LCPI0_4:                                          // |                     |                     |           |
    .long   16                                     // |                     |                     |           |
    .long   16                                     // |                     |                     |           |
    .long   16                                     // |                     |                     |           |
    .long   16                                     // |                     |                     |           |
    .text                                          // |                     |                     |           |
    .globl  func0                                  // |                     |                     |           |
    .p2align    4, 0x90                            // |                     |                     |           |
    .type   func0,@function                        // |                     |                     |           |
func0:                                             // |                     |                     |           |
    .cfi_startproc                                 // |                     |                     |           |
    cmpl    $2, %esi                               // |  1     v            |  0                  |  6 ^^^^^^ |
    jl  .LBB0_15                                   // |  0                  |  0                  |  2   vv   |
    movl    %esi, %r10d                            // |  2     v     ^      |  0                  |  0        |
    leaq    -1(%r10), %r8                          // |  2         ^ v      |  0                  |  0        |
    movl    $1, %ecx                               // |  3   ^     : :      |  0                  |  0        |
    cmpq    $8, %r8                                // |  2         v :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_11                                   // |  2         : :      |  0                  |  1 v      |
    movq    %rdx, %rax                             // |  4 ^  v    : :      |  0                  |  0        |
    subq    %rdi, %rax                             // |  4 x    v  : :      |  0                  |  6 ^^^^^^ |
    addq    $-4, %rax                              // |  3 x       : :      |  0                  |  6 ^^^^^^ |
    cmpq    $32, %rax                              // |  3 v       : :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_11                                   // |  2         : :      |  0                  |  1 v      |
    movq    %r8, %rcx                              // |  3   ^     v :      |  0                  |  0        |
    andq    $-8, %rcx                              // |  3   x     : :      |  0                  |  5 ^^^^^  |
    leaq    -8(%rcx), %rax                         // |  4 ^ v     : :      |  0                  |  0        |
    movq    %rax, %r9                              // |  5 v :     :^:      |  0                  |  0        |
    shrq    $3, %r9                                // |  5 : :     :x:      |  0                  |  5 ^^^^^  |
    incq    %r9                                    // |  5 : :     :x:      |  0                  |  5  ^^^^^ |
    testq   %rax, %rax                             // |  5 v :     :::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                    // |  4   :     :::      |  0                  |  1  v     |
    movq    %r9, %rax                              // |  5 ^ :     :v:      |  0                  |  0        |
    andq    $-2, %rax                              // |  5 x :     :::      |  0                  |  5 ^^^^^  |
    movdqa  .LCPI0_0(%rip), %xmm0                  // |  5 : :     :::      |  1 ^                |  0        |
    xorl    %esi, %esi                             // |  6 : : ^   :::      |  1 :                |  5 ^^^^^  |
    movdqa  .LCPI0_1(%rip), %xmm1                  // |  6 : : :   :::      |  2 :^               |  0        |
    movdqa  .LCPI0_2(%rip), %xmm2                  // |  6 : : :   :::      |  3 ::^              |  0        |
    movdqa  .LCPI0_3(%rip), %xmm3                  // |  6 : : :   :::      |  4 :::^             |  0        |
    movdqa  .LCPI0_4(%rip), %xmm4                  // |  6 : : :   :::      |  5 ::::^            |  0        |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_6:                                           // |                     |                     |           |
    movdqa  %xmm0, %xmm5                           // |  6 : : :   :::      |  6 v::::^           |  0        |
    paddd   %xmm1, %xmm5                           // |  6 : : :   :::      |  6 :v:::^           |  0        |
    cvtdq2ps    %xmm0, %xmm6                       // |  6 : : :   :::      |  5 v ::: ^          |  0        |
    cvtdq2ps    %xmm5, %xmm5                       // |  6 : : :   :::      |  6 : :::^:          |  0        |
    movups  4(%rdi,%rsi,4), %xmm7                  // |  7 : : vv  :::      |  7 : :::::^         |  0        |
    mulps   %xmm6, %xmm7                           // |  7 x :x:   :::      |  7 : ::::v^         |  2 ^  ^   |
    movups  20(%rdi,%rsi,4), %xmm6                 // |  8 : ::vv  :::      |  7 : ::::^:         |  0        |
    mulps   %xmm5, %xmm6                           // |  7 x :x:   :::      |  7 : :::v^:         |  2 ^  ^   |
    movups  %xmm7, (%rdx,%rsi,4)                   // |  7 : :vv   :::      |  6 : ::: :v         |  0        |
    movups  %xmm6, 16(%rdx,%rsi,4)                 // |  7 : :vv   :::      |  5 : ::: v          |  0        |
    movdqa  %xmm0, %xmm5                           // |  7 : :::   :::      |  5 v :::^           |  0        |
    paddd   %xmm2, %xmm5                           // |  7 : :::   :::      |  5 : v::^           |  0        |
    movdqa  %xmm0, %xmm6                           // |  7 : :::   :::      |  4 v  :: ^          |  0        |
    paddd   %xmm3, %xmm6                           // |  7 : :::   :::      |  3    v: ^          |  0        |
    cvtdq2ps    %xmm5, %xmm5                       // |  7 : :::   :::      |  2     :^           |  0        |
    cvtdq2ps    %xmm6, %xmm6                       // |  7 : :::   :::      |  3     ::^          |  0        |
    movups  36(%rdi,%rsi,4), %xmm7                 // |  8 : ::vv  :::      |  4     :::^         |  0        |
    mulps   %xmm5, %xmm7                           // |  7 x :x:   :::      |  4     :v:^         |  2 ^  ^   |
    movups  52(%rdi,%rsi,4), %xmm5                 // |  8 : ::vv  :::      |  4     :^::         |  0        |
    mulps   %xmm6, %xmm5                           // |  7 x :x:   :::      |  4     :^v:         |  2 ^  ^   |
    movups  %xmm7, 32(%rdx,%rsi,4)                 // |  7 : :vv   :::      |  3     :: v         |  0        |
    movups  %xmm5, 48(%rdx,%rsi,4)                 // |  7 : :vv   :::      |  2     :v           |  0        |
    addq    $16, %rsi                              // |  7 : ::x   :::      |  1     :            |  6 ^^^^^^ |
    paddd   %xmm4, %xmm0                           // |  7 : :::   :::      |  2 ^   v            |  0        |
    addq    $-2, %rax                              // |  7 x :::   :::      |  1 :                |  6 ^^^^^^ |
    jne .LBB0_6                                    // |  6   :::   :::      |  1 :                |  1  v     |
    testb   $1, %r9b                               // |  6   :::   :v:      |  1 :                |  6 ^^^^^^ |
    je  .LBB0_9                                    // |  6   :::   :::      |  1 :                |  1  v     |
.LBB0_8:                                           // |                     |                     |           |
    cvtdq2ps    %xmm0, %xmm1                       // |  6   :::   :::      |  2 v^               |  0        |
    paddd   .LCPI0_1(%rip), %xmm0                  // |  6   :::   :::      |  2 ^:               |  0        |
    cvtdq2ps    %xmm0, %xmm0                       // |  6   :::   :::      |  2 ^:               |  0        |
    leaq    (,%rsi,4), %rax                        // |  7 ^ ::v   :::      |  2 ::               |  0        |
    orq $4, %rax                                   // |  7 x :::   :::      |  2 ::               |  5 ^^^^^  |
    movups  (%rdi,%rax), %xmm2                     // |  8 v :::v  :::      |  3 ::^              |  0        |
    mulps   %xmm1, %xmm2                           // |  7 x :x:   :::      |  3 :v^              |  2 ^  ^   |
    movups  16(%rdi,%rax), %xmm1                   // |  8 v :::v  :::      |  3 :^:              |  0        |
    mulps   %xmm0, %xmm1                           // |  7 x :x:   :::      |  3 v^:              |  2 ^  ^   |
    movups  %xmm2, (%rdx,%rsi,4)                   // |  6   :vv   :::      |  2  :v              |  0        |
    movups  %xmm1, 16(%rdx,%rsi,4)                 // |  6   :vv   :::      |  1  v               |  0        |
.LBB0_9:                                           // |                     |                     |           |
    cmpq    %rcx, %r8                              // |  5   v:    v::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                   // |  4   ::     ::      |  0                  |  1  v     |
    orq $1, %rcx                                   // |  4   x:     ::      |  0                  |  5 ^^^^^  |
.LBB0_11:                                          // |                     |                     |           |
    movq    %rcx, %rax                             // |  5 ^ v:     ::      |  0                  |  0        |
    notq    %rax                                   // |  5 x ::     ::      |  0                  |  0        |
    testb   $1, %r10b                              // |  5 : ::     :v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                   // |  5 : ::     ::      |  0                  |  1  v     |
    xorps   %xmm0, %xmm0                           // |  5 : ::     ::      |  1 ^                |  5 ^^^^^  |
    cvtsi2ss    %ecx, %xmm0                        // |  5 : v:     ::      |  1 ^                |  0        |
    mulss   (%rdi,%rcx,4), %xmm0                   // |  6 x vx v   ::      |  1 ^                |  2 ^  ^   |
    movss   %xmm0, -4(%rdx,%rcx,4)                 // |  5 : vv     ::      |  1 v                |  0        |
    incq    %rcx                                   // |  5 : x:     ::      |  0                  |  5  ^^^^^ |
.LBB0_13:                                          // |                     |                     |           |
    addq    %r10, %rax                             // |  5 x ::     :v      |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                   // |  5 : ::     ::      |  0                  |  1  v     |
    .p2align    4, 0x90                            // |                     |                     |           |
.LBB0_14:                                          // |                     |                     |           |
    xorps   %xmm0, %xmm0                           // |  5 : ::     ::      |  1 ^                |  5 ^^^^^  |
    cvtsi2ss    %ecx, %xmm0                        // |  5 : v:     ::      |  1 ^                |  0        |
    mulss   (%rdi,%rcx,4), %xmm0                   // |  6 x vx v   ::      |  1 ^                |  2 ^  ^   |
    leal    1(%rcx), %eax                          // |  5 ^ v:     ::      |  1 :                |  0        |
    xorps   %xmm1, %xmm1                           // |  5 : ::     ::      |  2 :^               |  5 ^^^^^  |
    cvtsi2ss    %eax, %xmm1                        // |  5 v ::     ::      |  2 :^               |  0        |
    movss   %xmm0, -4(%rdx,%rcx,4)                 // |  5 : vv     ::      |  1 v                |  0        |
    mulss   4(%rdi,%rcx,4), %xmm1                  // |  6 x vx v   ::      |  1  ^               |  2 ^  ^   |
    movss   %xmm1, (%rdx,%rcx,4)                   // |  4   vv     ::      |  1  v               |  0        |
    addq    $2, %rcx                               // |  3   x      ::      |  0                  |  6 ^^^^^^ |
    cmpq    %r10, %rcx                             // |  3   v      :v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                   // |  1          :       |  0                  |  1  v     |
.LBB0_15:                                          // |                     |                     |           |
    retq                                           // |  2        x :       |  0                  |  0        |
.LBB0_4:                                           // |                     |                     |           |
    movdqa  .LCPI0_0(%rip), %xmm0                  // |  1          :       |  1 ^                |  0        |
    xorl    %esi, %esi                             // |  2     ^    :       |  0                  |  5 ^^^^^  |
    testb   $1, %r9b                               // |  1          v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                    // |  0                  |  0                  |  1  v     |
    jmp .LBB0_9                                    // |  0                  |  0                  |  0        |
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
