	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	callq	strlen@PLT
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	cltq
	addq	%rax, %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	incl	%eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.LBB0_46
# %bb.1:
	movq	16(%rsp), %rax                  # 8-byte Reload
	movslq	%eax, %rdx
	testl	%eax, %eax
	movq	%rdi, (%rsp)                    # 8-byte Spill
	jle	.LBB0_2
# %bb.3:
	movabsq	$-4294967296, %r13              # imm = 0xFFFFFFFF00000000
	movq	%rax, %rcx
	shlq	$32, %rcx
	movslq	%eax, %r10
	movl	%r10d, %r9d
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	leaq	(%rcx,%r13), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	leaq	16(%rdi,%r10), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	leaq	(%rdi,%r10), %rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	xorl	%r15d, %r15d
	movq	%r14, %r12
	movq	%r9, 64(%rsp)                   # 8-byte Spill
	movq	%r10, 56(%rsp)                  # 8-byte Spill
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_24:                               #   in Loop: Header=BB0_4 Depth=1
	leaq	(%r15,%r10), %rax
	movq	(%rsp), %rdi                    # 8-byte Reload
	movb	$0, (%rdi,%rax)
	testb	%bl, %bl
	movq	64(%rsp), %r9                   # 8-byte Reload
	movq	%rbp, %rdx
	je	.LBB0_46
.LBB0_25:                               #   in Loop: Header=BB0_4 Depth=1
	incq	%r15
	incq	%r12
	cmpq	%r9, %r15
	je	.LBB0_26
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_16 Depth 2
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_23 Depth 2
	movq	%r10, %rcx
	subq	%r15, %rcx
	cmpq	$2, %rcx
	jl	.LBB0_5
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %r8
	movq	48(%rsp), %rbp                  # 8-byte Reload
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%r12,%rbx), %ecx
	movq	%rbp, %rsi
	sarq	$32, %rsi
	cmpb	(%r14,%rsi), %cl
	jne	.LBB0_25
# %bb.7:                                #   in Loop: Header=BB0_8 Depth=2
	incq	%rbx
	addq	%r13, %rbp
	cmpq	%rbx, %rax
	jne	.LBB0_8
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	cmpq	%r8, %rbx
	setl	%bl
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_4 Depth=1
	xorl	%ebx, %ebx
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	movq	%r14, %rsi
	movq	%rdx, %rbp
	callq	strncpy@PLT
	testq	%r15, %r15
	movq	56(%rsp), %r10                  # 8-byte Reload
	pxor	%xmm3, %xmm3
	je	.LBB0_24
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	cmpq	$8, %r15
	jae	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	xorl	%eax, %eax
	jmp	.LBB0_22
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	cmpq	$32, %r15
	jae	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_4 Depth=1
	xorl	%eax, %eax
	jmp	.LBB0_19
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	movq	%r15, %rcx
	andq	$-32, %rcx
	negq	%rcx
	movq	%r15, %rax
	movabsq	$9223372036854775776, %rdx      # imm = 0x7FFFFFFFFFFFFFE0
	andq	%rdx, %rax
	movq	40(%rsp), %rdx                  # 8-byte Reload
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_16:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqu	-32(%r12,%rsi), %xmm0
	movdqu	-16(%r12,%rsi), %xmm1
	movdqa	%xmm1, %xmm2
	punpcklbw	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1],xmm2[2],xmm3[2],xmm2[3],xmm3[3],xmm2[4],xmm3[4],xmm2[5],xmm3[5],xmm2[6],xmm3[6],xmm2[7],xmm3[7]
	pshufd	$78, %xmm2, %xmm2               # xmm2 = xmm2[2,3,0,1]
	pshuflw	$27, %xmm2, %xmm2               # xmm2 = xmm2[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm2, %xmm2               # xmm2 = xmm2[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm3, %xmm1            # xmm1 = xmm1[8],xmm3[8],xmm1[9],xmm3[9],xmm1[10],xmm3[10],xmm1[11],xmm3[11],xmm1[12],xmm3[12],xmm1[13],xmm3[13],xmm1[14],xmm3[14],xmm1[15],xmm3[15]
	pshufd	$78, %xmm1, %xmm1               # xmm1 = xmm1[2,3,0,1]
	pshuflw	$27, %xmm1, %xmm1               # xmm1 = xmm1[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm1, %xmm1               # xmm1 = xmm1[0,1,2,3,7,6,5,4]
	packuswb	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	punpcklbw	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1],xmm2[2],xmm3[2],xmm2[3],xmm3[3],xmm2[4],xmm3[4],xmm2[5],xmm3[5],xmm2[6],xmm3[6],xmm2[7],xmm3[7]
	pshufd	$78, %xmm2, %xmm2               # xmm2 = xmm2[2,3,0,1]
	pshuflw	$27, %xmm2, %xmm2               # xmm2 = xmm2[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm2, %xmm2               # xmm2 = xmm2[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm3, %xmm0            # xmm0 = xmm0[8],xmm3[8],xmm0[9],xmm3[9],xmm0[10],xmm3[10],xmm0[11],xmm3[11],xmm0[12],xmm3[12],xmm0[13],xmm3[13],xmm0[14],xmm3[14],xmm0[15],xmm3[15]
	pshufd	$78, %xmm0, %xmm0               # xmm0 = xmm0[2,3,0,1]
	pshuflw	$27, %xmm0, %xmm0               # xmm0 = xmm0[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm0, %xmm0               # xmm0 = xmm0[0,1,2,3,7,6,5,4]
	packuswb	%xmm2, %xmm0
	movdqu	%xmm1, -16(%rdx)
	movdqu	%xmm0, (%rdx)
	addq	$-32, %rsi
	addq	$32, %rdx
	cmpq	%rsi, %rcx
	jne	.LBB0_16
# %bb.17:                               #   in Loop: Header=BB0_4 Depth=1
	cmpq	%rax, %r15
	je	.LBB0_24
# %bb.18:                               #   in Loop: Header=BB0_4 Depth=1
	testb	$24, %r15b
	je	.LBB0_22
.LBB0_19:                               #   in Loop: Header=BB0_4 Depth=1
	movq	%rax, %rcx
	movq	%r15, %rdx
	andq	$-8, %rdx
	negq	%rdx
	movabsq	$9223372036854775776, %rax      # imm = 0x7FFFFFFFFFFFFFE0
	addq	$24, %rax
	andq	%r15, %rax
	movq	24(%rsp), %rsi                  # 8-byte Reload
	addq	%rcx, %rsi
	negq	%rcx
	.p2align	4, 0x90
.LBB0_20:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-8(%r12,%rcx), %xmm0            # xmm0 = mem[0],zero
	punpcklbw	%xmm3, %xmm0            # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1],xmm0[2],xmm3[2],xmm0[3],xmm3[3],xmm0[4],xmm3[4],xmm0[5],xmm3[5],xmm0[6],xmm3[6],xmm0[7],xmm3[7]
	pshufd	$78, %xmm0, %xmm0               # xmm0 = xmm0[2,3,0,1]
	pshuflw	$27, %xmm0, %xmm0               # xmm0 = xmm0[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm0, %xmm0               # xmm0 = xmm0[0,1,2,3,7,6,5,4]
	packuswb	%xmm0, %xmm0
	movq	%xmm0, (%rsi)
	addq	$-8, %rcx
	addq	$8, %rsi
	cmpq	%rcx, %rdx
	jne	.LBB0_20
# %bb.21:                               #   in Loop: Header=BB0_4 Depth=1
	cmpq	%rax, %r15
	je	.LBB0_24
.LBB0_22:                               #   in Loop: Header=BB0_4 Depth=1
	movq	24(%rsp), %rcx                  # 8-byte Reload
	addq	%rax, %rcx
	negq	%rax
	.p2align	4, 0x90
.LBB0_23:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%r12,%rax), %edx
	movb	%dl, (%rcx)
	incq	%rcx
	decq	%rax
	movq	%r15, %rdx
	addq	%rax, %rdx
	jne	.LBB0_23
	jmp	.LBB0_24
.LBB0_2:
	movq	%r14, %rsi
	callq	strncpy@PLT
	movq	(%rsp), %rdi                    # 8-byte Reload
	movq	8(%rsp), %r9                    # 8-byte Reload
	jmp	.LBB0_45
.LBB0_26:
	movq	%r14, %rsi
	movq	%r9, %rbx
	callq	strncpy@PLT
	movq	(%rsp), %rdi                    # 8-byte Reload
	movq	16(%rsp), %r11                  # 8-byte Reload
	testl	%r11d, %r11d
	movq	8(%rsp), %r9                    # 8-byte Reload
	jle	.LBB0_45
# %bb.27:
	movslq	%r11d, %r8
	cmpl	$8, %ebx
	movq	%rbx, %r15
	jae	.LBB0_29
# %bb.28:
	xorl	%r10d, %r10d
.LBB0_40:
	movl	%r11d, %eax
	subl	%r10d, %eax
	leaq	1(%r10), %rdx
	testb	$1, %al
	je	.LBB0_42
# %bb.41:
	movl	%r10d, %eax
	notl	%eax
	addl	%r11d, %eax
	cltq
	movzbl	(%r14,%rax), %eax
	addq	%r8, %r10
	movb	%al, (%rdi,%r10)
	movq	%rdx, %r10
.LBB0_42:
	cmpq	%rdx, %r15
	je	.LBB0_45
# %bb.43:
	movabsq	$-8589934592, %rdx              # imm = 0xFFFFFFFE00000000
	movl	%r11d, %esi
	subl	%r10d, %esi
	addl	$-2, %esi
	shlq	$32, %rsi
	movl	%r10d, %ebp
	notl	%ebp
	addl	%r11d, %ebp
	shlq	$32, %rbp
	leaq	(%r8,%rdi), %rax
	incq	%rax
	.p2align	4, 0x90
.LBB0_44:                               # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rcx
	sarq	$32, %rcx
	movzbl	(%r14,%rcx), %ebx
	movb	%bl, -1(%rax,%r10)
	movq	%rsi, %rcx
	sarq	$32, %rcx
	movzbl	(%r14,%rcx), %ebx
	movb	%bl, (%rax,%r10)
	addq	$2, %r10
	addq	%rdx, %rsi
	addq	%rdx, %rbp
	cmpq	%r10, %r15
	jne	.LBB0_44
.LBB0_45:
	movb	$0, (%rdi,%r9)
.LBB0_46:
	movq	%rdi, %rax
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_29:
	.cfi_def_cfa_offset 128
	leaq	-1(%rbx), %rdx
	leal	-1(%r11), %esi
	movl	%esi, %eax
	subl	%edx, %eax
	xorl	%r10d, %r10d
	cmpl	%esi, %eax
	jg	.LBB0_40
# %bb.30:
	shrq	$32, %rdx
	jne	.LBB0_40
# %bb.31:
	movq	%r15, %rax
	cmpl	$32, %eax
	movq	%r15, %r10
	jae	.LBB0_33
# %bb.32:
	movq	%r10, %rax
	xorl	%r10d, %r10d
	jmp	.LBB0_37
.LBB0_33:
	movl	%r11d, %edx
	andl	$31, %edx
	subq	%rdx, %r10
	movq	32(%rsp), %rbp                  # 8-byte Reload
	addq	%r13, %rbp
	leaq	(%r8,%rdi), %rsi
	addq	$16, %rsi
	xorl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	movabsq	$-137438953472, %rax            # imm = 0xFFFFFFE000000000
	.p2align	4, 0x90
.LBB0_34:                               # =>This Inner Loop Header: Depth=1
	movq	%rbp, %rbx
	sarq	$32, %rbx
	movdqu	-31(%r14,%rbx), %xmm1
	movdqu	-15(%r14,%rbx), %xmm2
	movdqa	%xmm2, %xmm3
	punpcklbw	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
	pshufd	$78, %xmm3, %xmm3               # xmm3 = xmm3[2,3,0,1]
	pshuflw	$27, %xmm3, %xmm3               # xmm3 = xmm3[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm3, %xmm3               # xmm3 = xmm3[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm0, %xmm2            # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
	pshufd	$78, %xmm2, %xmm2               # xmm2 = xmm2[2,3,0,1]
	pshuflw	$27, %xmm2, %xmm2               # xmm2 = xmm2[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm2, %xmm2               # xmm2 = xmm2[0,1,2,3,7,6,5,4]
	packuswb	%xmm3, %xmm2
	movdqa	%xmm1, %xmm3
	punpcklbw	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
	pshufd	$78, %xmm3, %xmm3               # xmm3 = xmm3[2,3,0,1]
	pshuflw	$27, %xmm3, %xmm3               # xmm3 = xmm3[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm3, %xmm3               # xmm3 = xmm3[0,1,2,3,7,6,5,4]
	punpckhbw	%xmm0, %xmm1            # xmm1 = xmm1[8],xmm0[8],xmm1[9],xmm0[9],xmm1[10],xmm0[10],xmm1[11],xmm0[11],xmm1[12],xmm0[12],xmm1[13],xmm0[13],xmm1[14],xmm0[14],xmm1[15],xmm0[15]
	pshufd	$78, %xmm1, %xmm1               # xmm1 = xmm1[2,3,0,1]
	pshuflw	$27, %xmm1, %xmm1               # xmm1 = xmm1[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm1, %xmm1               # xmm1 = xmm1[0,1,2,3,7,6,5,4]
	packuswb	%xmm3, %xmm1
	movdqu	%xmm2, -16(%rsi,%rcx)
	movdqu	%xmm1, (%rsi,%rcx)
	addq	$32, %rcx
	addq	%rax, %rbp
	cmpq	%rcx, %r10
	jne	.LBB0_34
# %bb.35:
	testq	%rdx, %rdx
	je	.LBB0_45
# %bb.36:
	movq	%r15, %rax
	cmpl	$8, %edx
	jb	.LBB0_40
.LBB0_37:
	movq	%r10, %rsi
	movl	%r11d, %ebp
	andl	$7, %ebp
	movq	%rax, %r10
	subq	%rbp, %r10
	movl	%esi, %eax
	notl	%eax
	addl	%r11d, %eax
	shlq	$32, %rax
	leaq	(%rdi,%r8), %rcx
	pxor	%xmm0, %xmm0
	movabsq	$-34359738368, %rbx             # imm = 0xFFFFFFF800000000
	.p2align	4, 0x90
.LBB0_38:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	sarq	$32, %rdx
	movq	-7(%r14,%rdx), %xmm1            # xmm1 = mem[0],zero
	punpcklbw	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
	pshufd	$78, %xmm1, %xmm1               # xmm1 = xmm1[2,3,0,1]
	pshuflw	$27, %xmm1, %xmm1               # xmm1 = xmm1[3,2,1,0,4,5,6,7]
	pshufhw	$27, %xmm1, %xmm1               # xmm1 = xmm1[0,1,2,3,7,6,5,4]
	packuswb	%xmm1, %xmm1
	movq	%xmm1, (%rcx,%rsi)
	addq	$8, %rsi
	addq	%rbx, %rax
	cmpq	%rsi, %r10
	jne	.LBB0_38
# %bb.39:
	testq	%rbp, %rbp
	jne	.LBB0_40
	jmp	.LBB0_45
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
