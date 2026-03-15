	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_11
# %bb.1:
	movl	%esi, %eax
	cmpl	$8, %esi
	jae	.LBB0_3
# %bb.2:
	xorl	%ecx, %ecx
	jmp	.LBB0_10
.LBB0_3:
	movl	%eax, %ecx
	andl	$-8, %ecx
	leaq	-8(%rcx), %rdx
	movq	%rdx, %r8
	shrq	$3, %r8
	incq	%r8
	testq	%rdx, %rdx
	je	.LBB0_4
# %bb.5:
	movq	%r8, %rsi
	andq	$-2, %rsi
	xorl	%edx, %edx
	pcmpeqd	%xmm0, %xmm0
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rdx,4), %xmm1
	movdqu	16(%rdi,%rdx,4), %xmm2
	movdqu	32(%rdi,%rdx,4), %xmm3
	movdqu	48(%rdi,%rdx,4), %xmm4
	psubd	%xmm0, %xmm1
	psubd	%xmm0, %xmm2
	movdqu	%xmm1, (%rdi,%rdx,4)
	movdqu	%xmm2, 16(%rdi,%rdx,4)
	psubd	%xmm0, %xmm3
	psubd	%xmm0, %xmm4
	movdqu	%xmm3, 32(%rdi,%rdx,4)
	movdqu	%xmm4, 48(%rdi,%rdx,4)
	addq	$16, %rdx
	addq	$-2, %rsi
	jne	.LBB0_6
# %bb.7:
	testb	$1, %r8b
	je	.LBB0_9
.LBB0_8:
	movdqu	(%rdi,%rdx,4), %xmm0
	movdqu	16(%rdi,%rdx,4), %xmm1
	pcmpeqd	%xmm2, %xmm2
	psubd	%xmm2, %xmm0
	psubd	%xmm2, %xmm1
	movdqu	%xmm0, (%rdi,%rdx,4)
	movdqu	%xmm1, 16(%rdi,%rdx,4)
.LBB0_9:
	cmpq	%rax, %rcx
	je	.LBB0_11
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	incl	(%rdi,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %rax
	jne	.LBB0_10
.LBB0_11:
	retq
.LBB0_4:
	xorl	%edx, %edx
	testb	$1, %r8b
	jne	.LBB0_8
	jmp	.LBB0_9
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
