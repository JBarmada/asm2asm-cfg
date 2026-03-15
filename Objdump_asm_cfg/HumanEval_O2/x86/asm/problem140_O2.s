	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%edi, %edi
	jle	.LBB0_1
# %bb.2:
	movl	%edi, %r8d
	leaq	-1(%r8), %rax
	movl	%r8d, %r9d
	andl	$7, %r9d
	cmpq	$7, %rax
	jae	.LBB0_8
# %bb.3:
	movl	$1, %edx
	movl	$1, %eax
	movl	$1, %edi
	testq	%r9, %r9
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_8:
	andl	$-8, %r8d
	negq	%r8
	movl	$1, %eax
	movl	$8, %edx
	movl	$1, %edi
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	leaq	-7(%rdx), %rsi
	imulq	%rdi, %rsi
	imulq	%rsi, %rax
	leaq	-6(%rdx), %rdi
	imulq	%rsi, %rdi
	imulq	%rdi, %rax
	leaq	-5(%rdx), %rsi
	imulq	%rdi, %rsi
	imulq	%rsi, %rax
	leaq	-4(%rdx), %rdi
	imulq	%rsi, %rdi
	imulq	%rdi, %rax
	leaq	-3(%rdx), %rsi
	imulq	%rdi, %rsi
	imulq	%rsi, %rax
	leaq	-2(%rdx), %rcx
	imulq	%rsi, %rcx
	imulq	%rcx, %rax
	leaq	-1(%rdx), %rdi
	imulq	%rcx, %rdi
	imulq	%rdi, %rax
	imulq	%rdx, %rdi
	imulq	%rdi, %rax
	leaq	(%r8,%rdx), %rcx
	addq	$8, %rcx
	addq	$8, %rdx
	cmpq	$8, %rcx
	jne	.LBB0_9
# %bb.4:
	addq	$-7, %rdx
	testq	%r9, %r9
	je	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	imulq	%rdx, %rdi
	imulq	%rdi, %rax
	incq	%rdx
	decq	%r9
	jne	.LBB0_6
.LBB0_7:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
