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
    pushq   %rbx                                  // |  2  v     x         |  0                  |  0        |
    .cfi_def_cfa_offset 40                        // |                     |                     |           |
    .cfi_offset %rbx, -40                         // |                     |                     |           |
    .cfi_offset %r14, -32                         // |                     |                     |           |
    .cfi_offset %r15, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    leal    -1(%rsi), %r10d                       // |  3     v  :  ^      |  0                  |  0        |
    cmpl    $2, %esi                              // |  3     v  :  :      |  0                  |  6 ^^^^^^ |
    jl  .LBB0_4                                   // |  2        :  :      |  0                  |  2   vv   |
    movl    %esi, %r9d                            // |  4     v  : ^:      |  0                  |  0        |
    movl    %r10d, %r8d                           // |  4        :^:v      |  0                  |  0        |
    xorl    %r11d, %r11d                          // |  5        ::::^     |  0                  |  5 ^^^^^  |
    movq    %r9, %r14                             // |  6        ::v::  ^  |  0                  |  0        |
    movq    %rdi, %r15                            // |  8      v :::::  :^ |  0                  |  0        |
    jmp .LBB0_2                                   // |  7        :::::  :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_3:                                          // |                     |                     |           |
    addq    $4, %r15                              // |  7        :::::  :x |  0                  |  6 ^^^^^^ |
    decq    %r14                                  // |  7        :::::  x: |  0                  |  5  ^^^^^ |
    cmpq    %r8, %r11                             // |  7        :v::v  :: |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  7        :::::  :: |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movq    %r11, %rbx                            // |  8  ^     ::::v  :: |  0                  |  0        |
    incq    %r11                                  // |  8  :     ::::x  :: |  0                  |  5  ^^^^^ |
    cmpq    %r9, %r11                             // |  8  :     ::v:v  :: |  0                  |  6 ^^^^^^ |
    jae .LBB0_3                                   // |  6  :     :: :   :: |  0                  |  1 v      |
    movl    $1, %ecx                              // |  7  :^    :: :   :: |  0                  |  0        |
    jmp .LBB0_11                                  // |  7  ::    :: :   :: |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_13:                                         // |                     |                     |           |
    incq    %rcx                                  // |  7  :x    :: :   :: |  0                  |  5  ^^^^^ |
    cmpq    %rcx, %r14                            // |  7  :v    :: :   v: |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  6  ::    :: :    : |  0                  |  1  v     |
.LBB0_11:                                         // |                     |                     |           |
    movl    (%rdi,%rbx,4), %ebp                   // |  8  v:  v^:: :    : |  0                  |  0        |
    movl    (%r15,%rcx,4), %eax                   // |  8 ^:v   ::: :    v |  0                  |  0        |
    cmpl    %eax, %ebp                            // |  8 v::   v:: :    : |  0                  |  6 ^^^^^^ |
    jle .LBB0_13                                  // |  8 :::   ::: :    : |  0                  |  3  vvv   |
    movl    %eax, (%rdi,%rbx,4)                   // |  9 vv:  v::: :    : |  0                  |  0        |
    movl    %ebp, (%r15,%rcx,4)                   // |  6   v   v:: :    v |  0                  |  0        |
    jmp .LBB0_13                                  // |  3        :: :      |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    testl   %esi, %esi                            // |  4     v  :: :      |  0                  |  6 ^^^^^^ |
    jle .LBB0_9                                   // |  3        :: :      |  0                  |  3  vvv   |
    xorl    %ecx, %ecx                            // |  4   ^    :: :      |  0                  |  5 ^^^^^  |
    xorl    %eax, %eax                            // |  5 ^ :    :: :      |  0                  |  5 ^^^^^  |
    jmp .LBB0_6                                   // |  4   :    :: :      |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    leaq    1(%rcx), %rsi                         // |  5   v ^  :: :      |  0                  |  0        |
    movslq  %r10d, %rbp                           // |  6   : : ^:: v      |  0                  |  0        |
    movl    %r8d, %eax                            // |  7 ^ : : ::v :      |  0                  |  0        |
    cmpq    %rbp, %rcx                            // |  6 : v : v:  :      |  0                  |  6 ^^^^^^ |
    movq    %rsi, %rcx                            // |  5 : ^ v  :  :      |  0                  |  2   ::   |
    jge .LBB0_9                                   // |  4 : :    :  :      |  0                  |  2   vv   |
.LBB0_6:                                          // |                     |                     |           |
    movl    %r10d, %ebp                           // |  5 : :   ^:  v      |  0                  |  0        |
    leal    1(%rax), %r8d                         // |  6 v :   ::^ :      |  0                  |  0        |
    movl    (%rdi,%rcx,4), %ebx                   // |  8 :^v  v::: :      |  0                  |  0        |
    movslq  %eax, %rsi                            // |  8 v:: ^ ::: :      |  0                  |  0        |
    movl    %ebx, (%rdx,%rsi,4)                   // |  9 :v:vv ::: :      |  0                  |  0        |
    cmpq    %rbp, %rcx                            // |  6 : v   v:: :      |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  4 :      :: :      |  0                  |  1  v     |
    movslq  %r10d, %rsi                           // |  5 :   ^  :: v      |  0                  |  0        |
    decl    %r10d                                 // |  4 :      :: x      |  0                  |  5  ^^^^^ |
    movl    (%rdi,%rsi,4), %esi                   // |  5 :   ^v ::        |  0                  |  0        |
    addl    $2, %eax                              // |  4 x   :  ::        |  0                  |  6 ^^^^^^ |
    movslq  %r8d, %rbp                            // |  5 :   : ^:v        |  0                  |  0        |
    movl    %esi, (%rdx,%rbp,4)                   // |  5 :  vv v:         |  0                  |  0        |
    movl    %eax, %r8d                            // |  3 v      :^        |  0                  |  0        |
    jmp .LBB0_8                                   // |  1        :         |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
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
