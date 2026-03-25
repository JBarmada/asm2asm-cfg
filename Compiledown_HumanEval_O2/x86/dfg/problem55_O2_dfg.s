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
    pushq   %r15                                  // |  2        x       v |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    pushq   %r14                                  // |  2        x      v  |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %r15, -16                         // |                     |                     |           |
    movq    %rsi, %rbx                            // |  3  ^  v  :         |  0                  |  0        |
    movq    %rdi, %r14                            // |  4  :   v :      ^  |  0                  |  0        |
    callq   strlen@PLT                            // |  3  :     x      :  |  0                  |  0        |
    movq    %rax, %r15                            // |  5 v:     :      :^ |  0                  |  0        |
    movq    %rbx, %rdi                            // |  5  v   ^ :      :: |  0                  |  0        |
    callq   strlen@PLT                            // |  4  :     x      :: |  0                  |  0        |
    testl   %r15d, %r15d                          // |  4  :     :      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  4  :     :      :: |  0                  |  3  vvv   |
    movslq  %r15d, %r9                            // |  5  :     : ^    :v |  0                  |  0        |
    movl    %r9d, %r8d                            // |  6  :     :^v    :: |  0                  |  0        |
    movl    %eax, %esi                            // |  8 v:  ^  :::    :: |  0                  |  0        |
    movb    $1, %r10b                             // |  8  :  :  :::^   :: |  0                  |  0        |
    xorl    %edi, %edi                            // |  9  :  :^ ::::   :: |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    testl   %eax, %eax                            // | 10 v:  :: ::::   :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_19                                  // |  9  :  :: ::::   :: |  0                  |  3  vvv   |
    movzbl  (%r14,%rdi), %ecx                     // | 10  :^ :v ::::   v: |  0                  |  0        |
    xorl    %edx, %edx                            // | 11  ::^:: ::::   :: |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    cmpb    (%rbx,%rdx), %cl                      // | 11  vvv:: ::::   :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // | 10  : ::: ::::   :: |  0                  |  1  v     |
    incq    %rdx                                  // | 10  : x:: ::::   :: |  0                  |  5  ^^^^^ |
    cmpq    %rdx, %rsi                            // | 10  : vv: ::::   :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_4                                   // |  8  :   : ::::   :: |  0                  |  1  v     |
    jmp .LBB0_7                                   // |  8  :   : ::::   :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    incq    %rdi                                  // |  8  :   x ::::   :: |  0                  |  5  ^^^^^ |
    cmpq    %r9, %rdi                             // |  8  :   v ::v:   :: |  0                  |  6 ^^^^^^ |
    setl    %r10b                                 // |  7  :   : :: x   :: |  0                  |  2   vv   |
    cmpq    %r8, %rdi                             // |  7  :   v :v :   :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_2                                   // |  5  :     :  :   :: |  0                  |  1  v     |
    jmp .LBB0_9                                   // |  5  :     :  :   :: |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    testb   $1, %r10b                             // |  5  :     :  v   :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  4  :     :      :: |  0                  |  1  v     |
.LBB0_19:                                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  5 ^:     :      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_18                                  // |  5 ::     :      :: |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    testl   %eax, %eax                            // |  5 v:     :      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_16                                  // |  5 ::     :      :: |  0                  |  3  vvv   |
    movslq  %eax, %r9                             // |  6 v:     : ^    :: |  0                  |  0        |
    movl    %r9d, %r8d                            // |  6  :     :^v    :: |  0                  |  0        |
    movl    %r15d, %esi                           // |  7  :  ^  :::    :v |  0                  |  0        |
    xorl    %edi, %edi                            // |  8  :  :^ :::    :: |  0                  |  5 ^^^^^  |
    movb    $1, %al                               // |  9 ^:  :: :::    :: |  0                  |  0        |
.LBB0_11:                                         // |                     |                     |           |
    testl   %r15d, %r15d                          // |  9 ::  :: :::    :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_20                                  // |  8 ::  :: :::    :  |  0                  |  3  vvv   |
    movzbl  (%rbx,%rdi), %edx                     // |  9 :v ^:v :::    :  |  0                  |  0        |
    xorl    %ecx, %ecx                            // |  9 : ^::: :::    :  |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    cmpb    (%r14,%rcx), %dl                      // |  9 : vv:: :::    v  |  0                  |  6 ^^^^^^ |
    je  .LBB0_15                                  // |  7 : : :: :::       |  0                  |  1  v     |
    incq    %rcx                                  // |  7 : x :: :::       |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %rsi                            // |  7 : v v: :::       |  0                  |  6 ^^^^^^ |
    jne .LBB0_13                                  // |  5 :    : :::       |  0                  |  1  v     |
    jmp .LBB0_17                                  // |  5 :    : :::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_15:                                         // |                     |                     |           |
    incq    %rdi                                  // |  5 :    x :::       |  0                  |  5  ^^^^^ |
    cmpq    %r9, %rdi                             // |  5 :    v ::v       |  0                  |  6 ^^^^^^ |
    setl    %al                                   // |  4 x    : ::        |  0                  |  2   vv   |
    cmpq    %r8, %rdi                             // |  3      v :v        |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  1        :         |  0                  |  1  v     |
    jmp .LBB0_17                                  // |  1        :         |  0                  |  0        |
.LBB0_16:                                         // |                     |                     |           |
    xorl    %eax, %eax                            // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_17:                                         // |                     |                     |           |
    xorb    $1, %al                               // |  2 ^      :         |  0                  |  5 ^^^^^  |
.LBB0_18:                                         // |                     |                     |           |
    andb    $1, %al                               // |  2 x      :         |  0                  |  5 ^^^^^  |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %r15                                  // |  2        x       ^ |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  1        x         |  0                  |  0        |
.LBB0_20:                                         // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    movb    $1, %al                               // |  1 ^                |  0                  |  0        |
    jmp .LBB0_17                                  // |  0                  |  0                  |  0        |
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
