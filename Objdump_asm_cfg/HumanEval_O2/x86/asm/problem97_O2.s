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
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movl	%edi, %r15d
	movslq	%edi, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	movq	%rax, %rcx
	movl	$0, (%r14)
	cmpl	$3, %ebx
	jl	.LBB0_9
# %bb.1:
	movl	$2, %esi
	xorl	%r8d, %r8d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	movslq	%r8d, %rax
	movl	%esi, (%rcx,%rax,4)
	incl	%r8d
	movl	%r8d, (%r14)
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%esi
	cmpl	%r15d, %esi
	je	.LBB0_9
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	testl	%r8d, %r8d
	jle	.LBB0_7
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%r8d, %ebx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rcx,%rbp,4), %edi
	movl	%edi, %eax
	imull	%edi, %eax
	cmpl	%esi, %eax
	ja	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	movl	%esi, %eax
	cltd
	idivl	%edi
	testl	%edx, %edx
	je	.LBB0_8
# %bb.4:                                #   in Loop: Header=BB0_5 Depth=2
	incq	%rbp
	cmpq	%rbp, %rbx
	jne	.LBB0_5
	jmp	.LBB0_7
.LBB0_9:
	movq	%rcx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
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
