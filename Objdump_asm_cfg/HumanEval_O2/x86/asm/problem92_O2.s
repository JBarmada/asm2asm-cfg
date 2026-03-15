	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movzbl	(%rdi), %ebx
	testb	%bl, %bl
	je	.LBB0_1
# %bb.3:
	movq	%rdi, %r14
	callq	__ctype_b_loc@PLT
	movq	(%rax), %r9
	incq	%r14
	movl	$1, %edx
	xorl	%eax, %eax
	movabsq	$-9223301659520663552, %r8      # imm = 0x8000400200000000
	xorl	%r10d, %r10d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	movl	$1, %r10d
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	movzbl	%r11b, %edx
	addl	%edx, %eax
	movzbl	(%r14), %ebx
	incq	%r14
	movl	%ecx, %edx
	testb	%bl, %bl
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movsbq	%bl, %rdi
	movzwl	(%r9,%rdi,2), %esi
	movl	%esi, %ecx
	andl	$8192, %ecx                     # imm = 0x2000
	shrl	$13, %esi
	testl	%r10d, %r10d
	setne	%r11b
	andb	%sil, %r11b
	testl	%ecx, %ecx
	cmovnel	%edx, %ecx
	cmpb	$73, %dil
	jne	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	testl	%edx, %edx
	jne	.LBB0_6
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	xorl	%r10d, %r10d
	cmpb	$63, %bl
	ja	.LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	movzbl	%bl, %edx
	btq	%rdx, %r8
	jae	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	movl	$1, %ecx
	jmp	.LBB0_10
.LBB0_1:
	xorl	%eax, %eax
.LBB0_2:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
