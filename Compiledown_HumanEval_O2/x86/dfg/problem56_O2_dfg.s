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
    subq    $4000, %rsp                           // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 4016                      // |                     |                     |           |
    .cfi_offset %rbx, -16                         // |                     |                     |           |
    movl    %edi, %ebx                            // |  3  ^   v :         |  0                  |  0        |
    movq    %rsp, %rdi                            // |  3  :   ^ v         |  0                  |  0        |
    movl    $4000, %edx                           // |  3  : ^   :         |  0                  |  0        |
    xorl    %esi, %esi                            // |  3  :  ^  :         |  0                  |  5 ^^^^^  |
    callq   memset@PLT                            // |  2  :     x         |  0                  |  0        |
    movl    $1, 4(%rsp)                           // |  2  :     v         |  0                  |  0        |
    cmpl    $2, %ebx                              // |  2  v     :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_6                                   // |  2  :     :         |  0                  |  2   vv   |
    movl    %ebx, %ecx                            // |  3  v^    :         |  0                  |  0        |
    leaq    -1(%rcx), %rdx                        // |  4  :v^   :         |  0                  |  0        |
    addq    $-2, %rcx                             // |  4  :x:   :         |  0                  |  6 ^^^^^^ |
    movl    %edx, %eax                            // |  5 ^::v   :         |  0                  |  0        |
    andl    $3, %eax                              // |  5 x:::   :         |  0                  |  5 ^^^^^  |
    cmpq    $3, %rcx                              // |  5 ::v:   :         |  0                  |  6 ^^^^^^ |
    jae .LBB0_7                                   // |  4 :: :   :         |  0                  |  1 v      |
    movl    $2, %esi                              // |  5 :: :^  :         |  0                  |  0        |
    movl    $1, %ecx                              // |  5 ::^:   :         |  0                  |  0        |
    jmp .LBB0_3                                   // |  4 :: :   :         |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    andq    $-4, %rdx                             // |  4 :: x   :         |  0                  |  5 ^^^^^  |
    negq    %rdx                                  // |  4 :: x   :         |  0                  |  0        |
    movl    $2, %esi                              // |  5 :: :^  :         |  0                  |  0        |
    movl    $1, %ecx                              // |  6 ::^::  :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    addl    -8(%rsp,%rsi,4), %ecx                 // |  6 ::x:v  v         |  0                  |  6 ^^^^^^ |
    movl    %ecx, (%rsp,%rsi,4)                   // |  6 ::v:v  v         |  0                  |  0        |
    movl    -4(%rsp,%rsi,4), %edi                 // |  7 ::::v^ v         |  0                  |  0        |
    addl    %ecx, %edi                            // |  7 ::v::x :         |  0                  |  6 ^^^^^^ |
    movl    %edi, 4(%rsp,%rsi,4)                  // |  7 ::::vv v         |  0                  |  0        |
    addl    %edi, %ecx                            // |  7 ::x::v :         |  0                  |  6 ^^^^^^ |
    movl    %ecx, 8(%rsp,%rsi,4)                  // |  7 ::v:v: v         |  0                  |  0        |
    addl    %edi, %ecx                            // |  7 ::x::v :         |  0                  |  6 ^^^^^^ |
    movl    %ecx, 12(%rsp,%rsi,4)                 // |  6 ::v:v  v         |  0                  |  0        |
    leaq    (%rdx,%rsi), %rdi                     // |  7 :::vv^ :         |  0                  |  0        |
    addq    $4, %rdi                              // |  6 ::: :x :         |  0                  |  6 ^^^^^^ |
    addq    $4, %rsi                              // |  6 ::: x: :         |  0                  |  6 ^^^^^^ |
    cmpq    $2, %rdi                              // |  6 ::: :v :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  5 ::: :  :         |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testq   %rax, %rax                            // |  5 v:: :  :         |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  5 ::: :  :         |  0                  |  1  v     |
    leaq    (%rsp,%rsi,4), %rdx                   // |  6 :::^v  v         |  0                  |  0        |
    xorl    %esi, %esi                            // |  6 ::::^  :         |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    addl    -8(%rdx,%rsi,4), %ecx                 // |  6 ::xvv  :         |  0                  |  6 ^^^^^^ |
    movl    %ecx, (%rdx,%rsi,4)                   // |  6 ::vvv  :         |  0                  |  0        |
    incq    %rsi                                  // |  4 ::  x  :         |  0                  |  5  ^^^^^ |
    cmpq    %rsi, %rax                            // |  4 v:  v  :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  2  :     :         |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    movslq  %ebx, %rax                            // |  3 ^v     :         |  0                  |  0        |
    movl    (%rsp,%rax,4), %eax                   // |  2 ^      v         |  0                  |  0        |
    addq    $4000, %rsp                           // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
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
