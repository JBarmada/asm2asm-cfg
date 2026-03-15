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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebx
	leal	1(%rbx), %ebp
	movslq	%ebp, %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movl	$1, (%rax)
	testl	%ebx, %ebx
	je	.LBB0_7
# %bb.1:
	movl	$3, 4(%rax)
	cmpl	$2, %ebx
	jge	.LBB0_2
.LBB0_7:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_2:
	.cfi_def_cfa_offset 32
	movl	%ebp, %ecx
	movl	$2, %edx
	movl	$3, %esi
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	movl	-8(%rax,%rdx,4), %ebp
	leaq	1(%rdx), %rbx
	movl	%ebx, %edi
	shrl	%edi
	addl	%esi, %edi
	leal	(%rdi,%rbp), %esi
	incl	%esi
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	movl	%esi, (%rax,%rdx,4)
	movq	%rbx, %rdx
	cmpq	%rcx, %rbx
	je	.LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	testb	$1, %dl
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movl	%edx, %esi
	shrl	%esi
	incl	%esi
	leaq	1(%rdx), %rbx
	jmp	.LBB0_6
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
