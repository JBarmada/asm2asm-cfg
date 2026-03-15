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
	movq	%rsi, %r14
	movzbl	(%rdi), %r15d
	testb	%r15b, %r15b
	je	.LBB0_1
# %bb.2:
	movq	%rdi, %r13
	xorl	%ebp, %ebp
	callq	__ctype_b_loc@PLT
	movq	%rax, %r12
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #     Child Loop BB0_11 Depth 2
	movq	(%r12), %rax
	movq	%r13, %rbx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbq	%r15b, %rcx
	testb	$8, 1(%rax,%rcx,2)
	jne	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	cmpb	$45, %r15b
	je	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=2
	movzbl	1(%rbx), %r15d
	incq	%rbx
	testb	%r15b, %r15b
	jne	.LBB0_4
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
	movq	%rbx, %rdi
	movq	%rsp, %rsi
	movl	$10, %edx
	callq	strtol@PLT
	movq	(%rsp), %r13
	cmpq	%r13, %rbx
	je	.LBB0_11
# %bb.8:                                #   in Loop: Header=BB0_3 Depth=1
	movzbl	(%r13), %ecx
	cmpl	$44, %ecx
	je	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_3 Depth=1
	testl	%ecx, %ecx
	jne	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_3 Depth=1
	movslq	%ebp, %rcx
	incl	%ebp
	leaq	func0.out(%rip), %rdx
	movl	%eax, (%rdx,%rcx,4)
	movzbl	(%r13), %r15d
	testb	%r15b, %r15b
	jne	.LBB0_3
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=2
	incq	%r13
.LBB0_11:                               #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%r13), %r15d
	testl	%r15d, %r15d
	je	.LBB0_14
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=2
	cmpl	$44, %r15d
	jne	.LBB0_13
.LBB0_14:                               #   in Loop: Header=BB0_3 Depth=1
	movq	%r13, (%rsp)
	testb	%r15b, %r15b
	jne	.LBB0_3
	jmp	.LBB0_16
.LBB0_1:
	xorl	%ebp, %ebp
.LBB0_16:
	movl	%ebp, (%r14)
	leaq	func0.out(%rip), %rax
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
	.type	func0.out,@object               # @func0.out
	.local	func0.out
	.comm	func0.out,1024,16
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.out
