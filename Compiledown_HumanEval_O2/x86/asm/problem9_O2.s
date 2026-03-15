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
	movl	%esi, %r9d
	cmpl	$8, %esi
	jae	.LBB0_4
# %bb.3:
	xorl	%r10d, %r10d
	movl	$1, %esi
	xorl	%eax, %eax
	jmp	.LBB0_11
.LBB0_1:
	movl	$1, %esi
	xorl	%eax, %eax
	jmp	.LBB0_12
.LBB0_4:
	movl	%r9d, %r10d
	andl	$-8, %r10d
	leaq	-8(%r10), %rax
	movq	%rax, %r8
	shrq	$3, %r8
	incq	%r8
	testq	%rax, %rax
	je	.LBB0_5
# %bb.6:
	movq	%r8, %rax
	andq	$-2, %rax
	pxor	%xmm9, %xmm9
	movdqa	.LCPI0_0(%rip), %xmm1           # xmm1 = [1,1,1,1]
	xorl	%esi, %esi
	movdqa	%xmm1, %xmm3
	pxor	%xmm2, %xmm2
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rsi,4), %xmm6
	movdqu	16(%rdi,%rsi,4), %xmm4
	movdqu	32(%rdi,%rsi,4), %xmm7
	movdqu	48(%rdi,%rsi,4), %xmm8
	paddd	%xmm6, %xmm9
	paddd	%xmm4, %xmm2
	pshufd	$245, %xmm6, %xmm5              # xmm5 = xmm6[1,1,3,3]
	pshufd	$245, %xmm1, %xmm0              # xmm0 = xmm1[1,1,3,3]
	pmuludq	%xmm5, %xmm0
	pmuludq	%xmm1, %xmm6
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pshufd	$245, %xmm3, %xmm5              # xmm5 = xmm3[1,1,3,3]
	pmuludq	%xmm1, %xmm5
	pmuludq	%xmm3, %xmm4
	paddd	%xmm7, %xmm9
	paddd	%xmm8, %xmm2
	pmuludq	%xmm7, %xmm6
	pshufd	$232, %xmm6, %xmm1              # xmm1 = xmm6[0,2,2,3]
	pshufd	$245, %xmm7, %xmm3              # xmm3 = xmm7[1,1,3,3]
	pmuludq	%xmm0, %xmm3
	pshufd	$232, %xmm3, %xmm0              # xmm0 = xmm3[0,2,2,3]
	punpckldq	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	pmuludq	%xmm8, %xmm4
	pshufd	$232, %xmm4, %xmm3              # xmm3 = xmm4[0,2,2,3]
	pshufd	$245, %xmm8, %xmm0              # xmm0 = xmm8[1,1,3,3]
	pmuludq	%xmm5, %xmm0
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	addq	$16, %rsi
	addq	$-2, %rax
	jne	.LBB0_7
# %bb.8:
	testb	$1, %r8b
	je	.LBB0_10
.LBB0_9:
	movdqu	(%rdi,%rsi,4), %xmm0
	movdqu	16(%rdi,%rsi,4), %xmm4
	paddd	%xmm0, %xmm9
	paddd	%xmm4, %xmm2
	pshufd	$245, %xmm0, %xmm5              # xmm5 = xmm0[1,1,3,3]
	pmuludq	%xmm1, %xmm0
	pshufd	$245, %xmm1, %xmm1              # xmm1 = xmm1[1,1,3,3]
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	pmuludq	%xmm5, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	punpckldq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	pshufd	$245, %xmm4, %xmm1              # xmm1 = xmm4[1,1,3,3]
	pmuludq	%xmm3, %xmm4
	pshufd	$245, %xmm3, %xmm3              # xmm3 = xmm3[1,1,3,3]
	pshufd	$232, %xmm4, %xmm4              # xmm4 = xmm4[0,2,2,3]
	pmuludq	%xmm1, %xmm3
	pshufd	$232, %xmm3, %xmm1              # xmm1 = xmm3[0,2,2,3]
	punpckldq	%xmm1, %xmm4            # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
	movdqa	%xmm0, %xmm1
	movdqa	%xmm4, %xmm3
.LBB0_10:
	paddd	%xmm2, %xmm9
	pshufd	$238, %xmm9, %xmm0              # xmm0 = xmm9[2,3,2,3]
	paddd	%xmm9, %xmm0
	pshufd	$85, %xmm0, %xmm2               # xmm2 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm2
	movd	%xmm2, %eax
	pshufd	$245, %xmm1, %xmm0              # xmm0 = xmm1[1,1,3,3]
	pshufd	$245, %xmm3, %xmm2              # xmm2 = xmm3[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pmuludq	%xmm1, %xmm3
	pshufd	$238, %xmm3, %xmm0              # xmm0 = xmm3[2,3,2,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$170, %xmm2, %xmm1              # xmm1 = xmm2[2,2,2,2]
	pmuludq	%xmm2, %xmm1
	pmuludq	%xmm0, %xmm1
	movd	%xmm1, %esi
	cmpq	%r9, %r10
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r10,4), %ecx
	addl	%ecx, %eax
	imull	%ecx, %esi
	incq	%r10
	cmpq	%r10, %r9
	jne	.LBB0_11
.LBB0_12:
	movl	%eax, (%rdx)
	movl	%esi, 4(%rdx)
	retq
.LBB0_5:
	pxor	%xmm9, %xmm9
	movdqa	.LCPI0_0(%rip), %xmm1           # xmm1 = [1,1,1,1]
	xorl	%esi, %esi
	movdqa	%xmm1, %xmm3
	pxor	%xmm2, %xmm2
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
