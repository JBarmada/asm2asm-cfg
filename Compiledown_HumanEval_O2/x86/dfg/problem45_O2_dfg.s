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
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    movq    %rdx, %r10                            // |  3    v   :  ^      |  0                  |  0        |
    testl   %edi, %edi                            // |  3      v :  :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_15                                  // |  2        :  :      |  0                  |  3  vvv   |
    movl    %edi, %eax                            // |  4 ^    v :  :      |  0                  |  0        |
    xorl    %edi, %edi                            // |  4 :    ^ :  :      |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    cltd                                          // |  4 :    : :  :      |  0                  |  0        |
    idivl   %esi                                  // |  6 x  xx: :  :      |  0                  |  0        |
    addb    $48, %dl                              // |  5 :  x : :  :      |  0                  |  6 ^^^^^^ |
    movb    %dl, -48(%rsp,%rdi)                   // |  5 :  v v v  :      |  0                  |  0        |
    incq    %rdi                                  // |  4 :    x :  :      |  0                  |  5  ^^^^^ |
    testl   %eax, %eax                            // |  4 v    : :  :      |  0                  |  6 ^^^^^^ |
    jg  .LBB0_2                                   // |  3      : :  :      |  0                  |  3  vvv   |
    testl   %edi, %edi                            // |  3      v :  :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_15                                  // |  3      : :  :      |  0                  |  3  vvv   |
    movl    %edi, %r8d                            // |  4      v :^ :      |  0                  |  0        |
    cmpq    $8, %r8                               // |  4      : :v :      |  0                  |  6 ^^^^^^ |
    jae .LBB0_17                                  // |  4      : :: :      |  0                  |  1 v      |
    xorl    %eax, %eax                            // |  5 ^    : :: :      |  0                  |  5 ^^^^^  |
.LBB0_6:                                          // |                     |                     |           |
    movq    %r8, %rbx                             // |  6 :^   : :v :      |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movl    %edi, %ecx                            // |  7 ::^  v :: :      |  0                  |  0        |
    subl    %eax, %ecx                            // |  7 v:x  : :: :      |  0                  |  6 ^^^^^^ |
    movq    %rax, %rsi                            // |  8 v:: ^: :: :      |  0                  |  0        |
    notq    %rsi                                  // |  8 ::: x: :: :      |  0                  |  0        |
    addq    %rsi, %r8                             // |  8 ::: v: :x :      |  0                  |  6 ^^^^^^ |
    testb   $3, %cl                               // |  7 ::v  : :: :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  6 ::   : :: :      |  0                  |  1  v     |
    movl    %edi, %ecx                            // |  7 ::^  v :: :      |  0                  |  0        |
    subb    %al, %cl                              // |  7 v:x  : :: :      |  0                  |  6 ^^^^^^ |
    movzbl  %cl, %ecx                             // |  7 ::^  : :: :      |  0                  |  0        |
    andl    $3, %ecx                              // |  7 ::x  : :: :      |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    decq    %rbx                                  // |  7 :x:  : :: :      |  0                  |  5  ^^^^^ |
    movl    %ebx, %esi                            // |  8 :v: ^: :: :      |  0                  |  0        |
    movzbl  -48(%rsp,%rsi), %edx                  // |  9 :::^v: v: :      |  0                  |  0        |
    movb    %dl, (%r10,%rax)                      // |  8 v::v : :: v      |  0                  |  0        |
    incq    %rax                                  // |  7 x::  : :: :      |  0                  |  5  ^^^^^ |
    decq    %rcx                                  // |  7 ::x  : :: :      |  0                  |  5  ^^^^^ |
    jne .LBB0_9                                   // |  6 ::   : :: :      |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
    cmpq    $3, %r8                               // |  6 ::   : :v :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_13                                  // |  5 ::   : :  :      |  0                  |  1 v      |
    movl    $4294967294, %r8d                     // |  6 ::   : :^ :      |  0                  |  0        |
    movl    %edi, %esi                            // |  7 ::  ^v :: :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    leaq    (%rbx,%r8), %rdx                      // |  8 :v ^:: :v :      |  0                  |  0        |
    leal    1(%rdx), %ecx                         // |  9 ::^v:: :: :      |  0                  |  0        |
    movzbl  -48(%rsp,%rcx), %ecx                  // |  9 ::^::: v: :      |  0                  |  0        |
    movb    %cl, (%r10,%rax)                      // |  9 v:v::: :: v      |  0                  |  0        |
    movl    %edx, %ecx                            // |  9 ::^v:: :: :      |  0                  |  0        |
    movzbl  -48(%rsp,%rcx), %ecx                  // |  9 ::^::: v: :      |  0                  |  0        |
    movb    %cl, 1(%r10,%rax)                     // |  9 v:v::: :: v      |  0                  |  0        |
    decl    %edx                                  // |  8 :: x:: :: :      |  0                  |  5  ^^^^^ |
    movzbl  -48(%rsp,%rdx), %ecx                  // |  9 ::^v:: v: :      |  0                  |  0        |
    movb    %cl, 2(%r10,%rax)                     // |  8 v:v :: :: v      |  0                  |  0        |
    addq    $-4, %rbx                             // |  7 :x  :: :: :      |  0                  |  6 ^^^^^^ |
    movl    %ebx, %ecx                            // |  8 :v^ :: :: :      |  0                  |  0        |
    movzbl  -48(%rsp,%rcx), %ecx                  // |  7 : ^ :: v: :      |  0                  |  0        |
    movb    %cl, 3(%r10,%rax)                     // |  7 v v :: :: v      |  0                  |  0        |
    addq    $4, %rax                              // |  6 x   :: :: :      |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rsi                            // |  6 v   v: :: :      |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  4      : :: :      |  0                  |  1  v     |
.LBB0_13:                                         // |                     |                     |           |
    movl    %edi, %eax                            // |  5 ^    v :: :      |  0                  |  0        |
    jmp .LBB0_16                                  // |  4      : :: :      |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  5 ^    : :: :      |  0                  |  5 ^^^^^  |
.LBB0_16:                                         // |                     |                     |           |
    movb    $0, (%r10,%rax)                       // |  5 v    : :: v      |  0                  |  0        |
    popq    %rbx                                  // |  5  ^   : x: :      |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  4      : x: :      |  0                  |  0        |
.LBB0_17:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    leaq    -1(%r8), %rcx                         // |  5   ^  : :v :      |  0                  |  0        |
    leal    -1(%rdi), %edx                        // |  6   :^ v :: :      |  0                  |  0        |
    xorl    %eax, %eax                            // |  7 ^ :: : :: :      |  0                  |  5 ^^^^^  |
    cmpl    %ecx, %edx                            // |  6   vv : :: :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_6                                   // |  5   :  : :: :      |  0                  |  1 v      |
    shrq    $32, %rcx                             // |  5   x  : :: :      |  0                  |  5 ^^^^^  |
    movq    %r8, %rbx                             // |  5  ^   : :v :      |  0                  |  1  :     |
    jne .LBB0_7                                   // |  4      : :: :      |  0                  |  1  v     |
    cmpl    $32, %r8d                             // |  4      : :v :      |  0                  |  6 ^^^^^^ |
    jae .LBB0_22                                  // |  4      : :: :      |  0                  |  1 v      |
    xorl    %eax, %eax                            // |  5 ^    : :: :      |  0                  |  5 ^^^^^  |
    jmp .LBB0_26                                  // |  4      : :: :      |  0                  |  0        |
.LBB0_22:                                         // |                     |                     |           |
    leaq    -1(%rdi), %r11                        // |  5      v :: :^     |  0                  |  0        |
    movl    %edi, %r9d                            // |  6      v ::^::     |  0                  |  0        |
    movl    %edi, %ebx                            // |  7  ^   v :::::     |  0                  |  0        |
    andl    $31, %ebx                             // |  7  x   : :::::     |  0                  |  5 ^^^^^  |
    movq    %r8, %rax                             // |  8 ^:   : :v:::     |  0                  |  0        |
    subq    %rbx, %rax                            // |  8 xv   : :::::     |  0                  |  6 ^^^^^^ |
    subq    %rbx, %r9                             // |  8 :v   : ::x::     |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // |  9 ::^  : :::::     |  0                  |  5 ^^^^^  |
    pxor    %xmm0, %xmm0                          // |  9 :::  : :::::     |  1 ^                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_23:                                         // |                     |                     |           |
    movl    %r11d, %esi                           // | 10 ::: ^: ::::v     |  1 :                |  0        |
    movdqu  -79(%rsp,%rsi), %xmm1                 // | 10 ::: v: v::::     |  2 :^               |  0        |
    movdqu  -63(%rsp,%rsi), %xmm2                 // | 10 ::: v: v::::     |  3 ::^              |  0        |
    movdqa  %xmm2, %xmm3                          // |  9 :::  : :::::     |  4 ::v^             |  0        |
    punpcklbw   %xmm0, %xmm3                      // |  9 :::  : :::::     |  3 v: ^             |  0        |
    pshufd  $78, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    pshuflw $27, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    pshufhw $27, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    punpckhbw   %xmm0, %xmm2                      // |  9 :::  : :::::     |  4 v:^:             |  0        |
    pshufd  $78, %xmm2, %xmm2                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    pshuflw $27, %xmm2, %xmm2                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    pshufhw $27, %xmm2, %xmm2                     // |  9 :::  : :::::     |  3 :: :             |  0        |
    packuswb    %xmm3, %xmm2                      // |  9 :::  : :::::     |  4 ::^v             |  0        |
    movdqa  %xmm1, %xmm3                          // |  9 :::  : :::::     |  4 :v:^             |  0        |
    punpcklbw   %xmm0, %xmm3                      // |  9 :::  : :::::     |  3 v :^             |  0        |
    pshufd  $78, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 : ::             |  0        |
    pshuflw $27, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 : ::             |  0        |
    pshufhw $27, %xmm3, %xmm3                     // |  9 :::  : :::::     |  3 : ::             |  0        |
    punpckhbw   %xmm0, %xmm1                      // |  9 :::  : :::::     |  4 v^::             |  0        |
    pshufd  $78, %xmm1, %xmm1                     // |  9 :::  : :::::     |  2   ::             |  0        |
    pshuflw $27, %xmm1, %xmm1                     // |  9 :::  : :::::     |  2   ::             |  0        |
    pshufhw $27, %xmm1, %xmm1                     // |  9 :::  : :::::     |  2   ::             |  0        |
    packuswb    %xmm3, %xmm1                      // |  9 :::  : :::::     |  3  ^:v             |  0        |
    movdqu  %xmm2, (%r10,%rcx)                    // |  9 ::v  : :::v:     |  2  :v              |  0        |
    movdqu  %xmm1, 16(%r10,%rcx)                  // |  9 ::v  : :::v:     |  1  v               |  0        |
    addq    $32, %rcx                             // |  9 ::x  : :::::     |  0                  |  6 ^^^^^^ |
    addq    $-32, %r11                            // |  9 :::  : ::::x     |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %r9                             // |  8 ::v  : ::v:      |  0                  |  6 ^^^^^^ |
    jne .LBB0_23                                  // |  6 ::   : :: :      |  0                  |  1  v     |
    testq   %rbx, %rbx                            // |  6 :v   : :: :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  6 ::   : :: :      |  0                  |  1  v     |
    cmpl    $8, %ebx                              // |  6 :v   : :: :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_7                                   // |  5 :    : :: :      |  0                  |  1 v      |
.LBB0_26:                                         // |                     |                     |           |
    movq    %rax, %r11                            // |  6 v    : :: :^     |  0                  |  0        |
    movl    %edi, %r9d                            // |  6      v ::^::     |  0                  |  0        |
    movl    %edi, %ebx                            // |  7  ^   v :::::     |  0                  |  0        |
    andl    $7, %ebx                              // |  7  x   : :::::     |  0                  |  5 ^^^^^  |
    movq    %r8, %rax                             // |  8 ^:   : :v:::     |  0                  |  0        |
    subq    %rbx, %rax                            // |  7 xv   : : :::     |  0                  |  6 ^^^^^^ |
    movq    %r11, %rcx                            // |  7  :^  : : ::v     |  0                  |  0        |
    notq    %rcx                                  // |  7  :x  : : :::     |  0                  |  0        |
    addq    %rdi, %rcx                            // |  7  :x  v : :::     |  0                  |  6 ^^^^^^ |
    subq    %rbx, %r9                             // |  6  v:    : x::     |  0                  |  6 ^^^^^^ |
    pxor    %xmm0, %xmm0                          // |  6  ::    : :::     |  1 ^                |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_27:                                         // |                     |                     |           |
    movl    %ecx, %esi                            // |  7  :v ^  : :::     |  1 :                |  0        |
    movq    -55(%rsp,%rsi), %xmm1                 // |  7  :: v  v :::     |  2 :^               |  0        |
    punpcklbw   %xmm0, %xmm1                      // |  5  ::      :::     |  2 v^               |  0        |
    pshufd  $78, %xmm1, %xmm1                     // |  5  ::      :::     |  0                  |  0        |
    pshuflw $27, %xmm1, %xmm1                     // |  5  ::      :::     |  0                  |  0        |
    pshufhw $27, %xmm1, %xmm1                     // |  5  ::      :::     |  0                  |  0        |
    packuswb    %xmm1, %xmm1                      // |  5  ::      :::     |  1  ^               |  0        |
    movq    %xmm1, (%r10,%r11)                    // |  5  ::      :vv     |  1  v               |  0        |
    addq    $8, %r11                              // |  4  ::      : x     |  0                  |  6 ^^^^^^ |
    addq    $-8, %rcx                             // |  4  :x      : :     |  0                  |  6 ^^^^^^ |
    cmpq    %r11, %r9                             // |  3  :       v v     |  0                  |  6 ^^^^^^ |
    jne .LBB0_27                                  // |  1  :               |  0                  |  1  v     |
    testq   %rbx, %rbx                            // |  1  v               |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  0                  |  0                  |  1  v     |
    jmp .LBB0_13                                  // |  0                  |  0                  |  0        |
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
