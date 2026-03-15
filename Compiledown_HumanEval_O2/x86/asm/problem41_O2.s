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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %r8d
	movb	$1, %al
	movl	$2, %r14d
	movl	$1, %r15d
	xorl	%r9d, %r9d
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	movl	%eax, %r10d
	movq	%r9, %r11
	incq	%r9
	movq	%r15, %r12
	movq	%r14, %rcx
	cmpq	%r8, %r9
	setb	%al
	jb	.LBB0_6
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%r14
	incq	%r15
	cmpq	%r8, %r9
	jne	.LBB0_4
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	incq	%rcx
	cmpq	%r8, %r12
	je	.LBB0_3
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	movq	%r12, %rdx
	incq	%r12
	cmpl	%esi, %r12d
	jge	.LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	movl	(%rdi,%rdx,4), %ebp
	addl	(%rdi,%r11,4), %ebp
	movq	%rcx, %rdx
	.p2align	4, 0x90
.LBB0_9:                                #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	(%rdi,%rdx,4), %ebx
	addl	%ebp, %ebx
	je	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_9 Depth=3
	incq	%rdx
	cmpl	%esi, %edx
	jl	.LBB0_9
	jmp	.LBB0_5
.LBB0_10:
	movl	%r10d, %eax
	jmp	.LBB0_11
.LBB0_1:
	xorl	%eax, %eax
.LBB0_11:
	andb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
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
