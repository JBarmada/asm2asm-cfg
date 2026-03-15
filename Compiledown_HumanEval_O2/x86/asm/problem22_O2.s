	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movss	(%rdi), %xmm2                   # xmm2 = mem[0],zero,zero,zero
	movl	%esi, %r8d
	cmpl	$2, %esi
	jl	.LBB0_1
# %bb.2:
	leaq	-1(%r8), %rcx
	leaq	-2(%r8), %rdx
	movl	%ecx, %eax
	andl	$3, %eax
	cmpq	$3, %rdx
	jae	.LBB0_20
# %bb.3:
	movl	$1, %edx
	movaps	%xmm2, %xmm3
	jmp	.LBB0_5
.LBB0_1:
	movaps	%xmm2, %xmm0
	movaps	%xmm2, %xmm1
	jmp	.LBB0_8
.LBB0_20:
	andq	$-4, %rcx
	xorl	%edx, %edx
	movaps	%xmm2, %xmm3
	.p2align	4, 0x90
.LBB0_21:                               # =>This Inner Loop Header: Depth=1
	movss	4(%rdi,%rdx,4), %xmm0           # xmm0 = mem[0],zero,zero,zero
	movss	8(%rdi,%rdx,4), %xmm1           # xmm1 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm4
	minss	%xmm3, %xmm4
	maxss	%xmm2, %xmm0
	movaps	%xmm1, %xmm2
	minss	%xmm4, %xmm2
	maxss	%xmm0, %xmm1
	movss	12(%rdi,%rdx,4), %xmm0          # xmm0 = mem[0],zero,zero,zero
	movaps	%xmm0, %xmm4
	minss	%xmm2, %xmm4
	maxss	%xmm1, %xmm0
	movss	16(%rdi,%rdx,4), %xmm2          # xmm2 = mem[0],zero,zero,zero
	movaps	%xmm2, %xmm3
	minss	%xmm4, %xmm3
	maxss	%xmm0, %xmm2
	addq	$4, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_21
# %bb.4:
	incq	%rdx
.LBB0_5:
	movaps	%xmm3, %xmm0
	movaps	%xmm2, %xmm1
	testq	%rax, %rax
	je	.LBB0_8
# %bb.6:
	leaq	(%rdi,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movss	(%rcx,%rdx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	movaps	%xmm1, %xmm0
	minss	%xmm3, %xmm0
	maxss	%xmm2, %xmm1
	incq	%rdx
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm3
	cmpq	%rdx, %rax
	jne	.LBB0_7
.LBB0_8:
	testl	%esi, %esi
	jle	.LBB0_19
# %bb.9:
	subss	%xmm0, %xmm1
	cmpl	$4, %esi
	jae	.LBB0_12
# %bb.10:
	xorl	%ecx, %ecx
	jmp	.LBB0_11
.LBB0_12:
	movl	%r8d, %ecx
	andl	$-4, %ecx
	movaps	%xmm0, %xmm2
	shufps	$0, %xmm0, %xmm2                # xmm2 = xmm2[0,0],xmm0[0,0]
	movaps	%xmm1, %xmm3
	shufps	$0, %xmm1, %xmm3                # xmm3 = xmm3[0,0],xmm1[0,0]
	leaq	-4(%rcx), %rdx
	movq	%rdx, %rax
	shrq	$2, %rax
	incq	%rax
	testq	%rdx, %rdx
	je	.LBB0_13
# %bb.14:
	movq	%rax, %rsi
	andq	$-2, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	movups	(%rdi,%rdx,4), %xmm4
	movups	16(%rdi,%rdx,4), %xmm5
	subps	%xmm2, %xmm4
	divps	%xmm3, %xmm4
	movups	%xmm4, (%rdi,%rdx,4)
	subps	%xmm2, %xmm5
	divps	%xmm3, %xmm5
	movups	%xmm5, 16(%rdi,%rdx,4)
	addq	$8, %rdx
	addq	$-2, %rsi
	jne	.LBB0_15
# %bb.16:
	testb	$1, %al
	je	.LBB0_18
.LBB0_17:
	movups	(%rdi,%rdx,4), %xmm4
	subps	%xmm2, %xmm4
	divps	%xmm3, %xmm4
	movups	%xmm4, (%rdi,%rdx,4)
.LBB0_18:
	cmpq	%r8, %rcx
	je	.LBB0_19
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movss	(%rdi,%rcx,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	subss	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	movss	%xmm2, (%rdi,%rcx,4)
	incq	%rcx
	cmpq	%rcx, %r8
	jne	.LBB0_11
.LBB0_19:
	retq
.LBB0_13:
	xorl	%edx, %edx
	testb	$1, %al
	jne	.LBB0_17
	jmp	.LBB0_18
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
