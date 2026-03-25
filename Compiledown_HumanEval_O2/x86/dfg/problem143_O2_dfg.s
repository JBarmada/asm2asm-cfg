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
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r9d                            // |  2     v    ^       |  0                  |  0        |
    xorl    %edx, %edx                            // |  2    ^     :       |  0                  |  5 ^^^^^  |
    movl    $2863311531, %r8d                     // |  3    :    ^:       |  0                  |  0        |
    xorl    %eax, %eax                            // |  4 ^  :    ::       |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  4 :  :    ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movl    (%rdi,%rdx,4), %ecx                   // |  6 : ^v v  ::       |  0                  |  0        |
    imull   %ecx, %ecx                            // |  5 x ^x    ::       |  0                  |  2 ^  ^   |
.LBB0_8:                                          // |                     |                     |           |
    addl    %ecx, %eax                            // |  5 x v:    ::       |  0                  |  6 ^^^^^^ |
    incq    %rdx                                  // |  4 :  x    ::       |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %r9                             // |  4 :  v    :v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  3 :  :    :        |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    %edx, %esi                            // |  4 :  v^   :        |  0                  |  0        |
    imulq   %r8, %rsi                             // |  4 x  x^   v        |  0                  |  2 ^  ^   |
    shrq    $33, %rsi                             // |  3 :  :x            |  0                  |  5 ^^^^^  |
    leal    (%rsi,%rsi,2), %esi                   // |  3 :  :^            |  0                  |  0        |
    cmpl    %esi, %edx                            // |  3 :  vv            |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  2 :  :             |  0                  |  1  v     |
    movl    (%rdi,%rdx,4), %ecx                   // |  4 : ^v v           |  0                  |  0        |
    testb   $3, %dl                               // |  3 : :v             |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  3 : ::             |  0                  |  1  v     |
    movl    %ecx, %esi                            // |  4 : v:^            |  0                  |  0        |
    imull   %ecx, %esi                            // |  4 x vx^            |  0                  |  2 ^  ^   |
    imull   %esi, %ecx                            // |  4 x ^xv            |  0                  |  2 ^  ^   |
    jmp .LBB0_8                                   // |  0                  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  1 ^                |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
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
