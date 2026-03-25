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
    movl    $-1, %eax                             // |  1 ^                |  0                  |  0        |
    cmpl    %edi, %esi                            // |  2     vv           |  0                  |  6 ^^^^^^ |
    jl  .LBB0_4                                   // |  0                  |  0                  |  2   vv   |
    movl    %esi, %ecx                            // |  2   ^ v            |  0                  |  0        |
    andl    $-2147483647, %ecx                    // |  1   x              |  0                  |  5 ^^^^^  |
    cmpl    %edi, %esi                            // |  3   : vv           |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  1   :              |  0                  |  1  v     |
    cmpl    $1, %ecx                              // |  1   v              |  0                  |  6 ^^^^^^ |
    jne .LBB0_3                                   // |  1   :              |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    retq                                          // |  2   :    x         |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  3 ^ :    :         |  0                  |  5 ^^^^^  |
    cmpl    $1, %ecx                              // |  3 : v    :         |  0                  |  6 ^^^^^^ |
    sete    %al                                   // |  2 x      :         |  0                  |  1  v     |
    subl    %eax, %esi                            // |  3 v   x  :         |  0                  |  6 ^^^^^^ |
    movl    %esi, %eax                            // |  3 ^   v  :         |  0                  |  0        |
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
