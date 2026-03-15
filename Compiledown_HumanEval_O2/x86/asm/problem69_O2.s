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
	testl	%esi, %esi
	jle	.LBB0_8
# %bb.1:
	movq	%rdx, %rax
	movl	%esi, %r8d
	cmpl	$1, %esi
	jne	.LBB0_9
# %bb.2:
	movl	$2147483647, %r10d              # imm = 0x7FFFFFFF
	movl	$-1, %r11d
	xorl	%esi, %esi
.LBB0_3:
	testb	$1, %r8b
	je	.LBB0_6
# %bb.4:
	movl	(%rdi,%rsi,4), %edi
	testb	$1, %dil
	jne	.LBB0_6
# %bb.5:
	cmpl	%r10d, %edi
	setl	%r8b
	cmpl	$-1, %r11d
	sete	%cl
	orb	%r8b, %cl
	cmovnel	%edi, %r10d
	cmovel	%r11d, %esi
	movl	%esi, %r11d
.LBB0_6:
	cmpl	$-1, %r11d
	je	.LBB0_8
# %bb.7:
	movl	%r10d, (%rax)
	movl	%r11d, 4(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_8:
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_9:
	.cfi_def_cfa_offset 16
	movl	%r8d, %r9d
	andl	$-2, %r9d
	movl	$2147483647, %r10d              # imm = 0x7FFFFFFF
	movl	$-1, %r11d
	xorl	%esi, %esi
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addq	$2, %rsi
	cmpq	%rsi, %r9
	je	.LBB0_3
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rsi,4), %ecx
	testb	$1, %cl
	jne	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	cmpl	%r10d, %ecx
	setl	%dl
	cmpl	$-1, %r11d
	sete	%bl
	orb	%dl, %bl
	cmovnel	%ecx, %r10d
	cmovnel	%esi, %r11d
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=1
	movl	4(%rdi,%rsi,4), %ecx
	testb	$1, %cl
	jne	.LBB0_10
# %bb.14:                               #   in Loop: Header=BB0_11 Depth=1
	cmpl	%r10d, %ecx
	setl	%dl
	cmpl	$-1, %r11d
	sete	%bl
	orb	%dl, %bl
	leal	1(%rsi), %edx
	testb	%bl, %bl
	cmovnel	%ecx, %r10d
	cmovnel	%edx, %r11d
	jmp	.LBB0_10
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
