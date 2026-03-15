	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%esi, %esi
	jle	.LBB0_16
# %bb.1:
	movl	%esi, %r10d
	movl	$1, %r9d
	xorl	%r8d, %r8d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	incq	%r9
	cmpq	%r10, %r8
	je	.LBB0_16
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #       Child Loop BB0_7 Depth 3
                                        #       Child Loop BB0_10 Depth 3
	movq	%r8, %r11
	incq	%r8
	cmpq	%r10, %r8
	jae	.LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%r9, %rcx
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_5 Depth=2
	movl	%r15d, (%rdi,%r11,4)
	movl	%r14d, (%rdi,%rcx,4)
.LBB0_15:                               #   in Loop: Header=BB0_5 Depth=2
	incq	%rcx
	cmpq	%r10, %rcx
	je	.LBB0_2
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
                                        #       Child Loop BB0_10 Depth 3
	movl	(%rdi,%r11,4), %r14d
	xorl	%eax, %eax
	movl	$0, %esi
	testl	%r14d, %r14d
	jle	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	xorl	%esi, %esi
	movl	%r14d, %edx
	movl	%r14d, %ebx
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %ebp
	andl	$1, %ebp
	addl	%ebp, %esi
	shrl	%ebx
	cmpl	$2, %edx
	movl	%ebx, %edx
	jae	.LBB0_7
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=2
	movl	(%rdi,%rcx,4), %r15d
	testl	%r15d, %r15d
	jle	.LBB0_11
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=2
	xorl	%eax, %eax
	movl	%r15d, %edx
	movl	%r15d, %ebp
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_3 Depth=1
                                        #     Parent Loop BB0_5 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %ebx
	andl	$1, %ebx
	addl	%ebx, %eax
	shrl	%ebp
	cmpl	$1, %edx
	movl	%ebp, %edx
	ja	.LBB0_10
.LBB0_11:                               #   in Loop: Header=BB0_5 Depth=2
	cmpl	%esi, %eax
	jb	.LBB0_14
# %bb.12:                               #   in Loop: Header=BB0_5 Depth=2
	jne	.LBB0_15
# %bb.13:                               #   in Loop: Header=BB0_5 Depth=2
	cmpl	%r14d, %r15d
	jl	.LBB0_14
	jmp	.LBB0_15
.LBB0_16:
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
