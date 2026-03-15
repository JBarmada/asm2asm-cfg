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
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movw	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movw	$0, 8(%rsp)
	movq	$0, (%rsp)
	movzbl	(%rdi), %ebx
	testb	%bl, %bl
	je	.LBB0_8
# %bb.1:
	movq	%rdi, %rbp
	callq	__ctype_b_loc@PLT
	movq	(%rax), %rax
	incq	%rbp
	xorl	%r8d, %r8d
	movl	$1, %edx
	xorl	%edi, %edi
	xorl	%esi, %esi
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	testl	%esi, %esi
	sete	%cl
	testl	%edi, %edi
	setg	%bl
	testb	%bl, %cl
	cmovnel	%edx, %esi
	cmovnel	%r8d, %edi
	movl	%edi, %ecx
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	movzbl	(%rbp), %ebx
	incq	%rbp
	movl	%ecx, %edi
	testb	%bl, %bl
	je	.LBB0_8
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsbq	%bl, %rcx
	testb	$8, 1(%rax,%rcx,2)
	je	.LBB0_6
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	leal	1(%rdi), %ecx
	movslq	%edi, %rdi
	testl	%esi, %esi
	je	.LBB0_4
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	movb	%bl, (%rsp,%rdi)
	movl	$1, %esi
	jmp	.LBB0_7
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	movb	%bl, 16(%rsp,%rdi)
	xorl	%esi, %esi
	jmp	.LBB0_7
.LBB0_8:
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, %rbx
	movq	%rsp, %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	addl	%ebx, %eax
	subl	%eax, %r14d
	movl	%r14d, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
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
