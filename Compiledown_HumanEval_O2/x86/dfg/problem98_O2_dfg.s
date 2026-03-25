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
    movl    %edi, %ecx                            // |  2   ^  v           |  0                  |  0        |
    negl    %ecx                                  // |  1   x              |  0                  |  0        |
    cmovsl  %edi, %ecx                            // |  2   ^  v           |  0                  |  0        |
    movl    $3435973837, %edx                     // |  2   :^             |  0                  |  0        |
    movq    %rcx, %rax                            // |  3 ^ v:             |  0                  |  0        |
    imulq   %rdx, %rax                            // |  3 ^ :x             |  0                  |  2 ^  ^   |
    shrq    $35, %rax                             // |  2 x :              |  0                  |  5 ^^^^^  |
    addl    %eax, %eax                            // |  2 x :              |  0                  |  6 ^^^^^^ |
    leal    (%rax,%rax,4), %eax                   // |  2 ^ :              |  0                  |  0        |
    subl    %eax, %ecx                            // |  2 v x              |  0                  |  6 ^^^^^^ |
    movl    %esi, %eax                            // |  3 ^ : v            |  0                  |  0        |
    negl    %eax                                  // |  2 x :              |  0                  |  0        |
    cmovsl  %esi, %eax                            // |  3 ^ : v            |  0                  |  0        |
    imulq   %rax, %rdx                            // |  3 x :^             |  0                  |  2 ^  ^   |
    shrq    $35, %rdx                             // |  3 : :x             |  0                  |  5 ^^^^^  |
    addl    %edx, %edx                            // |  3 : :x             |  0                  |  6 ^^^^^^ |
    leal    (%rdx,%rdx,4), %edx                   // |  3 : :^             |  0                  |  0        |
    subl    %edx, %eax                            // |  3 x :v             |  0                  |  6 ^^^^^^ |
    imull   %ecx, %eax                            // |  3 ^ vx             |  0                  |  2 ^  ^   |
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
