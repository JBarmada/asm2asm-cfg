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
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    cmpl    $2, %esi                              // |  2     v  :         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_17                                  // |  1        :         |  0                  |  2   vv   |
    leal    -1(%rsi), %r8d                        // |  3     v  :^        |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  3        ::^       |  0                  |  5 ^^^^^  |
    movl    %r8d, %r10d                           // |  4        :v:^      |  0                  |  0        |
    jmp .LBB0_3                                   // |  4        ::::      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_2:                                          // |                     |                     |           |
    incl    %r9d                                  // |  4        ::x:      |  0                  |  5  ^^^^^ |
    decl    %r10d                                 // |  4        :::x      |  0                  |  5  ^^^^^ |
    cmpl    %r8d, %r9d                            // |  3        :vv       |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                  // |  2        : :       |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    movl    %r10d, %r10d                          // |  3        : :^      |  0                  |  0        |
    movl    %r9d, %eax                            // |  4 ^      : v:      |  0                  |  0        |
    notl    %eax                                  // |  3 x      :  :      |  0                  |  0        |
    addl    %esi, %eax                            // |  4 x   v  :  :      |  0                  |  6 ^^^^^^ |
    testl   %eax, %eax                            // |  3 v      :  :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_2                                   // |  2        :  :      |  0                  |  3  vvv   |
    movl    (%rdi), %r14d                         // |  4      v :  :   ^  |  0                  |  0        |
    cmpl    $1, %r10d                             // |  3        :  v   :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  3        :  :   :  |  0                  |  1  v     |
    xorl    %eax, %eax                            // |  4 ^      :  :   :  |  0                  |  5 ^^^^^  |
.LBB0_6:                                          // |                     |                     |           |
    testb   $1, %r10b                             // |  4 :      :  v   :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  4 :      :  :   :  |  0                  |  1  v     |
    movl    4(%rdi,%rax,4), %ebp                  // |  6 v    v^:  :   :  |  0                  |  0        |
    cmpl    %ebp, %r14d                           // |  5 :     v:  :   v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_2                                   // |  5 :     ::  :   :  |  0                  |  3  vvv   |
    movl    %ebp, (%rdi,%rax,4)                   // |  6 v    vv:  :   :  |  0                  |  0        |
    movl    %r14d, 4(%rdi,%rax,4)                 // |  6 v    v::  :   v  |  0                  |  0        |
    jmp .LBB0_2                                   // |  5 :     ::  :   :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    movl    %r10d, %r11d                          // |  6 :     ::  v^  :  |  0                  |  0        |
    andl    $-2, %r11d                            // |  5 :     ::   x  :  |  0                  |  5 ^^^^^  |
    xorl    %ebx, %ebx                            // |  6 :^    ::   :  :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                  // |  6 ::    ::   :  :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_10:                                         // |                     |                     |           |
    movl    %ebp, 4(%rdi,%rbx,4)                  // |  7 :v   vv:   :  :  |  0                  |  0        |
    movl    %r14d, 8(%rdi,%rbx,4)                 // |  6 :v   v :   :  v  |  0                  |  0        |
.LBB0_11:                                         // |                     |                     |           |
    movq    %rax, %rbx                            // |  5 v^     :   :  :  |  0                  |  0        |
    cmpq    %rax, %r11                            // |  5 v:     :   v  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  3  :     :      :  |  0                  |  1  v     |
.LBB0_12:                                         // |                     |                     |           |
    movl    4(%rdi,%rbx,4), %eax                  // |  5 ^v   v :      :  |  0                  |  0        |
    cmpl    %eax, %r14d                           // |  4 v:     :      v  |  0                  |  6 ^^^^^^ |
    jle .LBB0_14                                  // |  4 ::     :      :  |  0                  |  3  vvv   |
    movl    %eax, (%rdi,%rbx,4)                   // |  5 vv   v :      :  |  0                  |  0        |
    movl    %r14d, 4(%rdi,%rbx,4)                 // |  5 :v   v :      v  |  0                  |  0        |
    jmp .LBB0_15                                  // |  3 ::     :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movl    %eax, %r14d                           // |  4 v:     :      ^  |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    leaq    2(%rbx), %rax                         // |  4 ^v     :      :  |  0                  |  0        |
    movl    8(%rdi,%rbx,4), %ebp                  // |  5  v   v^:      :  |  0                  |  0        |
    cmpl    %ebp, %r14d                           // |  3       v:      v  |  0                  |  6 ^^^^^^ |
    jg  .LBB0_10                                  // |  2       ::         |  0                  |  3  vvv   |
    movl    %ebp, %r14d                           // |  3       v:      ^  |  0                  |  0        |
    jmp .LBB0_11                                  // |  1        :         |  0                  |  0        |
.LBB0_17:                                         // |                     |                     |           |
    testl   %edx, %edx                            // |  2    v   :         |  0                  |  6 ^^^^^^ |
    jle .LBB0_34                                  // |  1        :         |  0                  |  3  vvv   |
    subl    %edx, %esi                            // |  3    vx  :         |  0                  |  6 ^^^^^^ |
    movslq  %esi, %r8                             // |  3     v  :^        |  0                  |  0        |
    movl    %edx, %r10d                           // |  4    v   :: ^      |  0                  |  0        |
    cmpl    $8, %edx                              // |  4    v   :: :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_19                                  // |  3        :: :      |  0                  |  1 v      |
    leaq    (%rdi,%r8,4), %rax                    // |  5 ^    v :v :      |  0                  |  0        |
    movq    %rcx, %rdx                            // |  6 : v^   :: :      |  0                  |  0        |
    subq    %rax, %rdx                            // |  5 v  x   :: :      |  0                  |  6 ^^^^^^ |
    cmpq    $32, %rdx                             // |  4    v   :: :      |  0                  |  6 ^^^^^^ |
    jae .LBB0_22                                  // |  3        :: :      |  0                  |  1 v      |
.LBB0_19:                                         // |                     |                     |           |
    xorl    %edx, %edx                            // |  4    ^   :: :      |  0                  |  5 ^^^^^  |
.LBB0_28:                                         // |                     |                     |           |
    movq    %rdx, %rsi                            // |  5    v^  :: :      |  0                  |  0        |
    notq    %rsi                                  // |  5    :x  :: :      |  0                  |  0        |
    addq    %r10, %rsi                            // |  5    :x  :: v      |  0                  |  6 ^^^^^^ |
    movq    %r10, %rax                            // |  6 ^  ::  :: v      |  0                  |  0        |
    andq    $3, %rax                              // |  6 x  ::  :: :      |  0                  |  5 ^^^^^  |
    je  .LBB0_31                                  // |  6 :  ::  :: :      |  0                  |  1  v     |
    leaq    (%rdi,%r8,4), %rbp                    // |  8 :  ::v^:v :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_30:                                         // |                     |                     |           |
    movl    (%rbp,%rdx,4), %ebx                   // |  8 :^ v: v:: :      |  0                  |  0        |
    movl    %ebx, (%rcx,%rdx,4)                   // |  8 :vvv:  :: :      |  0                  |  0        |
    incq    %rdx                                  // |  6 :  x:  :: :      |  0                  |  5  ^^^^^ |
    decq    %rax                                  // |  6 x  ::  :: :      |  0                  |  5  ^^^^^ |
    jne .LBB0_30                                  // |  5    ::  :: :      |  0                  |  1  v     |
.LBB0_31:                                         // |                     |                     |           |
    cmpq    $3, %rsi                              // |  5    :v  :: :      |  0                  |  6 ^^^^^^ |
    jb  .LBB0_34                                  // |  4    :   :: :      |  0                  |  1 v      |
    leaq    (%rdi,%r8,4), %rax                    // |  6 ^  : v :v :      |  0                  |  0        |
    addq    $12, %rax                             // |  5 x  :   :: :      |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_33:                                         // |                     |                     |           |
    movl    -12(%rax,%rdx,4), %esi                // |  6 v  v^  :: :      |  0                  |  0        |
    movl    %esi, (%rcx,%rdx,4)                   // |  7 : vvv  :: :      |  0                  |  0        |
    movl    -8(%rax,%rdx,4), %esi                 // |  6 v  v^  :: :      |  0                  |  0        |
    movl    %esi, 4(%rcx,%rdx,4)                  // |  7 : vvv  :: :      |  0                  |  0        |
    movl    -4(%rax,%rdx,4), %esi                 // |  6 v  v^  :: :      |  0                  |  0        |
    movl    %esi, 8(%rcx,%rdx,4)                  // |  7 : vvv  :: :      |  0                  |  0        |
    movl    (%rax,%rdx,4), %esi                   // |  6 v  v^  :: :      |  0                  |  0        |
    movl    %esi, 12(%rcx,%rdx,4)                 // |  6   vvv  :: :      |  0                  |  0        |
    addq    $4, %rdx                              // |  4    x   :: :      |  0                  |  6 ^^^^^^ |
    cmpq    %rdx, %r10                            // |  4    v   :: v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_33                                  // |  3        :: :      |  0                  |  1  v     |
    jmp .LBB0_34                                  // |  3        :: :      |  0                  |  0        |
.LBB0_22:                                         // |                     |                     |           |
    movl    %r10d, %edx                           // |  4    ^   :: v      |  0                  |  0        |
    andl    $-8, %edx                             // |  4    x   :: :      |  0                  |  5 ^^^^^  |
    leaq    -8(%rdx), %rax                        // |  5 ^  v   :: :      |  0                  |  0        |
    movq    %rax, %r9                             // |  6 v  :   ::^:      |  0                  |  0        |
    shrq    $3, %r9                               // |  6 :  :   ::x:      |  0                  |  5 ^^^^^  |
    incq    %r9                                   // |  6 :  :   ::x:      |  0                  |  5  ^^^^^ |
    testq   %rax, %rax                            // |  6 v  :   ::::      |  0                  |  6 ^^^^^^ |
    je  .LBB0_35                                  // |  5    :   ::::      |  0                  |  1  v     |
    leaq    (,%r8,4), %rax                        // |  6 ^  :   :v::      |  0                  |  0        |
    movq    %r9, %rbx                             // |  7 :^ :   ::v:      |  0                  |  0        |
    andq    $-2, %rbx                             // |  7 :x :   ::::      |  0                  |  5 ^^^^^  |
    leaq    (%rax,%rdi), %rbp                     // |  9 v: : v^::::      |  0                  |  0        |
    addq    $48, %rbp                             // |  7  : :  x::::      |  0                  |  6 ^^^^^^ |
    xorl    %esi, %esi                            // |  8  : :^ :::::      |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_24:                                         // |                     |                     |           |
    movups  -48(%rbp,%rsi,4), %xmm0               // |  8  : :v v::::      |  1 ^                |  0        |
    movups  -32(%rbp,%rsi,4), %xmm1               // |  8  : :v v::::      |  2 :^               |  0        |
    movups  %xmm0, (%rcx,%rsi,4)                  // |  9  :v:v :::::      |  2 v:               |  0        |
    movups  %xmm1, 16(%rcx,%rsi,4)                // |  9  :v:v :::::      |  1  v               |  0        |
    movups  -16(%rbp,%rsi,4), %xmm0               // |  8  : :v v::::      |  1 ^                |  0        |
    movups  (%rbp,%rsi,4), %xmm1                  // |  8  : :v v::::      |  2 :^               |  0        |
    movups  %xmm0, 32(%rcx,%rsi,4)                // |  8  :v:v  ::::      |  2 v:               |  0        |
    movups  %xmm1, 48(%rcx,%rsi,4)                // |  8  :v:v  ::::      |  1  v               |  0        |
    addq    $16, %rsi                             // |  7  : :x  ::::      |  0                  |  6 ^^^^^^ |
    addq    $-2, %rbx                             // |  7  x ::  ::::      |  0                  |  6 ^^^^^^ |
    jne .LBB0_24                                  // |  6    ::  ::::      |  0                  |  1  v     |
    testb   $1, %r9b                              // |  6    ::  ::v:      |  0                  |  6 ^^^^^^ |
    je  .LBB0_27                                  // |  6    ::  ::::      |  0                  |  1  v     |
.LBB0_26:                                         // |                     |                     |           |
    leaq    (%rsi,%r8), %rax                      // |  7 ^  :v  :v::      |  0                  |  0        |
    movups  (%rdi,%rax,4), %xmm0                  // |  7 v  ::v : ::      |  1 ^                |  0        |
    movups  16(%rdi,%rax,4), %xmm1                // |  7 v  ::v : ::      |  2 :^               |  0        |
    movups  %xmm0, (%rcx,%rsi,4)                  // |  6   v:v  : ::      |  2 v:               |  0        |
    movups  %xmm1, 16(%rcx,%rsi,4)                // |  6   v:v  : ::      |  1  v               |  0        |
.LBB0_27:                                         // |                     |                     |           |
    cmpq    %r10, %rdx                            // |  4    v   : :v      |  0                  |  6 ^^^^^^ |
    jne .LBB0_28                                  // |  2        : :       |  0                  |  1  v     |
.LBB0_34:                                         // |                     |                     |           |
    popq    %rbx                                  // |  3  ^     x :       |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  3        x :    ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  3       ^x :       |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  2        x :       |  0                  |  0        |
.LBB0_35:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    xorl    %esi, %esi                            // |  2     ^    :       |  0                  |  5 ^^^^^  |
    testb   $1, %r9b                              // |  1          v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_26                                  // |  0                  |  0                  |  1  v     |
    jmp .LBB0_27                                  // |  0                  |  0                  |  0        |
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
