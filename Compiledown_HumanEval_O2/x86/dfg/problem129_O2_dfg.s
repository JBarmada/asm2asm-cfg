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
    testl   %esi, %esi                            // |  1     v            |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  0                  |  0                  |  3  v::   |
    jle .LBB0_3                                   // |  0                  |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  2     v   ^        |  0                  |  0        |
    cmpl    $1, %esi                              // |  2     v   :        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  1         :        |  0                  |  1  v     |
    xorl    %r10d, %r10d                          // |  2         : ^      |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  2     ^   :        |  0                  |  0        |
    xorl    %eax, %eax                            // |  2 ^       :        |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  1         :        |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movl    $-32768, %eax                         // |  2 ^       :        |  0                  |  0        |
    retq                                          // |  2        x:        |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  3 ^      ::        |  0                  |  5 ^^^^^  |
    retq                                          // |  2        x:        |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    %r8d, %r9d                            // |  3        :v^       |  0                  |  0        |
    andl    $-2, %r9d                             // |  3        ::x       |  0                  |  5 ^^^^^  |
    xorl    %r10d, %r10d                          // |  4        :::^      |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  5     ^  ::::      |  0                  |  0        |
    xorl    %eax, %eax                            // |  5 ^      ::::      |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    (%rdi,%r10,4), %edx                   // |  7 :  ^ v :::v      |  0                  |  0        |
    movl    4(%rdi,%r10,4), %r11d                 // |  8 :  : v :::v^     |  0                  |  0        |
    testl   %edx, %edx                            // |  7 :  v   :::::     |  0                  |  6 ^^^^^^ |
    cmovel  %edx, %esi                            // |  8 :  v^  :::::     |  0                  |  0        |
    movl    %esi, %ecx                            // |  9 : ^:v  :::::     |  0                  |  0        |
    negl    %ecx                                  // |  9 : x::  :::::     |  0                  |  0        |
    testl   %edx, %edx                            // |  8 :  v:  :::::     |  0                  |  6 ^^^^^^ |
    cmovnsl %esi, %ecx                            // |  9 : ^:v  :::::     |  0                  |  0        |
    testl   %r11d, %r11d                          // |  7 :  :   ::::v     |  0                  |  6 ^^^^^^ |
    cmovel  %r11d, %ecx                           // |  8 : ^:   ::::v     |  0                  |  0        |
    movl    %ecx, %esi                            // |  9 : v:^  :::::     |  0                  |  0        |
    negl    %esi                                  // |  9 : ::x  :::::     |  0                  |  0        |
    testl   %r11d, %r11d                          // |  8 : ::   ::::v     |  0                  |  6 ^^^^^^ |
    cmovnsl %ecx, %esi                            // |  9 : v:^  :::::     |  0                  |  0        |
    movl    %edx, %ecx                            // |  8 : ^v   :::::     |  0                  |  0        |
    negl    %ecx                                  // |  8 : x:   :::::     |  0                  |  0        |
    cmovsl  %edx, %ecx                            // |  8 : ^v   :::::     |  0                  |  0        |
    addl    %eax, %ecx                            // |  7 v x    :::::     |  0                  |  6 ^^^^^^ |
    movl    %r11d, %eax                           // |  7 ^ :    ::::v     |  0                  |  0        |
    negl    %eax                                  // |  7 x :    :::::     |  0                  |  0        |
    cmovsl  %r11d, %eax                           // |  7 ^ :    ::::v     |  0                  |  0        |
    addl    %ecx, %eax                            // |  6 x v    ::::      |  0                  |  6 ^^^^^^ |
    addq    $2, %r10                              // |  5 :      :::x      |  0                  |  6 ^^^^^^ |
    cmpq    %r10, %r9                             // |  5 :      ::vv      |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  4 :      :: :      |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  4 :      :v :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  3 :      :  :      |  0                  |  1  v     |
    movl    (%rdi,%r10,4), %ecx                   // |  5 : ^  v :  v      |  0                  |  0        |
    testl   %ecx, %ecx                            // |  3 : v    :         |  0                  |  6 ^^^^^^ |
    cmovel  %ecx, %esi                            // |  4 : v ^  :         |  0                  |  0        |
    movl    %esi, %edx                            // |  5 : :^v  :         |  0                  |  0        |
    negl    %edx                                  // |  4 : :x   :         |  0                  |  0        |
    testl   %ecx, %ecx                            // |  4 : v:   :         |  0                  |  6 ^^^^^^ |
    cmovsl  %edx, %esi                            // |  5 : :v^  :         |  0                  |  0        |
    movl    %ecx, %edx                            // |  5 : v^:  :         |  0                  |  0        |
    negl    %edx                                  // |  5 : :x:  :         |  0                  |  0        |
    cmovsl  %ecx, %edx                            // |  5 : v^:  :         |  0                  |  0        |
    addl    %edx, %eax                            // |  4 x  v:  :         |  0                  |  6 ^^^^^^ |
.LBB0_10:                                         // |                     |                     |           |
    imull   %esi, %eax                            // |  4 ^  xv  :         |  0                  |  2 ^  ^   |
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
