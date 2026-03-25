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
    xorl    %r9d, %r9d                            // |  1          ^       |  0                  |  5 ^^^^^  |
    movl    $2, %eax                              // |  2 ^        :       |  0                  |  0        |
    movl    $1, %r8d                              // |  2         ^:       |  0                  |  0        |
    jmp .LBB0_1                                   // |  2         ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    testl   %edx, %edx                            // |  3    v    ::       |  0                  |  6 ^^^^^^ |
    setne   %dl                                   // |  3    x    ::       |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movl    %r8d, %eax                            // |  3 ^       v:       |  0                  |  0        |
    addl    %ecx, %eax                            // |  3 x v      :       |  0                  |  6 ^^^^^^ |
    movzbl  %dl, %edx                             // |  3 :  ^     :       |  0                  |  0        |
    addl    %edx, %r9d                            // |  3 :  v     x       |  0                  |  6 ^^^^^^ |
    movl    %ecx, %r8d                            // |  4 : v     ^:       |  0                  |  0        |
    cmpl    %edi, %r9d                            // |  3 :    v   v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  2 :        :       |  0                  |  1  v     |
.LBB0_1:                                          // |                     |                     |           |
    cmpl    %edi, %r9d                            // |  3 :    v   v       |  0                  |  6 ^^^^^^ |
    jge .LBB0_2                                   // |  1 :                |  0                  |  2   vv   |
    movl    %eax, %ecx                            // |  2 v ^              |  0                  |  0        |
    movb    $1, %dl                               // |  3 : :^             |  0                  |  0        |
    cmpl    $4, %eax                              // |  3 v ::             |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                   // |  2   ::             |  0                  |  2   vv   |
    movl    $2, %esi                              // |  3   ::^            |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  4 ^ v::            |  0                  |  0        |
    cltd                                          // |  4 : :::            |  0                  |  0        |
    idivl   %esi                                  // |  4 x :xx            |  0                  |  0        |
    testl   %edx, %edx                            // |  3   :v:            |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  3   :::            |  0                  |  1  v     |
    incl    %esi                                  // |  3   ::x            |  0                  |  5  ^^^^^ |
    movl    %esi, %eax                            // |  4 ^ ::v            |  0                  |  0        |
    imull   %esi, %eax                            // |  4 ^ :xv            |  0                  |  2 ^  ^   |
    cmpl    %ecx, %eax                            // |  2 v v              |  0                  |  6 ^^^^^^ |
    jle .LBB0_6                                   // |  1   :              |  0                  |  3  vvv   |
    jmp .LBB0_7                                   // |  1   :              |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  2 ^ v              |  0                  |  0        |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
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
