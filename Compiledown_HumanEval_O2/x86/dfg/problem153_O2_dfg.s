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
    testl   %ecx, %ecx                            // |  1   v              |  0                  |  6 ^^^^^^ |
    jle .LBB0_12                                  // |  0                  |  0                  |  3  vvv   |
    movl    %ecx, %r8d                            // |  2   v     ^        |  0                  |  0        |
    cmpl    $8, %ecx                              // |  2   v     :        |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  1         :        |  0                  |  1 v      |
    xorl    %r11d, %r11d                          // |  2         :  ^     |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  1         :        |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    movq    %rdx, %rax                            // |  3 ^  v    :        |  0                  |  0        |
    subq    %rdi, %rax                            // |  3 x    v  :        |  0                  |  6 ^^^^^^ |
    xorl    %r11d, %r11d                          // |  3 :       :  ^     |  0                  |  5 ^^^^^  |
    cmpq    $32, %rax                             // |  2 v       :        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_8                                   // |  1         :        |  0                  |  1 v      |
    movq    %rdx, %rax                            // |  3 ^  v    :        |  0                  |  0        |
    subq    %rsi, %rax                            // |  3 x   v   :        |  0                  |  6 ^^^^^^ |
    cmpq    $32, %rax                             // |  2 v       :        |  0                  |  6 ^^^^^^ |
    jb  .LBB0_8                                   // |  1         :        |  0                  |  1 v      |
    movl    %r8d, %r11d                           // |  2         v  ^     |  0                  |  0        |
    andl    $-8, %r11d                            // |  2         :  x     |  0                  |  5 ^^^^^  |
    leaq    (,%r8,4), %r9                         // |  3         v^ :     |  0                  |  0        |
    andq    $-32, %r9                             // |  3         :x :     |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  4 ^       :: :     |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movdqu  (%rdi,%rax), %xmm0                    // |  5 v    v  :: :     |  1 ^                |  0        |
    movdqu  16(%rdi,%rax), %xmm1                  // |  5 v    v  :: :     |  1  ^               |  0        |
    movdqu  (%rsi,%rax), %xmm2                    // |  5 v   v   :: :     |  1   ^              |  0        |
    psubd   %xmm2, %xmm0                          // |  4 :       :: :     |  2 ^ v              |  0        |
    movdqu  16(%rsi,%rax), %xmm2                  // |  5 v   v   :: :     |  2 : ^              |  0        |
    psubd   %xmm2, %xmm1                          // |  4 :       :: :     |  3 :^v              |  0        |
    movdqa  %xmm0, %xmm2                          // |  4 :       :: :     |  3 v:^              |  0        |
    psrad   $31, %xmm2                            // |  4 :       :: :     |  2  :^              |  0        |
    pxor    %xmm2, %xmm0                          // |  4 :       :: :     |  3 ^:v              |  0        |
    psubd   %xmm2, %xmm0                          // |  4 :       :: :     |  3 ^:v              |  0        |
    movdqa  %xmm1, %xmm2                          // |  4 :       :: :     |  3 :v^              |  0        |
    psrad   $31, %xmm2                            // |  4 :       :: :     |  2 : ^              |  0        |
    pxor    %xmm2, %xmm1                          // |  4 :       :: :     |  3 :^v              |  0        |
    psubd   %xmm2, %xmm1                          // |  4 :       :: :     |  3 :^v              |  0        |
    movdqu  %xmm0, (%rdx,%rax)                    // |  5 v  v    :: :     |  2 v:               |  0        |
    movdqu  %xmm1, 16(%rdx,%rax)                  // |  5 v  v    :: :     |  1  v               |  0        |
    addq    $32, %rax                             // |  4 x       :: :     |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %r9                             // |  4 v       :v :     |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2         :  :     |  0                  |  1  v     |
    cmpq    %r8, %r11                             // |  2         v  v     |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  2         :  :     |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movq    %r11, %r10                            // |  3         : ^v     |  0                  |  0        |
    notq    %r10                                  // |  3         : x:     |  0                  |  0        |
    testb   $1, %r8b                              // |  3         v ::     |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  3         : ::     |  0                  |  1  v     |
    movl    (%rdi,%r11,4), %r9d                   // |  5      v  :^:v     |  0                  |  0        |
    subl    (%rsi,%r11,4), %r9d                   // |  5     v   :x:v     |  0                  |  6 ^^^^^^ |
    movl    %r9d, %eax                            // |  5 ^       :v::     |  0                  |  0        |
    negl    %eax                                  // |  5 x       ::::     |  0                  |  0        |
    cmovsl  %r9d, %eax                            // |  5 ^       :v::     |  0                  |  0        |
    movl    %eax, (%rdx,%r11,4)                   // |  5 v  v    : :v     |  0                  |  0        |
    orq $1, %r11                                  // |  3         : :x     |  0                  |  5 ^^^^^  |
.LBB0_10:                                         // |                     |                     |           |
    addq    %r8, %r10                             // |  3         v x:     |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  2         :  :     |  0                  |  1  v     |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    movl    (%rdi,%r11,4), %ecx                   // |  4   ^  v  :  v     |  0                  |  0        |
    subl    (%rsi,%r11,4), %ecx                   // |  4   x v   :  v     |  0                  |  6 ^^^^^^ |
    movl    %ecx, %eax                            // |  4 ^ v     :  :     |  0                  |  0        |
    negl    %eax                                  // |  4 x :     :  :     |  0                  |  0        |
    cmovsl  %ecx, %eax                            // |  4 ^ v     :  :     |  0                  |  0        |
    movl    %eax, (%rdx,%r11,4)                   // |  4 v  v    :  v     |  0                  |  0        |
    movl    4(%rdi,%r11,4), %eax                  // |  4 ^    v  :  v     |  0                  |  0        |
    subl    4(%rsi,%r11,4), %eax                  // |  4 x   v   :  v     |  0                  |  6 ^^^^^^ |
    movl    %eax, %ecx                            // |  4 v ^     :  :     |  0                  |  0        |
    negl    %ecx                                  // |  4 : x     :  :     |  0                  |  0        |
    cmovsl  %eax, %ecx                            // |  4 v ^     :  :     |  0                  |  0        |
    movl    %ecx, 4(%rdx,%r11,4)                  // |  4   vv    :  v     |  0                  |  0        |
    addq    $2, %r11                              // |  2         :  x     |  0                  |  6 ^^^^^^ |
    cmpq    %r11, %r8                             // |  2         v  v     |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  0                  |  0                  |  1  v     |
.LBB0_12:                                         // |                     |                     |           |
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
