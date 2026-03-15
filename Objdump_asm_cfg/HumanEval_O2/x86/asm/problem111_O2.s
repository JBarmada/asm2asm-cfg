	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %r8d
	cmpl	$8, %esi
	jae	.LBB0_5
# %bb.3:
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	jmp	.LBB0_4
.LBB0_1:
	xorl	%r10d, %r10d
	jmp	.LBB0_12
.LBB0_5:
	movl	%r8d, %r9d
	andl	$-8, %r9d
	leaq	-8(%r9), %rax
	movq	%rax, %r10
	shrq	$3, %r10
	incq	%r10
	testq	%rax, %rax
	je	.LBB0_6
# %bb.7:
	movq	%r10, %r11
	andq	$-2, %r11
	pxor	%xmm3, %xmm3
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm2           # xmm2 = [1,1,1,1]
	pxor	%xmm4, %xmm4
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rax,4), %xmm5
	movdqu	16(%rdi,%rax,4), %xmm6
	movdqu	32(%rdi,%rax,4), %xmm0
	movdqu	48(%rdi,%rax,4), %xmm1
	pandn	%xmm2, %xmm5
	paddd	%xmm3, %xmm5
	pandn	%xmm2, %xmm6
	paddd	%xmm4, %xmm6
	pandn	%xmm2, %xmm0
	paddd	%xmm5, %xmm0
	pandn	%xmm2, %xmm1
	paddd	%xmm6, %xmm1
	addq	$16, %rax
	movdqa	%xmm0, %xmm3
	movdqa	%xmm1, %xmm4
	addq	$-2, %r11
	jne	.LBB0_8
# %bb.9:
	testb	$1, %r10b
	je	.LBB0_11
.LBB0_10:
	movdqu	(%rdi,%rax,4), %xmm2
	movdqu	16(%rdi,%rax,4), %xmm3
	movdqa	.LCPI0_0(%rip), %xmm4           # xmm4 = [1,1,1,1]
	pandn	%xmm4, %xmm2
	paddd	%xmm2, %xmm0
	pandn	%xmm4, %xmm3
	paddd	%xmm3, %xmm1
.LBB0_11:
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %r10d
	cmpq	%r8, %r9
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r9,4), %eax
	notl	%eax
	andl	$1, %eax
	addl	%eax, %r10d
	incq	%r9
	cmpq	%r9, %r8
	jne	.LBB0_4
.LBB0_12:
	testl	%ecx, %ecx
	jle	.LBB0_23
# %bb.13:
	movl	%ecx, %r9d
	cmpl	$8, %ecx
	jae	.LBB0_15
# %bb.14:
	xorl	%ecx, %ecx
	jmp	.LBB0_22
.LBB0_15:
	movl	%r9d, %ecx
	andl	$-8, %ecx
	movd	%r10d, %xmm0
	leaq	-8(%rcx), %rax
	movq	%rax, %r8
	shrq	$3, %r8
	incq	%r8
	testq	%rax, %rax
	je	.LBB0_16
# %bb.17:
	movq	%r8, %rdi
	andq	$-2, %rdi
	pxor	%xmm3, %xmm3
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm2           # xmm2 = [1,1,1,1]
	movdqa	%xmm0, %xmm4
	.p2align	4, 0x90
.LBB0_18:                               # =>This Inner Loop Header: Depth=1
	movdqu	(%rdx,%rax,4), %xmm5
	movdqu	16(%rdx,%rax,4), %xmm6
	movdqu	32(%rdx,%rax,4), %xmm0
	movdqu	48(%rdx,%rax,4), %xmm1
	pandn	%xmm2, %xmm5
	paddd	%xmm4, %xmm5
	pandn	%xmm2, %xmm6
	paddd	%xmm3, %xmm6
	pandn	%xmm2, %xmm0
	paddd	%xmm5, %xmm0
	pandn	%xmm2, %xmm1
	paddd	%xmm6, %xmm1
	addq	$16, %rax
	movdqa	%xmm0, %xmm4
	movdqa	%xmm1, %xmm3
	addq	$-2, %rdi
	jne	.LBB0_18
# %bb.19:
	testb	$1, %r8b
	je	.LBB0_21
.LBB0_20:
	movdqu	(%rdx,%rax,4), %xmm2
	movdqu	16(%rdx,%rax,4), %xmm3
	movdqa	.LCPI0_0(%rip), %xmm4           # xmm4 = [1,1,1,1]
	pandn	%xmm4, %xmm2
	paddd	%xmm2, %xmm0
	pandn	%xmm4, %xmm3
	paddd	%xmm3, %xmm1
.LBB0_21:
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %r10d
	cmpq	%r9, %rcx
	je	.LBB0_23
	.p2align	4, 0x90
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdx,%rcx,4), %eax
	notl	%eax
	andl	$1, %eax
	addl	%eax, %r10d
	incq	%rcx
	cmpq	%rcx, %r9
	jne	.LBB0_22
.LBB0_23:
	cmpl	%esi, %r10d
	leaq	.L.str.1(%rip), %rcx
	leaq	.L.str(%rip), %rax
	cmovlq	%rcx, %rax
	retq
.LBB0_6:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	testb	$1, %r10b
	jne	.LBB0_10
	jmp	.LBB0_11
.LBB0_16:
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	testb	$1, %r8b
	jne	.LBB0_20
	jmp	.LBB0_21
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"YES"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"NO"
	.size	.L.str.1, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
