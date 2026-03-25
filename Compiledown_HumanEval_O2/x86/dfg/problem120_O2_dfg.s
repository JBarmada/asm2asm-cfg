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
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %r13                                    // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    pushq   %rax                                    // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                          // |                     |                     |           |
    .cfi_offset %rbx, -56                           // |                     |                     |           |
    .cfi_offset %r12, -48                           // |                     |                     |           |
    .cfi_offset %r13, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rsi, %r12                              // |  3     v  :    ^    |  0                  |  0        |
    movq    %rdi, %r15                              // |  4      v :    :  ^ |  0                  |  0        |
    callq   strlen@PLT                              // |  3        x    :  : |  0                  |  0        |
    movq    %rax, %r14                              // |  5 v      :    : ^: |  0                  |  0        |
    movq    %r12, %rdi                              // |  5      ^ :    v :: |  0                  |  0        |
    callq   strlen@PLT                              // |  4        x    : :: |  0                  |  0        |
    testl   %r14d, %r14d                            // |  4        :    : v: |  0                  |  6 ^^^^^^ |
    jle .LBB0_3                                     // |  4        :    : :: |  0                  |  3  vvv   |
    movl    %r14d, %r10d                            // |  5        :  ^ : v: |  0                  |  0        |
    movl    %r14d, %r8d                             // |  6        :^ : : v: |  0                  |  0        |
    andl    $1, %r8d                                // |  6        :x : : :: |  0                  |  5 ^^^^^  |
    cmpq    $1, %r10                                // |  6        :: v : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  6        :: : : :: |  0                  |  1  v     |
    xorl    %esi, %esi                              // |  7     ^  :: : : :: |  0                  |  5 ^^^^^  |
    movl    $1, %ebp                                // |  7       ^:: : : :: |  0                  |  0        |
    xorl    %edi, %edi                              // |  7      ^ :: : : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                     // |  6        :: : : :: |  0                  |  0        |
.LBB0_3:                                            // |                     |                     |           |
    movl    $1, %ebp                                // |  7       ^:: : : :: |  0                  |  0        |
    xorl    %edi, %edi                              // |  7      ^ :: : : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                     // |  6        :: : : :: |  0                  |  0        |
.LBB0_4:                                            // |                     |                     |           |
    subq    %r8, %r10                               // |  6        :v x : :: |  0                  |  6 ^^^^^^ |
    xorl    %r9d, %r9d                              // |  7        ::^: : :: |  0                  |  5 ^^^^^  |
    movl    $1, %ebp                                // |  8       ^:::: : :: |  0                  |  0        |
    xorl    %esi, %esi                              // |  8     ^  :::: : :: |  0                  |  5 ^^^^^  |
    xorl    %edi, %edi                              // |  9     :^ :::: : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    movzbl  (%r15,%rsi), %ebx                       // | 10  ^  v: :::: : :v |  0                  |  0        |
    movzbl  1(%r15,%rsi), %ecx                      // | 11  :^ v: :::: : :v |  0                  |  0        |
    xorl    %edx, %edx                              // | 12  ::^:: :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %bl                                // | 12  v:::: :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // | 12  ::x:: :::: : :: |  0                  |  1  v     |
    addl    %edi, %edx                              // | 12  ::x:v :::: : :: |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                              // | 12  ::::^ :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %bl                                // | 12  v:::: :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %dil                                    // | 11   :::x :::: : :: |  0                  |  1  v     |
    subl    %edi, %edx                              // | 11   :x:v :::: : :: |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                              // | 11   :::^ :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %cl                                // | 11   v::: :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %dil                                    // | 11   :::x :::: : :: |  0                  |  1  v     |
    addl    %edx, %edi                              // | 11   :v:x :::: : :: |  0                  |  6 ^^^^^^ |
    xorl    %ebx, %ebx                              // | 12  ^:::: :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %cl                                // | 12  :v::: :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %bl                                     // | 11  x ::: :::: : :: |  0                  |  1  v     |
    subl    %ebx, %edi                              // | 11  v ::x :::: : :: |  0                  |  6 ^^^^^^ |
    orl %edi, %edx                                  // | 10    x:v :::: : :: |  0                  |  5 ^^^^^  |
    cmovsl  %r9d, %ebp                              // | 10     ::^::v: : :: |  0                  |  0        |
    addq    $2, %rsi                                // |  8     x: :: : : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rsi, %r10                              // |  8     v: :: v : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  7     :: ::   : :: |  0                  |  1  v     |
.LBB0_6:                                            // |                     |                     |           |
    testq   %r8, %r8                                // |  7     :: :v   : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                     // |  6     :: :    : :: |  0                  |  1  v     |
    movzbl  (%r15,%rsi), %ecx                       // |  7   ^ v: :    : :v |  0                  |  0        |
    xorl    %esi, %esi                              // |  7   : ^: :    : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %cl                                // |  7   v :: :    : :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // |  7   : x: :    : :: |  0                  |  1  v     |
    addl    %esi, %edi                              // |  7   : vx :    : :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // |  7   : ^: :    : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %cl                                // |  7   v :: :    : :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // |  6     x: :    : :: |  0                  |  1  v     |
    xorl    %ecx, %ecx                              // |  7   ^ :: :    : :: |  0                  |  5 ^^^^^  |
    subl    %esi, %edi                              // |  7   : vx :    : :: |  0                  |  6 ^^^^^^ |
    cmovsl  %ecx, %ebp                              // |  7   v  :^:    : :: |  0                  |  0        |
.LBB0_8:                                            // |                     |                     |           |
    testl   %eax, %eax                              // |  6 v    : :    : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                    // |  5      : :    : :: |  0                  |  3  vvv   |
    movl    %eax, %r8d                              // |  7 v    : :^   : :: |  0                  |  0        |
    movl    %eax, %r10d                             // |  8 v    : :: ^ : :: |  0                  |  0        |
    andl    $1, %r10d                               // |  7      : :: x : :: |  0                  |  5 ^^^^^  |
    xorl    %r11d, %r11d                            // |  8      : :: :^: :: |  0                  |  5 ^^^^^  |
    movq    %r8, %r9                                // |  9      : :v^::: :: |  0                  |  0        |
    decq    %r9                                     // |  9      : ::x::: :: |  0                  |  5  ^^^^^ |
    je  .LBB0_25                                    // |  9      : :::::: :: |  0                  |  1  v     |
    movq    %r8, %r13                               // | 10      : :v::::^:: |  0                  |  0        |
    subq    %r10, %r13                              // | 10      : :::v::x:: |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                              // | 11   ^  : ::::::::: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_11:                                           // |                     |                     |           |
    movzbl  (%r12,%rcx), %edx                       // | 12   v^ : :::::v::: |  0                  |  0        |
    movzbl  1(%r12,%rcx), %ebx                      // | 13  ^v: : :::::v::: |  0                  |  0        |
    xorl    %esi, %esi                              // | 14  :::^: ::::::::: |  0                  |  5 ^^^^^  |
    cmpb    $40, %dl                                // | 14  ::v:: ::::::::: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // | 14  :::x: ::::::::: |  0                  |  1  v     |
    addl    %edi, %esi                              // | 14  :::xv ::::::::: |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                              // | 14  ::::^ ::::::::: |  0                  |  5 ^^^^^  |
    cmpb    $41, %dl                                // | 14  ::v:: ::::::::: |  0                  |  6 ^^^^^^ |
    sete    %dil                                    // | 13  :: :x ::::::::: |  0                  |  1  v     |
    subl    %edi, %esi                              // | 13  :: xv ::::::::: |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                              // | 13  :: :^ ::::::::: |  0                  |  5 ^^^^^  |
    cmpb    $40, %bl                                // | 13  v: :: ::::::::: |  0                  |  6 ^^^^^^ |
    sete    %dil                                    // | 13  :: :x ::::::::: |  0                  |  1  v     |
    addl    %esi, %edi                              // | 13  :: vx ::::::::: |  0                  |  6 ^^^^^^ |
    xorl    %edx, %edx                              // | 14  ::^:: ::::::::: |  0                  |  5 ^^^^^  |
    cmpb    $41, %bl                                // | 14  v:::: ::::::::: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // | 13   :x:: ::::::::: |  0                  |  1  v     |
    subl    %edx, %edi                              // | 13   :v:x ::::::::: |  0                  |  6 ^^^^^^ |
    orl %edi, %esi                                  // | 12   : xv ::::::::: |  0                  |  5 ^^^^^  |
    cmovsl  %r11d, %ebp                             // | 12   :  :^::::v:::: |  0                  |  0        |
    addq    $2, %rcx                                // | 10   x  : :::: :::: |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %r13                              // | 10   v  : :::: :v:: |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                    // |  8      : :::: : :: |  0                  |  1  v     |
    testq   %r10, %r10                              // |  8      : :::v : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                    // |  8      : :::: : :: |  0                  |  1  v     |
.LBB0_13:                                           // |                     |                     |           |
    movzbl  (%r12,%rcx), %ecx                       // |  9   ^  : :::: v :: |  0                  |  0        |
    xorl    %edx, %edx                              // | 10   :^ : :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %cl                                // | 10   v: : :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // | 10   :x : :::: : :: |  0                  |  1  v     |
    addl    %edx, %edi                              // | 10   :v x :::: : :: |  0                  |  6 ^^^^^^ |
    xorl    %edx, %edx                              // | 10   :^ : :::: : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %cl                                // | 10   v: : :::: : :: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // |  9    x : :::: : :: |  0                  |  1  v     |
    xorl    %ecx, %ecx                              // | 10   ^: : :::: : :: |  0                  |  5 ^^^^^  |
    subl    %edx, %edi                              // | 10   :v x :::: : :: |  0                  |  6 ^^^^^^ |
    cmovsl  %ecx, %ebp                              // | 10   v  :^:::: : :: |  0                  |  0        |
.LBB0_14:                                           // |                     |                     |           |
    testl   %edi, %edi                              // |  9      v::::: : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_20                                    // |  8       ::::: : :: |  0                  |  1  v     |
    testl   %ebp, %ebp                              // |  8       v:::: : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                    // |  7        :::: : :: |  0                  |  1  v     |
.LBB0_20:                                           // |                     |                     |           |
    testl   %eax, %eax                              // |  8 v      :::: : :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_26                                    // |  7        :::: : :: |  0                  |  3  vvv   |
    andl    $1, %eax                                // |  8 x      :::: : :: |  0                  |  5 ^^^^^  |
    testq   %r9, %r9                                // |  8 :      ::v: : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_27                                    // |  7 :      :: : : :: |  0                  |  1  v     |
    subq    %rax, %r8                               // |  7 v      :x : : :: |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                              // |  8 :    ^ :: : : :: |  0                  |  5 ^^^^^  |
    movl    $1, %r9d                                // |  9 :    : ::^: : :: |  0                  |  0        |
    xorl    %edx, %edx                              // |  9 :  ^ : :: : : :: |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                              // | 10 :  :^: :: : : :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_23:                                           // |                     |                     |           |
    movzbl  (%r12,%rdx), %ebx                       // | 11 :^ v:: :: : v :: |  0                  |  0        |
    movzbl  1(%r12,%rdx), %ecx                      // | 12 ::^v:: :: : v :: |  0                  |  0        |
    xorl    %ebp, %ebp                              // | 13 ::::::^:: : : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %bl                                // | 13 :v::::::: : : :: |  0                  |  6 ^^^^^^ |
    sete    %bpl                                    // | 13 ::::::x:: : : :: |  0                  |  1  v     |
    addl    %esi, %ebp                              // | 13 ::::v:x:: : : :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // | 13 ::::^:::: : : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %bl                                // | 13 :v::::::: : : :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // | 12 : ::x:::: : : :: |  0                  |  1  v     |
    subl    %esi, %ebp                              // | 12 : ::v:x:: : : :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // | 12 : ::^:::: : : :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %cl                                // | 12 : v:::::: : : :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // | 12 : ::x:::: : : :: |  0                  |  1  v     |
    addl    %ebp, %esi                              // | 12 : ::x:v:: : : :: |  0                  |  6 ^^^^^^ |
    xorl    %ebx, %ebx                              // | 13 :^::::::: : : :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %cl                                // | 13 ::v:::::: : : :: |  0                  |  6 ^^^^^^ |
    sete    %bl                                     // | 12 :x :::::: : : :: |  0                  |  1  v     |
    subl    %ebx, %esi                              // | 12 :v :x:::: : : :: |  0                  |  6 ^^^^^^ |
    orl %esi, %ebp                                  // | 11 :  :v:x:: : : :: |  0                  |  5 ^^^^^  |
    cmovsl  %edi, %r9d                              // | 11 :  : v:::^: : :: |  0                  |  0        |
    addq    $2, %rdx                                // | 10 :  x :::: : : :: |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %r8                               // | 10 :  v :::v : : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_23                                    // |  8 :    :::  : : :: |  0                  |  1  v     |
    testq   %rax, %rax                              // |  8 v    :::  : : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_28                                    // |  7      :::  : : :: |  0                  |  1  v     |
    jmp .LBB0_29                                    // |  7      :::  : : :: |  0                  |  0        |
.LBB0_17:                                           // |                     |                     |           |
    xorl    %esi, %esi                              // |  8     ^:::  : : :: |  0                  |  5 ^^^^^  |
    movl    $1, %r9d                                // |  8      ::: ^: : :: |  0                  |  0        |
    testl   %edi, %edi                              // |  7      v::  : : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_29                                    // |  6       ::  : : :: |  0                  |  1  v     |
    testl   %ebp, %ebp                              // |  6       v:  : : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_29                                    // |  5        :  : : :: |  0                  |  1  v     |
.LBB0_16:                                           // |                     |                     |           |
    leaq    .L.str(%rip), %rax                      // |  6 ^      :  : : :: |  0                  |  0        |
    jmp .LBB0_37                                    // |  6 :      :  : : :: |  0                  |  0        |
.LBB0_25:                                           // |                     |                     |           |
    xorl    %ecx, %ecx                              // |  7 : ^    :  : : :: |  0                  |  5 ^^^^^  |
    testq   %r10, %r10                              // |  6 :      :  v : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                    // |  5 :      :    : :: |  0                  |  1  v     |
    jmp .LBB0_14                                    // |  5 :      :    : :: |  0                  |  0        |
.LBB0_26:                                           // |                     |                     |           |
    movl    $1, %r9d                                // |  6 :      : ^  : :: |  0                  |  0        |
    xorl    %esi, %esi                              // |  6 :   ^  :    : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_29                                    // |  5 :      :    : :: |  0                  |  0        |
.LBB0_27:                                           // |                     |                     |           |
    xorl    %edx, %edx                              // |  6 :  ^   :    : :: |  0                  |  5 ^^^^^  |
    movl    $1, %r9d                                // |  7 :  :   : ^  : :: |  0                  |  0        |
    xorl    %esi, %esi                              // |  7 :  :^  :    : :: |  0                  |  5 ^^^^^  |
    testq   %rax, %rax                              // |  7 v  ::  :    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_29                                    // |  6    ::  :    : :: |  0                  |  1  v     |
.LBB0_28:                                           // |                     |                     |           |
    movzbl  (%r12,%rdx), %eax                       // |  7 ^  v:  :    v :: |  0                  |  0        |
    xorl    %edx, %edx                              // |  6 :  ^:  :      :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %al                                // |  6 v  ::  :      :: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // |  6 :  x:  :      :: |  0                  |  1  v     |
    addl    %edx, %esi                              // |  6 :  vx  :      :: |  0                  |  6 ^^^^^^ |
    xorl    %edx, %edx                              // |  6 :  ^:  :      :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %al                                // |  6 v  ::  :      :: |  0                  |  6 ^^^^^^ |
    sete    %dl                                     // |  5    x:  :      :: |  0                  |  1  v     |
    xorl    %eax, %eax                              // |  6 ^  ::  :      :: |  0                  |  5 ^^^^^  |
    subl    %edx, %esi                              // |  6 :  vx  :      :: |  0                  |  6 ^^^^^^ |
    cmovsl  %eax, %r9d                              // |  6 v   :  : ^    :: |  0                  |  0        |
.LBB0_29:                                           // |                     |                     |           |
    testl   %r14d, %r14d                            // |  4     :  :      v: |  0                  |  6 ^^^^^^ |
    jle .LBB0_36                                    // |  4     :  :      :: |  0                  |  3  vvv   |
    movl    %r14d, %edx                             // |  5    ^:  :      v: |  0                  |  0        |
    andl    $1, %r14d                               // |  5    ::  :      x: |  0                  |  5 ^^^^^  |
    xorl    %edi, %edi                              // |  6    ::^ :      :: |  0                  |  5 ^^^^^  |
    cmpq    $1, %rdx                                // |  6    v:: :      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_32                                    // |  6    ::: :      :: |  0                  |  1  v     |
    xorl    %eax, %eax                              // |  7 ^  ::: :      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_34                                    // |  6    ::: :      :: |  0                  |  0        |
.LBB0_32:                                           // |                     |                     |           |
    subq    %r14, %rdx                              // |  6    x:: :      v: |  0                  |  6 ^^^^^^ |
    xorl    %eax, %eax                              // |  7 ^  ::: :      :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_33:                                           // |                     |                     |           |
    movzbl  (%r15,%rax), %ecx                       // |  8 v ^::: :      :v |  0                  |  0        |
    movzbl  1(%r15,%rax), %ebx                      // |  9 v^:::: :      :v |  0                  |  0        |
    xorl    %ebp, %ebp                              // | 10 ::::::^:      :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %cl                                // | 10 ::v:::::      :: |  0                  |  6 ^^^^^^ |
    sete    %bpl                                    // | 10 ::::::x:      :: |  0                  |  1  v     |
    addl    %esi, %ebp                              // | 10 ::::v:x:      :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // | 10 ::::^:::      :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %cl                                // | 10 ::v:::::      :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // |  9 :: :x:::      :: |  0                  |  1  v     |
    subl    %esi, %ebp                              // |  9 :: :v:x:      :: |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                              // |  9 :: :^:::      :: |  0                  |  5 ^^^^^  |
    cmpb    $40, %bl                                // |  9 :v :::::      :: |  0                  |  6 ^^^^^^ |
    sete    %sil                                    // |  9 :: :x:::      :: |  0                  |  1  v     |
    addl    %ebp, %esi                              // |  9 :: :x:v:      :: |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                              // | 10 ::^:::::      :: |  0                  |  5 ^^^^^  |
    cmpb    $41, %bl                                // | 10 :v::::::      :: |  0                  |  6 ^^^^^^ |
    sete    %cl                                     // |  9 : x:::::      :: |  0                  |  1  v     |
    subl    %ecx, %esi                              // |  9 : v:x:::      :: |  0                  |  6 ^^^^^^ |
    orl %esi, %ebp                                  // |  8 :  :v:x:      :: |  0                  |  5 ^^^^^  |
    cmovsl  %edi, %r9d                              // |  8 :  ::v : ^    :: |  0                  |  0        |
    addq    $2, %rax                                // |  6 x  ::  :      :: |  0                  |  6 ^^^^^^ |
    cmpq    %rax, %rdx                              // |  6 v  v:  :      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_33                                    // |  4     :  :      :: |  0                  |  1  v     |
.LBB0_34:                                           // |                     |                     |           |
    testq   %r14, %r14                              // |  4     :  :      v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_36                                    // |  3     :  :       : |  0                  |  1  v     |
    movzbl  (%r15,%rax), %eax                       // |  4 ^   :  :       v |  0                  |  0        |
    xorl    %ecx, %ecx                              // |  4 : ^ :  :         |  0                  |  5 ^^^^^  |
    cmpb    $40, %al                                // |  4 v : :  :         |  0                  |  6 ^^^^^^ |
    sete    %cl                                     // |  4 : x :  :         |  0                  |  1  v     |
    addl    %ecx, %esi                              // |  4 : v x  :         |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                              // |  4 : ^ :  :         |  0                  |  5 ^^^^^  |
    cmpb    $41, %al                                // |  4 v : :  :         |  0                  |  6 ^^^^^^ |
    sete    %cl                                     // |  3   x :  :         |  0                  |  1  v     |
    xorl    %eax, %eax                              // |  4 ^ : :  :         |  0                  |  5 ^^^^^  |
    subl    %ecx, %esi                              // |  4 : v x  :         |  0                  |  6 ^^^^^^ |
    cmovsl  %eax, %r9d                              // |  4 v   :  : ^       |  0                  |  0        |
.LBB0_36:                                           // |                     |                     |           |
    testl   %r9d, %r9d                              // |  3     :  : v       |  0                  |  6 ^^^^^^ |
    leaq    .L.str(%rip), %rax                      // |  3 ^   :  :         |  0                  |  0        |
    leaq    .L.str.1(%rip), %rcx                    // |  3   ^ :  :         |  0                  |  0        |
    cmoveq  %rcx, %rax                              // |  4 ^ v :  :         |  0                  |  0        |
    testl   %esi, %esi                              // |  3   : v  :         |  0                  |  6 ^^^^^^ |
    cmovneq %rcx, %rax                              // |  3 ^ v    :         |  0                  |  0        |
.LBB0_37:                                           // |                     |                     |           |
    addq    $8, %rsp                                // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r13                                    // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "Yes"                                   // |                     |                     |           |
    .size   .L.str, 4                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "No"                                    // |                     |                     |           |
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
