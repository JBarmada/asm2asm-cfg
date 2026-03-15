	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	je	.LBB0_1
# %bb.2:
	jle	.LBB0_3
# %bb.4:
	movl	%esi, %r8d
	cmpl	$1, %esi
	jne	.LBB0_6
# %bb.5:
	xorl	%r10d, %r10d
	movl	$1, %esi
	xorl	%eax, %eax
	jmp	.LBB0_8
.LBB0_1:
	movl	$-32768, %eax                   # imm = 0x8000
	retq
.LBB0_3:
	xorl	%eax, %eax
	retq
.LBB0_6:
	movl	%r8d, %r9d
	andl	$-2, %r9d
	xorl	%r10d, %r10d
	movl	$1, %esi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%r10,4), %edx
	movl	4(%rdi,%r10,4), %r11d
	testl	%edx, %edx
	cmovel	%edx, %esi
	movl	%esi, %ecx
	negl	%ecx
	testl	%edx, %edx
	cmovnsl	%esi, %ecx
	testl	%r11d, %r11d
	cmovel	%r11d, %ecx
	movl	%ecx, %esi
	negl	%esi
	testl	%r11d, %r11d
	cmovnsl	%ecx, %esi
	movl	%edx, %ecx
	negl	%ecx
	cmovsl	%edx, %ecx
	addl	%eax, %ecx
	movl	%r11d, %eax
	negl	%eax
	cmovsl	%r11d, %eax
	addl	%ecx, %eax
	addq	$2, %r10
	cmpq	%r10, %r9
	jne	.LBB0_7
.LBB0_8:
	testb	$1, %r8b
	je	.LBB0_10
# %bb.9:
	movl	(%rdi,%r10,4), %ecx
	testl	%ecx, %ecx
	cmovel	%ecx, %esi
	movl	%esi, %edx
	negl	%edx
	testl	%ecx, %ecx
	cmovsl	%edx, %esi
	movl	%ecx, %edx
	negl	%edx
	cmovsl	%ecx, %edx
	addl	%edx, %eax
.LBB0_10:
	imull	%esi, %eax
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
