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
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %r14, -16                         // |                     |                     |           |
    movq    %rdi, %r14                            // |  3      v :      ^  |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x      :  |  0                  |  0        |
    testq   %rax, %rax                            // |  3 v      :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  2        :      :  |  0                  |  1  v     |
    movzbl  (%r14), %edx                          // |  3    ^   :      v  |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  4   ^:   :      :  |  0                  |  5 ^^^^^  |
    cmpb    $91, %dl                              // |  4   :v   :      :  |  0                  |  6 ^^^^^^ |
    sete    %cl                                   // |  4   x:   :      :  |  0                  |  1  v     |
    xorl    %esi, %esi                            // |  5   ::^  :      :  |  0                  |  5 ^^^^^  |
    cmpb    $93, %dl                              // |  5   :v:  :      :  |  0                  |  6 ^^^^^^ |
    sete    %sil                                  // |  4   : x  :      :  |  0                  |  1  v     |
    subl    %esi, %ecx                            // |  4   x v  :      :  |  0                  |  6 ^^^^^^ |
    xorl    %r8d, %r8d                            // |  4   :    :^     :  |  0                  |  5 ^^^^^  |
    testl   %ecx, %ecx                            // |  4   v    ::     :  |  0                  |  6 ^^^^^^ |
    cmovlel %r8d, %ecx                            // |  4   ^    :v     :  |  0                  |  0        |
    movl    $1, %edi                              // |  5   :  ^ ::     :  |  0                  |  0        |
    movl    %ecx, %esi                            // |  6   v ^: ::     :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    movq    %rdi, %rdx                            // |  7   :^:v ::     :  |  0                  |  0        |
    cmpq    %rdi, %rax                            // |  8 v :::v ::     :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  6   :::  ::     :  |  0                  |  1  v     |
    movzbl  (%r14,%rdx), %ebx                     // |  7  ^:v:  ::     v  |  0                  |  0        |
    xorl    %edi, %edi                            // |  7  ::::^ ::        |  0                  |  5 ^^^^^  |
    cmpb    $91, %bl                              // |  7  v:::: ::        |  0                  |  6 ^^^^^^ |
    sete    %dil                                  // |  7  ::::x ::        |  0                  |  1  v     |
    addl    %edi, %esi                            // |  7  :::xv ::        |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                            // |  7  ::::^ ::        |  0                  |  5 ^^^^^  |
    cmpb    $93, %bl                              // |  7  v:::: ::        |  0                  |  6 ^^^^^^ |
    sete    %dil                                  // |  6   :::x ::        |  0                  |  1  v     |
    subl    %edi, %esi                            // |  6   ::xv ::        |  0                  |  6 ^^^^^^ |
    testl   %esi, %esi                            // |  5   ::v  ::        |  0                  |  6 ^^^^^^ |
    cmovlel %r8d, %esi                            // |  5   ::^  :v        |  0                  |  0        |
    cmpl    %ecx, %esi                            // |  4   v:v  :         |  0                  |  6 ^^^^^^ |
    cmovgl  %esi, %ecx                            // |  4   ^:v  :         |  0                  |  0        |
    leal    -2(%rcx), %ebx                        // |  5  ^v::  :         |  0                  |  0        |
    leaq    1(%rdx), %rdi                         // |  5  : v:^ :         |  0                  |  0        |
    cmpl    %ebx, %esi                            // |  4  v :v  :         |  0                  |  6 ^^^^^^ |
    jg  .LBB0_3                                   // |  2    :   :         |  0                  |  3  vvv   |
.LBB0_5:                                          // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  3   ^:   :         |  0                  |  5 ^^^^^  |
    cmpq    %rdx, %rax                            // |  4 v :v   :         |  0                  |  6 ^^^^^^ |
    seta    %cl                                   // |  2   x    :         |  0                  |  2 vv     |
    jmp .LBB0_6                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  2   ^    :         |  0                  |  5 ^^^^^  |
.LBB0_6:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  3 ^ v    :         |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
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
