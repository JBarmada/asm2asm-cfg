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
    pushq   %rbp                                  // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %edi, %ebp                            // |  3      v^:         |  0                  |  0        |
    movslq  %edi, %rbx                            // |  4  ^   v::         |  0                  |  0        |
    leaq    (,%rbx,4), %rdi                       // |  4  v   ^::         |  0                  |  0        |
    callq   malloc@PLT                            // |  3  :    :x         |  0                  |  0        |
    testl   %ebx, %ebx                            // |  3  v    ::         |  0                  |  6 ^^^^^^ |
    jle .LBB0_5                                   // |  2       ::         |  0                  |  3  vvv   |
    movl    %ebp, %r8d                            // |  3       v:^        |  0                  |  0        |
    cmpl    $1, %ebp                              // |  3       v::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  2        ::        |  0                  |  1  v     |
    xorl    %edx, %edx                            // |  3    ^   ::        |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  3     ^  ::        |  0                  |  0        |
    movl    $1, %edi                              // |  3      ^ ::        |  0                  |  0        |
    jmp .LBB0_3                                   // |  2        ::        |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    %r8d, %ecx                            // |  3   ^    :v        |  0                  |  0        |
    andl    $-2, %ecx                             // |  3   x    ::        |  0                  |  5 ^^^^^  |
    negq    %rcx                                  // |  3   x    ::        |  0                  |  0        |
    xorl    %edx, %edx                            // |  4   :^   ::        |  0                  |  5 ^^^^^  |
    movl    $1, %esi                              // |  5   ::^  ::        |  0                  |  0        |
    movl    $1, %edi                              // |  5   :: ^ ::        |  0                  |  0        |
    movl    $2, %ebx                              // |  6  ^:: : ::        |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    leal    -1(%rbx), %ebp                        // |  7  v:: :^::        |  0                  |  0        |
    addl    %ebx, %edx                            // |  7  v:x ::::        |  0                  |  6 ^^^^^^ |
    decl    %edx                                  // |  7  ::x ::::        |  0                  |  5  ^^^^^ |
    movl    %edx, -4(%rax,%rdi,4)                 // |  8 v::v v:::        |  0                  |  0        |
    addl    %ebx, %edx                            // |  7  v:x ::::        |  0                  |  6 ^^^^^^ |
    imull   %ebx, %esi                            // |  9 xv:x^::::        |  0                  |  2 ^  ^   |
    imull   %ebp, %esi                            // |  9 x::x^:v::        |  0                  |  2 ^  ^   |
    movl    %esi, (%rax,%rdi,4)                   // |  8 v:::vv ::        |  0                  |  0        |
    addl    $2, %ebx                              // |  7 :x:: : ::        |  0                  |  6 ^^^^^^ |
    leaq    (%rcx,%rdi), %rbp                     // |  7 : v: v^::        |  0                  |  0        |
    addq    $2, %rbp                              // |  6 :  : :x::        |  0                  |  6 ^^^^^^ |
    addq    $2, %rdi                              // |  6 :  : x:::        |  0                  |  6 ^^^^^^ |
    cmpq    $1, %rbp                              // |  6 :  : :v::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  5 :  : : ::        |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  5 :  : : :v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  4 :  : : :         |  0                  |  1  v     |
    addl    %edi, %edx                            // |  4 :  x v :         |  0                  |  6 ^^^^^^ |
    imull   %edi, %esi                            // |  5 x  x^v :         |  0                  |  2 ^  ^   |
    testb   $1, %dil                              // |  4 :  : v :         |  0                  |  6 ^^^^^^ |
    cmovnel %edx, %esi                            // |  5 :  v^: :         |  0                  |  0        |
    movl    %esi, -4(%rax,%rdi,4)                 // |  4 v   vv :         |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  2       ^x         |  0                  |  0        |
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
