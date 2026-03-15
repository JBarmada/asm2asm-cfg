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
	movl	%esi, %ebp
	movq	%rdi, %rbx
	leal	1(%rbp), %eax
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	calloc@PLT
	testl	%ebp, %ebp
	jle	.LBB0_1
# %bb.2:
	movl	%ebp, %r8d
	cmpl	$1, %ebp
	jne	.LBB0_7
# %bb.3:
	movl	$-1, %ebp
	xorl	%edx, %edx
.LBB0_4:
	testb	$1, %r8b
	je	.LBB0_6
# %bb.5:
	movslq	(%rbx,%rdx,4), %rcx
	movl	(%rax,%rcx,4), %edx
	incl	%edx
	cmpl	%ebp, %ecx
	movl	%ebp, %esi
	cmovgl	%ecx, %esi
	movl	%edx, (%rax,%rcx,4)
	cmpl	%ecx, %edx
	cmovgel	%esi, %ebp
	jmp	.LBB0_6
.LBB0_1:
	movl	$-1, %ebp
.LBB0_6:
	movq	%rax, %rdi
	callq	free@PLT
	movl	%ebp, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_7:
	.cfi_def_cfa_offset 32
	movl	%r8d, %r9d
	andl	$-2, %r9d
	movl	$-1, %ebp
	xorl	%edx, %edx
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	cmpl	%edi, %ecx
	cmovgel	%esi, %ebp
	addq	$2, %rdx
	cmpq	%rdx, %r9
	je	.LBB0_4
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	movslq	(%rbx,%rdx,4), %rdi
	movl	(%rax,%rdi,4), %ecx
	incl	%ecx
	movl	%ecx, (%rax,%rdi,4)
	movl	%edi, %esi
	cmpl	%ebp, %edi
	jg	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	movl	%ebp, %esi
.LBB0_10:                               #   in Loop: Header=BB0_8 Depth=1
	cmpl	%edi, %ecx
	cmovgel	%esi, %ebp
	movslq	4(%rbx,%rdx,4), %rdi
	movl	(%rax,%rdi,4), %ecx
	incl	%ecx
	movl	%ecx, (%rax,%rdi,4)
	movl	%edi, %esi
	cmpl	%ebp, %edi
	jg	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	movl	%ebp, %esi
	jmp	.LBB0_12
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
