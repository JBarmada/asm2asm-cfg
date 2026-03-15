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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, %r14
	movl	%ecx, %r15d
	movq	%rdx, %rbx
	movl	%esi, %r12d
	movq	%rdi, %r13
	movslq	%esi, %rbp
	leaq	(,%rbp,4), %rdi
	callq	malloc@PLT
	testl	%ebp, %ebp
	jle	.LBB0_1
# %bb.2:
	movl	%r12d, %r8d
	movl	%r15d, %esi
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_3 Depth=1
	movslq	%r9d, %rdx
	incl	%r9d
	movl	%ecx, (%rax,%rdx,4)
.LBB0_17:                               #   in Loop: Header=BB0_3 Depth=1
	incq	%rdi
	cmpq	%r8, %rdi
	je	.LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_15 Depth 2
	testl	%r9d, %r9d
	jle	.LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movl	(%r13,%rdi,4), %ecx
	movl	%r9d, %ebp
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%ecx, (%rax,%rdx,4)
	je	.LBB0_17
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	incq	%rdx
	cmpq	%rdx, %rbp
	jne	.LBB0_5
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	testl	%r15d, %r15d
	jle	.LBB0_17
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	movl	(%r13,%rdi,4), %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_15:                               #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	(%rbx,%rdx,4), %ecx
	je	.LBB0_16
# %bb.14:                               #   in Loop: Header=BB0_15 Depth=2
	incq	%rdx
	cmpq	%rdx, %rsi
	jne	.LBB0_15
	jmp	.LBB0_17
.LBB0_9:
	cmpl	$2, %r9d
	jl	.LBB0_30
# %bb.10:
	leal	-1(%r9), %r8d
	xorl	%esi, %esi
	movl	%r8d, %r11d
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_29:                               #   in Loop: Header=BB0_11 Depth=1
	incl	%esi
	decl	%r11d
	cmpl	%r8d, %esi
	je	.LBB0_30
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	movl	%esi, %ecx
	notl	%ecx
	addl	%r9d, %ecx
	testl	%ecx, %ecx
	jle	.LBB0_29
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%r8d, %r10d
	subl	%esi, %r10d
	movl	(%rax), %edx
	cmpl	$1, %r10d
	jne	.LBB0_18
# %bb.13:                               #   in Loop: Header=BB0_11 Depth=1
	xorl	%ebx, %ebx
.LBB0_26:                               #   in Loop: Header=BB0_11 Depth=1
	testb	$1, %r10b
	je	.LBB0_29
# %bb.27:                               #   in Loop: Header=BB0_11 Depth=1
	movl	4(%rax,%rbx,4), %ecx
	cmpl	%ecx, %edx
	jle	.LBB0_29
# %bb.28:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%ecx, (%rax,%rbx,4)
	movl	%edx, 4(%rax,%rbx,4)
	jmp	.LBB0_29
	.p2align	4, 0x90
.LBB0_18:                               #   in Loop: Header=BB0_11 Depth=1
	movl	%r11d, %edi
	andl	$-2, %edi
	xorl	%ecx, %ecx
	jmp	.LBB0_19
	.p2align	4, 0x90
.LBB0_24:                               #   in Loop: Header=BB0_19 Depth=2
	movl	%ebp, 4(%rax,%rcx,4)
	movl	%edx, 8(%rax,%rcx,4)
.LBB0_25:                               #   in Loop: Header=BB0_19 Depth=2
	movq	%rbx, %rcx
	cmpq	%rbx, %rdi
	je	.LBB0_26
.LBB0_19:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%rax,%rcx,4), %ebp
	cmpl	%ebp, %edx
	jle	.LBB0_20
# %bb.21:                               #   in Loop: Header=BB0_19 Depth=2
	movl	%ebp, (%rax,%rcx,4)
	movl	%edx, 4(%rax,%rcx,4)
	jmp	.LBB0_22
	.p2align	4, 0x90
.LBB0_20:                               #   in Loop: Header=BB0_19 Depth=2
	movl	%ebp, %edx
.LBB0_22:                               #   in Loop: Header=BB0_19 Depth=2
	leaq	2(%rcx), %rbx
	movl	8(%rax,%rcx,4), %ebp
	cmpl	%ebp, %edx
	jg	.LBB0_24
# %bb.23:                               #   in Loop: Header=BB0_19 Depth=2
	movl	%ebp, %edx
	jmp	.LBB0_25
.LBB0_1:
	xorl	%r9d, %r9d
.LBB0_30:
	movl	%r9d, (%r14)
	addq	$8, %rsp
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
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
