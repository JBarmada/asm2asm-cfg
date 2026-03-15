	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testl	%esi, %esi
	jle	.LBB0_8
# %bb.1:
	movq	%rdi, %rbx
	movl	%esi, %r14d
	leaq	(,%r14,4), %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_8
# %bb.2:
	movl	(%rbx), %edx
	leaq	-1(%r14), %rcx
	movl	%r14d, %r8d
	andl	$3, %r8d
	cmpq	$3, %rcx
	jae	.LBB0_10
# %bb.3:
	xorl	%esi, %esi
.LBB0_4:
	testq	%r8, %r8
	je	.LBB0_9
# %bb.5:
	leaq	(%rax,%rsi,4), %rdi
	leaq	(%rbx,%rsi,4), %rsi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movl	(%rsi,%rbx,4), %ecx
	cmpl	%edx, %ecx
	cmovgl	%ecx, %edx
	movl	%edx, (%rdi,%rbx,4)
	incq	%rbx
	cmpq	%rbx, %r8
	jne	.LBB0_6
	jmp	.LBB0_9
.LBB0_8:
	xorl	%eax, %eax
.LBB0_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB0_10:
	.cfi_def_cfa_offset 32
	andl	$-4, %r14d
	xorl	%esi, %esi
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%edx, 12(%rax,%rsi,4)
	addq	$4, %rsi
	cmpq	%rsi, %r14
	je	.LBB0_4
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	movl	(%rbx,%rsi,4), %ecx
	cmpl	%edx, %ecx
	cmovgl	%ecx, %edx
	movl	%edx, (%rax,%rsi,4)
	movl	4(%rbx,%rsi,4), %edi
	cmpl	%edx, %edi
	jg	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%edx, %edi
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%edi, 4(%rax,%rsi,4)
	movl	8(%rbx,%rsi,4), %ecx
	cmpl	%edi, %ecx
	jg	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%edi, %ecx
.LBB0_16:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%ecx, 8(%rax,%rsi,4)
	movl	12(%rbx,%rsi,4), %edx
	cmpl	%ecx, %edx
	jg	.LBB0_11
# %bb.17:                               #   in Loop: Header=BB0_12 Depth=1
	movl	%ecx, %edx
	jmp	.LBB0_11
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
