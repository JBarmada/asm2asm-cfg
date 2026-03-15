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
	cmpb	$40, %dl
	sete	%cl
	xorl	%esi, %esi
	cmpb	$41, %dl
	sete	%sil
	subl	%esi, %ecx
	js	.LBB0_3
# %bb.4:
	movl	$1, %esi
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movq	%rsi, %rdx
	cmpq	%rsi, %rax
	je	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	movzbl	(%r14,%rdx), %ebx
	xorl	%esi, %esi
	cmpb	$40, %bl
	sete	%sil
	addl	%esi, %ecx
	xorl	%edi, %edi
	cmpb	$41, %bl
	sete	%dil
	leaq	1(%rdx), %rsi
	subl	%edi, %ecx
	jns	.LBB0_5
# %bb.7:
	movl	$1, %ecx
.LBB0_8:
	cmpq	%rdx, %rax
	setbe	%dl
	jmp	.LBB0_9
.LBB0_1:
	xorl	%ecx, %ecx
	movb	$1, %dl
	jmp	.LBB0_9
.LBB0_3:
	xorl	%edx, %edx
	movl	$1, %ecx
.LBB0_9:
	testl	%ecx, %ecx
	sete	%al
	andb	%dl, %al
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
