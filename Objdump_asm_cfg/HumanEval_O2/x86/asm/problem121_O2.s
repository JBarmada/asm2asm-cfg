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
                                        # kill: def $esi killed $esi def $rsi
	cmpl	$2, %esi
	jl	.LBB0_17
# %bb.1:
	leal	-1(%rsi), %r8d
	xorl	%r9d, %r9d
	movl	%r8d, %r10d
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	incl	%r9d
	decl	%r10d
	cmpl	%r8d, %r9d
	je	.LBB0_17
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
	movl	%r10d, %r10d
	movl	%r9d, %eax
	notl	%eax
	addl	%esi, %eax
	testl	%eax, %eax
	jle	.LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movl	(%rdi), %r14d
	cmpl	$1, %r10d
	jne	.LBB0_9
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	xorl	%eax, %eax
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	testb	$1, %r10b
	je	.LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	movl	4(%rdi,%rax,4), %ebp
	cmpl	%ebp, %r14d
	jle	.LBB0_2
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	movl	%ebp, (%rdi,%rax,4)
	movl	%r14d, 4(%rdi,%rax,4)
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_3 Depth=1
	movl	%r10d, %r11d
	andl	$-2, %r11d
	xorl	%ebx, %ebx
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_12 Depth=2
	movl	%ebp, 4(%rdi,%rbx,4)
	movl	%r14d, 8(%rdi,%rbx,4)
.LBB0_11:                               #   in Loop: Header=BB0_12 Depth=2
	movq	%rax, %rbx
	cmpq	%rax, %r11
	je	.LBB0_6
.LBB0_12:                               #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%rdi,%rbx,4), %eax
	cmpl	%eax, %r14d
	jle	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	movl	%eax, (%rdi,%rbx,4)
	movl	%r14d, 4(%rdi,%rbx,4)
	jmp	.LBB0_15
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=2
	movl	%eax, %r14d
.LBB0_15:                               #   in Loop: Header=BB0_12 Depth=2
	leaq	2(%rbx), %rax
	movl	8(%rdi,%rbx,4), %ebp
	cmpl	%ebp, %r14d
	jg	.LBB0_10
# %bb.16:                               #   in Loop: Header=BB0_12 Depth=2
	movl	%ebp, %r14d
	jmp	.LBB0_11
.LBB0_17:
	testl	%edx, %edx
	jle	.LBB0_34
# %bb.18:
	subl	%edx, %esi
	movslq	%esi, %r8
	movl	%edx, %r10d
	cmpl	$8, %edx
	jb	.LBB0_19
# %bb.20:
	leaq	(%rdi,%r8,4), %rax
	movq	%rcx, %rdx
	subq	%rax, %rdx
	cmpq	$32, %rdx
	jae	.LBB0_22
.LBB0_19:
	xorl	%edx, %edx
.LBB0_28:
	movq	%rdx, %rsi
	notq	%rsi
	addq	%r10, %rsi
	movq	%r10, %rax
	andq	$3, %rax
	je	.LBB0_31
# %bb.29:
	leaq	(%rdi,%r8,4), %rbp
	.p2align	4, 0x90
.LBB0_30:                               # =>This Inner Loop Header: Depth=1
	movl	(%rbp,%rdx,4), %ebx
	movl	%ebx, (%rcx,%rdx,4)
	incq	%rdx
	decq	%rax
	jne	.LBB0_30
.LBB0_31:
	cmpq	$3, %rsi
	jb	.LBB0_34
# %bb.32:
	leaq	(%rdi,%r8,4), %rax
	addq	$12, %rax
	.p2align	4, 0x90
.LBB0_33:                               # =>This Inner Loop Header: Depth=1
	movl	-12(%rax,%rdx,4), %esi
	movl	%esi, (%rcx,%rdx,4)
	movl	-8(%rax,%rdx,4), %esi
	movl	%esi, 4(%rcx,%rdx,4)
	movl	-4(%rax,%rdx,4), %esi
	movl	%esi, 8(%rcx,%rdx,4)
	movl	(%rax,%rdx,4), %esi
	movl	%esi, 12(%rcx,%rdx,4)
	addq	$4, %rdx
	cmpq	%rdx, %r10
	jne	.LBB0_33
	jmp	.LBB0_34
.LBB0_22:
	movl	%r10d, %edx
	andl	$-8, %edx
	leaq	-8(%rdx), %rax
	movq	%rax, %r9
	shrq	$3, %r9
	incq	%r9
	testq	%rax, %rax
	je	.LBB0_35
# %bb.23:
	leaq	(,%r8,4), %rax
	movq	%r9, %rbx
	andq	$-2, %rbx
	leaq	(%rax,%rdi), %rbp
	addq	$48, %rbp
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_24:                               # =>This Inner Loop Header: Depth=1
	movups	-48(%rbp,%rsi,4), %xmm0
	movups	-32(%rbp,%rsi,4), %xmm1
	movups	%xmm0, (%rcx,%rsi,4)
	movups	%xmm1, 16(%rcx,%rsi,4)
	movups	-16(%rbp,%rsi,4), %xmm0
	movups	(%rbp,%rsi,4), %xmm1
	movups	%xmm0, 32(%rcx,%rsi,4)
	movups	%xmm1, 48(%rcx,%rsi,4)
	addq	$16, %rsi
	addq	$-2, %rbx
	jne	.LBB0_24
# %bb.25:
	testb	$1, %r9b
	je	.LBB0_27
.LBB0_26:
	leaq	(%rsi,%r8), %rax
	movups	(%rdi,%rax,4), %xmm0
	movups	16(%rdi,%rax,4), %xmm1
	movups	%xmm0, (%rcx,%rsi,4)
	movups	%xmm1, 16(%rcx,%rsi,4)
.LBB0_27:
	cmpq	%r10, %rdx
	jne	.LBB0_28
.LBB0_34:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_35:
	.cfi_def_cfa_offset 32
	xorl	%esi, %esi
	testb	$1, %r9b
	jne	.LBB0_26
	jmp	.LBB0_27
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
