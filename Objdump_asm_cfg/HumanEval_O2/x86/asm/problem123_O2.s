	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	99                              # 0x63
	.long	99                              # 0x63
	.long	99                              # 0x63
	.long	99                              # 0x63
.LCPI0_1:
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
	.long	2147483648                      # 0x80000000
.LCPI0_2:
	.long	2147483847                      # 0x800000c7
	.long	2147483847                      # 0x800000c7
	.long	2147483847                      # 0x800000c7
	.long	2147483847                      # 0x800000c7
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
	movl	%esi, %r10d
	xorl	%r9d, %r9d
	cmpl	$8, %esi
	jae	.LBB0_4
# %bb.3:
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.LBB0_11
.LBB0_1:
	xorl	%eax, %eax
	retq
.LBB0_4:
	movl	%r10d, %esi
	andl	$-8, %esi
	leaq	-8(%rsi), %rax
	movq	%rax, %r8
	shrq	$3, %r8
	incq	%r8
	testq	%rax, %rax
	je	.LBB0_5
# %bb.6:
	movq	%r8, %rdx
	andq	$-2, %rdx
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm8           # xmm8 = [99,99,99,99]
	movdqa	.LCPI0_1(%rip), %xmm9           # xmm9 = [2147483648,2147483648,2147483648,2147483648]
	movdqa	.LCPI0_2(%rip), %xmm10          # xmm10 = [2147483847,2147483847,2147483847,2147483847]
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rax,4), %xmm3
	movdqu	16(%rdi,%rax,4), %xmm4
	movdqu	32(%rdi,%rax,4), %xmm6
	movdqu	48(%rdi,%rax,4), %xmm11
	movdqa	%xmm3, %xmm7
	paddd	%xmm8, %xmm7
	movdqa	%xmm4, %xmm2
	paddd	%xmm8, %xmm2
	pxor	%xmm9, %xmm7
	movdqa	%xmm10, %xmm5
	pcmpgtd	%xmm7, %xmm5
	pxor	%xmm9, %xmm2
	movdqa	%xmm10, %xmm7
	pcmpgtd	%xmm2, %xmm7
	pand	%xmm3, %xmm5
	paddd	%xmm0, %xmm5
	pand	%xmm4, %xmm7
	paddd	%xmm1, %xmm7
	movdqa	%xmm6, %xmm1
	paddd	%xmm8, %xmm1
	movdqa	%xmm11, %xmm2
	paddd	%xmm8, %xmm2
	pxor	%xmm9, %xmm1
	movdqa	%xmm10, %xmm0
	pcmpgtd	%xmm1, %xmm0
	pxor	%xmm9, %xmm2
	movdqa	%xmm10, %xmm1
	pcmpgtd	%xmm2, %xmm1
	pand	%xmm6, %xmm0
	paddd	%xmm5, %xmm0
	pand	%xmm11, %xmm1
	paddd	%xmm7, %xmm1
	addq	$16, %rax
	addq	$-2, %rdx
	jne	.LBB0_7
# %bb.8:
	testb	$1, %r8b
	je	.LBB0_10
.LBB0_9:
	movdqu	(%rdi,%rax,4), %xmm2
	movdqu	16(%rdi,%rax,4), %xmm3
	movdqa	.LCPI0_0(%rip), %xmm4           # xmm4 = [99,99,99,99]
	movdqa	%xmm2, %xmm5
	paddd	%xmm4, %xmm5
	paddd	%xmm3, %xmm4
	movdqa	.LCPI0_1(%rip), %xmm8           # xmm8 = [2147483648,2147483648,2147483648,2147483648]
	pxor	%xmm8, %xmm5
	movdqa	.LCPI0_2(%rip), %xmm7           # xmm7 = [2147483847,2147483847,2147483847,2147483847]
	movdqa	%xmm7, %xmm6
	pcmpgtd	%xmm5, %xmm6
	pxor	%xmm8, %xmm4
	pcmpgtd	%xmm4, %xmm7
	pand	%xmm2, %xmm6
	paddd	%xmm6, %xmm0
	pand	%xmm3, %xmm7
	paddd	%xmm7, %xmm1
.LBB0_10:
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%r10, %rsi
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rsi,4), %edx
	leal	99(%rdx), %ecx
	cmpl	$199, %ecx
	cmovael	%r9d, %edx
	addl	%edx, %eax
	incq	%rsi
	cmpq	%rsi, %r10
	jne	.LBB0_11
.LBB0_12:
	retq
.LBB0_5:
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	testb	$1, %r8b
	jne	.LBB0_9
	jmp	.LBB0_10
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
