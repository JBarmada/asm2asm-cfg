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
    movl    (%rdi), %eax                          // |  2 ^    v           |  0                  |  0        |
    testl   %eax, %eax                            // |  1 v                |  0                  |  6 ^^^^^^ |
    js  .LBB0_3                                   // |  1 :                |  0                  |  1   v    |
    movl    %esi, %ecx                            // |  3 : ^ v            |  0                  |  0        |
    movl    $1, %esi                              // |  3 : : ^            |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movq    %rsi, %rdx                            // |  4 : :^v            |  0                  |  0        |
    cmpq    %rsi, %rcx                            // |  4 : v:v            |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  3 : ::             |  0                  |  1  v     |
    leaq    1(%rdx), %rsi                         // |  4 : :v^            |  0                  |  0        |
    addl    (%rdi,%rdx,4), %eax                   // |  4 x :v v           |  0                  |  6 ^^^^^^ |
    jns .LBB0_5                                   // |  2   ::             |  0                  |  1   v    |
.LBB0_7:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  3 ^ ::             |  0                  |  5 ^^^^^  |
    cmpq    %rcx, %rdx                            // |  3 : vv             |  0                  |  6 ^^^^^^ |
    setb    %al                                   // |  1 x                |  0                  |  1 v      |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    movl    $1, %eax                              // |  2 ^      :         |  0                  |  0        |
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
