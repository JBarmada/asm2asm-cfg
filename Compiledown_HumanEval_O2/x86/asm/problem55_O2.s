	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	strlen@PLT
	movq	%rax, %r15
	movq	%rbx, %rdi
	callq	strlen@PLT
	testl	%r15d, %r15d
	jle	.LBB0_9
# %bb.1:
	movslq	%r15d, %r9
	movl	%r9d, %r8d
	movl	%eax, %esi
	movb	$1, %r10b
	xorl	%edi, %edi
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	testl	%eax, %eax
	jle	.LBB0_19
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movzbl	(%r14,%rdi), %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	(%rbx,%rdx), %cl
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	incq	%rdx
	cmpq	%rdx, %rsi
	jne	.LBB0_4
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	incq	%rdi
	cmpq	%r9, %rdi
	setl	%r10b
	cmpq	%r8, %rdi
	jne	.LBB0_2
	jmp	.LBB0_9
.LBB0_7:
	testb	$1, %r10b
	je	.LBB0_9
.LBB0_19:
	xorl	%eax, %eax
	jmp	.LBB0_18
.LBB0_9:
	testl	%eax, %eax
	jle	.LBB0_16
# %bb.10:
	movslq	%eax, %r9
	movl	%r9d, %r8d
	movl	%r15d, %esi
	xorl	%edi, %edi
	movb	$1, %al
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
	testl	%r15d, %r15d
	jle	.LBB0_20
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	movzbl	(%rbx,%rdi), %edx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_13:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpb	(%r14,%rcx), %dl
	je	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=2
	incq	%rcx
	cmpq	%rcx, %rsi
	jne	.LBB0_13
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_11 Depth=1
	incq	%rdi
	cmpq	%r9, %rdi
	setl	%al
	cmpq	%r8, %rdi
	jne	.LBB0_11
	jmp	.LBB0_17
.LBB0_16:
	xorl	%eax, %eax
.LBB0_17:
	xorb	$1, %al
.LBB0_18:
	andb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB0_20:
	.cfi_def_cfa_offset 32
	movb	$1, %al
	jmp	.LBB0_17
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
