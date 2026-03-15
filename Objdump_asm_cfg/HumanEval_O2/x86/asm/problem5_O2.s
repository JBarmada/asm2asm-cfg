	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB0_3
# %bb.1:
	movl	%esi, %r9d
	leaq	-1(%r9), %r8
	movl	%r9d, %ecx
	andl	$7, %ecx
	cmpq	$7, %r8
	jae	.LBB0_4
# %bb.2:
	xorps	%xmm1, %xmm1
	xorl	%edx, %edx
	jmp	.LBB0_6
.LBB0_3:
	cvtsi2ss	%esi, %xmm2
	jmp	.LBB0_12
.LBB0_4:
	movl	%r9d, %eax
	andl	$-8, %eax
	xorps	%xmm1, %xmm1
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	addss	(%rdi,%rdx,4), %xmm1
	addss	4(%rdi,%rdx,4), %xmm1
	addss	8(%rdi,%rdx,4), %xmm1
	addss	12(%rdi,%rdx,4), %xmm1
	addss	16(%rdi,%rdx,4), %xmm1
	addss	20(%rdi,%rdx,4), %xmm1
	addss	24(%rdi,%rdx,4), %xmm1
	addss	28(%rdi,%rdx,4), %xmm1
	addq	$8, %rdx
	cmpq	%rdx, %rax
	jne	.LBB0_5
.LBB0_6:
	testq	%rcx, %rcx
	je	.LBB0_9
# %bb.7:
	leaq	(%rdi,%rdx,4), %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	addss	(%rax,%rdx,4), %xmm1
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_8
.LBB0_9:
	cvtsi2ss	%esi, %xmm2
	testl	%esi, %esi
	jle	.LBB0_12
# %bb.10:
	divss	%xmm2, %xmm1
	movl	%r9d, %ecx
	andl	$3, %ecx
	cmpq	$3, %r8
	jae	.LBB0_13
# %bb.11:
	xorps	%xmm0, %xmm0
	xorl	%edx, %edx
	jmp	.LBB0_15
.LBB0_12:
	xorps	%xmm0, %xmm0
	divss	%xmm2, %xmm0
	retq
.LBB0_13:
	andl	$-4, %r9d
	xorps	%xmm0, %xmm0
	xorl	%edx, %edx
	movaps	.LCPI0_0(%rip), %xmm3           # xmm3 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB0_14:                               # =>This Inner Loop Header: Depth=1
	movss	(%rdi,%rdx,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	movss	4(%rdi,%rdx,4), %xmm5           # xmm5 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm4
	andps	%xmm3, %xmm4
	addss	%xmm0, %xmm4
	subss	%xmm1, %xmm5
	andps	%xmm3, %xmm5
	addss	%xmm4, %xmm5
	movss	8(%rdi,%rdx,4), %xmm4           # xmm4 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm4
	andps	%xmm3, %xmm4
	addss	%xmm5, %xmm4
	movss	12(%rdi,%rdx,4), %xmm0          # xmm0 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	andps	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	addq	$4, %rdx
	cmpq	%rdx, %r9
	jne	.LBB0_14
.LBB0_15:
	testq	%rcx, %rcx
	je	.LBB0_18
# %bb.16:
	leaq	(%rdi,%rdx,4), %rax
	xorl	%edx, %edx
	movaps	.LCPI0_0(%rip), %xmm3           # xmm3 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	movss	(%rax,%rdx,4), %xmm4            # xmm4 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm4
	andps	%xmm3, %xmm4
	addss	%xmm4, %xmm0
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_17
.LBB0_18:
	divss	%xmm2, %xmm0
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
