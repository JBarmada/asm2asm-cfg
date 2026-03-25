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
    cmpb    $40, %dl                              // |  4   :v   :      :  |  0                  |  6 ^^^^^^ |
    sete    %cl                                   // |  4   x:   :      :  |  0                  |  1  v     |
    xorl    %esi, %esi                            // |  5   ::^  :      :  |  0                  |  5 ^^^^^  |
    cmpb    $41, %dl                              // |  5   :v:  :      :  |  0                  |  6 ^^^^^^ |
    sete    %sil                                  // |  4   : x  :      :  |  0                  |  1  v     |
    subl    %esi, %ecx                            // |  4   x v  :      :  |  0                  |  6 ^^^^^^ |
    js  .LBB0_3                                   // |  3   :    :      :  |  0                  |  1   v    |
    movl    $1, %esi                              // |  4   : ^  :      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movq    %rsi, %rdx                            // |  5   :^v  :      :  |  0                  |  0        |
    cmpq    %rsi, %rax                            // |  6 v ::v  :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  4   ::   :      :  |  0                  |  1  v     |
    movzbl  (%r14,%rdx), %ebx                     // |  5  ^:v   :      v  |  0                  |  0        |
    xorl    %esi, %esi                            // |  5  :::^  :         |  0                  |  5 ^^^^^  |
    cmpb    $40, %bl                              // |  5  v:::  :         |  0                  |  6 ^^^^^^ |
    sete    %sil                                  // |  5  :::x  :         |  0                  |  1  v     |
    addl    %esi, %ecx                            // |  5  :x:v  :         |  0                  |  6 ^^^^^^ |
    xorl    %edi, %edi                            // |  5  ::: ^ :         |  0                  |  5 ^^^^^  |
    cmpb    $41, %bl                              // |  5  v:: : :         |  0                  |  6 ^^^^^^ |
    sete    %dil                                  // |  4   :: x :         |  0                  |  1  v     |
    leaq    1(%rdx), %rsi                         // |  5   :v^: :         |  0                  |  0        |
    subl    %edi, %ecx                            // |  4   x: v :         |  0                  |  6 ^^^^^^ |
    jns .LBB0_5                                   // |  2    :   :         |  0                  |  1   v    |
    movl    $1, %ecx                              // |  3   ^:   :         |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    cmpq    %rdx, %rax                            // |  3 v  v   :         |  0                  |  6 ^^^^^^ |
    setbe   %dl                                   // |  2    x   :         |  0                  |  2 vv     |
    jmp .LBB0_9                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  2   ^    :         |  0                  |  5 ^^^^^  |
    movb    $1, %dl                               // |  2    ^   :         |  0                  |  0        |
    jmp .LBB0_9                                   // |  1        :         |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  2    ^   :         |  0                  |  5 ^^^^^  |
    movl    $1, %ecx                              // |  3   ^:   :         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    testl   %ecx, %ecx                            // |  3   v:   :         |  0                  |  6 ^^^^^^ |
    sete    %al                                   // |  3 x  :   :         |  0                  |  1  v     |
    andb    %dl, %al                              // |  3 x  v   :         |  0                  |  5 ^^^^^  |
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
