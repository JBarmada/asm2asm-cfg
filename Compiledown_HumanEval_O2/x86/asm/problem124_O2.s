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
	movq	%rdx, %r14
	movq	%rsi, %rax
	movl	$1, (%rdx)
	movl	$1, (%rsi)
	cmpl	$1, %edi
	jne	.LBB0_1
.LBB0_6:
	cmpl	$2, (%r14)
	jl	.LBB0_13
# %bb.7:
	movl	$1, %ecx
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_8 Depth=1
	movslq	%esi, %rsi
	movl	%edx, (%rax,%rsi,4)
	incq	%rcx
	movslq	(%r14), %rdx
	cmpq	%rdx, %rcx
	jge	.LBB0_13
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
	movl	(%rax,%rcx,4), %edx
	movq	%rcx, %rsi
	.p2align	4, 0x90
.LBB0_9:                                #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	-1(%rsi), %rdi
	movl	%edi, %ebp
	movl	(%rax,%rbp,4), %ebp
	cmpl	%edx, %ebp
	jle	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	movl	%ebp, (%rax,%rsi,4)
	leaq	1(%rdi), %rbp
	movq	%rdi, %rsi
	cmpq	$1, %rbp
	jg	.LBB0_9
# %bb.11:                               #   in Loop: Header=BB0_8 Depth=1
	xorl	%esi, %esi
	jmp	.LBB0_12
.LBB0_13:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_1:
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	movl	$10, %ebp
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_2 Depth=1
	movl	%ebx, %ecx
	shrl	$31, %ecx
	addl	%ebx, %ecx
	sarl	%ecx
	movl	%ecx, %ebx
.LBB0_15:                               #   in Loop: Header=BB0_2 Depth=1
	cmpl	$1, %ebx
	je	.LBB0_6
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	%ebx, %ecx
	andl	$-2147483647, %ecx              # imm = 0x80000001
	cmpl	$1, %ecx
	jne	.LBB0_14
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	(%r14), %ecx
	cmpl	%ebp, %ecx
	jl	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	addl	%ebp, %ebp
	movslq	%ebp, %rsi
	shlq	$2, %rsi
	movq	%rax, %rdi
	callq	realloc@PLT
	movl	(%r14), %ecx
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	leal	1(%rcx), %edx
	movl	%edx, (%r14)
	movslq	%ecx, %rcx
	movl	%ebx, (%rax,%rcx,4)
	leal	(%rbx,%rbx,2), %ebx
	incl	%ebx
	jmp	.LBB0_15
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
