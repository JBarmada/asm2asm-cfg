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
	movl	%edi, %r14d
	movl	$8, %edi
	callq	malloc@PLT
	movq	$0, (%rax)
	testl	%r14d, %r14d
	jle	.LBB0_9
# %bb.1:
	movl	$1, %esi
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%r9d
	movl	%r9d, 4(%rax)
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	leal	1(%rsi), %ecx
	cmpl	%r14d, %esi
	movl	%ecx, %esi
	je	.LBB0_9
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	%esi, %edi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%rcx,%rcx,4), %ecx
	movslq	%edi, %rbp
	imulq	$1717986919, %rbp, %rdi         # imm = 0x66666667
	movq	%rdi, %rbx
	shrq	$63, %rbx
	sarq	$34, %rdi
	addl	%ebx, %edi
	leal	(%rdi,%rdi), %ebx
	leal	(%rbx,%rbx,4), %ebx
	movl	%ebp, %edx
	subl	%ebx, %edx
	leal	(%rdx,%rcx,2), %ecx
	addl	$9, %ebp
	cmpl	$18, %ebp
	ja	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	cmpl	%ecx, %esi
	jne	.LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	testb	$1, %sil
	jne	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%r8d
	movl	%r8d, (%rax)
	jmp	.LBB0_8
.LBB0_9:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
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
