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
	movl	$10, %eax
	testl	%esi, %esi
	jle	.LBB0_8
# %bb.1:
	movl	%esi, %r8d
	xorl	%r9d, %r9d
	movaps	.LCPI0_0(%rip), %xmm1           # xmm1 = [NaN,NaN,NaN,NaN]
	movq	%r8, %rdx
	movq	%rdi, %rcx
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addq	$4, %rcx
	decq	%rdx
	cmpq	%r8, %r9
	je	.LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movq	%r9, %rsi
	incq	%r9
	cmpq	%r8, %r9
	jae	.LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movss	(%rdi,%rsi,4), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm2, %xmm3
	subss	(%rcx,%rsi,4), %xmm3
	andps	%xmm1, %xmm3
	ucomiss	%xmm3, %xmm0
	ja	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_6 Depth=2
	incq	%rsi
	cmpq	%rsi, %rdx
	jne	.LBB0_6
	jmp	.LBB0_2
.LBB0_7:
	movl	$1, %eax
.LBB0_8:
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
