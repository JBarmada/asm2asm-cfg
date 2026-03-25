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
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    testl   %esi, %esi                            // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  1        :         |  0                  |  3  vvv   |
    movl    %esi, %r8d                            // |  3     v  :^        |  0                  |  0        |
    movb    $1, %al                               // |  3 ^      ::        |  0                  |  0        |
    xorl    %r10d, %r10d                          // |  4 :      :: ^      |  0                  |  5 ^^^^^  |
    movq    %r8, %r11                             // |  5 :      :v :^     |  0                  |  0        |
    movq    %rdi, %rsi                            // |  7 :   ^v :: ::     |  0                  |  0        |
    jmp .LBB0_4                                   // |  6 :   :  :: ::     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    addq    $4, %rsi                              // |  6 :   x  :: ::     |  0                  |  6 ^^^^^^ |
    decq    %r11                                  // |  6 :   :  :: :x     |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r10                             // |  6 :   :  :v v:     |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  6 :   :  :: ::     |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    %eax, %r9d                            // |  7 v   :  ::^::     |  0                  |  0        |
    movq    %r10, %rcx                            // |  8 : ^ :  :::v:     |  0                  |  0        |
    incq    %r10                                  // |  7 :   :  :::x:     |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r10                             // |  7 :   :  :v:v:     |  0                  |  6 ^^^^^^ |
    setb    %al                                   // |  5 x   :  : : :     |  0                  |  1 v      |
    jae .LBB0_3                                   // |  4     :  : : :     |  0                  |  1 v      |
    movl    (%rdi,%rcx,4), %ecx                   // |  6   ^ :v : : :     |  0                  |  0        |
    movl    $1, %edx                              // |  6   :^:  : : :     |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    (%rsi,%rdx,4), %ebx                   // |  7  ^:vv  : : :     |  0                  |  0        |
    addl    %ecx, %ebx                            // |  6  xv:   : : :     |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  4    :   : : :     |  0                  |  1  v     |
    incq    %rdx                                  // |  4    x   : : :     |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %r11                            // |  4    v   : : v     |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  2        : :       |  0                  |  1  v     |
    jmp .LBB0_3                                   // |  2        : :       |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    movl    %r9d, %eax                            // |  3 ^      : v       |  0                  |  0        |
    jmp .LBB0_9                                   // |  1        :         |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_9:                                          // |                     |                     |           |
    andb    $1, %al                               // |  2 x      :         |  0                  |  5 ^^^^^  |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
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
