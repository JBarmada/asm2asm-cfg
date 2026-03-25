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
    movl    %edi, %eax                            // |  2 ^    v           |  0                  |  0        |
    negl    %eax                                  // |  1 x                |  0                  |  0        |
    cmovsl  %edi, %eax                            // |  2 ^    v           |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  2 : ^              |  0                  |  5 ^^^^^  |
    xorl    %edx, %edx                            // |  3 : :^             |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_1:                                          // |                     |                     |           |
    movslq  %eax, %r8                             // |  4 v ::    ^        |  0                  |  0        |
    andl    $1, %eax                              // |  4 x ::    :        |  0                  |  5 ^^^^^  |
    addl    %eax, %edx                            // |  4 v :x    :        |  0                  |  6 ^^^^^^ |
    xorl    $1, %eax                              // |  4 ^ ::    :        |  0                  |  5 ^^^^^  |
    addl    %eax, %ecx                            // |  4 v x:    :        |  0                  |  6 ^^^^^^ |
    imulq   $1717986919, %r8, %rax                // |  4 x :x    :        |  0                  |  2 ^  ^   |
    movq    %rax, %rdi                            // |  5 v :: ^  :        |  0                  |  0        |
    shrq    $63, %rdi                             // |  4   :: x  :        |  0                  |  5 ^^^^^  |
    sarq    $34, %rax                             // |  5 ^ :: :  :        |  0                  |  5 ^^^^^  |
    addl    %edi, %eax                            // |  5 x :: v  :        |  0                  |  6 ^^^^^^ |
    cmpl    $9, %r8d                              // |  3   ::    v        |  0                  |  6 ^^^^^^ |
    jg  .LBB0_1                                   // |  2   ::             |  0                  |  3  vvv   |
    movl    %ecx, (%rsi)                          // |  3   v:v            |  0                  |  0        |
    movl    %edx, 4(%rsi)                         // |  2    vv            |  0                  |  0        |
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
