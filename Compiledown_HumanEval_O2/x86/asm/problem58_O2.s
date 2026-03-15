	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	movb	$1, %al
	cmpl	$2, %esi
	jl	.LBB0_10
# %bb.1:
	movl	%esi, %r9d
	movss	(%rdi), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	leaq	-1(%r9), %r8
	cmpq	$8, %r8
	jae	.LBB0_3
# %bb.2:
	xorl	%eax, %eax
	movl	$1, %ecx
	xorl	%edx, %edx
	jmp	.LBB0_7
.LBB0_3:
	movq	%r8, %rsi
	andq	$-8, %rsi
	leaq	1(%rsi), %rcx
	shufps	$0, %xmm1, %xmm1                # xmm1 = xmm1[0,0,0,0]
	xorps	%xmm8, %xmm8
	xorl	%eax, %eax
	xorps	%xmm9, %xmm9
	xorps	%xmm3, %xmm3
	xorps	%xmm4, %xmm4
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movaps	%xmm1, %xmm0
	movups	4(%rdi,%rax,4), %xmm5
	shufps	$3, %xmm5, %xmm0                # xmm0 = xmm0[3,0],xmm5[0,0]
	shufps	$152, %xmm5, %xmm0              # xmm0 = xmm0[0,2],xmm5[1,2]
	movaps	%xmm5, %xmm6
	movaps	%xmm0, %xmm2
	cmpltps	%xmm5, %xmm2
	cmpltps	%xmm0, %xmm5
	movups	20(%rdi,%rax,4), %xmm1
	shufps	$3, %xmm1, %xmm6                # xmm6 = xmm6[3,0],xmm1[0,0]
	shufps	$152, %xmm1, %xmm6              # xmm6 = xmm6[0,2],xmm1[1,2]
	movaps	%xmm1, %xmm0
	cmpltps	%xmm6, %xmm0
	cmpltps	%xmm1, %xmm6
	movaps	%xmm2, %xmm7
	andnps	%xmm3, %xmm7
	movaps	%xmm7, %xmm3
	psubd	%xmm2, %xmm3
	movaps	%xmm6, %xmm2
	andnps	%xmm4, %xmm2
	movaps	%xmm2, %xmm4
	psubd	%xmm6, %xmm4
	movaps	%xmm5, %xmm2
	andnps	%xmm8, %xmm2
	movaps	%xmm2, %xmm8
	psubd	%xmm5, %xmm8
	movaps	%xmm0, %xmm2
	andnps	%xmm9, %xmm2
	movaps	%xmm2, %xmm9
	psubd	%xmm0, %xmm9
	addq	$8, %rax
	cmpq	%rax, %rsi
	jne	.LBB0_4
# %bb.5:
	orps	%xmm4, %xmm3
	pxor	%xmm0, %xmm0
	pcmpeqd	%xmm0, %xmm3
	movmskps	%xmm3, %eax
	xorl	%edx, %edx
	cmpl	$15, %eax
	setne	%dl
	orps	%xmm9, %xmm8
	pcmpeqd	%xmm0, %xmm8
	movmskps	%xmm8, %r10d
	xorl	%eax, %eax
	cmpl	$15, %r10d
	setne	%al
	cmpq	%rsi, %r8
	je	.LBB0_9
# %bb.6:
	shufps	$255, %xmm1, %xmm1              # xmm1 = xmm1[3,3,3,3]
.LBB0_7:
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movss	(%rdi,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm0
	cmoval	%esi, %edx
	ucomiss	%xmm0, %xmm1
	cmoval	%esi, %eax
	incq	%rcx
	movaps	%xmm0, %xmm1
	cmpq	%rcx, %r9
	jne	.LBB0_8
.LBB0_9:
	addl	%eax, %edx
	cmpl	$2, %edx
	setne	%al
.LBB0_10:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
