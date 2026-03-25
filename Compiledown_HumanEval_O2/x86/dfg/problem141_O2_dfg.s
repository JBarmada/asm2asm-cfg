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
    pushq   %r12                                  // |  2        x    v    |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 48                        // |                     |                     |           |
    .cfi_offset %rbx, -48                         // |                     |                     |           |
    .cfi_offset %r12, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movq    %rsi, %r14                            // |  3     v  :      ^  |  0                  |  0        |
    cmpb    $0, (%rdi)                            // |  3      v :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_1                                   // |  2        :      :  |  0                  |  1  v     |
    movq    %rdi, %r12                            // |  4      v :    ^ :  |  0                  |  0        |
    xorl    %ebx, %ebx                            // |  4  ^     :    : :  |  0                  |  5 ^^^^^  |
    xorl    %r15d, %r15d                          // |  5  :     :    : :^ |  0                  |  5 ^^^^^  |
    xorl    %ebp, %ebp                            // |  6  :    ^:    : :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                   // |  6  :    ::    : :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_7:                                          // |                     |                     |           |
    incl    %ebp                                  // |  6  :    x:    : :: |  0                  |  5  ^^^^^ |
.LBB0_16:                                         // |                     |                     |           |
    incq    %rbx                                  // |  6  x    ::    : :: |  0                  |  5  ^^^^^ |
    movq    %r12, %rdi                            // |  7  :   ^::    v :: |  0                  |  0        |
    callq   strlen@PLT                            // |  6  :    :x    : :: |  0                  |  0        |
    cmpq    %rbx, %rax                            // |  7 vv    ::    : :: |  0                  |  6 ^^^^^^ |
    jbe .LBB0_2                                   // |  6  :    ::    : :: |  0                  |  2 vv     |
.LBB0_6:                                          // |                     |                     |           |
    cmpb    $32, (%r12,%rbx)                      // |  6  v    ::    v :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_7                                   // |  6  :    ::    : :: |  0                  |  1  v     |
    movb    $95, %al                              // |  7 ^:    ::    : :: |  0                  |  0        |
    cmpl    $1, %ebp                              // |  6  :    v:    : :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_13                                  // |  6  :    ::    : :: |  0                  |  1  v     |
    cmpl    $2, %ebp                              // |  6  :    v:    : :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_11                                  // |  5  :     :    : :: |  0                  |  3  v::   |
    leal    1(%r15), %ecx                         // |  6  :^    :    : :v |  0                  |  3  :::   |
    movslq  %r15d, %rdx                           // |  6  : ^   :    : :v |  0                  |  3  :::   |
    movb    $95, (%r14,%rdx)                      // |  6  : v   :    : v: |  0                  |  3  :::   |
    movl    $2, %ebp                              // |  6  :    ^:    : :: |  0                  |  3  :::   |
    jmp .LBB0_14                                  // |  5  :     :    : :: |  0                  |  3  :::   |
.LBB0_11:                                         // |                     |                     |           |
    jle .LBB0_15                                  // |  5  :     :    : :: |  0                  |  3  vvv   |
    movb    $45, %al                              // |  6 ^:     :    : :: |  0                  |  0        |
    movl    $1, %ebp                              // |  7 ::    ^:    : :: |  0                  |  0        |
.LBB0_13:                                         // |                     |                     |           |
    movl    %r15d, %ecx                           // |  8 ::^   ::    : :v |  0                  |  0        |
.LBB0_14:                                         // |                     |                     |           |
    addl    %ebp, %r15d                           // |  7 ::    v:    : :x |  0                  |  6 ^^^^^^ |
    movslq  %ecx, %rcx                            // |  7 ::^    :    : :: |  0                  |  0        |
    movb    %al, (%r14,%rcx)                      // |  7 v:v    :    : v: |  0                  |  0        |
.LBB0_15:                                         // |                     |                     |           |
    movzbl  (%r12,%rbx), %eax                     // |  6 ^v     :    v :: |  0                  |  0        |
    movslq  %r15d, %rcx                           // |  5 : ^    :      :v |  0                  |  0        |
    incl    %r15d                                 // |  5 : :    :      :x |  0                  |  5  ^^^^^ |
    movb    %al, (%r14,%rcx)                      // |  5 v v    :      v: |  0                  |  0        |
    xorl    %ebp, %ebp                            // |  4       ^:      :: |  0                  |  5 ^^^^^  |
    jmp .LBB0_16                                  // |  4       ::      :: |  0                  |  0        |
.LBB0_2:                                          // |                     |                     |           |
    movb    $95, %al                              // |  5 ^     ::      :: |  0                  |  0        |
    cmpl    $1, %ebp                              // |  4       v:      :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_19                                  // |  4       ::      :: |  0                  |  1  v     |
    cmpl    $2, %ebp                              // |  4       v:      :: |  0                  |  6 ^^^^^^ |
    jne .LBB0_17                                  // |  3        :      :: |  0                  |  1  v     |
    leal    1(%r15), %ecx                         // |  4   ^    :      :v |  0                  |  0        |
    movslq  %r15d, %rdx                           // |  4    ^   :      :v |  0                  |  0        |
    movb    $95, (%r14,%rdx)                      // |  3    v   :      v  |  0                  |  0        |
    movl    $2, %ebp                              // |  3       ^:      :  |  0                  |  0        |
    jmp .LBB0_20                                  // |  2        :      :  |  0                  |  0        |
.LBB0_1:                                          // |                     |                     |           |
    xorl    %r15d, %r15d                          // |  3        :      :^ |  0                  |  5 ^^^^^  |
    jmp .LBB0_21                                  // |  3        :      :: |  0                  |  3  :::   |
.LBB0_17:                                         // |                     |                     |           |
    jle .LBB0_21                                  // |  3        :      :: |  0                  |  3  vvv   |
    movb    $45, %al                              // |  4 ^      :      :: |  0                  |  0        |
    movl    $1, %ebp                              // |  5 :     ^:      :: |  0                  |  0        |
.LBB0_19:                                         // |                     |                     |           |
    movl    %r15d, %ecx                           // |  6 : ^   ::      :v |  0                  |  0        |
.LBB0_20:                                         // |                     |                     |           |
    addl    %ebp, %r15d                           // |  5 :     v:      :x |  0                  |  6 ^^^^^^ |
    movslq  %ecx, %rcx                            // |  5 : ^    :      :: |  0                  |  0        |
    movb    %al, (%r14,%rcx)                      // |  5 v v    :      v: |  0                  |  0        |
.LBB0_21:                                         // |                     |                     |           |
    movslq  %r15d, %rax                           // |  4 ^      :      :v |  0                  |  0        |
    movb    $0, (%r14,%rax)                       // |  3 v      :      v  |  0                  |  0        |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    popq    %r12                                  // |  2        x    ^    |  0                  |  0        |
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
