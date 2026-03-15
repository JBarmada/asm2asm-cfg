	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	cmpl	%edi, %esi
	movl	%edi, %r8d
	cmovgl	%esi, %r8d
	movl	$0, (%rcx)
	cmovll	%esi, %edi
	leal	1(%r8), %r9d
	movl	%r9d, %eax
	subl	%edi, %eax
	movl	%edi, %esi
	testb	$1, %al
	je	.LBB0_5
# %bb.1:
	cmpl	$9, %edi
	jg	.LBB0_4
# %bb.2:
	movl	%edi, %eax
	andl	$1, %eax
	jne	.LBB0_4
# %bb.3:
	movslq	(%rcx), %rax
	leal	1(%rax), %esi
	movl	%esi, (%rcx)
	movl	%edi, (%rdx,%rax,4)
.LBB0_4:
	leal	1(%rdi), %esi
.LBB0_5:
	cmpl	%edi, %r8d
	jne	.LBB0_6
.LBB0_14:
	retq
.LBB0_6:
	movl	%esi, %r8d
	andl	$1, %r8d
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=1
	addl	$2, %esi
	cmpl	%esi, %r9d
	je	.LBB0_14
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	cmpl	$9, %esi
	jg	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	testl	%r8d, %r8d
	jne	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=1
	movslq	(%rcx), %rax
	leal	1(%rax), %edi
	movl	%edi, (%rcx)
	movl	%esi, (%rdx,%rax,4)
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=1
	leal	1(%rsi), %eax
	cmpl	$9, %eax
	jg	.LBB0_13
# %bb.11:                               #   in Loop: Header=BB0_7 Depth=1
	testl	%r8d, %r8d
	je	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_7 Depth=1
	movslq	(%rcx), %r10
	leal	1(%r10), %edi
	movl	%edi, (%rcx)
	movl	%eax, (%rdx,%r10,4)
	jmp	.LBB0_13
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
