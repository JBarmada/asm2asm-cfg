	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	strlen@PLT
	cmpq	$3, %rax
	jae	.LBB0_2
# %bb.1:
	xorl	%eax, %eax
	jmp	.LBB0_8
.LBB0_2:
	movq	%rax, %rdi
	movzbl	2(%rbx), %ecx
	movb	$1, %al
	cmpb	1(%rbx), %cl
	je	.LBB0_7
# %bb.3:
	movb	$1, %al
	movl	$3, %esi
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	cmpb	-3(%rbx,%rsi), %cl
	je	.LBB0_7
# %bb.4:                                #   in Loop: Header=BB0_6 Depth=1
	cmpq	%rsi, %rdi
	seta	%al
	je	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_6 Depth=1
	movzbl	(%rbx,%rsi), %edx
	incq	%rsi
	cmpb	%cl, %dl
	movl	%edx, %ecx
	jne	.LBB0_6
.LBB0_7:
	xorb	$1, %al
.LBB0_8:
	andb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
