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
    pushq   %r12                                    // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    pushq   %rbx                                    // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                          // |                     |                     |           |
    .cfi_offset %rbx, -48                           // |                     |                     |           |
    .cfi_offset %r12, -40                           // |                     |                     |           |
    .cfi_offset %r14, -32                           // |                     |                     |           |
    .cfi_offset %r15, -24                           // |                     |                     |           |
    .cfi_offset %rbp, -16                           // |                     |                     |           |
    movq    %rdx, %r14                              // |  3    v   :      ^  |  0                  |  0        |
    movl    %esi, %r15d                             // |  4     v  :      :^ |  0                  |  0        |
    movq    %rdi, %rbx                              // |  5  ^   v :      :: |  0                  |  0        |
    leal    -1(%r15), %r8d                          // |  5  :     :^     :v |  0                  |  0        |
    cmpl    $2, %esi                                // |  6  :  v  ::     :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_17                                    // |  5  :     ::     :: |  0                  |  2   vv   |
    xorl    %r9d, %r9d                              // |  6  :     ::^    :: |  0                  |  5 ^^^^^  |
    movl    %r8d, %r10d                             // |  7  :     :v:^   :: |  0                  |  0        |
    jmp .LBB0_2                                     // |  7  :     ::::   :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_16:                                           // |                     |                     |           |
    incl    %r9d                                    // |  7  :     ::x:   :: |  0                  |  5  ^^^^^ |
    decl    %r10d                                   // |  7  :     :::x   :: |  0                  |  5  ^^^^^ |
    cmpl    %r8d, %r9d                              // |  6  :     :vv    :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_17                                    // |  6  :     :::    :: |  0                  |  1  v     |
.LBB0_2:                                            // |                     |                     |           |
    movl    %r10d, %r10d                            // |  7  :     :::^   :: |  0                  |  0        |
    movl    %r9d, %eax                              // |  8 ^:     ::v:   :: |  0                  |  0        |
    notl    %eax                                    // |  7 x:     :: :   :: |  0                  |  0        |
    addl    %r15d, %eax                             // |  7 x:     :: :   :v |  0                  |  6 ^^^^^^ |
    testl   %eax, %eax                              // |  7 v:     :: :   :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                    // |  6  :     :: :   :: |  0                  |  3  vvv   |
    movl    (%rbx), %ebp                            // |  7  v    ^:: :   :: |  0                  |  0        |
    cmpl    $1, %r10d                               // |  7  :    ::: v   :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_5                                     // |  7  :    ::: :   :: |  0                  |  1  v     |
    xorl    %edx, %edx                              // |  8  : ^  ::: :   :: |  0                  |  5 ^^^^^  |
.LBB0_13:                                           // |                     |                     |           |
    testb   $1, %r10b                               // |  8  : :  ::: v   :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_16                                    // |  8  : :  ::: :   :: |  0                  |  1  v     |
    movl    4(%rbx,%rdx,4), %eax                    // |  9 ^v v  ::: :   :: |  0                  |  0        |
    cmpl    %eax, %ebp                              // |  9 v: :  v:: :   :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                    // |  9 :: :  ::: :   :: |  0                  |  3  vvv   |
    movl    %eax, (%rbx,%rdx,4)                     // |  9 vv v  ::: :   :: |  0                  |  0        |
    movl    %ebp, 4(%rbx,%rdx,4)                    // |  8  v v  v:: :   :: |  0                  |  0        |
    jmp .LBB0_16                                    // |  8  : :  ::: :   :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_5:                                            // |                     |                     |           |
    movl    %r10d, %esi                             // |  9  : :^ ::: v   :: |  0                  |  0        |
    andl    $-2, %esi                               // |  8  : :x :::     :: |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                              // |  9 ^: :: :::     :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                     // |  9 :: :: :::     :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_11:                                           // |                     |                     |           |
    movl    %edi, 4(%rbx,%rax,4)                    // | 10 vv ::v:::     :: |  0                  |  0        |
    movl    %ebp, 8(%rbx,%rax,4)                    // |  9 vv :: v::     :: |  0                  |  0        |
.LBB0_12:                                           // |                     |                     |           |
    movq    %rdx, %rax                              // |  9 ^: v: :::     :: |  0                  |  0        |
    cmpq    %rdx, %rsi                              // |  9 :: vv :::     :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                    // |  7 ::    :::     :: |  0                  |  1  v     |
.LBB0_6:                                            // |                     |                     |           |
    movl    4(%rbx,%rax,4), %edx                    // |  8 vv ^  :::     :: |  0                  |  0        |
    cmpl    %edx, %ebp                              // |  8 :: v  v::     :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_7                                     // |  8 :: :  :::     :: |  0                  |  3  vvv   |
    movl    %edx, (%rbx,%rax,4)                     // |  8 vv v  :::     :: |  0                  |  0        |
    movl    %ebp, 4(%rbx,%rax,4)                    // |  8 vv :  v::     :: |  0                  |  0        |
    jmp .LBB0_9                                     // |  7 :: :   ::     :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_7:                                            // |                     |                     |           |
    movl    %edx, %ebp                              // |  8 :: v  ^::     :: |  0                  |  0        |
.LBB0_9:                                            // |                     |                     |           |
    leaq    2(%rax), %rdx                           // |  8 v: ^  :::     :: |  0                  |  0        |
    movl    8(%rbx,%rax,4), %edi                    // |  8 vv   ^:::     :: |  0                  |  0        |
    cmpl    %edi, %ebp                              // |  7  :   vv::     :: |  0                  |  6 ^^^^^^ |
    jg  .LBB0_11                                    // |  6  :   : ::     :: |  0                  |  3  vvv   |
    movl    %edi, %ebp                              // |  7  :   v^::     :: |  0                  |  0        |
    jmp .LBB0_12                                    // |  5  :     ::     :: |  0                  |  0        |
.LBB0_17:                                           // |                     |                     |           |
    movl    $0, (%rcx)                              // |  6  :v    ::     :: |  0                  |  0        |
    movl    %r8d, %r12d                             // |  6  :     :v   ^ :: |  0                  |  0        |
    testl   %r15d, %r15d                            // |  6  :     ::   : :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_18                                    // |  6  :     ::   : :: |  0                  |  3  vvv   |
    leaq    1(%r12), %rdx                           // |  7  : ^   ::   v :: |  0                  |  0        |
    testl   %r8d, %r8d                              // |  7  : :   :v   : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_20                                    // |  6  : :   :    : :: |  0                  |  1  v     |
    movq    %rdx, %rsi                              // |  7  : v^  :    : :: |  0                  |  0        |
    andq    $-2, %rsi                               // |  7  : :x  :    : :: |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                              // |  8  : :: ^:    : :: |  0                  |  5 ^^^^^  |
    movq    %r12, %rax                              // |  9 ^: :: ::    v :: |  0                  |  0        |
    jmp .LBB0_22                                    // |  9 :: :: ::    : :: |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_26:                                           // |                     |                     |           |
    addq    $-2, %rax                               // |  9 x: :: ::    : :: |  0                  |  6 ^^^^^^ |
    addq    $-2, %rsi                               // |  9 :: :x ::    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_27                                    // |  8 :: :  ::    : :: |  0                  |  1  v     |
.LBB0_22:                                           // |                     |                     |           |
    movl    (%rbx,%rax,4), %edi                     // |  9 vv : ^::    : :: |  0                  |  0        |
    decl    %edi                                    // |  9 :: : x::    : :: |  0                  |  5  ^^^^^ |
    cmpl    $8, %edi                                // |  9 :: : v::    : :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_24                                    // |  8 :: :  ::    : :: |  0                  |  2 vv     |
    incl    %ebp                                    // |  8 :: :  x:    : :: |  0                  |  5  ^^^^^ |
    movl    %ebp, (%rcx)                            // |  9 ::v:  v:    : :: |  0                  |  0        |
.LBB0_24:                                           // |                     |                     |           |
    movl    -4(%rbx,%rax,4), %edi                   // |  9 vv : ^::    : :: |  0                  |  0        |
    decl    %edi                                    // |  8  : : x::    : :: |  0                  |  5  ^^^^^ |
    cmpl    $8, %edi                                // |  8  : : v::    : :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_26                                    // |  7  : :  ::    : :: |  0                  |  2 vv     |
    incl    %ebp                                    // |  7  : :  x:    : :: |  0                  |  5  ^^^^^ |
    movl    %ebp, (%rcx)                            // |  8  :v:  v:    : :: |  0                  |  0        |
    jmp .LBB0_26                                    // |  6  : :   :    : :: |  0                  |  0        |
.LBB0_18:                                           // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  7  : :  ^:    : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_30                                    // |  6  : :   :    : :: |  0                  |  0        |
.LBB0_20:                                           // |                     |                     |           |
    xorl    %ebp, %ebp                              // |  7  : :  ^:    : :: |  0                  |  5 ^^^^^  |
    movq    %r12, %rax                              // |  8 ^: :  ::    v :: |  0                  |  0        |
.LBB0_27:                                           // |                     |                     |           |
    testb   $1, %dl                                 // |  7  : v  ::    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_30                                    // |  6  :    ::    : :: |  0                  |  1  v     |
    movl    (%rbx,%rax,4), %eax                     // |  7 ^v    ::    : :: |  0                  |  0        |
    decl    %eax                                    // |  7 x:    ::    : :: |  0                  |  5  ^^^^^ |
    cmpl    $8, %eax                                // |  7 v:    ::    : :: |  0                  |  6 ^^^^^^ |
    ja  .LBB0_30                                    // |  7 ::    ::    : :: |  0                  |  2 vv     |
    incl    %ebp                                    // |  7 ::    x:    : :: |  0                  |  5  ^^^^^ |
    movl    %ebp, (%rcx)                            // |  8 ::v   v:    : :: |  0                  |  0        |
.LBB0_30:                                           // |                     |                     |           |
    movslq  %ebp, %rdi                              // |  8 ::   ^v:    : :: |  0                  |  0        |
    shlq    $3, %rdi                                // |  8 ::   x::    : :: |  0                  |  5 ^^^^^  |
    callq   malloc@PLT                              // |  7 ::    :x    : :: |  0                  |  0        |
    movq    %rax, (%r14)                            // |  7 v:    ::    : v: |  0                  |  0        |
    testl   %r15d, %r15d                            // |  6  :    ::    : :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_37                                    // |  5  :    ::    : :  |  0                  |  3  vvv   |
    testl   %ebp, %ebp                              // |  5  :    v:    : :  |  0                  |  6 ^^^^^^ |
    jle .LBB0_37                                    // |  5  :    ::    : :  |  0                  |  3  vvv   |
    xorl    %eax, %eax                              // |  6 ^:    ::    : :  |  0                  |  5 ^^^^^  |
    leaq    .Lreltable.func0(%rip), %rcx            // |  7 ::^   ::    : :  |  0                  |  0        |
    .p2align    4, 0x90                             // |                     |                     |           |
.LBB0_33:                                           // |                     |                     |           |
    movl    (%rbx,%r12,4), %edx                     // |  8 :v:^  ::    v :  |  0                  |  0        |
    leal    -1(%rdx), %esi                          // |  8 : :v^ ::    : :  |  0                  |  0        |
    cmpl    $8, %esi                                // |  7 : : v ::    : :  |  0                  |  6 ^^^^^^ |
    ja  .LBB0_35                                    // |  6 : :   ::    : :  |  0                  |  2 vv     |
    movslq  (%rcx,%rdx,4), %rdx                     // |  7 : v^  ::    : :  |  0                  |  0        |
    addq    %rcx, %rdx                              // |  7 : vx  ::    : :  |  0                  |  6 ^^^^^^ |
    movq    (%r14), %rsi                            // |  7 :  :^ ::    : v  |  0                  |  0        |
    movslq  %eax, %rdi                              // |  7 v  ::^::    :    |  0                  |  0        |
    incl    %eax                                    // |  7 x  :::::    :    |  0                  |  5  ^^^^^ |
    movq    %rdx, (%rsi,%rdi,8)                     // |  7 :  vvv::    :    |  0                  |  0        |
.LBB0_35:                                           // |                     |                     |           |
    testq   %r12, %r12                              // |  4 :     ::    v    |  0                  |  6 ^^^^^^ |
    jle .LBB0_37                                    // |  4 :     ::    :    |  0                  |  3  vvv   |
    decq    %r12                                    // |  4 :     ::    x    |  0                  |  5  ^^^^^ |
    cmpl    %ebp, %eax                              // |  3 v     v:         |  0                  |  6 ^^^^^^ |
    jl  .LBB0_33                                    // |  1        :         |  0                  |  2   vv   |
.LBB0_37:                                           // |                     |                     |           |
    popq    %rbx                                    // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                          // |                     |                     |           |
    popq    %r12                                    // |  2        x    ^    |  0                  |  0        |
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
    .type   .L.str,@object                          // |                     |                     |           |
    .section    .rodata.str1.1,"aMS",@progbits,1    // |                     |                     |           |
.L.str:                                             // |                     |                     |           |
    .zero   1                                       // |                     |                     |           |
    .size   .L.str, 1                               // |                     |                     |           |
    .type   .L.str.1,@object                        // |                     |                     |           |
.L.str.1:                                           // |                     |                     |           |
    .asciz  "One"                                   // |                     |                     |           |
    .size   .L.str.1, 4                             // |                     |                     |           |
    .type   .L.str.2,@object                        // |                     |                     |           |
.L.str.2:                                           // |                     |                     |           |
    .asciz  "Two"                                   // |                     |                     |           |
    .size   .L.str.2, 4                             // |                     |                     |           |
    .type   .L.str.3,@object                        // |                     |                     |           |
.L.str.3:                                           // |                     |                     |           |
    .asciz  "Three"                                 // |                     |                     |           |
    .size   .L.str.3, 6                             // |                     |                     |           |
    .type   .L.str.4,@object                        // |                     |                     |           |
.L.str.4:                                           // |                     |                     |           |
    .asciz  "Four"                                  // |                     |                     |           |
    .size   .L.str.4, 5                             // |                     |                     |           |
    .type   .L.str.5,@object                        // |                     |                     |           |
.L.str.5:                                           // |                     |                     |           |
    .asciz  "Five"                                  // |                     |                     |           |
    .size   .L.str.5, 5                             // |                     |                     |           |
    .type   .L.str.6,@object                        // |                     |                     |           |
.L.str.6:                                           // |                     |                     |           |
    .asciz  "Six"                                   // |                     |                     |           |
    .size   .L.str.6, 4                             // |                     |                     |           |
    .type   .L.str.7,@object                        // |                     |                     |           |
.L.str.7:                                           // |                     |                     |           |
    .asciz  "Seven"                                 // |                     |                     |           |
    .size   .L.str.7, 6                             // |                     |                     |           |
    .type   .L.str.8,@object                        // |                     |                     |           |
.L.str.8:                                           // |                     |                     |           |
    .asciz  "Eight"                                 // |                     |                     |           |
    .size   .L.str.8, 6                             // |                     |                     |           |
    .type   .L.str.9,@object                        // |                     |                     |           |
.L.str.9:                                           // |                     |                     |           |
    .asciz  "Nine"                                  // |                     |                     |           |
    .size   .L.str.9, 5                             // |                     |                     |           |
    .type   .Lreltable.func0,@object                // |                     |                     |           |
    .section    .rodata,"a",@progbits               // |                     |                     |           |
    .p2align    2                                   // |                     |                     |           |
.Lreltable.func0:                                   // |                     |                     |           |
    .long   .L.str-.Lreltable.func0                 // |                     |                     |           |
    .long   .L.str.1-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.2-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.3-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.4-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.5-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.6-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.7-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.8-.Lreltable.func0               // |                     |                     |           |
    .long   .L.str.9-.Lreltable.func0               // |                     |                     |           |
    .size   .Lreltable.func0, 40                    // |                     |                     |           |
    .ident  "clang version 15.0.4"                  // |                     |                     |           |
    .section    ".note.GNU-stack","",@progbits      // |                     |                     |           |
    .addrsig                                        // |                     |                     |           |
                                                    // +.....................+.....................+...........+
                                                    // Legend:
                                                    //     ^       : Register assignment (write)
                                                    //     v       : Register usage (read)
                                                    //     x       : Register usage and reassignment (R/W)
                                                    //     :       : Register in use (live)
                                                    //     <space> : Register not in use
                                                    //     #       : Number of occupied registers
