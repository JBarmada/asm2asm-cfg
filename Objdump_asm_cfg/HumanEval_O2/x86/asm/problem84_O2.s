	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
.LCPI0_1:
	.long	18                              # 0x12
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
.LCPI0_2:
	.long	100000000                       # 0x5f5e100
	.long	100000000                       # 0x5f5e100
	.long	100000000                       # 0x5f5e100
	.long	100000000                       # 0x5f5e100
.LCPI0_3:
	.long	10                              # 0xa
	.long	10                              # 0xa
	.long	10                              # 0xa
	.long	10                              # 0xa
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	testl	%edi, %edi
	jle	.LBB0_1
# %bb.2:
	movl	$1, %eax
	cmpl	$1, %edi
	je	.LBB0_17
# %bb.3:
	movl	$18, %eax
	cmpl	$3, %edi
	jb	.LBB0_17
# %bb.4:
	leal	-2(%rdi), %r8d
	cmpl	$8, %r8d
	jae	.LBB0_6
# %bb.5:
	movl	$18, %eax
	movl	$2, %ecx
	jmp	.LBB0_15
.LBB0_1:
	xorl	%eax, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.LBB0_6:
	movl	%r8d, %ecx
	andl	$-8, %ecx
	leal	-8(%rcx), %edx
	movl	%edx, %esi
	shrl	$3, %esi
	incl	%esi
	movl	%esi, %eax
	andl	$7, %eax
	cmpl	$56, %edx
	jae	.LBB0_8
# %bb.7:
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [1,1,1,1]
	movdqa	.LCPI0_1(%rip), %xmm1           # xmm1 = [18,1,1,1]
	jmp	.LBB0_10
.LBB0_8:
	andl	$-8, %esi
	movdqa	.LCPI0_0(%rip), %xmm0           # xmm0 = [1,1,1,1]
	movdqa	.LCPI0_1(%rip), %xmm1           # xmm1 = [18,1,1,1]
	movdqa	.LCPI0_2(%rip), %xmm2           # xmm2 = [100000000,100000000,100000000,100000000]
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	pshufd	$245, %xmm1, %xmm3              # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm2, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	pshufd	$245, %xmm0, %xmm3              # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm0            # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	addl	$-8, %esi
	jne	.LBB0_9
.LBB0_10:
	testl	%eax, %eax
	je	.LBB0_13
# %bb.11:
	movdqa	.LCPI0_3(%rip), %xmm2           # xmm2 = [10,10,10,10]
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	pshufd	$245, %xmm1, %xmm3              # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm2, %xmm1
	pshufd	$232, %xmm1, %xmm1              # xmm1 = xmm1[0,2,2,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm1            # xmm1 = xmm1[0],xmm3[0],xmm1[1],xmm3[1]
	pshufd	$245, %xmm0, %xmm3              # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm0
	pshufd	$232, %xmm0, %xmm0              # xmm0 = xmm0[0,2,2,3]
	pmuludq	%xmm2, %xmm3
	pshufd	$232, %xmm3, %xmm3              # xmm3 = xmm3[0,2,2,3]
	punpckldq	%xmm3, %xmm0            # xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1]
	decl	%eax
	jne	.LBB0_12
.LBB0_13:
	pshufd	$245, %xmm1, %xmm2              # xmm2 = xmm1[1,1,3,3]
	pshufd	$245, %xmm0, %xmm3              # xmm3 = xmm0[1,1,3,3]
	pmuludq	%xmm2, %xmm3
	pmuludq	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	pmuludq	%xmm0, %xmm1
	pshufd	$170, %xmm3, %xmm0              # xmm0 = xmm3[2,2,2,2]
	pmuludq	%xmm3, %xmm0
	pmuludq	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpl	%ecx, %r8d
	je	.LBB0_17
# %bb.14:
	orl	$2, %ecx
.LBB0_15:
	subl	%ecx, %edi
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	addl	%eax, %eax
	leal	(%rax,%rax,4), %eax
	decl	%edi
	jne	.LBB0_16
.LBB0_17:
                                        # kill: def $eax killed $eax killed $rax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
