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
    cmpl    %edi, %esi                            // |  2     vv           |  0                  |  6 ^^^^^^ |
    movl    %edi, %r8d                            // |  2      v  ^        |  0                  |  0        |
    cmovgl  %esi, %r8d                            // |  2     v   ^        |  0                  |  0        |
    movl    $0, (%rcx)                            // |  2   v     :        |  0                  |  0        |
    cmovll  %esi, %edi                            // |  3     v^  :        |  0                  |  0        |
    leal    1(%r8), %r9d                          // |  3      :  v^       |  0                  |  0        |
    movl    %r9d, %eax                            // |  4 ^    :  :v       |  0                  |  0        |
    subl    %edi, %eax                            // |  4 x    v  ::       |  0                  |  6 ^^^^^^ |
    movl    %edi, %esi                            // |  5 :   ^v  ::       |  0                  |  0        |
    testb   $1, %al                               // |  4 v    :  ::       |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  3      :  ::       |  0                  |  1  v     |
    cmpl    $9, %edi                              // |  3      v  ::       |  0                  |  6 ^^^^^^ |
    jg  .LBB0_4                                   // |  3      :  ::       |  0                  |  3  vvv   |
    movl    %edi, %eax                            // |  4 ^    v  ::       |  0                  |  0        |
    andl    $1, %eax                              // |  4 x    :  ::       |  0                  |  5 ^^^^^  |
    jne .LBB0_4                                   // |  3      :  ::       |  0                  |  1  v     |
    movslq  (%rcx), %rax                          // |  5 ^ v  :  ::       |  0                  |  0        |
    leal    1(%rax), %esi                         // |  5 v   ^:  ::       |  0                  |  0        |
    movl    %esi, (%rcx)                          // |  6 : v v:  ::       |  0                  |  0        |
    movl    %edi, (%rdx,%rax,4)                   // |  5 v  v v  ::       |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    leal    1(%rdi), %esi                         // |  4     ^v  ::       |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    cmpl    %edi, %r8d                            // |  4     :v  v:       |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2     :    :       |  0                  |  1  v     |
.LBB0_14:                                         // |                     |                     |           |
    retq                                          // |  3     :  x :       |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    %esi, %r8d                            // |  3     v   ^:       |  0                  |  0        |
    andl    $1, %r8d                              // |  3     :   x:       |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  3     :   ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    addl    $2, %esi                              // |  3     x   ::       |  0                  |  6 ^^^^^^ |
    cmpl    %esi, %r9d                            // |  3     v   :v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  2     :   :        |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    cmpl    $9, %esi                              // |  2     v   :        |  0                  |  6 ^^^^^^ |
    jg  .LBB0_10                                  // |  2     :   :        |  0                  |  3  vvv   |
    testl   %r8d, %r8d                            // |  2     :   v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_10                                  // |  2     :   :        |  0                  |  1  v     |
    movslq  (%rcx), %rax                          // |  4 ^ v :   :        |  0                  |  0        |
    leal    1(%rax), %edi                         // |  4 v   :^  :        |  0                  |  0        |
    movl    %edi, (%rcx)                          // |  5 : v :v  :        |  0                  |  0        |
    movl    %esi, (%rdx,%rax,4)                   // |  4 v  vv   :        |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    leal    1(%rsi), %eax                         // |  3 ^   v   :        |  0                  |  0        |
    cmpl    $9, %eax                              // |  2 v       :        |  0                  |  6 ^^^^^^ |
    jg  .LBB0_13                                  // |  2 :       :        |  0                  |  3  vvv   |
    testl   %r8d, %r8d                            // |  2 :       v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  1 :                |  0                  |  1  v     |
    movslq  (%rcx), %r10                          // |  3 : v       ^      |  0                  |  0        |
    leal    1(%r10), %edi                         // |  3 :    ^    v      |  0                  |  0        |
    movl    %edi, (%rcx)                          // |  4 : v  v    :      |  0                  |  0        |
    movl    %eax, (%rdx,%r10,4)                   // |  3 v  v      v      |  0                  |  0        |
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
