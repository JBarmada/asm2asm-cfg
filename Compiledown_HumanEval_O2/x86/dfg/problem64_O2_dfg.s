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
    subq    $408, %rsp                            // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 432                       // |                     |                     |           |
    .cfi_offset %rbx, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %edi, %ebx                            // |  3  ^   v :         |  0                  |  0        |
    movq    %rsp, %rdi                            // |  3  :   ^ v         |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  3  :    ^:         |  0                  |  5 ^^^^^  |
    movl    $400, %edx                            // |  3  : ^   :         |  0                  |  0        |
    xorl    %esi, %esi                            // |  3  :  ^  :         |  0                  |  5 ^^^^^  |
    callq   memset@PLT                            // |  2  :     x         |  0                  |  0        |
    movl    $1, 8(%rsp)                           // |  2  :     v         |  0                  |  0        |
    cmpl    $3, %ebx                              // |  2  v     :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                   // |  2  :     :         |  0                  |  3  :vv   |
    movl    %ebx, %r8d                            // |  3  v     :^        |  0                  |  1  :     |
    jne .LBB0_6                                   // |  3  :     ::        |  0                  |  1  v     |
    movl    $3, %ecx                              // |  4  :^    ::        |  0                  |  0        |
    movl    $1, %edx                              // |  4  : ^   ::        |  0                  |  0        |
    jmp .LBB0_3                                   // |  3  :     ::        |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    leaq    -2(%r8), %rsi                         // |  4  :  ^  :v        |  0                  |  0        |
    andq    $-2, %rsi                             // |  4  :  x  ::        |  0                  |  5 ^^^^^  |
    negq    %rsi                                  // |  4  :  x  ::        |  0                  |  0        |
    movl    $3, %ecx                              // |  5  :^ :  ::        |  0                  |  0        |
    movl    $1, %edx                              // |  6  ::^:  ::        |  0                  |  0        |
    xorl    %edi, %edi                            // |  7  ::::^ ::        |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    movl    -8(%rsp,%rcx,4), %eax                 // |  8 ^:v::: v:        |  0                  |  0        |
    movl    -4(%rsp,%rcx,4), %ebp                 // |  9 ::v:::^v:        |  0                  |  0        |
    addl    %eax, %edx                            // |  9 v::x:::::        |  0                  |  6 ^^^^^^ |
    addl    %edi, %edx                            // |  9 :::x:v:::        |  0                  |  6 ^^^^^^ |
    movl    %edx, (%rsp,%rcx,4)                   // |  8 ::vv: :v:        |  0                  |  0        |
    addl    %ebp, %edx                            // |  8 :::x: v::        |  0                  |  6 ^^^^^^ |
    addl    %eax, %edx                            // |  8 v::x: :::        |  0                  |  6 ^^^^^^ |
    movl    %edx, 4(%rsp,%rcx,4)                  // |  7  :vv: :v:        |  0                  |  0        |
    leaq    (%rsi,%rcx), %rax                     // |  8 ^:v:v :::        |  0                  |  0        |
    addq    $2, %rax                              // |  7 x:::  :::        |  0                  |  6 ^^^^^^ |
    addq    $2, %rcx                              // |  7 ::x:  :::        |  0                  |  6 ^^^^^^ |
    movl    %ebp, %edi                            // |  8 :::: ^v::        |  0                  |  0        |
    cmpq    $3, %rax                              // |  7 v:::  :::        |  0                  |  6 ^^^^^^ |
    jne .LBB0_7                                   // |  6  :::  :::        |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testb   $1, %r8b                              // |  6  :::  ::v        |  0                  |  6 ^^^^^^ |
    je  .LBB0_5                                   // |  5  :::  ::         |  0                  |  1  v     |
    addl    -8(%rsp,%rcx,4), %edx                 // |  5  :vx  :v         |  0                  |  6 ^^^^^^ |
    addl    %ebp, %edx                            // |  5  ::x  v:         |  0                  |  6 ^^^^^^ |
    movl    %edx, (%rsp,%rcx,4)                   // |  4  :vv   v         |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    movslq  %ebx, %rax                            // |  3 ^v     :         |  0                  |  0        |
    movl    (%rsp,%rax,4), %eax                   // |  2 ^      v         |  0                  |  0        |
    addq    $408, %rsp                            // |  1        x         |  0                  |  6 ^^^^^^ |
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
