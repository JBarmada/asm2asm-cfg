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
    movzbl  (%rdi), %edx                          // |  2    ^ v           |  0                  |  0        |
    testb   %dl, %dl                              // |  1    v             |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  1    :             |  0                  |  1  v     |
    incq    %rdi                                  // |  2    : x           |  0                  |  5  ^^^^^ |
    xorl    %ecx, %ecx                            // |  3   ^: :           |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  4 ^ :: :           |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    leal    -65(%rdx), %esi                       // |  5 : :v^:           |  0                  |  0        |
    cmpb    $26, %sil                             // |  4 : : v:           |  0                  |  6 ^^^^^^ |
    movzbl  %dl, %edx                             // |  4 : :^ :           |  0                  |  0        |
    cmovael %ecx, %edx                            // |  4 : v^ :           |  0                  |  0        |
    movzbl  %dl, %edx                             // |  3 :  ^ :           |  0                  |  0        |
    addl    %edx, %eax                            // |  3 x  v :           |  0                  |  6 ^^^^^^ |
    movzbl  (%rdi), %edx                          // |  2    ^ v           |  0                  |  0        |
    incq    %rdi                                  // |  2    : x           |  0                  |  5  ^^^^^ |
    testb   %dl, %dl                              // |  1    v             |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  0                  |  0                  |  1  v     |
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
