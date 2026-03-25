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
    pushq   %rax                                  // |  2 v      x         |  0                  |  0        |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    .cfi_offset %rbx, -56                         // |                     |                     |           |
    .cfi_offset %r12, -48                         // |                     |                     |           |
    .cfi_offset %r13, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %r8, %r14                             // |  3        :v     ^  |  0                  |  0        |
    movl    %ecx, %r15d                           // |  4   v    :      :^ |  0                  |  0        |
    movq    %rdx, %rbx                            // |  5  ^ v   :      :: |  0                  |  0        |
    movl    %esi, %r12d                           // |  6  :  v  :    ^ :: |  0                  |  0        |
    movq    %rdi, %r13                            // |  7  :   v :    :^:: |  0                  |  0        |
    movslq  %esi, %rbp                            // |  8  :  v ^:    :::: |  0                  |  0        |
    leaq    (,%rbp,4), %rdi                       // |  8  :   ^v:    :::: |  0                  |  0        |
    callq   malloc@PLT                            // |  7  :    :x    :::: |  0                  |  0        |
    testl   %ebp, %ebp                            // |  7  :    v:    :::: |  0                  |  6 ^^^^^^ |
    jle .LBB0_1                                   // |  6  :     :    :::: |  0                  |  3  vvv   |
    movl    %r12d, %r8d                           // |  7  :     :^   v::: |  0                  |  0        |
    movl    %r15d, %esi                           // |  7  :  ^  ::    ::v |  0                  |  0        |
    xorl    %edi, %edi                            // |  8  :  :^ ::    ::: |  0                  |  5 ^^^^^  |
    xorl    %r9d, %r9d                            // |  9  :  :: ::^   ::: |  0                  |  5 ^^^^^  |
    jmp .LBB0_3                                   // |  9  :  :: :::   ::: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_16:                                         // |                     |                     |           |
    movslq  %r9d, %rdx                            // | 10  : ^:: ::v   ::: |  0                  |  0        |
    incl    %r9d                                  // | 10  : ::: ::x   ::: |  0                  |  5  ^^^^^ |
    movl    %ecx, (%rax,%rdx,4)                   // | 12 v:vv:: :::   ::: |  0                  |  0        |
.LBB0_17:                                         // |                     |                     |           |
    incq    %rdi                                  // |  9  :  :x :::   ::: |  0                  |  5  ^^^^^ |
    cmpq    %r8, %rdi                             // |  9  :  :v :v:   ::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  8  :  :: : :   ::: |  0                  |  1  v     |
.LBB0_3:                                          // |                     |                     |           |
    testl   %r9d, %r9d                            // |  8  :  :: : v   ::: |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                   // |  8  :  :: : :   ::: |  0                  |  3  vvv   |
    movl    (%r13,%rdi,4), %ecx                   // |  9  :^ :v : :   v:: |  0                  |  0        |
    movl    %r9d, %ebp                            // | 10  :: ::^: v   ::: |  0                  |  0        |
    xorl    %edx, %edx                            // | 11  ::^:::: :   ::: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_5:                                          // |                     |                     |           |
    cmpl    %ecx, (%rax,%rdx,4)                   // | 12 v:vv:::: :   ::: |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                  // | 10  : ::::: :   ::: |  0                  |  1  v     |
    incq    %rdx                                  // | 10  : x:::: :   ::: |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rbp                            // | 10  : v::v: :   ::: |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                   // |  9  :  :::: :   ::: |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    testl   %r15d, %r15d                          // |  9  :  :::: :   ::v |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  8  :  :::: :   ::  |  0                  |  3  vvv   |
    movl    (%r13,%rdi,4), %ecx                   // |  9  :^ :v:: :   v:  |  0                  |  0        |
    xorl    %edx, %edx                            // |  8  ::^: :: :    :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_15:                                         // |                     |                     |           |
    cmpl    (%rbx,%rdx,4), %ecx                   // |  8  vvv: :: :    :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                  // |  6    :: :: :    :  |  0                  |  1  v     |
    incq    %rdx                                  // |  6    x: :: :    :  |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rsi                            // |  6    vv :: :    :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  4       :: :    :  |  0                  |  1  v     |
    jmp .LBB0_17                                  // |  4       :: :    :  |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    cmpl    $2, %r9d                              // |  4       :: v    :  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_30                                  // |  4       :: :    :  |  0                  |  2   vv   |
    leal    -1(%r9), %r8d                         // |  5       ::^v    :  |  0                  |  0        |
    xorl    %esi, %esi                            // |  6     ^ ::::    :  |  0                  |  5 ^^^^^  |
    movl    %r8d, %r11d                           // |  7     : ::v: ^  :  |  0                  |  0        |
    jmp .LBB0_11                                  // |  7     : :::: :  :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_29:                                         // |                     |                     |           |
    incl    %esi                                  // |  7     x :::: :  :  |  0                  |  5  ^^^^^ |
    decl    %r11d                                 // |  7     : :::: x  :  |  0                  |  5  ^^^^^ |
    cmpl    %r8d, %esi                            // |  7     v ::v: :  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_30                                  // |  7     : :::: :  :  |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    movl    %esi, %ecx                            // |  8   ^ v :::: :  :  |  0                  |  0        |
    notl    %ecx                                  // |  8   x : :::: :  :  |  0                  |  0        |
    addl    %r9d, %ecx                            // |  8   x : :::v :  :  |  0                  |  6 ^^^^^^ |
    testl   %ecx, %ecx                            // |  7   v : :::  :  :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_29                                  // |  6     : :::  :  :  |  0                  |  3  vvv   |
    movl    %r8d, %r10d                           // |  7     : ::v ^:  :  |  0                  |  0        |
    subl    %esi, %r10d                           // |  6     v ::  x:  :  |  0                  |  6 ^^^^^^ |
    movl    (%rax), %edx                          // |  7 v  ^  ::  ::  :  |  0                  |  0        |
    cmpl    $1, %r10d                             // |  6    :  ::  v:  :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_18                                  // |  6    :  ::  ::  :  |  0                  |  1  v     |
    xorl    %ebx, %ebx                            // |  7  ^ :  ::  ::  :  |  0                  |  5 ^^^^^  |
.LBB0_26:                                         // |                     |                     |           |
    testb   $1, %r10b                             // |  7  : :  ::  v:  :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_29                                  // |  6  : :  ::   :  :  |  0                  |  1  v     |
    movl    4(%rax,%rbx,4), %ecx                  // |  8 vv^:  ::   :  :  |  0                  |  0        |
    cmpl    %ecx, %edx                            // |  7  :vv  ::   :  :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_29                                  // |  7  :::  ::   :  :  |  0                  |  3  vvv   |
    movl    %ecx, (%rax,%rbx,4)                   // |  8 vvv:  ::   :  :  |  0                  |  0        |
    movl    %edx, 4(%rax,%rbx,4)                  // |  7 vv v  ::   :  :  |  0                  |  0        |
    jmp .LBB0_29                                  // |  6  : :  ::   :  :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_18:                                         // |                     |                     |           |
    movl    %r11d, %edi                           // |  7  : : ^::   v  :  |  0                  |  0        |
    andl    $-2, %edi                             // |  6  : : x::      :  |  0                  |  5 ^^^^^  |
    xorl    %ecx, %ecx                            // |  7  :^: :::      :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_19                                  // |  7  ::: :::      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_24:                                         // |                     |                     |           |
    movl    %ebp, 4(%rax,%rcx,4)                  // |  8 v:v: :v:      :  |  0                  |  0        |
    movl    %edx, 8(%rax,%rcx,4)                  // |  7 v:vv : :      :  |  0                  |  0        |
.LBB0_25:                                         // |                     |                     |           |
    movq    %rbx, %rcx                            // |  6  v^: : :      :  |  0                  |  0        |
    cmpq    %rbx, %rdi                            // |  6  v:: v :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_26                                  // |  4   ::   :      :  |  0                  |  1  v     |
.LBB0_19:                                         // |                     |                     |           |
    movl    4(%rax,%rcx,4), %ebp                  // |  6 v v:  ^:      :  |  0                  |  0        |
    cmpl    %ebp, %edx                            // |  5   :v  v:      :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_20                                  // |  5   ::  ::      :  |  0                  |  3  vvv   |
    movl    %ebp, (%rax,%rcx,4)                   // |  6 v v:  v:      :  |  0                  |  0        |
    movl    %edx, 4(%rax,%rcx,4)                  // |  6 v vv  ::      :  |  0                  |  0        |
    jmp .LBB0_22                                  // |  4   :   ::      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_20:                                         // |                     |                     |           |
    movl    %ebp, %edx                            // |  5   :^  v:      :  |  0                  |  0        |
.LBB0_22:                                         // |                     |                     |           |
    leaq    2(%rcx), %rbx                         // |  5  ^v:   :      :  |  0                  |  0        |
    movl    8(%rax,%rcx,4), %ebp                  // |  6 v v:  ^:      :  |  0                  |  0        |
    cmpl    %ebp, %edx                            // |  4    v  v:      :  |  0                  |  6 ^^^^^^ |
    jg  .LBB0_24                                  // |  3       ::      :  |  0                  |  3  vvv   |
    movl    %ebp, %edx                            // |  4    ^  v:      :  |  0                  |  0        |
    jmp .LBB0_25                                  // |  2        :      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r9d, %r9d                            // |  3        : ^    :  |  0                  |  5 ^^^^^  |
.LBB0_30:                                         // |                     |                     |           |
    movl    %r9d, (%r14)                          // |  3        : v    v  |  0                  |  0        |
    addq    $8, %rsp                              // |  1        x         |  0                  |  6 ^^^^^^ |
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
