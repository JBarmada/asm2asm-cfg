	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movl	$-1, %eax
	cmpl	$2, %esi
	jl	.LBB0_6
# %bb.1:
	movl	%esi, %r8d
	leaq	(,%r8,4), %r9
	andq	$-8, %r9
	movl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	xorl	%r10d, %r10d
	movl	$2147483647, %eax               # imm = 0x7FFFFFFF
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r10), %edx
	cmpl	%eax, %edx
	movl	%edx, %esi
	cmovel	%ecx, %esi
	cmpl	%ecx, %edx
	cmovgel	%ecx, %esi
	cmpl	%eax, %edx
	cmovgel	%eax, %edx
	cmovll	%eax, %esi
	movl	4(%rdi,%r10), %eax
	cmpl	%edx, %eax
	movl	%eax, %ecx
	cmovel	%esi, %ecx
	cmpl	%esi, %eax
	cmovgel	%esi, %ecx
	cmpl	%edx, %eax
	cmovgel	%edx, %eax
	cmovll	%edx, %ecx
	addq	$8, %r10
	cmpq	%r10, %r9
	jne	.LBB0_2
# %bb.3:
	testb	$1, %r8b
	je	.LBB0_5
# %bb.4:
	movl	(%rdi,%r10), %edx
	cmpl	%eax, %edx
	movl	%edx, %esi
	cmovel	%ecx, %esi
	cmpl	%ecx, %edx
	cmovgel	%ecx, %esi
	cmpl	%eax, %edx
	cmovll	%eax, %esi
	movl	%esi, %ecx
.LBB0_5:
	cmpl	$2147483647, %ecx               # imm = 0x7FFFFFFF
	movl	$-1, %eax
	cmovnel	%ecx, %eax
.LBB0_6:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
