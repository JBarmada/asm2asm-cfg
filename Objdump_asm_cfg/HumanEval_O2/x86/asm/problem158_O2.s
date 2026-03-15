	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_1:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	mulss	%xmm1, %xmm1
	mulss	%xmm0, %xmm0
	movaps	%xmm0, %xmm3
	addss	%xmm1, %xmm3
	mulss	%xmm2, %xmm2
	subss	%xmm2, %xmm3
	andps	.LCPI0_0(%rip), %xmm3
	cvtss2sd	%xmm3, %xmm4
	movl	$1, %eax
	movsd	.LCPI0_1(%rip), %xmm3           # xmm3 = mem[0],zero
	ucomisd	%xmm4, %xmm3
	ja	.LBB0_4
# %bb.1:
	movaps	%xmm0, %xmm4
	addss	%xmm2, %xmm4
	subss	%xmm1, %xmm4
	andps	.LCPI0_0(%rip), %xmm4
	cvtss2sd	%xmm4, %xmm4
	ucomisd	%xmm4, %xmm3
	ja	.LBB0_4
# %bb.2:
	addss	%xmm2, %xmm1
	subss	%xmm0, %xmm1
	andps	.LCPI0_0(%rip), %xmm1
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm3
	ja	.LBB0_4
# %bb.3:
	xorl	%eax, %eax
.LBB0_4:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
