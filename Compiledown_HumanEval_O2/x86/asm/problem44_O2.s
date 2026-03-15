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
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %r8d
	movb	$1, %al
	xorl	%r10d, %r10d
	movq	%r8, %r11
	movq	%rdi, %rsi
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addq	$4, %rsi
	decq	%r11
	cmpq	%r8, %r10
	je	.LBB0_9
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	movl	%eax, %r9d
	movq	%r10, %rcx
	incq	%r10
	cmpq	%r8, %r10
	setb	%al
	jae	.LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdi,%rcx,4), %ecx
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rsi,%rdx,4), %ebx
	addl	%ecx, %ebx
	je	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_7 Depth=2
	incq	%rdx
	cmpq	%rdx, %r11
	jne	.LBB0_7
	jmp	.LBB0_3
.LBB0_8:
	movl	%r9d, %eax
	jmp	.LBB0_9
.LBB0_1:
	xorl	%eax, %eax
.LBB0_9:
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
