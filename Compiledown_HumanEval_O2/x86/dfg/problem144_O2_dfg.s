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
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    movq    %rdi, %r12                            // |  4      v :    ^ :  |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  4  ^     :    : :  |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  5  :    ^:    : :  |  0                  |  5 ^^^^^  |
    xorl    %r15d, %r15d                          // |  6  :    ::    : :^ |  0                  |  5 ^^^^^  |
    jmp .LBB0_1                                   // |  5  :    ::    : :  |  0                  |  0        |
.LBB0_11:                                         // |                     |                     |           |
    movslq  %r15d, %r15                           // |  6  :    ::    : :^ |  0                  |  0        |
    leaq    (%r14,%r15), %rdi                     // |  7  :   ^::    : vv |  0                  |  0        |
    movslq  %ebp, %rdx                            // |  7  : ^  v:    : :: |  0                  |  0        |
    subq    %rdx, %rsi                            // |  8  : vx ::    : :: |  0                  |  6 ^^^^^^ |
    callq   memcpy@PLT                            // |  7  : :  :x    : :: |  0                  |  0        |
    addl    %ebp, %r15d                           // |  7  : :  v:    : :x |  0                  |  6 ^^^^^^ |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_12:                                         // |                     |                     |           |
    incq    %rbx                                  // |  6  x :   :    : :: |  0                  |  5  ^^^^^ |
    movl    %r13d, %ebp                           // |  8  : :  ^:    :v:: |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    leaq    (%r12,%rbx), %rsi                     // |  8  v :^ ::    v :: |  0                  |  0        |
    movzbl  (%r12,%rbx), %eax                     // |  9 ^v :: ::    v :: |  0                  |  0        |
    cmpl    $32, %eax                             // |  7 v  :: ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  7 :  :: ::      :: |  0                  |  1  v     |
    testl   %eax, %eax                            // |  7 v  :: ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  6    :: ::      :: |  0                  |  1  v     |
    incl    %ebp                                  // |  6    :: x:      :: |  0                  |  5  ^^^^^ |
    movl    %ebp, %r13d                           // |  7    :: v:     ^:: |  0                  |  0        |
    jmp .LBB0_12                                  // |  6    :: ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_4:                                          // |                     |                     |           |
    xorl    %r13d, %r13d                          // |  7    :: ::     ^:: |  0                  |  5 ^^^^^  |
    cmpl    $2, %ebp                              // |  6    :: v:      :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_12                                  // |  6    :: ::      :: |  0                  |  2   vv   |
    cmpl    $4, %ebp                              // |  6    :: v:      :: |  0                  |  6 ^^^^^^ |
    jb  .LBB0_9                                   // |  6    :: ::      :: |  0                  |  1 v      |
    movl    $2, %ecx                              // |  7   ^:: ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    movl    %ebp, %eax                            // |  8 ^ ::: v:      :: |  0                  |  0        |
    cltd                                          // |  8 : ::: ::      :: |  0                  |  0        |
    idivl   %ecx                                  // |  8 x xx: ::      :: |  0                  |  0        |
    testl   %edx, %edx                            // |  7   :v: ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_12                                  // |  7   ::: ::      :: |  0                  |  1  v     |
    incl    %ecx                                  // |  7   x:: ::      :: |  0                  |  5  ^^^^^ |
    movl    %ecx, %eax                            // |  8 ^ v:: ::      :: |  0                  |  0        |
    imull   %ecx, %eax                            // |  8 ^ vx: ::      :: |  0                  |  2 ^  ^   |
    cmpl    %ebp, %eax                            // |  7 v  :: v:      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_8                                   // |  6    :: ::      :: |  0                  |  3  vvv   |
.LBB0_9:                                          // |                     |                     |           |
    testl   %r15d, %r15d                          // |  6    :: ::      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_11                                  // |  6    :: ::      :: |  0                  |  3  vvv   |
    movl    %r15d, %eax                           // |  7 ^  :: ::      :v |  0                  |  0        |
    incl    %r15d                                 // |  7 :  :: ::      :x |  0                  |  5  ^^^^^ |
    movb    $32, (%r14,%rax)                      // |  7 v  :: ::      v: |  0                  |  0        |
    jmp .LBB0_11                                  // |  6    :: ::      :: |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    cmpl    $2, %ebp                              // |  6    :: v:      :: |  0                  |  6 ^^^^^^ |
    jl  .LBB0_21                                  // |  6    :: ::      :: |  0                  |  2   vv   |
    cmpl    $4, %ebp                              // |  6    :: v:      :: |  0                  |  6 ^^^^^^ |
    jb  .LBB0_18                                  // |  6    :: ::      :: |  0                  |  1 v      |
    movl    $2, %ecx                              // |  7   ^:: ::      :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_17:                                         // |                     |                     |           |
    movl    %ebp, %eax                            // |  8 ^ ::: v:      :: |  0                  |  0        |
    cltd                                          // |  8 : ::: ::      :: |  0                  |  0        |
    idivl   %ecx                                  // |  8 x xx: ::      :: |  0                  |  0        |
    testl   %edx, %edx                            // |  7   :v: ::      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_21                                  // |  7   ::: ::      :: |  0                  |  1  v     |
    incl    %ecx                                  // |  7   x:: ::      :: |  0                  |  5  ^^^^^ |
    movl    %ecx, %eax                            // |  8 ^ v:: ::      :: |  0                  |  0        |
    imull   %ecx, %eax                            // |  8 ^ vx: ::      :: |  0                  |  2 ^  ^   |
    cmpl    %ebp, %eax                            // |  6 v   : v:      :: |  0                  |  6 ^^^^^^ |
    jle .LBB0_17                                  // |  5     : ::      :: |  0                  |  3  vvv   |
.LBB0_18:                                         // |                     |                     |           |
    testl   %r15d, %r15d                          // |  5     : ::      :v |  0                  |  6 ^^^^^^ |
    jle .LBB0_20                                  // |  5     : ::      :: |  0                  |  3  vvv   |
    movl    %r15d, %eax                           // |  6 ^   : ::      :v |  0                  |  0        |
    incl    %r15d                                 // |  6 :   : ::      :x |  0                  |  5  ^^^^^ |
    movb    $32, (%r14,%rax)                      // |  5 v   : ::      v  |  0                  |  0        |
.LBB0_20:                                         // |                     |                     |           |
    movslq  %r15d, %r15                           // |  5     : ::      :^ |  0                  |  0        |
    leaq    (%r14,%r15), %rdi                     // |  6     :^::      vv |  0                  |  0        |
    movslq  %ebp, %rdx                            // |  6    ^: v:      :: |  0                  |  0        |
    subq    %rdx, %rsi                            // |  6    vx ::      :: |  0                  |  6 ^^^^^^ |
    callq   memcpy@PLT                            // |  4       :x      :: |  0                  |  0        |
    addl    %ebp, %r15d                           // |  4       v:      :x |  0                  |  6 ^^^^^^ |
.LBB0_21:                                         // |                     |                     |           |
    movslq  %r15d, %rax                           // |  4 ^      :      :v |  0                  |  0        |
    movb    $0, (%r14,%rax)                       // |  3 v      :      v  |  0                  |  0        |
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
