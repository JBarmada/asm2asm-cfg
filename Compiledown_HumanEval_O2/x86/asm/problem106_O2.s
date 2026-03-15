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
	movq	%rdx, %r14
	movl	%esi, %r15d
	movq	%rdi, %rbx
	leal	-1(%r15), %r8d
	cmpl	$2, %esi
	jl	.LBB0_17
# %bb.1:
	xorl	%r9d, %r9d
	movl	%r8d, %r10d
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_2 Depth=1
	incl	%r9d
	decl	%r10d
	cmpl	%r8d, %r9d
	je	.LBB0_17
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movl	%r10d, %r10d
	movl	%r9d, %eax
	notl	%eax
	addl	%r15d, %eax
	testl	%eax, %eax
	jle	.LBB0_16
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	(%rbx), %ebp
	cmpl	$1, %r10d
	jne	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	xorl	%edx, %edx
.LBB0_13:                               #   in Loop: Header=BB0_2 Depth=1
	testb	$1, %r10b
	je	.LBB0_16
# %bb.14:                               #   in Loop: Header=BB0_2 Depth=1
	movl	4(%rbx,%rdx,4), %eax
	cmpl	%eax, %ebp
	jle	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_2 Depth=1
	movl	%eax, (%rbx,%rdx,4)
	movl	%ebp, 4(%rbx,%rdx,4)
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%r10d, %esi
	andl	$-2, %esi
	xorl	%eax, %eax
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=2
	movl	%edi, 4(%rbx,%rax,4)
	movl	%ebp, 8(%rbx,%rax,4)
.LBB0_12:                               #   in Loop: Header=BB0_6 Depth=2
	movq	%rdx, %rax
	cmpq	%rdx, %rsi
	je	.LBB0_13
.LBB0_6:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	4(%rbx,%rax,4), %edx
	cmpl	%edx, %ebp
	jle	.LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	movl	%edx, (%rbx,%rax,4)
	movl	%ebp, 4(%rbx,%rax,4)
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_6 Depth=2
	movl	%edx, %ebp
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=2
	leaq	2(%rax), %rdx
	movl	8(%rbx,%rax,4), %edi
	cmpl	%edi, %ebp
	jg	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_6 Depth=2
	movl	%edi, %ebp
	jmp	.LBB0_12
.LBB0_17:
	movl	$0, (%rcx)
	movl	%r8d, %r12d
	testl	%r15d, %r15d
	jle	.LBB0_18
# %bb.19:
	leaq	1(%r12), %rdx
	testl	%r8d, %r8d
	je	.LBB0_20
# %bb.21:
	movq	%rdx, %rsi
	andq	$-2, %rsi
	xorl	%ebp, %ebp
	movq	%r12, %rax
	jmp	.LBB0_22
	.p2align	4, 0x90
.LBB0_26:                               #   in Loop: Header=BB0_22 Depth=1
	addq	$-2, %rax
	addq	$-2, %rsi
	je	.LBB0_27
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	movl	(%rbx,%rax,4), %edi
	decl	%edi
	cmpl	$8, %edi
	ja	.LBB0_24
# %bb.23:                               #   in Loop: Header=BB0_22 Depth=1
	incl	%ebp
	movl	%ebp, (%rcx)
.LBB0_24:                               #   in Loop: Header=BB0_22 Depth=1
	movl	-4(%rbx,%rax,4), %edi
	decl	%edi
	cmpl	$8, %edi
	ja	.LBB0_26
# %bb.25:                               #   in Loop: Header=BB0_22 Depth=1
	incl	%ebp
	movl	%ebp, (%rcx)
	jmp	.LBB0_26
.LBB0_18:
	xorl	%ebp, %ebp
	jmp	.LBB0_30
.LBB0_20:
	xorl	%ebp, %ebp
	movq	%r12, %rax
.LBB0_27:
	testb	$1, %dl
	je	.LBB0_30
# %bb.28:
	movl	(%rbx,%rax,4), %eax
	decl	%eax
	cmpl	$8, %eax
	ja	.LBB0_30
# %bb.29:
	incl	%ebp
	movl	%ebp, (%rcx)
.LBB0_30:
	movslq	%ebp, %rdi
	shlq	$3, %rdi
	callq	malloc@PLT
	movq	%rax, (%r14)
	testl	%r15d, %r15d
	jle	.LBB0_37
# %bb.31:
	testl	%ebp, %ebp
	jle	.LBB0_37
# %bb.32:
	xorl	%eax, %eax
	leaq	.Lreltable.func0(%rip), %rcx
	.p2align	4, 0x90
.LBB0_33:                               # =>This Inner Loop Header: Depth=1
	movl	(%rbx,%r12,4), %edx
	leal	-1(%rdx), %esi
	cmpl	$8, %esi
	ja	.LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_33 Depth=1
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	movq	(%r14), %rsi
	movslq	%eax, %rdi
	incl	%eax
	movq	%rdx, (%rsi,%rdi,8)
.LBB0_35:                               #   in Loop: Header=BB0_33 Depth=1
	testq	%r12, %r12
	jle	.LBB0_37
# %bb.36:                               #   in Loop: Header=BB0_33 Depth=1
	decq	%r12
	cmpl	%ebp, %eax
	jl	.LBB0_33
.LBB0_37:
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.zero	1
	.size	.L.str, 1

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"One"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Two"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Three"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Four"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Five"
	.size	.L.str.5, 5

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Six"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Seven"
	.size	.L.str.7, 6

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Eight"
	.size	.L.str.8, 6

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"Nine"
	.size	.L.str.9, 5

	.type	.Lreltable.func0,@object        # @reltable.func0
	.section	.rodata,"a",@progbits
	.p2align	2
.Lreltable.func0:
	.long	.L.str-.Lreltable.func0
	.long	.L.str.1-.Lreltable.func0
	.long	.L.str.2-.Lreltable.func0
	.long	.L.str.3-.Lreltable.func0
	.long	.L.str.4-.Lreltable.func0
	.long	.L.str.5-.Lreltable.func0
	.long	.L.str.6-.Lreltable.func0
	.long	.L.str.7-.Lreltable.func0
	.long	.L.str.8-.Lreltable.func0
	.long	.L.str.9-.Lreltable.func0
	.size	.Lreltable.func0, 40

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
