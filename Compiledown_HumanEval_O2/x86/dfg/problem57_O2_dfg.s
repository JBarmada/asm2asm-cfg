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
    xorl    %eax, %eax                            // |  1 ^                |  0                  |  5 ^^^^^  |
    jmp .LBB0_1                                   // |  1 :                |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    incl    %eax                                  // |  1 x                |  0                  |  5  ^^^^^ |
.LBB0_5:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  2 :  ^             |  0                  |  5 ^^^^^  |
    cmpb    $62, %cl                              // |  3 : v:             |  0                  |  6 ^^^^^^ |
    sete    %dl                                   // |  2 :  x             |  0                  |  1  v     |
    incq    %rdi                                  // |  3 :  : x           |  0                  |  5  ^^^^^ |
    subl    %edx, %eax                            // |  3 x  v :           |  0                  |  6 ^^^^^^ |
    js  .LBB0_6                                   // |  2 :    :           |  0                  |  1   v    |
.LBB0_1:                                          // |                     |                     |           |
    movzbl  (%rdi), %ecx                          // |  3 : ^  v           |  0                  |  0        |
    cmpl    $60, %ecx                             // |  2 : v              |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  2 : :              |  0                  |  1  v     |
    testl   %ecx, %ecx                            // |  2 : v              |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  1 :                |  0                  |  1  v     |
    testl   %eax, %eax                            // |  1 v                |  0                  |  6 ^^^^^^ |
    sete    %al                                   // |  1 x                |  0                  |  1  v     |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
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
