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
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, %r8d
	shrl	$31, %r8d
	addl	%esi, %r8d
	sarl	%r8d
	xorl	%r10d, %r10d
	cmpl	$2, %esi
	jl	.LBB0_4
# %bb.1:
	movl	%r8d, %r9d
	leal	-1(%rsi), %r11d
	xorl	%ecx, %ecx
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rcx,4), %eax
	movslq	%r11d, %rbx
	cmpl	(%rdi,%rbx,4), %eax
	jne	.LBB0_7
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	leal	(%r10,%rax,2), %r10d
	incq	%rcx
	decl	%r11d
	cmpq	%rcx, %r9
	jne	.LBB0_2
.LBB0_4:
	andl	$-2147483647, %esi              # imm = 0x80000001
	cmpl	$1, %esi
	jne	.LBB0_6
# %bb.5:
	movslq	%r8d, %rax
	addl	(%rdi,%rax,4), %r10d
.LBB0_6:
	cmpl	%edx, %r10d
	setle	%al
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_7:
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
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
