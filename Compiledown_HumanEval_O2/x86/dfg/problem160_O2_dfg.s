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
    movl    %edx, %eax                            // |  2 ^  v             |  0                  |  0        |
    subl    %esi, %eax                            // |  2 x   v            |  0                  |  6 ^^^^^^ |
    jge .LBB0_2                                   // |  0                  |  0                  |  2   vv   |
    addl    %edi, %edx                            // |  2    x v           |  0                  |  6 ^^^^^^ |
    movl    %edx, (%rcx)                          // |  2   vv             |  0                  |  0        |
    xorl    %eax, %eax                            // |  1 ^                |  0                  |  5 ^^^^^  |
    movl    %eax, 4(%rcx)                         // |  2 v v              |  0                  |  0        |
    retq                                          // |  2 :      x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    addl    %edi, %esi                            // |  4 :   xv :         |  0                  |  6 ^^^^^^ |
    movl    %esi, (%rcx)                          // |  4 : v v  :         |  0                  |  0        |
    movl    %eax, 4(%rcx)                         // |  3 v v    :         |  0                  |  0        |
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
