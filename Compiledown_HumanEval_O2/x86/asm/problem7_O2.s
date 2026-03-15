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
	movq	%rsi, %r14
	movq	%rdi, %rbx
	xorl	%ecx, %ecx
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
	xorl	%eax, %eax
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	testl	%edx, %edx
	je	.LBB0_4
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	incq	%rbx
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movzbl	(%rbx), %edx
	cmpl	$40, %edx
	je	.LBB0_5
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	cmpl	$41, %edx
	jne	.LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	decl	%ecx
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	%r15d, %r12
	incl	%r15d
	leaq	4(,%r12,4), %rsi
	movq	%rax, %rdi
	callq	realloc@PLT
	movl	%ebp, (%rax,%r12,4)
	xorl	%ecx, %ecx
	xorl	%ebp, %ebp
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	cmpl	%ebp, %ecx
	leal	1(%rcx), %ecx
	cmovgel	%ecx, %ebp
                                        # kill: def $ecx killed $ecx def $rcx
	incq	%rbx
	jmp	.LBB0_1
.LBB0_4:
	movl	%r15d, (%r14)
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
