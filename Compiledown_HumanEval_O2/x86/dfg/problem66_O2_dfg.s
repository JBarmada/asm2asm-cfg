                                                    // +---------------------+---------------------+-----------+
                                                    // |         GPR         |        VECTOR       |   FLAGS   |
                                                    // |                     |                     |           |
                                                    // |    RRRRRRRRRRRRRRRR |    XXXXXXXXXXXXXXXX |    CZSOPA |
                                                    // |    ABCDSDBS89111111 |    MMMMMMMMMMMMMMMM |    FFFFFF |
                                                    // |    XXXXIIPP  012345 |    MMMMMMMMMMMMMMMM |           |
                                                    // |                     |    0123456789111111 |           |
                                                    // |  #                  |  #           012345 |  #        |
                                                    // +---------------------+---------------------+-----------+
    .text                                           // |                     |                     |           |
    .file   "code.c"                                // |                     |                     |           |
    .globl  func0                                   // |                     |                     |           |
    .p2align    4, 0x90                             // |                     |                     |           |
    .type   func0,@function                         // |                     |                     |           |
func0:                                              // |                     |                     |           |
    .cfi_startproc                                  // |                     |                     |           |
    pushq   %rbp                                    // |  2       vx         |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    pushq   %r15                                    // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    pushq   %r14                                    // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    subq    $56, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 96                          // |                     |                     |           |
    .cfi_offset %rbx, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movl    %esi, %r14d                             // |  3     v  :      ^  |  0                  |  0        |
    movl    %edi, %edx                              // |  4    ^ v :      :  |  0                  |  0        |
    leaq    func0.xs(%rip), %r15                    // |  3        :      :^ |  0                  |  0        |
    leaq    .L.str(%rip), %rsi                      // |  4     ^  :      :: |  0                  |  0        |
    movq    %r15, %rdi                              // |  4      ^ :      :v |  0                  |  0        |
    xorl    %eax, %eax                              // |  4 ^      :      :: |  0                  |  5 ^^^^^  |
    callq   sprintf@PLT                             // |  4 :      x      :: |  0                  |  0        |
    movq    %r15, %rdi                              // |  5 :    ^ :      :v |  0                  |  0        |
    callq   strlen@PLT                              // |  4 :      x      :: |  0                  |  0        |
    movl    %eax, %ebp                              // |  5 v     ^:      :: |  0                  |  0        |
    subl    %r14d, %ebp                             // |  5 :     x:      v: |  0                  |  6 ^^^^^^ |
    jge .LBB0_9                                     // |  5 :     ::      :: |  0                  |  2   vv   |
    cmpl    $2, %eax                                // |  5 v     ::      :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_8                                     // |  5 :     ::      :: |  0                  |  2   vv   |
    movq    %rax, %r8                               // |  6 v     ::^     :: |  0                  |  0        |
    shrq    %r8                                     // |  6 :     ::x     :: |  0                  |  5 ^^^^^  |
    movl    %r8d, %r11d                             // |  7 :     ::v  ^  :: |  0                  |  0        |
    andl    $2147483647, %r11d                      // |  7 :     :::  x  :: |  0                  |  5 ^^^^^  |
    andl    $1, %r8d                                // |  7 :     ::x  :  :: |  0                  |  5 ^^^^^  |
    cmpq    $1, %r11                                // |  7 :     :::  v  :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                     // |  7 :     :::  :  :: |  0                  |  1  v     |
    xorl    %edx, %edx                              // |  8 :  ^  :::  :  :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                     // |  7 :     :::  :  :: |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    movslq  %eax, %rsi                              // |  8 v   ^ :::  :  :: |  0                  |  0        |
    addq    %r15, %rsi                              // |  8 :   x :::  :  :v |  0                  |  6 ^^^^^^ |
    movslq  %r14d, %rbx                             // |  9 :^  : :::  :  v: |  0                  |  0        |
    subq    %rbx, %rsi                              // |  8 :v  x :::  :   : |  0                  |  6 ^^^^^^ |
    movq    %rsp, %r14                              // |  8 ::    :v:  :  ^: |  0                  |  0        |
    movq    %r14, %rdi                              // |  9 ::   ^:::  :  v: |  0                  |  0        |
    callq   strcpy@PLT                              // |  8 ::    :x:  :  :: |  0                  |  0        |
    movb    $0, (%rsp,%rbx)                         // |  8 :v    :v:  :  :: |  0                  |  0        |
    movslq  %ebp, %rdx                              // |  8 :  ^  v::  :  :: |  0                  |  0        |
    movq    %r14, %rdi                              // |  7 :    ^ ::  :  v: |  0                  |  0        |
    movq    %r15, %rsi                              // |  7 :   ^  ::  :  :v |  0                  |  0        |
    callq   strncat@PLT                             // |  6 :      x:  :  :: |  0                  |  0        |
    movq    %r15, %rdi                              // |  7 :    ^ ::  :  :v |  0                  |  0        |
    movq    %r14, %rsi                              // |  7 :   ^  ::  :  v: |  0                  |  0        |
    callq   strcpy@PLT                              // |  5 :      x:  :   : |  0                  |  0        |
    jmp .LBB0_8                                     // |  5 :      ::  :   : |  0                  |  0        |
.LBB0_4:                                            // |                     |                     |           |
    movabsq $-8589934592, %r9                       // |  6 :      ::^ :   : |  0                  |  0        |
    subq    %r8, %r11                               // |  6 :      :v: x   : |  0                  |  6 ^^^^^^ |
    movq    %rax, %rdx                              // |  7 v  ^   ::: :   : |  0                  |  0        |
    shlq    $32, %rdx                               // |  7 :  x   ::: :   : |  0                  |  5 ^^^^^  |
    leaq    (%rdx,%r9), %rsi                        // |  8 :  v^  ::v :   : |  0                  |  0        |
    movabsq $-4294967296, %rdi                      // |  9 :  ::^ ::: :   : |  0                  |  0        |
    addq    %rdx, %rdi                              // |  9 :  v:x ::: :   : |  0                  |  6 ^^^^^^ |
    xorl    %edx, %edx                              // |  9 :  ^:: ::: :   : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    movzbl  (%rdx,%r15), %r10d                      // | 10 :  v:: :::^:   v |  0                  |  0        |
    movq    %rdi, %rcx                              // | 11 : ^::v :::::   : |  0                  |  0        |
    sarq    $32, %rcx                               // | 11 : ^::: :::::   : |  0                  |  5 ^^^^^  |
    movzbl  (%rcx,%r15), %ebx                       // | 12 :^v::: :::::   v |  0                  |  0        |
    movb    %bl, (%rdx,%r15)                        // | 12 :v:v:: :::::   v |  0                  |  0        |
    movb    %r10b, (%rcx,%r15)                      // | 11 : v::: :::v:   v |  0                  |  0        |
    movzbl  1(%rdx,%r15), %ecx                      // | 10 : ^v:: ::: :   v |  0                  |  0        |
    movq    %rsi, %rbp                              // | 11 : ::v:^::: :   : |  0                  |  0        |
    sarq    $32, %rbp                               // | 11 : ::::^::: :   : |  0                  |  5 ^^^^^  |
    movzbl  (%rbp,%r15), %ebx                       // | 12 :^::::v::: :   v |  0                  |  0        |
    movb    %bl, 1(%rdx,%r15)                       // | 12 :v:v:::::: :   v |  0                  |  0        |
    movb    %cl, (%rbp,%r15)                        // | 11 : v:::v::: :   v |  0                  |  0        |
    addq    $2, %rdx                                // |  9 :  x:: ::: :   : |  0                  |  6 ^^^^^^ |
    addq    %r9, %rsi                               // |  9 :  :x: ::v :   : |  0                  |  6 ^^^^^^ |
    addq    %r9, %rdi                               // |  8 :  : x ::v :   : |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %r11                              // |  6 :  v   ::  v   : |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  5 :  :   ::      : |  0                  |  1  v     |
.LBB0_6:                                            // |                     |                     |           |
    testq   %r8, %r8                                // |  5 :  :   :v      : |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                     // |  4 :  :   :       : |  0                  |  1  v     |
    movzbl  (%rdx,%r15), %ecx                       // |  5 : ^v   :       v |  0                  |  0        |
    movl    %edx, %esi                              // |  6 : :v^  :       : |  0                  |  0        |
    notl    %esi                                    // |  6 : ::x  :       : |  0                  |  0        |
    addl    %eax, %esi                              // |  6 v ::x  :       : |  0                  |  6 ^^^^^^ |
    movslq  %esi, %rax                              // |  6 ^ ::v  :       : |  0                  |  0        |
    movzbl  (%rax,%r15), %ebx                       // |  6 v^::   :       v |  0                  |  0        |
    movb    %bl, (%rdx,%r15)                        // |  6 :v:v   :       v |  0                  |  0        |
    movb    %cl, (%rax,%r15)                        // |  4 v v    :       v |  0                  |  0        |
.LBB0_8:                                            // |                     |                     |           |
    leaq    func0.xs(%rip), %rax                    // |  2 ^      :         |  0                  |  0        |
    addq    $56, %rsp                               // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                          // |                     |                     |           |
    popq    %r14                                    // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 24                          // |                     |                     |           |
    popq    %r15                                    // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 16                          // |                     |                     |           |
    popq    %rbp                                    // |  2       ^x         |  0                  |  0        |
    .cfi_def_cfa_offset 8                           // |                     |                     |           |
    retq                                            // |  1        x         |  0                  |  0        |
.Lfunc_end0:                                        // |                     |                     |           |
    .size   func0, .Lfunc_end0-func0                // |                     |                     |           |
    .cfi_endproc                                    // |                     |                     |           |
    .type   func0.xs,@object                        // |                     |                     |           |
    .local  func0.xs                                // |                     |                     |           |
    .comm   func0.xs,50,16                          // |                     |                     |           |
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .asciz  "%d"                                    // |                     |                     |           |
    .size   .L.str, 3                               // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
    .addrsig_sym func0.xs                           // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
