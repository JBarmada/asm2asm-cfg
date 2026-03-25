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
    movb    $1, %cl                               // |  3  :^    :         |  0                  |  0        |
    cmpl    $2, %eax                              // |  3 v:     :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_7                                   // |  2  :     :         |  0                  |  2   vv   |
    movzbl  (%rbx), %ecx                          // |  3  v^    :         |  0                  |  0        |
    leal    -1(%rax), %edx                        // |  5 v::^   :         |  0                  |  0        |
    movslq  %edx, %rdx                            // |  4  ::^   :         |  0                  |  0        |
    cmpb    (%rbx,%rdx), %cl                      // |  4  vvv   :         |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  2  :     :         |  0                  |  1  v     |
    movabsq $-4294967296, %r8                     // |  3  :     :^        |  0                  |  0        |
    movl    %eax, %r9d                            // |  5 v:     ::^       |  0                  |  0        |
    shrl    %r9d                                  // |  4  :     ::x       |  0                  |  5 ^^^^^  |
    shlq    $32, %rax                             // |  5 x:     :::       |  0                  |  5 ^^^^^  |
    movabsq $-8589934592, %rsi                    // |  6 ::  ^  :::       |  0                  |  0        |
    addq    %rax, %rsi                            // |  6 v:  x  :::       |  0                  |  6 ^^^^^^ |
    movl    $1, %edi                              // |  6  :  :^ :::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    movq    %rdi, %rax                            // |  7 ^:  :v :::       |  0                  |  0        |
    cmpq    %rdi, %r9                             // |  7 ::  :v ::v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  6 ::  :  :::       |  0                  |  1  v     |
    movzbl  (%rbx,%rax), %edx                     // |  7 vv ^:  :::       |  0                  |  0        |
    movq    %rsi, %rcx                            // |  8 ::^:v  :::       |  0                  |  0        |
    sarq    $32, %rcx                             // |  8 ::^::  :::       |  0                  |  5 ^^^^^  |
    addq    %r8, %rsi                             // |  8 ::::x  :v:       |  0                  |  6 ^^^^^^ |
    leaq    1(%rax), %rdi                         // |  7 v::: ^ : :       |  0                  |  0        |
    cmpb    (%rbx,%rcx), %dl                      // |  6 :vvv   : :       |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4 : :    : :       |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    cmpq    %r9, %rax                             // |  4 v :    : v       |  0                  |  6 ^^^^^^ |
    setae   %cl                                   // |  2   x    :         |  0                  |  1 v      |
    jmp .LBB0_7                                   // |  1        :         |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    xorl    %ecx, %ecx                            // |  2   ^    :         |  0                  |  5 ^^^^^  |
.LBB0_7:                                          // |                     |                     |           |
    movl    %ecx, %eax                            // |  3 ^ v    :         |  0                  |  0        |
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
