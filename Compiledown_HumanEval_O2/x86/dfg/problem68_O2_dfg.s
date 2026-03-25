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
    subq    $32, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 64                        // |                     |                     |           |
    .cfi_offset %rbx, -32                         // |                     |                     |           |
    .cfi_offset %r14, -24                         // |                     |                     |           |
    .cfi_offset %rbp, -16                         // |                     |                     |           |
    movl    %esi, %r14d                           // |  3     v  :      ^  |  0                  |  0        |
    movw    $0, 24(%rsp)                          // |  2        v      :  |  0                  |  0        |
    movq    $0, 16(%rsp)                          // |  2        v      :  |  0                  |  0        |
    movw    $0, 8(%rsp)                           // |  2        v      :  |  0                  |  0        |
    movq    $0, (%rsp)                            // |  2        v      :  |  0                  |  0        |
    movzbl  (%rdi), %ebx                          // |  4  ^   v :      :  |  0                  |  0        |
    testb   %bl, %bl                              // |  3  v     :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  3  :     :      :  |  0                  |  1  v     |
    movq    %rdi, %rbp                            // |  5  :   v^:      :  |  0                  |  0        |
    callq   __ctype_b_loc@PLT                     // |  4  :    :x      :  |  0                  |  0        |
    movq    (%rax), %rax                          // |  5 ^:    ::      :  |  0                  |  0        |
    incq    %rbp                                  // |  5 ::    x:      :  |  0                  |  5  ^^^^^ |
    xorl    %r8d, %r8d                            // |  6 ::    ::^     :  |  0                  |  5 ^^^^^  |
    movl    $1, %edx                              // |  7 :: ^  :::     :  |  0                  |  0        |
    xorl    %edi, %edi                            // |  8 :: : ^:::     :  |  0                  |  5 ^^^^^  |
    xorl    %esi, %esi                            // |  9 :: :^::::     :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_2                                   // |  9 :: ::::::     :  |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_6:                                          // |                     |                     |           |
    testl   %esi, %esi                            // |  9 :: :v::::     :  |  0                  |  6 ^^^^^^ |
    sete    %cl                                   // |  9 ::x: ::::     :  |  0                  |  1  v     |
    testl   %edi, %edi                            // |  9 :::: v:::     :  |  0                  |  6 ^^^^^^ |
    setg    %bl                                   // |  8 :x::  :::     :  |  0                  |  3  vvv   |
    testb   %bl, %cl                              // |  8 :vv:  :::     :  |  0                  |  6 ^^^^^^ |
    cmovnel %edx, %esi                            // |  7 :  v^ :::     :  |  0                  |  0        |
    cmovnel %r8d, %edi                            // |  7 :   :^::v     :  |  0                  |  0        |
    movl    %edi, %ecx                            // |  7 : ^ :v::      :  |  0                  |  0        |
.LBB0_7:                                          // |                     |                     |           |
    movzbl  (%rbp), %ebx                          // |  7 :^: : v:      :  |  0                  |  0        |
    incq    %rbp                                  // |  7 ::: : x:      :  |  0                  |  5  ^^^^^ |
    movl    %ecx, %edi                            // |  7 ::v :^ :      :  |  0                  |  0        |
    testb   %bl, %bl                              // |  6 :v  :: :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_8                                   // |  6 ::  :: :      :  |  0                  |  1  v     |
.LBB0_2:                                          // |                     |                     |           |
    movsbq  %bl, %rcx                             // |  7 :v^ :: :      :  |  0                  |  0        |
    testb   $8, 1(%rax,%rcx,2)                    // |  7 v:v :: :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_6                                   // |  6 ::  :: :      :  |  0                  |  1  v     |
    leal    1(%rdi), %ecx                         // |  7 ::^ :v :      :  |  0                  |  0        |
    movslq  %edi, %rdi                            // |  6 ::  :^ :      :  |  0                  |  0        |
    testl   %esi, %esi                            // |  6 ::  v: :      :  |  0                  |  6 ^^^^^^ |
    je  .LBB0_4                                   // |  5 ::   : :      :  |  0                  |  1  v     |
    movb    %bl, (%rsp,%rdi)                      // |  5 :v   v v      :  |  0                  |  0        |
    movl    $1, %esi                              // |  6 ::  ^: :      :  |  0                  |  0        |
    jmp .LBB0_7                                   // |  5 ::   : :      :  |  0                  |  0        |
.LBB0_4:                                          // |                     |                     |           |
    movb    %bl, 16(%rsp,%rdi)                    // |  5 :v   v v      :  |  0                  |  0        |
    xorl    %esi, %esi                            // |  4 :   ^  :      :  |  0                  |  5 ^^^^^  |
    jmp .LBB0_7                                   // |  3 :      :      :  |  0                  |  0        |
.LBB0_8:                                          // |                     |                     |           |
    leaq    16(%rsp), %rdi                        // |  4 :    ^ v      :  |  0                  |  0        |
    xorl    %esi, %esi                            // |  4 :   ^  :      :  |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  4 :  ^   :      :  |  0                  |  0        |
    callq   strtol@PLT                            // |  3 :      x      :  |  0                  |  0        |
    movq    %rax, %rbx                            // |  4 v^     :      :  |  0                  |  0        |
    movq    %rsp, %rdi                            // |  5 ::   ^ v      :  |  0                  |  0        |
    xorl    %esi, %esi                            // |  5 ::  ^  :      :  |  0                  |  5 ^^^^^  |
    movl    $10, %edx                             // |  5 :: ^   :      :  |  0                  |  0        |
    callq   strtol@PLT                            // |  4 ::     x      :  |  0                  |  0        |
    addl    %ebx, %eax                            // |  4 xv     :      :  |  0                  |  6 ^^^^^^ |
    subl    %eax, %r14d                           // |  3 v      :      x  |  0                  |  6 ^^^^^^ |
    movl    %r14d, %eax                           // |  3 ^      :      v  |  0                  |  0        |
    addq    $32, %rsp                             // |  1        x         |  0                  |  6 ^^^^^^ |
    .cfi_def_cfa_offset 32                        // |                     |                     |           |
    popq    %rbx                                  // |  2  ^     x         |  0                  |  0        |
    .cfi_def_cfa_offset 24                        // |                     |                     |           |
    popq    %r14                                  // |  2        x      ^  |  0                  |  0        |
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
