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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	movl	%esi, %ebp
	xorl	%eax, %eax
	testl	%esi, %esi
	leal	-1(%rbp,%rbp), %edx
	cmovlel	%eax, %edx
	movq	%rdi, %rbx
	movl	%edx, (%rcx)
	movslq	%edx, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	testl	%ebp, %ebp
	jle	.LBB0_13
# %bb.1:
	movl	(%rbx), %ecx
	movl	%ecx, (%rax)
	cmpl	$1, %ebp
	je	.LBB0_13
# %bb.2:
	movl	%ebp, %ecx
	leaq	-1(%rcx), %r8
	movl	$1, %edi
	movl	$1, %esi
	cmpq	$4, %r8
	jb	.LBB0_11
# %bb.3:
	movq	%r8, %rsi
	andq	$-4, %rsi
	movd	%r14d, %xmm0
	pshufd	$80, %xmm0, %xmm0               # xmm0 = xmm0[0,0,1,1]
	leaq	-4(%rsi), %rdi
	movq	%rdi, %rdx
	shrq	$2, %rdx
	incq	%rdx
	testq	%rdi, %rdi
	je	.LBB0_4
# %bb.5:
	movq	%rdx, %rbp
	andq	$-2, %rbp
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movq	4(%rbx,%rdi,4), %xmm1           # xmm1 = mem[0],zero
	movq	12(%rbx,%rdi,4), %xmm2          # xmm2 = mem[0],zero
	movdqa	%xmm0, %xmm3
	punpckldq	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
	movdqu	%xmm3, 4(%rax,%rdi,8)
	movdqa	%xmm0, %xmm1
	punpckldq	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movdqu	%xmm1, 20(%rax,%rdi,8)
	movq	20(%rbx,%rdi,4), %xmm1          # xmm1 = mem[0],zero
	movq	28(%rbx,%rdi,4), %xmm2          # xmm2 = mem[0],zero
	movdqa	%xmm0, %xmm3
	punpckldq	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
	movdqu	%xmm3, 36(%rax,%rdi,8)
	movdqa	%xmm0, %xmm1
	punpckldq	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movdqu	%xmm1, 52(%rax,%rdi,8)
	addq	$8, %rdi
	addq	$-2, %rbp
	jne	.LBB0_6
# %bb.7:
	testb	$1, %dl
	je	.LBB0_9
.LBB0_8:
	leaq	(,%rdi,4), %rdx
	shlq	$3, %rdi
	orq	$4, %rdx
	movq	(%rbx,%rdx), %xmm1              # xmm1 = mem[0],zero
	movq	8(%rbx,%rdx), %xmm2             # xmm2 = mem[0],zero
	movq	%rdi, %rdx
	orq	$8, %rdx
	orq	$24, %rdi
	movdqa	%xmm0, %xmm3
	punpckldq	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
	movdqu	%xmm3, -4(%rax,%rdx)
	punpckldq	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
	movdqu	%xmm0, -4(%rax,%rdi)
.LBB0_9:
	cmpq	%rsi, %r8
	je	.LBB0_13
# %bb.10:
	leaq	1(%rsi), %rdi
	addq	%rsi, %rsi
	incq	%rsi
.LBB0_11:
	leaq	(%rbx,%rdi,4), %rdx
	subq	%rdi, %rcx
	leaq	(%rax,%rsi,4), %rsi
	addq	$4, %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	%r14d, -4(%rsi,%rdi,8)
	movl	(%rdx,%rdi,4), %ebp
	movl	%ebp, (%rsi,%rdi,8)
	incq	%rdi
	cmpq	%rdi, %rcx
	jne	.LBB0_12
.LBB0_13:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_4:
	.cfi_def_cfa_offset 32
	xorl	%edi, %edi
	testb	$1, %dl
	jne	.LBB0_8
	jmp	.LBB0_9
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
