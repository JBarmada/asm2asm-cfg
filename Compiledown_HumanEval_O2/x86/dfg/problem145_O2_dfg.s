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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    pushq   %r13                                  // |  2        x     v   |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    subq    $216, %rsp                            // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 272                       // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r13                            // |  3     v  :     ^   |  0                  |  0        |
    movq    %rdi, %r15                            // |  4      v :     : ^ |  0                  |  0        |
    movzbl  (%rdi), %ecx                          // |  5   ^  v :     : : |  0                  |  0        |
    xorl    %eax, %eax                            // |  5 ^ :    :     : : |  0                  |  5 ^^^^^  |
    cmpb    $47, %cl                              // |  4   v    :     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  4   :    :     : : |  0                  |  1  v     |
    xorl    %eax, %eax                            // |  5 ^ :    :     : : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    movb    %cl, 112(%rsp,%rax)                   // |  5 v v    v     : : |  0                  |  0        |
    movzbl  1(%r15,%rax), %ecx                    // |  5 v ^    :     : v |  0                  |  0        |
    incq    %rax                                  // |  5 x :    :     : : |  0                  |  5  ^^^^^ |
    cmpb    $47, %cl                              // |  5 : v    :     : : |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  4 :      :     : : |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    movl    %eax, %ebp                            // |  5 v     ^:     : : |  0                  |  0        |
    movb    $0, 112(%rsp,%rbp)                    // |  5 :     vv     : : |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  6 :^    ::     : : |  0                  |  5 ^^^^^  |
    leaq    112(%rsp), %rdi                       // |  6 :    ^:v     : : |  0                  |  0        |
    xorl    %esi, %esi                            // |  6 :   ^ ::     : : |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  6 :  ^  ::     : : |  0                  |  0        |
    callq   strtol@PLT                            // |  5 :     :x     : : |  0                  |  0        |
    movq    %rax, %r14                            // |  6 v     ::     :^: |  0                  |  0        |
    movzbl  1(%rbp,%r15), %eax                    // |  5 ^     v:     : v |  0                  |  0        |
    movl    $0, %ecx                              // |  6 : ^   ::     : : |  0                  |  0        |
    testb   %al, %al                              // |  5 v     ::     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  5 :     ::     : : |  0                  |  1  v     |
    leaq    (%r15,%rbp), %rdx                     // |  6 :  ^  v:     : v |  0                  |  0        |
    addq    $2, %rdx                              // |  4 :  x   :     :   |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // |  5 : ^:   :     :   |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    movb    %al, (%rsp,%rcx)                      // |  5 v v:   v     :   |  0                  |  0        |
    movzbl  (%rdx,%rcx), %eax                     // |  5 ^ vv   :     :   |  0                  |  0        |
    incq    %rcx                                  // |  4 : x    :     :   |  0                  |  5  ^^^^^ |
    testb   %al, %al                              // |  3 v      :     :   |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  3 :      :     :   |  0                  |  1  v     |
    movl    %ecx, %ecx                            // |  4 : ^    :     :   |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movb    $0, (%rsp,%rcx)                       // |  4 : v    v     :   |  0                  |  0        |
    movq    %rsp, %rdi                            // |  4 :    ^ v     :   |  0                  |  0        |
    xorl    %esi, %esi                            // |  4 :   ^  :     :   |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  4 :  ^   :     :   |  0                  |  0        |
    callq   strtol@PLT                            // |  3 :      x     :   |  0                  |  0        |
    movq    %rax, %r15                            // |  4 v      :     : ^ |  0                  |  0        |
    movzbl  (%r13), %eax                          // |  4 ^      :     v : |  0                  |  0        |
    cmpb    $47, %al                              // |  4 v      :     : : |  0                  |  6 ^^^^^^ |
    je  .LBB0_10                                  // |  4 :      :     : : |  0                  |  1  v     |
    xorl    %ebx, %ebx                            // |  5 :^     :     : : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    movb    %al, 112(%rsp,%rbx)                   // |  5 vv     v     : : |  0                  |  0        |
    movzbl  1(%r13,%rbx), %eax                    // |  5 ^v     :     v : |  0                  |  0        |
    incq    %rbx                                  // |  5 :x     :     : : |  0                  |  5  ^^^^^ |
    cmpb    $47, %al                              // |  5 v:     :     : : |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  5 ::     :     : : |  0                  |  1  v     |
.LBB0_10:                                         // |                     |                     |           |
    movl    %ebx, %ebp                            // |  6 :v    ^:     : : |  0                  |  0        |
    movb    $0, 112(%rsp,%rbp)                    // |  5 :     vv     : : |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  6 :^    ::     : : |  0                  |  5 ^^^^^  |
    leaq    112(%rsp), %rdi                       // |  6 :    ^:v     : : |  0                  |  0        |
    xorl    %esi, %esi                            // |  6 :   ^ ::     : : |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  6 :  ^  ::     : : |  0                  |  0        |
    callq   strtol@PLT                            // |  5 :     :x     : : |  0                  |  0        |
    movq    %rax, %r12                            // |  6 v     ::    ^: : |  0                  |  0        |
    movzbl  1(%rbp,%r13), %eax                    // |  6 ^     v:    :v : |  0                  |  0        |
    testb   %al, %al                              // |  6 v     ::    :: : |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  6 :     ::    :: : |  0                  |  1  v     |
    leaq    2(,%r13), %rdx                        // |  7 :  ^  ::    :v : |  0                  |  0        |
    addq    %rbp, %rdx                            // |  6 :  x  v:    :  : |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // |  6 : ^:   :    :  : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    movb    %al, (%rsp,%rcx)                      // |  6 v v:   v    :  : |  0                  |  0        |
    movzbl  (%rdx,%rcx), %eax                     // |  6 ^ vv   :    :  : |  0                  |  0        |
    incq    %rcx                                  // |  5 : x    :    :  : |  0                  |  5  ^^^^^ |
    testb   %al, %al                              // |  5 v :    :    :  : |  0                  |  6 ^^^^^^ |
    jne .LBB0_12                                  // |  5 : :    :    :  : |  0                  |  1  v     |
    movl    %ecx, %ebx                            // |  6 :^v    :    :  : |  0                  |  0        |
.LBB0_14:                                         // |                     |                     |           |
    movb    $0, (%rsp,%rbx)                       // |  5 :v     v    :  : |  0                  |  0        |
    movq    %rsp, %rdi                            // |  5 :    ^ v    :  : |  0                  |  0        |
    xorl    %esi, %esi                            // |  5 :   ^  :    :  : |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  5 :  ^   :    :  : |  0                  |  0        |
    callq   strtol@PLT                            // |  5 :  :   x    :  : |  0                  |  0        |
    movq    %rax, %rcx                            // |  6 v ^:   :    :  : |  0                  |  0        |
    imull   %r12d, %r14d                          // |  6 x  x   :    v ^: |  0                  |  2 ^  ^   |
    imull   %r15d, %ecx                           // |  6 x ^x   :      :v |  0                  |  2 ^  ^   |
    movl    %r14d, %eax                           // |  5 ^ ::   :      v  |  0                  |  0        |
    cltd                                          // |  4 : ::   :         |  0                  |  0        |
    idivl   %ecx                                  // |  4 x xx   :         |  0                  |  0        |
    xorl    %eax, %eax                            // |  3 ^  :   :         |  0                  |  5 ^^^^^  |
    testl   %edx, %edx                            // |  3 :  v   :         |  0                  |  6 ^^^^^^ |
    sete    %al                                   // |  2 x      :         |  0                  |  1  v     |
    addq    $216, %rsp                            // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 56                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r13                                  // |  2        x     ^   |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
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
