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
    cmpl    $4, %edi                              // |  1      v           |  0                  |  6 ^^^^^^ |
    jge .LBB0_1                                   // |  0                  |  0                  |  2   vv   |
.LBB0_7:                                          // |                     |                     |           |
    movl    %edi, %eax                            // |  2 ^    v           |  0                  |  0        |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movl    $2, %ecx                              // |  1   ^              |  0                  |  0        |
    jmp .LBB0_2                                   // |  1   :              |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incl    %ecx                                  // |  1   x              |  0                  |  5  ^^^^^ |
    movl    %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
    imull   %ecx, %eax                            // |  3 ^ vx             |  0                  |  2 ^  ^   |
    cmpl    %edi, %eax                            // |  4 v :: v           |  0                  |  6 ^^^^^^ |
    jg  .LBB0_7                                   // |  2   ::             |  0                  |  3  vvv   |
.LBB0_2:                                          // |                     |                     |           |
    movl    %edi, %eax                            // |  4 ^ :: v           |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    cltd                                          // |  3 : ::             |  0                  |  0        |
    idivl   %ecx                                  // |  3 x xx             |  0                  |  0        |
    cmpl    %ecx, %edi                            // |  3   v: v           |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                   // |  2   ::             |  0                  |  3  vvv   |
    testl   %edx, %edx                            // |  2   :v             |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2   ::             |  0                  |  1  v     |
    movl    %edi, %eax                            // |  4 ^ :: v           |  0                  |  0        |
    cltd                                          // |  3 : ::             |  0                  |  0        |
    idivl   %ecx                                  // |  3 x xx             |  0                  |  0        |
    movl    %eax, %edi                            // |  2 v    ^           |  0                  |  0        |
    jmp .LBB0_3                                   // |  0                  |  0                  |  0        |
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
