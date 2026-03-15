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
	movq	%rdi, %r14
	callq	strlen@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:
	movzbl	(%r14), %edx
	xorl	%ecx, %ecx
	cmpb	$91, %dl
	sete	%cl
	xorl	%esi, %esi
	cmpb	$93, %dl
	sete	%sil
	subl	%esi, %ecx
	xorl	%r8d, %r8d
	testl	%ecx, %ecx
	cmovlel	%r8d, %ecx
	movl	$1, %edi
	movl	%ecx, %esi
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rdx
	cmpq	%rdi, %rax
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movzbl	(%r14,%rdx), %ebx
	xorl	%edi, %edi
	cmpb	$91, %bl
	sete	%dil
	addl	%edi, %esi
	xorl	%edi, %edi
	cmpb	$93, %bl
	sete	%dil
	subl	%edi, %esi
	testl	%esi, %esi
	cmovlel	%r8d, %esi
	cmpl	%ecx, %esi
	cmovgl	%esi, %ecx
	leal	-2(%rcx), %ebx
	leaq	1(%rdx), %rdi
	cmpl	%ebx, %esi
	jg	.LBB0_3
.LBB0_5:
	xorl	%ecx, %ecx
	cmpq	%rdx, %rax
	seta	%cl
	jmp	.LBB0_6
.LBB0_1:
	xorl	%ecx, %ecx
.LBB0_6:
	movl	%ecx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
