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
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movl	%esi, 20(%rsp)                  # 4-byte Spill
	movq	%rdi, 48(%rsp)                  # 8-byte Spill
	callq	strlen@PLT
	incq	%rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	%rax, %rbx
	xorl	%r14d, %r14d
	callq	__ctype_b_loc@PLT
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movl	$0, 4(%rsp)                     # 4-byte Folded Spill
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	leal	1(%r14), %r12d
	xorl	%r13d, %r13d
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	incq	%r14
	cmpq	%r14, 40(%rsp)                  # 8-byte Folded Reload
	je	.LBB0_9
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	32(%rsp), %rax                  # 8-byte Reload
	movq	(%rax), %rbp
	movq	48(%rsp), %rax                  # 8-byte Reload
	movsbq	(%rax,%r14), %r15
	testb	$32, 1(%rbp,%r15,2)
	jne	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	testb	%r15b, %r15b
	je	.LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%r14d, %eax
	subl	%r12d, %eax
	cltq
	movb	%r15b, (%rbx,%rax)
	movl	$11, %edx
	leaq	.L.str(%rip), %rdi
	movl	%r15d, %esi
	callq	memchr@PLT
	testq	%rax, %rax
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_1 Depth=1
	movzbl	%r15b, %eax
	movzwl	(%rbp,%rax,2), %eax
	btl	$10, %eax
	adcl	$0, %r13d
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	cmpl	20(%rsp), %r13d                 # 4-byte Folded Reload
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	%r14d, %eax
	subl	%r12d, %eax
	cltq
	movb	$0, (%rbx,%rax)
	movl	4(%rsp), %eax                   # 4-byte Reload
	movslq	%eax, %r15
	incl	%eax
	movl	%eax, 4(%rsp)                   # 4-byte Spill
	leaq	8(,%r15,8), %rsi
	movq	8(%rsp), %rdi                   # 8-byte Reload
	callq	realloc@PLT
	movq	%rbx, %rbp
	movq	%rax, %rbx
	movq	%rbp, %rdi
	callq	strlen@PLT
	leaq	1(%rax), %rdi
	callq	malloc@PLT
	movq	%rbx, 8(%rsp)                   # 8-byte Spill
	movq	%rax, (%rbx,%r15,8)
	movq	%rbp, %rbx
	movq	%rax, %rdi
	movq	%rbp, %rsi
	callq	strcpy@PLT
	jmp	.LBB0_5
.LBB0_9:
	movq	%rbx, %rdi
	callq	free@PLT
	movq	24(%rsp), %rax                  # 8-byte Reload
	movl	4(%rsp), %ecx                   # 4-byte Reload
	movl	%ecx, (%rax)
	movq	8(%rsp), %rax                   # 8-byte Reload
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"aeiouAEIOU"
	.size	.L.str, 11

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
