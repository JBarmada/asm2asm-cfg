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
	movl	%edi, %ebp
	movslq	%edi, %rbx
	leaq	(,%rbx,4), %rdi
	callq	malloc@PLT
	testl	%ebx, %ebx
	jle	.LBB0_5
# %bb.1:
	movl	%ebp, %r8d
	cmpl	$1, %ebp
	jne	.LBB0_6
# %bb.2:
	xorl	%edx, %edx
	movl	$1, %esi
	movl	$1, %edi
	jmp	.LBB0_3
.LBB0_6:
	movl	%r8d, %ecx
	andl	$-2, %ecx
	negq	%rcx
	xorl	%edx, %edx
	movl	$1, %esi
	movl	$1, %edi
	movl	$2, %ebx
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	leal	-1(%rbx), %ebp
	addl	%ebx, %edx
	decl	%edx
	movl	%edx, -4(%rax,%rdi,4)
	addl	%ebx, %edx
	imull	%ebx, %esi
	imull	%ebp, %esi
	movl	%esi, (%rax,%rdi,4)
	addl	$2, %ebx
	leaq	(%rcx,%rdi), %rbp
	addq	$2, %rbp
	addq	$2, %rdi
	cmpq	$1, %rbp
	jne	.LBB0_7
.LBB0_3:
	testb	$1, %r8b
	je	.LBB0_5
# %bb.4:
	addl	%edi, %edx
	imull	%edi, %esi
	testb	$1, %dil
	cmovnel	%edx, %esi
	movl	%esi, -4(%rax,%rdi,4)
.LBB0_5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
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
