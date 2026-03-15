	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	testl	%edi, %edi
	jle	.LBB0_1
# %bb.2:
	leal	-1(%rdi), %eax
	movl	%edi, %ecx
	andl	$3, %ecx
	cmpl	$3, %eax
	jae	.LBB0_7
# %bb.3:
	movl	$1, %edx
	jmp	.LBB0_4
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_7:
	andl	$-4, %edi
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	addl	%edx, %edx
	movl	%edx, %eax
	cltd
	idivl	%esi
                                        # kill: def $edx killed $edx def $rdx
	leal	(%rdx,%rdx), %eax
	cltd
	idivl	%esi
                                        # kill: def $edx killed $edx def $rdx
	leal	(%rdx,%rdx), %eax
	cltd
	idivl	%esi
                                        # kill: def $edx killed $edx def $rdx
	leal	(%rdx,%rdx), %eax
	cltd
	idivl	%esi
	addl	$-4, %edi
	jne	.LBB0_8
.LBB0_4:
	testl	%ecx, %ecx
	je	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	addl	%edx, %edx
	movl	%edx, %eax
	cltd
	idivl	%esi
	decl	%ecx
	jne	.LBB0_5
.LBB0_6:
	movl	%edx, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
