	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movaps	%xmm2, 16(%rsp)                 # 16-byte Spill
	movaps	%xmm1, 32(%rsp)                 # 16-byte Spill
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	callq	roundf@PLT
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	movaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	roundf@PLT
	movss	%xmm0, 4(%rsp)                  # 4-byte Spill
	movaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	roundf@PLT
	movss	8(%rsp), %xmm4                  # 4-byte Reload
                                        # xmm4 = mem[0],zero,zero,zero
	xorl	%eax, %eax
	movss	12(%rsp), %xmm1                 # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm4, %xmm1
	jne	.LBB0_4
	jp	.LBB0_4
# %bb.1:
	movaps	32(%rsp), %xmm2                 # 16-byte Reload
	movss	4(%rsp), %xmm1                  # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm2, %xmm1
	jne	.LBB0_4
	jp	.LBB0_4
# %bb.2:
	movaps	16(%rsp), %xmm3                 # 16-byte Reload
	ucomiss	%xmm3, %xmm0
	jne	.LBB0_4
	jp	.LBB0_4
# %bb.3:
	movaps	%xmm4, %xmm0
	addss	%xmm2, %xmm0
	movaps	%xmm4, %xmm1
	addss	%xmm3, %xmm1
	cmpeqps	%xmm2, %xmm1
	cmpeqps	%xmm3, %xmm0
	orps	%xmm1, %xmm0
	movd	%xmm0, %eax
	addss	%xmm3, %xmm2
	ucomiss	%xmm4, %xmm2
	setnp	%cl
	sete	%dl
	andb	%cl, %dl
	orb	%al, %dl
	movzbl	%dl, %eax
	andl	$1, %eax
.LBB0_4:
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
