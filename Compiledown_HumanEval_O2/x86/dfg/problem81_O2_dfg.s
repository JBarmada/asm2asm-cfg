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
    movq    %rdi, %rbx                            // |  3  ^   v :         |  0                  |  0        |
    callq   strlen@PLT                            // |  2  :     x         |  0                  |  0        |
    cmpq    $3, %rax                              // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jae .LBB0_2                                   // |  2  :     :         |  0                  |  1 v      |
    xorl    %eax, %eax                            // |  3 ^:     :         |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  3 ::     :         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    movq    %rax, %rdi                            // |  4 v:   ^ :         |  0                  |  0        |
    movzbl  2(%rbx), %ecx                         // |  4  v^  : :         |  0                  |  0        |
    movb    $1, %al                               // |  5 ^::  : :         |  0                  |  0        |
    cmpb    1(%rbx), %cl                          // |  4  vv  : :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  4  ::  : :         |  0                  |  1  v     |
    movb    $1, %al                               // |  5 ^::  : :         |  0                  |  0        |
    movl    $3, %esi                              // |  6 ::: ^: :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    cmpb    -3(%rbx,%rsi), %cl                    // |  6 :vv v: :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  6 ::: :: :         |  0                  |  1  v     |
    cmpq    %rsi, %rdi                            // |  6 ::: vv :         |  0                  |  6 ^^^^^^ |
    seta    %al                                   // |  5 x:: :  :         |  0                  |  2 vv     |
    je  .LBB0_7                                   // |  4  :: :  :         |  0                  |  1  v     |
    movzbl  (%rbx,%rsi), %edx                     // |  5  v:^v  :         |  0                  |  0        |
    incq    %rsi                                  // |  4   ::x  :         |  0                  |  5  ^^^^^ |
    cmpb    %cl, %dl                              // |  3   vv   :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %ecx                            // |  3   ^v   :         |  0                  |  1  :     |
    jne .LBB0_6                                   // |  1        :         |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    xorb    $1, %al                               // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_8:                                          // |                     |                     |           |
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
