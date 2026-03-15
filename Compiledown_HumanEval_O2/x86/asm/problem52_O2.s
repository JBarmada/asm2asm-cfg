	.text
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r15
	movzbl	(%rdi), %ebp
	testb	%bpl, %bpl
	je	.LBB0_5
# %bb.1:
	leaq	1(%r15), %rbx
	leaq	.L.str(%rip), %r14
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	movzbl	(%rbx), %ebp
	incq	%rbx
	testb	%bpl, %bpl
	je	.LBB0_5
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsbl	%bpl, %esi
	movl	$11, %edx
	movq	%r14, %rdi
	callq	memchr@PLT
	testq	%rax, %rax
	jne	.LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movb	%bpl, (%r15)
	incq	%r15
	jmp	.LBB0_4
.LBB0_5:
	movb	$0, (%r15)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"AEIOUaeiou"
	.size	.L.str, 11

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
