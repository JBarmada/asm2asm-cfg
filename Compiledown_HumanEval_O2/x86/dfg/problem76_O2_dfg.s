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
    cmpl    $2, %edi                              // |  1      v           |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                   // |  0                  |  0                  |  2   vv   |
    xorl    %ecx, %ecx                            // |  1   ^              |  0                  |  5 ^^^^^  |
    cmpl    $4, %edi                              // |  2   :  v           |  0                  |  6 ^^^^^^ |
    jae .LBB0_2                                   // |  1   :              |  0                  |  1 v      |
.LBB0_7:                                          // |                     |                     |           |
    xorl    %edx, %edx                            // |  2   :^             |  0                  |  5 ^^^^^  |
    cmpl    $2, %edi                              // |  3   :: v           |  0                  |  6 ^^^^^^ |
    setge   %dl                                   // |  2   :x             |  0                  |  2   vv   |
    addl    %ecx, %edx                            // |  2   vx             |  0                  |  6 ^^^^^^ |
    xorl    %eax, %eax                            // |  2 ^  :             |  0                  |  5 ^^^^^  |
    cmpl    $3, %edx                              // |  2 :  v             |  0                  |  6 ^^^^^^ |
    sete    %al                                   // |  2 x  :             |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    retq                                          // |  2    :   x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  2   ^:             |  0                  |  5 ^^^^^  |
    movl    $2, %esi                              // |  3   ::^            |  0                  |  0        |
    jmp .LBB0_3                                   // |  3   :::            |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incl    %esi                                  // |  3   ::x            |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                            // |  4 ^ ::v            |  0                  |  0        |
    imull   %esi, %eax                            // |  4 ^ :xv            |  0                  |  2 ^  ^   |
    cmpl    %edi, %eax                            // |  5 v :::v           |  0                  |  6 ^^^^^^ |
    jg  .LBB0_7                                   // |  3   :::            |  0                  |  3  vvv   |
.LBB0_3:                                          // |                     |                     |           |
    movl    %edi, %eax                            // |  5 ^ :::v           |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    cltd                                          // |  4 : :::            |  0                  |  0        |
    idivl   %esi                                  // |  4 x :xx            |  0                  |  0        |
    testl   %edx, %edx                            // |  3   :v:            |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  3   :::            |  0                  |  1  v     |
    movl    %edi, %eax                            // |  5 ^ :::v           |  0                  |  0        |
    cltd                                          // |  4 : :::            |  0                  |  0        |
    idivl   %esi                                  // |  4 x :xx            |  0                  |  0        |
    incl    %ecx                                  // |  2 : x              |  0                  |  5  ^^^^^ |
    movl    %eax, %edi                            // |  2 v    ^           |  0                  |  0        |
    jmp .LBB0_5                                   // |  0                  |  0                  |  0        |
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
