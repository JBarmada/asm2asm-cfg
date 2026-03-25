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
    cmpq    $2, %rdi                              // |  1      v           |  0                  |  6 ^^^^^^ |
    jge .LBB0_2                                   // |  0                  |  0                  |  2   vv   |
    xorl    %eax, %eax                            // |  1 ^                |  0                  |  5 ^^^^^  |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    movb    $1, %al                               // |  2 ^      :         |  0                  |  0        |
    cmpq    $4, %rdi                              // |  2      v :         |  0                  |  6 ^^^^^^ |
    jb  .LBB0_10                                  // |  1        :         |  0                  |  1 v      |
    movl    $2, %ecx                              // |  2   ^    :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movq    %rdi, %rax                            // |  4 ^ :  v :         |  0                  |  0        |
    orq %rcx, %rax                                // |  3 x v    :         |  0                  |  5 ^^^^^  |
    shrq    $32, %rax                             // |  3 x :    :         |  0                  |  5 ^^^^^  |
    je  .LBB0_6                                   // |  2   :    :         |  0                  |  1  v     |
    movq    %rdi, %rax                            // |  4 ^ :  v :         |  0                  |  0        |
    cqto                                          // |  3 : :    :         |  0                  |  0        |
    idivq   %rcx                                  // |  4 x xx   :         |  0                  |  0        |
    testq   %rdx, %rdx                            // |  3   :v   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  2   :    :         |  0                  |  1  v     |
    jmp .LBB0_9                                   // |  2   :    :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movl    %edi, %eax                            // |  4 ^ :  v :         |  0                  |  0        |
    xorl    %edx, %edx                            // |  4 : :^   :         |  0                  |  5 ^^^^^  |
    divl    %ecx                                  // |  4 x xx   :         |  0                  |  0        |
    testq   %rdx, %rdx                            // |  3   :v   :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  3   ::   :         |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    incq    %rcx                                  // |  3   x:   :         |  0                  |  5  ^^^^^ |
    movq    %rcx, %rax                            // |  4 ^ v:   :         |  0                  |  0        |
    imulq   %rcx, %rax                            // |  4 ^ vx   :         |  0                  |  2 ^  ^   |
    cmpq    %rdi, %rax                            // |  4 v  : v :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_5                                   // |  3 :  :   :         |  0                  |  3  vvv   |
.LBB0_9:                                          // |                     |                     |           |
    testq   %rdx, %rdx                            // |  3 :  v   :         |  0                  |  6 ^^^^^^ |
    setne   %al                                   // |  2 x      :         |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
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
