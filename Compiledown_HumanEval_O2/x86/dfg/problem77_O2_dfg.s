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
    xorl    %ecx, %ecx                            // |  1   ^              |  0                  |  5 ^^^^^  |
    movl    $1, %edx                              // |  2   :^             |  0                  |  0        |
    xorl    %eax, %eax                            // |  3 ^ ::             |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    cmpl    %edi, %edx                            // |  4 : :v v           |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  2 : :              |  0                  |  1  v     |
    imull   %esi, %edx                            // |  4 x :^v            |  0                  |  2 ^  ^   |
    cmpl    %edi, %edx                            // |  3   :v v           |  0                  |  6 ^^^^^^ |
    jg  .LBB0_7                                   // |  1   :              |  0                  |  3  vvv   |
    leal    1(%rcx), %r8d                         // |  2   v     ^        |  0                  |  0        |
    cmpl    $99, %ecx                             // |  2   v     :        |  0                  |  6 ^^^^^^ |
    movl    %r8d, %ecx                            // |  2   ^     v        |  0                  |  1 :      |
    jb  .LBB0_3                                   // |  0                  |  0                  |  1 v      |
.LBB0_7:                                          // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
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
