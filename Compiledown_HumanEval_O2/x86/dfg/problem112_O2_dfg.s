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
    xorps   %xmm0, %xmm0                          // |  0                  |  1 ^                |  5 ^^^^^  |
    movaps  %xmm0, -24(%rsp)                      // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -40(%rsp)                      // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -56(%rsp)                      // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -72(%rsp)                      // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -88(%rsp)                      // |  1        v         |  1 v                |  0        |
    movaps  %xmm0, -104(%rsp)                     // |  1        v         |  1 v                |  0        |
    movq    $0, -8(%rsp)                          // |  1        v         |  0                  |  0        |
    xorl    %r9d, %r9d                            // |  1          ^       |  0                  |  5 ^^^^^  |
    jmp .LBB0_1                                   // |  1          :       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_11:                                         // |                     |                     |           |
    incq    %rdi                                  // |  2      x   :       |  0                  |  5  ^^^^^ |
.LBB0_1:                                          // |                     |                     |           |
    movzbl  (%rdi), %eax                          // |  3 ^    v   :       |  0                  |  0        |
    cmpl    $32, %eax                             // |  2 v        :       |  0                  |  6 ^^^^^^ |
    je  .LBB0_11                                  // |  2 :        :       |  0                  |  1  v     |
    testl   %eax, %eax                            // |  2 v        :       |  0                  |  6 ^^^^^^ |
    je  .LBB0_3                                   // |  1          :       |  0                  |  1  v     |
    movsbq  %al, %rax                             // |  2 ^        :       |  0                  |  0        |
    movl    -492(%rsp,%rax,4), %r8d               // |  4 v      v^:       |  0                  |  0        |
    leal    1(%r8), %r10d                         // |  4 :       v:^      |  0                  |  0        |
    movl    %r10d, -492(%rsp,%rax,4)              // |  5 v      v::v      |  0                  |  0        |
    cmpl    %r9d, %r8d                            // |  3         vv:      |  0                  |  6 ^^^^^^ |
    cmovgel %r10d, %r9d                           // |  2          ^v      |  0                  |  0        |
    jmp .LBB0_11                                  // |  1          :       |  0                  |  0        |
.LBB0_3:                                          // |                     |                     |           |
    xorl    %edi, %edi                            // |  2      ^   :       |  0                  |  5 ^^^^^  |
    xorl    %r8d, %r8d                            // |  3      :  ^:       |  0                  |  5 ^^^^^  |
    jmp .LBB0_4                                   // |  3      :  ::       |  0                  |  0        |
    .p2align    4, 0x90                           // |                     |                     |           |
.LBB0_8:                                          // |                     |                     |           |
    addq    $2, %rdi                              // |  3      x  ::       |  0                  |  6 ^^^^^^ |
    cmpq    $26, %rdi                             // |  3      v  ::       |  0                  |  6 ^^^^^^ |
    je  .LBB0_9                                   // |  3      :  ::       |  0                  |  1  v     |
.LBB0_4:                                          // |                     |                     |           |
    movl    -104(%rsp,%rdi,4), %eax               // |  5 ^    v v::       |  0                  |  0        |
    movl    %eax, (%rsi,%rdi,4)                   // |  5 v   vv  ::       |  0                  |  0        |
    cmpl    %r9d, %eax                            // |  4 v    :  :v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_6                                   // |  3      :  ::       |  0                  |  1  v     |
    movslq  %r8d, %r10                            // |  4      :  v:^      |  0                  |  0        |
    incl    %r8d                                  // |  4      :  x::      |  0                  |  5  ^^^^^ |
    leal    97(%rdi), %eax                        // |  5 ^    v  :::      |  0                  |  0        |
    movb    %al, (%rcx,%r10)                      // |  6 v v  :  ::v      |  0                  |  0        |
.LBB0_6:                                          // |                     |                     |           |
    movl    -100(%rsp,%rdi,4), %eax               // |  5 ^    v v::       |  0                  |  0        |
    movl    %eax, 4(%rsi,%rdi,4)                  // |  5 v   vv  ::       |  0                  |  0        |
    cmpl    %r9d, %eax                            // |  4 v    :  :v       |  0                  |  6 ^^^^^^ |
    jne .LBB0_8                                   // |  3      :  ::       |  0                  |  1  v     |
    movslq  %r8d, %r10                            // |  4      :  v:^      |  0                  |  0        |
    incl    %r8d                                  // |  4      :  x::      |  0                  |  5  ^^^^^ |
    leal    98(%rdi), %eax                        // |  5 ^    v  :::      |  0                  |  0        |
    movb    %al, (%rcx,%r10)                      // |  5 v v     ::v      |  0                  |  0        |
    jmp .LBB0_8                                   // |  2         ::       |  0                  |  0        |
.LBB0_9:                                          // |                     |                     |           |
    movl    %r9d, (%rdx)                          // |  3    v    :v       |  0                  |  0        |
    movslq  %r8d, %rax                            // |  2 ^       v        |  0                  |  0        |
    movb    $0, (%rcx,%rax)                       // |  2 v v              |  0                  |  0        |
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
