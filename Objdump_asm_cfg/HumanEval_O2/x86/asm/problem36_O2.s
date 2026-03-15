	.text
	.file	"code.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.long	0xc61c4000                      # float -1.0E+4
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
	movl	%esi, %ecx
	leaq	-1(%rcx), %rdx
	movl	%ecx, %eax
	andl	$3, %eax
	cmpq	$3, %rdx
	jae	.LBB0_8
# %bb.3:
	movss	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	xorl	%edx, %edx
	jmp	.LBB0_4
.LBB0_1:
	movss	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	retq
.LBB0_8:
	andl	$-4, %ecx
	movss	.LCPI0_0(%rip), %xmm1           # xmm1 = mem[0],zero,zero,zero
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movss	(%rdi,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	maxss	%xmm1, %xmm0
	movss	4(%rdi,%rdx,4), %xmm1           # xmm1 = mem[0],zero,zero,zero
	maxss	%xmm0, %xmm1
	movss	8(%rdi,%rdx,4), %xmm0           # xmm0 = mem[0],zero,zero,zero
	maxss	%xmm1, %xmm0
	movss	12(%rdi,%rdx,4), %xmm1          # xmm1 = mem[0],zero,zero,zero
	maxss	%xmm0, %xmm1
	addq	$4, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB0_9
.LBB0_4:
	movaps	%xmm1, %xmm0
	testq	%rax, %rax
	je	.LBB0_7
# %bb.5:
	leaq	(%rdi,%rdx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movss	(%rcx,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	maxss	%xmm1, %xmm0
	incq	%rdx
	movaps	%xmm0, %xmm1
	cmpq	%rdx, %rax
	jne	.LBB0_6
.LBB0_7:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
