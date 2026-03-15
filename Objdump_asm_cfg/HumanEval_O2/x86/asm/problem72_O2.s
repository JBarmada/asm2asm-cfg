	.text
	.file	"code.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.long	0xbf800000                      # float -1
.LCPI0_1:
	.long	0x3f000000                      # float 0.5
.LCPI0_2:
	.long	0x42c80000                      # float 100
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movaps	%xmm0, %xmm4
	movaps	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	ucomiss	%xmm0, %xmm4
	movss	.LCPI0_0(%rip), %xmm3           # xmm3 = mem[0],zero,zero,zero
	jae	.LBB0_7
# %bb.1:
	movaps	%xmm4, %xmm0
	addss	%xmm1, %xmm0
	ucomiss	%xmm0, %xmm2
	jae	.LBB0_7
# %bb.2:
	movaps	%xmm4, %xmm5
	addss	%xmm2, %xmm5
	ucomiss	%xmm5, %xmm1
	jae	.LBB0_7
# %bb.3:
	addss	%xmm2, %xmm0
	mulss	.LCPI0_1(%rip), %xmm0
	movaps	%xmm0, %xmm3
	subss	%xmm4, %xmm3
	mulss	%xmm0, %xmm3
	movaps	%xmm0, %xmm4
	subss	%xmm1, %xmm4
	mulss	%xmm3, %xmm4
	subss	%xmm2, %xmm0
	mulss	%xmm4, %xmm0
	xorps	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jb	.LBB0_5
# %bb.4:
	sqrtss	%xmm0, %xmm0
	jmp	.LBB0_6
.LBB0_5:
	callq	sqrtf@PLT
.LBB0_6:
	mulss	.LCPI0_2(%rip), %xmm0
	callq	roundf@PLT
	movaps	%xmm0, %xmm3
	divss	.LCPI0_2(%rip), %xmm3
.LBB0_7:
	movaps	%xmm3, %xmm0
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
