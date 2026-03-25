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
    movl    %esi, %ebp                            // |  3     v ^:         |  0                  |  0        |
    movq    %rdi, %rbx                            // |  4  ^   v::         |  0                  |  0        |
    leal    1(%rbp), %eax                         // |  4 ^:    v:         |  0                  |  0        |
    movslq  %eax, %rdi                            // |  5 v:   ^::         |  0                  |  0        |
    movl    $4, %esi                              // |  5 ::  ^ ::         |  0                  |  0        |
    callq   calloc@PLT                            // |  4 ::    :x         |  0                  |  0        |
    testl   %ebp, %ebp                            // |  4 ::    v:         |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  4 ::    ::         |  0                  |  3  vvv   |
    movl    %ebp, %r8d                            // |  5 ::    v:^        |  0                  |  0        |
    cmpl    $1, %ebp                              // |  5 ::    v::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  4 ::     ::        |  0                  |  1  v     |
    movl    $-1, %ebp                             // |  5 ::    ^::        |  0                  |  0        |
    xorl    %edx, %edx                            // |  6 :: ^  :::        |  0                  |  5 ^^^^^  |
.LBB0_4:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  6 :: :  ::v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  6 :: :  :::        |  0                  |  1  v     |
    movslq  (%rbx,%rdx,4), %rcx                   // |  7 :v^v  :::        |  0                  |  0        |
    movl    (%rax,%rcx,4), %edx                   // |  6 v v^  :::        |  0                  |  0        |
    incl    %edx                                  // |  6 : :x  :::        |  0                  |  5  ^^^^^ |
    cmpl    %ebp, %ecx                            // |  6 : v:  v::        |  0                  |  6 ^^^^^^ |
    movl    %ebp, %esi                            // |  7 : ::^ v::        |  0                  |  0        |
    cmovgl  %ecx, %esi                            // |  6 : v:^  ::        |  0                  |  0        |
    movl    %edx, (%rax,%rcx,4)                   // |  6 v vv:  ::        |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  6 : vv:  ::        |  0                  |  6 ^^^^^^ |
    cmovgel %esi, %ebp                            // |  6 : : v ^::        |  0                  |  0        |
    jmp .LBB0_6                                   // |  5 : : :  ::        |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    movl    $-1, %ebp                             // |  6 : : : ^::        |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movq    %rax, %rdi                            // |  7 v : :^:::        |  0                  |  0        |
    callq   free@PLT                              // |  6   : :::x:        |  0                  |  0        |
    movl    %ebp, %eax                            // |  7 ^ : ::v::        |  0                  |  0        |
    addq    $8, %rsp                              // |  6 : : :: x:        |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %rbx                                  // |  7 :^: :: x:        |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  8 ::: ::^x:        |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  7 ::: :: x:        |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    movl    %r8d, %r9d                            // |  7 ::: ::  v^       |  0                  |  0        |
    andl    $-2, %r9d                             // |  6 ::: ::   x       |  0                  |  5 ^^^^^  |
    movl    $-1, %ebp                             // |  7 ::: ::^  :       |  0                  |  0        |
    xorl    %edx, %edx                            // |  7 :::^::   :       |  0                  |  5 ^^^^^  |
    jmp .LBB0_8                                   // |  7 ::::::   :       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    cmpl    %edi, %ecx                            // |  7 ::v::v   :       |  0                  |  6 ^^^^^^ |
    cmovgel %esi, %ebp                            // |  6 :: :v ^  :       |  0                  |  0        |
    addq    $2, %rdx                              // |  5 :: x  :  :       |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %r9                             // |  5 :: v  :  v       |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  4 :: :  :          |  0                  |  1  v     |
.LBB0_8:                                          // |                     |                     |           |
    movslq  (%rbx,%rdx,4), %rdi                   // |  5 :v v ^:          |  0                  |  0        |
    movl    (%rax,%rdi,4), %ecx                   // |  6 v:^: v:          |  0                  |  0        |
    incl    %ecx                                  // |  6 ::x: ::          |  0                  |  5  ^^^^^ |
    movl    %ecx, (%rax,%rdi,4)                   // |  6 v:v: v:          |  0                  |  0        |
    movl    %edi, %esi                            // |  7 ::::^v:          |  0                  |  0        |
    cmpl    %ebp, %edi                            // |  6 :::: vv          |  0                  |  6 ^^^^^^ |
    jg  .LBB0_10                                  // |  6 :::: ::          |  0                  |  3  vvv   |
    movl    %ebp, %esi                            // |  7 ::::^:v          |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    cmpl    %edi, %ecx                            // |  6 ::v::v           |  0                  |  6 ^^^^^^ |
    cmovgel %esi, %ebp                            // |  5 :: :v ^          |  0                  |  0        |
    movslq  4(%rbx,%rdx,4), %rdi                  // |  5 :v v ^:          |  0                  |  0        |
    movl    (%rax,%rdi,4), %ecx                   // |  4 v ^  v:          |  0                  |  0        |
    incl    %ecx                                  // |  4 : x  ::          |  0                  |  5  ^^^^^ |
    movl    %ecx, (%rax,%rdi,4)                   // |  4 v v  v:          |  0                  |  0        |
    movl    %edi, %esi                            // |  3     ^v:          |  0                  |  0        |
    cmpl    %ebp, %edi                            // |  2      vv          |  0                  |  6 ^^^^^^ |
    jg  .LBB0_12                                  // |  1       :          |  0                  |  3  vvv   |
    movl    %ebp, %esi                            // |  2     ^ v          |  0                  |  0        |
    jmp .LBB0_12                                  // |  0                  |  0                  |  0        |
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
