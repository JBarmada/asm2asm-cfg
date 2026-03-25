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
    testl   %edi, %edi                            // |  1      v           |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  0                  |  0                  |  3  vvv   |
    movl    $1, %r9d                              // |  1          ^       |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  2   ^      :       |  0                  |  5 ^^^^^  |
    movl    $3435973837, %r8d                     // |  2         ^:       |  0                  |  0        |
    movl    $1, %eax                              // |  3 ^       ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    movl    %edi, %esi                            // |  5 :   ^v  ::       |  0                  |  0        |
    imulq   %r8, %rsi                             // |  5 x  x^   v:       |  0                  |  2 ^  ^   |
    shrq    $35, %rsi                             // |  2     x    :       |  0                  |  5 ^^^^^  |
    leal    (%rsi,%rsi), %edx                     // |  3    ^v    :       |  0                  |  0        |
    leal    (%rdx,%rdx,4), %r10d                  // |  4    v:    :^      |  0                  |  0        |
    movl    %edi, %edx                            // |  5    ^:v   ::      |  0                  |  0        |
    subl    %r10d, %edx                           // |  4    x:    :v      |  0                  |  6 ^^^^^^ |
    testb   $1, %dl                               // |  3    v:    :       |  0                  |  6 ^^^^^^ |
    cmovel  %r9d, %edx                            // |  3    ^:    v       |  0                  |  0        |
    cmovnel %r9d, %ecx                            // |  4   ^::    v       |  0                  |  0        |
    imull   %edx, %eax                            // |  4 ^ :x:            |  0                  |  2 ^  ^   |
    cmpl    $9, %edi                              // |  3   : :v           |  0                  |  6 ^^^^^^ |
    movl    %esi, %edi                            // |  3   : v^           |  0                  |  2 ::     |
    ja  .LBB0_3                                   // |  1   :              |  0                  |  2 vv     |
    testl   %ecx, %ecx                            // |  1   v              |  0                  |  6 ^^^^^^ |
    cmovel  %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
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
