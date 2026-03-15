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
# %bb.3:
	movl	%esi, %r8d
	xorl	%r10d, %r10d
	movl	$3435973837, %r9d               # imm = 0xCCCCCCCD
	xorl	%eax, %eax
	jmp	.LBB0_4
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%esi, %edx
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	xorl	%esi, %esi
	cmpl	%edx, %r11d
	setg	%sil
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	addl	%esi, %eax
	incq	%r10
	cmpq	%r8, %r10
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	movl	(%rdi,%r10,4), %edx
	movl	$1, %esi
	testl	%edx, %edx
	jg	.LBB0_10
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movl	%edx, %esi
	negl	%esi
	xorl	%r11d, %r11d
	cmpl	$-10, %edx
	jg	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB0_8:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%esi, %edx
	imulq	%r9, %rdx
	shrq	$35, %rdx
	leal	(%rdx,%rdx), %ecx
	leal	(%rcx,%rcx,4), %ecx
	movl	%esi, %ebx
	subl	%ecx, %ebx
	addl	%ebx, %r11d
	cmpl	$99, %esi
	movl	%edx, %esi
	ja	.LBB0_8
	jmp	.LBB0_9
.LBB0_1:
	xorl	%eax, %eax
.LBB0_2:
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
