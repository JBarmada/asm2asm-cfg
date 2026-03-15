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
	cmpl	%esi, %edi
	jle	.LBB0_2
# %bb.1:
	leaq	.L.str(%rip), %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_2:
	.cfi_def_cfa_offset 16
	movl	%esi, %ebx
	addl	%edi, %ebx
	movl	$33, %edi
	callq	malloc@PLT
	movb	$0, (%rax)
	movb	$0, 32(%rax)
	addq	$32, %rax
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movl	%ebx, %ecx
	shrl	$31, %ecx
	addl	%ebx, %ecx
	movl	%ecx, %edx
	sarl	%edx
	shrl	$31, %ecx
	addl	%edx, %ecx
	andl	$254, %ecx
	movl	%edx, %esi
	subl	%ecx, %esi
	addb	$48, %sil
	movb	%sil, -1(%rax)
	decq	%rax
	cmpl	$3, %ebx
	movl	%edx, %ebx
	jg	.LBB0_3
# %bb.4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"-1"
	.size	.L.str, 3

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
