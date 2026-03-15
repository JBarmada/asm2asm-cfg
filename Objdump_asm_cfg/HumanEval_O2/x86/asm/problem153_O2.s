	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%ecx, %ecx
	jle	.LBB0_12
# %bb.1:
	movl	%ecx, %r8d
	cmpl	$8, %ecx
	jae	.LBB0_3
# %bb.2:
	xorl	%r11d, %r11d
	jmp	.LBB0_8
.LBB0_3:
	movq	%rdx, %rax
	subq	%rdi, %rax
	xorl	%r11d, %r11d
	cmpq	$32, %rax
	jb	.LBB0_8
# %bb.4:
	movq	%rdx, %rax
	subq	%rsi, %rax
	cmpq	$32, %rax
	jb	.LBB0_8
# %bb.5:
	movl	%r8d, %r11d
	andl	$-8, %r11d
	leaq	(,%r8,4), %r9
	andq	$-32, %r9
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rax), %xmm0
	movdqu	16(%rdi,%rax), %xmm1
	movdqu	(%rsi,%rax), %xmm2
	psubd	%xmm2, %xmm0
	movdqu	16(%rsi,%rax), %xmm2
	psubd	%xmm2, %xmm1
	movdqa	%xmm0, %xmm2
	psrad	$31, %xmm2
	pxor	%xmm2, %xmm0
	psubd	%xmm2, %xmm0
	movdqa	%xmm1, %xmm2
	psrad	$31, %xmm2
	pxor	%xmm2, %xmm1
	psubd	%xmm2, %xmm1
	movdqu	%xmm0, (%rdx,%rax)
	movdqu	%xmm1, 16(%rdx,%rax)
	addq	$32, %rax
	cmpq	%rax, %r9
	jne	.LBB0_6
# %bb.7:
	cmpq	%r8, %r11
	je	.LBB0_12
.LBB0_8:
	movq	%r11, %r10
	notq	%r10
	testb	$1, %r8b
	je	.LBB0_10
# %bb.9:
	movl	(%rdi,%r11,4), %r9d
	subl	(%rsi,%r11,4), %r9d
	movl	%r9d, %eax
	negl	%eax
	cmovsl	%r9d, %eax
	movl	%eax, (%rdx,%r11,4)
	orq	$1, %r11
.LBB0_10:
	addq	%r8, %r10
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r11,4), %ecx
	subl	(%rsi,%r11,4), %ecx
	movl	%ecx, %eax
	negl	%eax
	cmovsl	%ecx, %eax
	movl	%eax, (%rdx,%r11,4)
	movl	4(%rdi,%r11,4), %eax
	subl	4(%rsi,%r11,4), %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovsl	%eax, %ecx
	movl	%ecx, 4(%rdx,%r11,4)
	addq	$2, %r11
	cmpq	%r11, %r8
	jne	.LBB0_11
.LBB0_12:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
