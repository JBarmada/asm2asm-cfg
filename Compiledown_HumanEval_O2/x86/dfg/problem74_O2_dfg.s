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
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %r14, -16                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    cmpl    $2, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_14                                  // |  1        :         |  0                  |  2   vv   |
    movl    %esi, %r8d                            // |  3     v  :^        |  0                  |  0        |
    shrl    %r8d                                  // |  2        :x        |  0                  |  5 ^^^^^  |
    cmpl    $24, %esi                             // |  3     v  ::        |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  2        ::        |  0                  |  1 v      |
    xorl    %r14d, %r14d                          // |  3        ::     ^  |  0                  |  5 ^^^^^  |
.LBB0_8:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  4 ^      ::     :  |  0                  |  5 ^^^^^  |
.LBB0_9:                                          // |                     |                     |           |
    movq    %r14, %r10                            // |  5 :      :: ^   v  |  0                  |  0        |
    notq    %r10                                  // |  5 :      :: x   :  |  0                  |  0        |
    testb   $1, %r8b                              // |  5 :      :v :   :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  5 :      :: :   :  |  0                  |  1  v     |
    movl    (%rdi,%r14,4), %r9d                   // |  7 :    v ::^:   v  |  0                  |  0        |
    movl    %r14d, %ecx                           // |  7 : ^    ::::   v  |  0                  |  0        |
    notl    %ecx                                  // |  7 : x    ::::   :  |  0                  |  0        |
    addl    %esi, %ecx                            // |  8 : x v  ::::   :  |  0                  |  6 ^^^^^^ |
    movslq  %ecx, %r11                            // |  8 : v    ::::^  :  |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  8 : ^    :::::  :  |  0                  |  5 ^^^^^  |
    cmpl    (%rdi,%r11,4), %r9d                   // |  9 : :  v ::v:v  :  |  0                  |  6 ^^^^^^ |
    setne   %cl                                   // |  6 : x    :: :   :  |  0                  |  1  v     |
    addl    %ecx, %eax                            // |  6 x v    :: :   :  |  0                  |  6 ^^^^^^ |
    orq $1, %r14                                  // |  5 :      :: :   x  |  0                  |  5 ^^^^^  |
.LBB0_11:                                         // |                     |                     |           |
    addq    %r8, %r10                             // |  5 :      :v x   :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  4 :      ::     :  |  0                  |  1  v     |
    movl    %r14d, %ecx                           // |  5 : ^    ::     v  |  0                  |  0        |
    notl    %ecx                                  // |  5 : x    ::     :  |  0                  |  0        |
    addl    %esi, %ecx                            // |  6 : x v  ::     :  |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    movslq  %ecx, %rcx                            // |  5 : ^    ::     :  |  0                  |  0        |
    movl    (%rdi,%r14,4), %esi                   // |  7 : : ^v ::     v  |  0                  |  0        |
    movl    4(%rdi,%r14,4), %edx                  // |  8 : :^:v ::     v  |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  8 :^:::  ::     :  |  0                  |  5 ^^^^^  |
    cmpl    (%rdi,%rcx,4), %esi                   // |  9 ::v:vv ::     :  |  0                  |  6 ^^^^^^ |
    setne   %bl                                   // |  7 :x::   ::     :  |  0                  |  1  v     |
    addl    %eax, %ebx                            // |  7 vx::   ::     :  |  0                  |  6 ^^^^^^ |
    leal    -1(%rcx), %eax                        // |  7 ^:v:   ::     :  |  0                  |  0        |
    movslq  %eax, %rsi                            // |  8 v:::^  ::     :  |  0                  |  0        |
    xorl    %eax, %eax                            // |  8 ^::::  ::     :  |  0                  |  5 ^^^^^  |
    cmpl    (%rdi,%rsi,4), %edx                   // |  9 :::vvv ::     :  |  0                  |  6 ^^^^^^ |
    setne   %al                                   // |  7 x:: :  ::     :  |  0                  |  1  v     |
    addl    %ebx, %eax                            // |  7 xv: :  ::     :  |  0                  |  6 ^^^^^^ |
    addq    $2, %r14                              // |  5   : :  ::     x  |  0                  |  6 ^^^^^^ |
    addl    $-2, %ecx                             // |  5   x :  ::     :  |  0                  |  6 ^^^^^^ |
    cmpq    %r14, %r8                             // |  4     :  :v     v  |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  3     :  ::        |  0                  |  1  v     |
    jmp .LBB0_14                                  // |  3     :  ::        |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    leaq    -1(%r8), %r9                          // |  4     :  :v^       |  0                  |  0        |
    leal    -1(%rsi), %ecx                        // |  5   ^ v  :::       |  0                  |  0        |
    movl    %ecx, %eax                            // |  6 ^ v :  :::       |  0                  |  0        |
    subl    %r9d, %eax                            // |  6 x : :  ::v       |  0                  |  6 ^^^^^^ |
    xorl    %r14d, %r14d                          // |  7 : : :  :::    ^  |  0                  |  5 ^^^^^  |
    cmpl    %ecx, %eax                            // |  6 v v :  :::       |  0                  |  6 ^^^^^^ |
    jg  .LBB0_8                                   // |  4     :  :::       |  0                  |  3  vvv   |
    shrq    $32, %r9                              // |  4     :  ::x       |  0                  |  5 ^^^^^  |
    movl    $0, %eax                              // |  4 ^   :  ::        |  0                  |  1  :     |
    jne .LBB0_9                                   // |  3     :  ::        |  0                  |  1  v     |
    movl    %r8d, %r14d                           // |  4     :  :v     ^  |  0                  |  0        |
    andl    $-8, %r14d                            // |  4     :  ::     x  |  0                  |  5 ^^^^^  |
    movl    %esi, %r9d                            // |  5     v  ::^    :  |  0                  |  0        |
    andl    $-16, %r9d                            // |  4        ::x    :  |  0                  |  5 ^^^^^  |
    addq    %r9, %r9                              // |  4        ::x    :  |  0                  |  6 ^^^^^^ |
    pxor    %xmm0, %xmm0                          // |  4        :::    :  |  1 ^                |  0        |
    xorl    %eax, %eax                            // |  5 ^      :::    :  |  0                  |  5 ^^^^^  |
    pcmpeqd %xmm2, %xmm2                          // |  5 :      :::    :  |  1   ^              |  0        |
    pxor    %xmm1, %xmm1                          // |  5 :      :::    :  |  2  ^:              |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movdqu  (%rdi,%rax), %xmm3                    // |  6 v    v :::    :  |  2   :^             |  0        |
    movdqu  16(%rdi,%rax), %xmm4                  // |  6 v    v :::    :  |  3   ::^            |  0        |
    movslq  %ecx, %rcx                            // |  6 : ^    :::    :  |  3   :::            |  0        |
    movdqu  -28(%rdi,%rcx,4), %xmm5               // |  7 : v  v :::    :  |  4   :::^           |  0        |
    movdqu  -12(%rdi,%rcx,4), %xmm6               // |  7 : v  v :::    :  |  4   ::: ^          |  0        |
    pshufd  $27, %xmm6, %xmm6                     // |  6 : :    :::    :  |  3   :::            |  0        |
    pcmpeqd %xmm3, %xmm6                          // |  6 : :    :::    :  |  4   :v: ^          |  0        |
    paddd   %xmm6, %xmm0                          // |  6 : :    :::    :  |  4 ^ : : v          |  0        |
    pshufd  $27, %xmm5, %xmm3                     // |  6 : :    :::    :  |  2   : :            |  0        |
    pcmpeqd %xmm4, %xmm3                          // |  6 : :    :::    :  |  3   :^v            |  0        |
    paddd   %xmm3, %xmm1                          // |  6 : :    :::    :  |  3  ^:v             |  0        |
    psubd   %xmm2, %xmm0                          // |  6 : :    :::    :  |  2 ^ v              |  0        |
    psubd   %xmm2, %xmm1                          // |  6 : :    :::    :  |  3 :^v              |  0        |
    addq    $32, %rax                             // |  6 x :    :::    :  |  1 :                |  6 ^^^^^^ |
    addl    $-8, %ecx                             // |  6 : x    :::    :  |  1 :                |  6 ^^^^^^ |
    cmpq    %rax, %r9                             // |  5 v      ::v    :  |  1 :                |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  3        ::     :  |  1 :                |  1  v     |
    paddd   %xmm0, %xmm1                          // |  3        ::     :  |  2 v^               |  0        |
    pshufd  $238, %xmm1, %xmm0                    // |  3        ::     :  |  1  :               |  0        |
    paddd   %xmm1, %xmm0                          // |  3        ::     :  |  2 ^v               |  0        |
    pshufd  $85, %xmm0, %xmm1                     // |  3        ::     :  |  1 :                |  0        |
    paddd   %xmm0, %xmm1                          // |  3        ::     :  |  2 v^               |  0        |
    movd    %xmm1, %eax                           // |  4 ^      ::     :  |  1  v               |  0        |
    cmpq    %r8, %r14                             // |  3        :v     v  |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  1        :         |  0                  |  1  v     |
.LBB0_14:                                         // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
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
