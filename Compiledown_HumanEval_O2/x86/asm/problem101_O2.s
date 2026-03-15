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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebp
	movslq	%edi, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	movl	%ebx, (%rax)
	cmpl	$2, %ebx
	jl	.LBB0_8
# %bb.1:
	movl	%ebp, %ecx
	movl	(%rax), %ebx
	leaq	-1(%rcx), %rdi
	addq	$-2, %rcx
	movl	%edi, %edx
	andl	$3, %edx
	movl	$1, %esi
	cmpq	$3, %rcx
	jb	.LBB0_5
# %bb.2:
	andq	$-4, %rdi
	movq	$-1, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	leal	(%rbx,%rcx), %ebp
	addl	$2, %ebp
	movl	%ebp, 4(%rax,%rcx,2)
	leal	4(%rbx,%rcx), %ebp
	movl	%ebp, 8(%rax,%rcx,2)
	leal	6(%rbx,%rcx), %ebp
	movl	%ebp, 12(%rax,%rcx,2)
	leal	(%rbx,%rcx), %ebp
	addl	$8, %ebp
	movl	%ebp, 16(%rax,%rcx,2)
	addq	$8, %rcx
	leaq	(%rdi,%rsi), %rbp
	addq	$-4, %rbp
	addq	$-4, %rsi
	cmpq	$-1, %rbp
	jne	.LBB0_3
# %bb.4:
	addl	%ebx, %ecx
	negq	%rsi
	movl	%ecx, %ebx
.LBB0_5:
	testq	%rdx, %rdx
	je	.LBB0_8
# %bb.6:
	addl	$2, %ebx
	leaq	(%rax,%rsi,4), %rcx
	addq	%rdx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	leal	(%rbx,%rsi), %edi
	movl	%edi, (%rcx,%rsi,2)
	addq	$2, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB0_7
.LBB0_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
