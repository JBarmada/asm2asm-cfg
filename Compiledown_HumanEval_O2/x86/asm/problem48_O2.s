	.text
	.file	"code.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.long	0x3f000000                      # float 0.5
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	testl	%esi, %esi
	jle	.LBB0_4
# %bb.1:
	movl	%esi, %r8d
	xorl	%r9d, %r9d
	movq	%r8, %r10
	movq	%rdi, %rdx
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	addq	$4, %rdx
	decq	%r10
	cmpq	%r8, %r9
	je	.LBB0_4
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	movq	%r9, %rax
	incq	%r9
	cmpq	%r8, %r9
	jae	.LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	movl	$1, %ecx
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=2
	incq	%rcx
	cmpq	%rcx, %r10
	je	.LBB0_3
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	ucomiss	%xmm1, %xmm0
	jbe	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	movss	%xmm1, (%rdi,%rax,4)
	movss	%xmm0, (%rdx,%rcx,4)
	jmp	.LBB0_9
.LBB0_4:
	movl	%esi, %eax
	andl	$-2147483647, %eax              # imm = 0x80000001
	cmpl	$1, %eax
	jne	.LBB0_10
# %bb.5:
	shrl	%esi
	movss	(%rdi,%rsi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	retq
.LBB0_10:
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	cltq
	movss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	addss	-4(%rdi,%rax,4), %xmm0
	mulss	.LCPI0_0(%rip), %xmm0
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
