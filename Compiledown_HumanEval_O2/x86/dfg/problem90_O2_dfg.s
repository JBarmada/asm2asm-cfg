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
    movzbl  (%rdi), %ecx                          // |  2   ^  v           |  0                  |  0        |
    testb   %cl, %cl                              // |  1   v              |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  0                  |  0                  |  1  v     |
    xorl    %r8d, %r8d                            // |  1         ^        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    movsbl  %cl, %ecx                             // |  2   ^     :        |  0                  |  0        |
    addl    $-93, %ecx                            // |  2   x     :        |  0                  |  6 ^^^^^^ |
    imull   $20165, %ecx, %edx                    // |  4 x :x    :        |  0                  |  2 ^  ^   |
    movl    %edx, %eax                            // |  4 ^ :v    :        |  0                  |  0        |
    shrl    $31, %eax                             // |  4 x ::    :        |  0                  |  5 ^^^^^  |
    shrl    $19, %edx                             // |  4 : :x    :        |  0                  |  5 ^^^^^  |
    addl    %eax, %edx                            // |  4 v :x    :        |  0                  |  6 ^^^^^^ |
    leal    (%rdx,%rdx,4), %eax                   // |  4 ^ :v    :        |  0                  |  0        |
    leal    (%rax,%rax,4), %eax                   // |  4 ^ ::    :        |  0                  |  0        |
    addl    %edx, %eax                            // |  4 x :v    :        |  0                  |  6 ^^^^^^ |
    subl    %eax, %ecx                            // |  3 v x     :        |  0                  |  6 ^^^^^^ |
    addb    $97, %cl                              // |  2   x     :        |  0                  |  6 ^^^^^^ |
    movb    %cl, (%rsi,%r8)                       // |  3   v v   v        |  0                  |  0        |
    movzbl  1(%rdi,%r8), %ecx                     // |  3   ^  v  v        |  0                  |  0        |
    incq    %r8                                   // |  2   :     x        |  0                  |  5  ^^^^^ |
    testb   %cl, %cl                              // |  2   v     :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  1         :        |  0                  |  1  v     |
    movl    %r8d, %eax                            // |  2 ^       v        |  0                  |  0        |
    movb    $0, (%rsi,%rax)                       // |  2 v   v            |  0                  |  0        |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    movb    $0, (%rsi,%rax)                       // |  3 v   v  :         |  0                  |  0        |
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
