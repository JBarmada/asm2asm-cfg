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
    movq    %rdx, %r14                            // |  3    v   :      ^  |  0                  |  0        |
    movq    %rsi, %rax                            // |  4 ^   v  :      :  |  0                  |  0        |
    movl    $1, (%rdx)                            // |  4 :  v   :      :  |  0                  |  0        |
    movl    $1, (%rsi)                            // |  4 :   v  :      :  |  0                  |  0        |
    cmpl    $1, %edi                              // |  4 :    v :      :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_1                                   // |  3 :      :      :  |  0                  |  1  v     |
.LBB0_6:                                          // |                     |                     |           |
    cmpl    $2, (%r14)                            // |  3 :      :      v  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_13                                  // |  3 :      :      :  |  0                  |  2   vv   |
    movl    $1, %ecx                              // |  4 : ^    :      :  |  0                  |  0        |
    jmp .LBB0_8                                   // |  4 : :    :      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    movslq  %esi, %rsi                            // |  5 : : ^  :      :  |  0                  |  0        |
    movl    %edx, (%rax,%rsi,4)                   // |  6 v :vv  :      :  |  0                  |  0        |
    incq    %rcx                                  // |  4 : x    :      :  |  0                  |  5  ^^^^^ |
    movslq  (%r14), %rdx                          // |  5 : :^   :      v  |  0                  |  0        |
    cmpq    %rdx, %rcx                            // |  4 : vv   :         |  0                  |  6 ^^^^^^ |
    jge .LBB0_13                                  // |  3 : :    :         |  0                  |  2   vv   |
.LBB0_8:                                          // |                     |                     |           |
    movl    (%rax,%rcx,4), %edx                   // |  4 v v^   :         |  0                  |  0        |
    movq    %rcx, %rsi                            // |  5 : v:^  :         |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_9:                                          // |                     |                     |           |
    leaq    -1(%rsi), %rdi                        // |  5 :  :v^ :         |  0                  |  0        |
    movl    %edi, %ebp                            // |  6 :  ::v^:         |  0                  |  0        |
    movl    (%rax,%rbp,4), %ebp                   // |  6 v  :::^:         |  0                  |  0        |
    cmpl    %edx, %ebp                            // |  6 :  v::v:         |  0                  |  6 ^^^^^^ |
    jle .LBB0_12                                  // |  5 :   ::::         |  0                  |  3  vvv   |
    movl    %ebp, (%rax,%rsi,4)                   // |  5 v   v:v:         |  0                  |  0        |
    leaq    1(%rdi), %rbp                         // |  4 :    v^:         |  0                  |  0        |
    movq    %rdi, %rsi                            // |  5 :   ^v::         |  0                  |  0        |
    cmpq    $1, %rbp                              // |  4 :    :v:         |  0                  |  6 ^^^^^^ |
    jg  .LBB0_9                                   // |  3 :    : :         |  0                  |  3  vvv   |
    xorl    %esi, %esi                            // |  4 :   ^: :         |  0                  |  5 ^^^^^  |
    jmp .LBB0_12                                  // |  3 :    : :         |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    popq    %rbx                                  // |  4 :^   : x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  4 :    : x      ^  |  0                  |  0        |
    .cfi_def_cfa_offset 16                        // |                     |                     |           |
    popq    %rbp                                  // |  5 :    :^x      :  |  0                  |  0        |
    .cfi_def_cfa_offset 8                         // |                     |                     |           |
    retq                                          // |  4 :    : x      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    movl    %edi, %ebx                            // |  5 :^   v :      :  |  0                  |  0        |
    movl    $10, %ebp                             // |  5 ::    ^:      :  |  0                  |  0        |
    jmp .LBB0_2                                   // |  5 ::    ::      :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_14:                                         // |                     |                     |           |
    movl    %ebx, %ecx                            // |  6 :v^   ::      :  |  0                  |  0        |
    shrl    $31, %ecx                             // |  6 ::x   ::      :  |  0                  |  5 ^^^^^  |
    addl    %ebx, %ecx                            // |  6 :vx   ::      :  |  0                  |  6 ^^^^^^ |
    sarl    %ecx                                  // |  5 : x   ::      :  |  0                  |  5 ^^^^^  |
    movl    %ecx, %ebx                            // |  6 :^v   ::      :  |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    cmpl    $1, %ebx                              // |  5 :v    ::      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  5 ::    ::      :  |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movl    %ebx, %ecx                            // |  6 :v^   ::      :  |  0                  |  0        |
    andl    $-2147483647, %ecx                    // |  6 ::x   ::      :  |  0                  |  5 ^^^^^  |
    cmpl    $1, %ecx                              // |  6 ::v   ::      :  |  0                  |  6 ^^^^^^ |
    jne .LBB0_14                                  // |  5 ::    ::      :  |  0                  |  1  v     |
    movl    (%r14), %ecx                          // |  6 ::^   ::      v  |  0                  |  0        |
    cmpl    %ebp, %ecx                            // |  6 ::v   v:      :  |  0                  |  6 ^^^^^^ |
    jl  .LBB0_5                                   // |  5 ::    ::      :  |  0                  |  2   vv   |
    addl    %ebp, %ebp                            // |  5 ::    x:      :  |  0                  |  6 ^^^^^^ |
    movslq  %ebp, %rsi                            // |  6 ::  ^ v:      :  |  0                  |  0        |
    shlq    $2, %rsi                              // |  5 ::  x  :      :  |  0                  |  5 ^^^^^  |
    movq    %rax, %rdi                            // |  5 v:   ^ :      :  |  0                  |  0        |
    callq   realloc@PLT                           // |  4 ::     x      :  |  0                  |  0        |
    movl    (%r14), %ecx                          // |  4 ::^           v  |  0                  |  0        |
.LBB0_5:                                          // |                     |                     |           |
    leal    1(%rcx), %edx                         // |  5 ::v^          :  |  0                  |  0        |
    movl    %edx, (%r14)                          // |  4 :: v          v  |  0                  |  0        |
    movslq  %ecx, %rcx                            // |  3 ::^              |  0                  |  0        |
    movl    %ebx, (%rax,%rcx,4)                   // |  3 vvv              |  0                  |  0        |
    leal    (%rbx,%rbx,2), %ebx                   // |  1  ^               |  0                  |  0        |
    incl    %ebx                                  // |  1  x               |  0                  |  5  ^^^^^ |
    jmp .LBB0_15                                  // |  0                  |  0                  |  0        |
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
