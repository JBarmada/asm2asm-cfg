	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	je	.LBB0_9
# %bb.1:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	cmpl	$2, %esi
	jl	.LBB0_11
# %bb.2:
	movl	(%rdi), %r9d
	movl	4(%rdi), %r10d
	movb	$1, %al
	cmpl	%r9d, %r10d
	jl	.LBB0_12
# %bb.3:
	movl	%esi, %r8d
	movl	$1, %edx
	movb	$1, %al
	movl	$2, %esi
	movl	$4294967295, %ebx               # imm = 0xFFFFFFFF
	.p2align	4, 0x90
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movl	%r10d, %r11d
	cmpq	$2, %rdx
	jb	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r9d, %r11d
	jne	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%ebx, %ecx
	cmpl	(%rdi,%rcx,4), %r9d
	je	.LBB0_12
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	cmpq	%r8, %rsi
	setb	%al
	je	.LBB0_12
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdi,%rsi,4), %r10d
	incq	%rsi
	incq	%rbx
	incq	%rdx
	movl	%r11d, %r9d
	cmpl	%r11d, %r10d
	jge	.LBB0_4
	jmp	.LBB0_12
.LBB0_9:
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	movb	$1, %al
	andb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retq
.LBB0_11:
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	xorl	%eax, %eax
.LBB0_12:
	xorb	$1, %al
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	andb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
