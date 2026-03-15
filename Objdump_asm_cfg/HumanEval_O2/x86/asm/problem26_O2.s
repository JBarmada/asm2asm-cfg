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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movl	%edi, %ebp
	movl	$256, %edi                      # imm = 0x100
	callq	malloc@PLT
	movq	%rax, %rcx
	movl	$0, (%r14)
	xorl	%esi, %esi
	cmpl	$4, %ebp
	jge	.LBB0_1
.LBB0_7:
	cmpl	$1, %ebp
	jle	.LBB0_9
# %bb.8:
	leal	1(%rsi), %eax
	movl	%eax, (%r14)
	movslq	%esi, %rax
	movl	%ebp, (%rcx,%rax,4)
.LBB0_9:
	movq	%rcx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_1:
	.cfi_def_cfa_offset 32
	movl	$2, %edi
	xorl	%esi, %esi
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%edi
	movl	%edi, %eax
	imull	%edi, %eax
	cmpl	%ebp, %eax
	jg	.LBB0_7
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	movl	%ebp, %eax
	cltd
	idivl	%edi
	testl	%edx, %edx
	jne	.LBB0_6
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movslq	%esi, %rax
	leaq	(%rcx,%rax,4), %rbx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebp, %eax
	cltd
	idivl	%edi
	movl	%edi, (%rbx)
	movl	%eax, %ebp
	cltd
	idivl	%edi
	addq	$4, %rbx
	incl	%esi
	testl	%edx, %edx
	je	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%esi, (%r14)
	jmp	.LBB0_6
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
