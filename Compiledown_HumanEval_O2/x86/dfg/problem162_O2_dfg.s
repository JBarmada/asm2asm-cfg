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
    movq    %rdi, %r15                            // |  3      v :       ^ |  0                  |  0        |
    callq   strlen@PLT                            // |  2        x       : |  0                  |  0        |
    movq    %rax, %rbp                            // |  4 v     ^:       : |  0                  |  0        |
    testl   %ebp, %ebp                            // |  3       v:       : |  0                  |  6 ^^^^^^ |
    movq    %rax, (%rsp)                          // |  4 v     :v       : |  0                  |  3  :::   |
    jle .LBB0_1                                   // |  3       ::       : |  0                  |  3  vvv   |
    callq   __ctype_b_loc@PLT                     // |  3       :x       : |  0                  |  0        |
    movq    %rax, %rbx                            // |  5 v^    ::       : |  0                  |  0        |
    movl    %ebp, %r12d                           // |  5  :    v:    ^  : |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  5  :    ^:    :  : |  0                  |  5 ^^^^^  |
    xorl    %r13d, %r13d                          // |  6  :    ::    :^ : |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  6  :    ::    :: : |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    incl    %r13d                                 // |  6  :    ::    :x : |  0                  |  5  ^^^^^ |
.LBB0_14:                                         // |                     |                     |           |
    incq    %rbp                                  // |  5  :    x:    :  : |  0                  |  5  ^^^^^ |
    cmpq    %rbp, %r12                            // |  5  :    v:    v  : |  0                  |  6 ^^^^^^ |
    je  .LBB0_2                                   // |  4  :    ::       : |  0                  |  1  v     |
.LBB0_7:                                          // |                     |                     |           |
    movq    (%rbx), %rax                          // |  5 ^v    ::       : |  0                  |  0        |
    movzbl  (%r15,%rbp), %r14d                    // |  4       v:      ^v |  0                  |  0        |
    movzwl  (%rax,%r14,2), %eax                   // |  5 ^     ::      v: |  0                  |  0        |
    testl   $1024, %eax                           // |  5 v     ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  5 :     ::      :: |  0                  |  1  v     |
    testl   $256, %eax                            // |  5 v     ::      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_9                                   // |  5 :     ::      :: |  0                  |  1  v     |
    testl   $512, %eax                            // |  5 v     ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_14                                  // |  4       ::      :: |  0                  |  1  v     |
    callq   __ctype_toupper_loc@PLT               // |  4       :x      :: |  0                  |  0        |
    jmp .LBB0_10                                  // |  4       ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    callq   __ctype_tolower_loc@PLT               // |  4       :x      :: |  0                  |  0        |
.LBB0_10:                                         // |                     |                     |           |
    movq    (%rax), %rax                          // |  5 ^     ::      :: |  0                  |  0        |
    movzbl  (%rax,%r14,4), %eax                   // |  5 ^     ::      v: |  0                  |  0        |
    movb    %al, (%r15,%rbp)                      // |  4 v     v:       v |  0                  |  0        |
    jmp .LBB0_14                                  // |  2        :       : |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r13d, %r13d                          // |  3        :     ^ : |  0                  |  5 ^^^^^  |
.LBB0_2:                                          // |                     |                     |           |
    movq    (%rsp), %r11                          // |  4        v   ^ : : |  0                  |  0        |
    cmpl    %r11d, %r13d                          // |  4        :   v v : |  0                  |  6 ^^^^^^ |
    jne .LBB0_19                                  // |  3        :   :   : |  0                  |  1  v     |
    cmpl    $2, %r11d                             // |  3        :   v   : |  0                  |  6 ^^^^^^ |
    jl  .LBB0_19                                  // |  3        :   :   : |  0                  |  2   vv   |
    movq    %r11, %r8                             // |  4        :^  v   : |  0                  |  0        |
    shrq    %r8                                   // |  4        :x  :   : |  0                  |  5 ^^^^^  |
    movl    %r8d, %r10d                           // |  5        :v ^:   : |  0                  |  0        |
    andl    $2147483647, %r10d                    // |  5        :: x:   : |  0                  |  5 ^^^^^  |
    andl    $1, %r8d                              // |  5        :x ::   : |  0                  |  5 ^^^^^  |
    cmpq    $1, %r10                              // |  5        :: v:   : |  0                  |  6 ^^^^^^ |
    jne .LBB0_15                                  // |  5        :: ::   : |  0                  |  1  v     |
    xorl    %ecx, %ecx                            // |  6   ^    :: ::   : |  0                  |  5 ^^^^^  |
    jmp .LBB0_17                                  // |  5        :: ::   : |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    movabsq $-8589934592, %r9                     // |  6        ::^::   : |  0                  |  0        |
    subq    %r8, %r10                             // |  6        :v:x:   : |  0                  |  6 ^^^^^^ |
    movq    %r11, %rcx                            // |  7   ^    ::::v   : |  0                  |  0        |
    shlq    $32, %rcx                             // |  7   x    :::::   : |  0                  |  5 ^^^^^  |
    leaq    (%rcx,%r9), %rdi                      // |  8   v  ^ ::v::   : |  0                  |  0        |
    movabsq $-4294967296, %rsi                    // |  9   : ^: :::::   : |  0                  |  0        |
    addq    %rcx, %rsi                            // |  9   v x: :::::   : |  0                  |  6 ^^^^^^ |
    xorl    %ecx, %ecx                            // |  9   ^ :: :::::   : |  0                  |  5 ^^^^^  |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_16:                                         // |                     |                     |           |
    movzbl  (%r15,%rcx), %eax                     // | 10 ^ v :: :::::   v |  0                  |  0        |
    movq    %rsi, %rbp                            // | 11 : : v:^:::::   : |  0                  |  0        |
    sarq    $32, %rbp                             // | 11 : : ::^:::::   : |  0                  |  5 ^^^^^  |
    movzbl  (%r15,%rbp), %edx                     // | 12 : :^::v:::::   v |  0                  |  0        |
    movb    %dl, (%r15,%rcx)                      // | 12 : vv::::::::   v |  0                  |  0        |
    movb    %al, (%r15,%rbp)                      // | 11 v : ::v:::::   v |  0                  |  0        |
    movzbl  1(%r15,%rcx), %eax                    // | 10 ^ v :: :::::   v |  0                  |  0        |
    movq    %rdi, %rdx                            // | 11 : :^:v :::::   : |  0                  |  0        |
    sarq    $32, %rdx                             // | 11 : :^:: :::::   : |  0                  |  5 ^^^^^  |
    movzbl  (%r15,%rdx), %ebx                     // | 12 :^:v:: :::::   v |  0                  |  0        |
    movb    %bl, 1(%r15,%rcx)                     // | 12 :vv::: :::::   v |  0                  |  0        |
    movb    %al, (%r15,%rdx)                      // | 11 v :v:: :::::   v |  0                  |  0        |
    addq    $2, %rcx                              // |  9   x :: :::::   : |  0                  |  6 ^^^^^^ |
    addq    %r9, %rdi                             // |  9   : :x ::v::   : |  0                  |  6 ^^^^^^ |
    addq    %r9, %rsi                             // |  8   : x  ::v::   : |  0                  |  6 ^^^^^^ |
    cmpq    %rcx, %r10                            // |  6   v    :: v:   : |  0                  |  6 ^^^^^^ |
    jne .LBB0_16                                  // |  5   :    ::  :   : |  0                  |  1  v     |
.LBB0_17:                                         // |                     |                     |           |
    testq   %r8, %r8                              // |  5   :    :v  :   : |  0                  |  6 ^^^^^^ |
    je  .LBB0_19                                  // |  4   :    :   :   : |  0                  |  1  v     |
    movzbl  (%r15,%rcx), %eax                     // |  5 ^ v    :   :   v |  0                  |  0        |
    movl    %ecx, %edx                            // |  6 : v^   :   :   : |  0                  |  0        |
    notl    %edx                                  // |  6 : :x   :   :   : |  0                  |  0        |
    addl    %r11d, %edx                           // |  6 : :x   :   v   : |  0                  |  6 ^^^^^^ |
    movslq  %edx, %rdx                            // |  5 : :^   :       : |  0                  |  0        |
    movzbl  (%r15,%rdx), %ebx                     // |  6 :^:v   :       v |  0                  |  0        |
    movb    %bl, (%r15,%rcx)                      // |  6 :vv:   :       v |  0                  |  0        |
    movb    %al, (%r15,%rdx)                      // |  4 v  v   :       v |  0                  |  0        |
.LBB0_19:                                         // |                     |                     |           |
    movq    %r15, %rax                            // |  3 ^      :       v |  0                  |  0        |
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
