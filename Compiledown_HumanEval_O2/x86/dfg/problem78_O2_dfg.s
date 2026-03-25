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
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_1:                                          // |                     |                     |           |
    movl    %ecx, %edx                            // |  3 : v^             |  0                  |  0        |
    imull   %ecx, %edx                            // |  3 x v^             |  0                  |  2 ^  ^   |
    imull   %ecx, %edx                            // |  3 x v^             |  0                  |  2 ^  ^   |
    incl    %ecx                                  // |  3 : x:             |  0                  |  5  ^^^^^ |
    cmpl    %eax, %edx                            // |  2 v  v             |  0                  |  6 ^^^^^^ |
    jb  .LBB0_1                                   // |  1 :                |  0                  |  2 v:     |
    setbe   %al                                   // |  1 x                |  0                  |  2 vv     |
    movzbl  %al, %eax                             // |  1 ^                |  0                  |  0        |
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
