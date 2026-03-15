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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r8
	testl	%edx, %edx
	jle	.LBB0_1
# %bb.3:
	movl	%edx, %r9d
	movl	$-1000, %r14d                   # imm = 0xFC18
	xorl	%edx, %edx
	xorl	%r11d, %r11d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%r14d, %eax
	cmovgq	%r10, %r11
	cmovgl	%eax, %r14d
	incq	%rdx
	cmpq	%r9, %rdx
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movq	(%rsi,%rdx,8), %r10
	movzbl	(%r10), %ebx
	movl	$0, %eax
	testb	%bl, %bl
	je	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	leaq	1(%r10), %rdi
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-65(%rbx), %ebp
	cmpb	$26, %bpl
	adcl	$0, %eax
	addb	$-97, %bl
	cmpb	$26, %bl
	sbbl	$0, %eax
	movzbl	(%rdi), %ebx
	incq	%rdi
	testb	%bl, %bl
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_1:
	xorl	%r11d, %r11d
.LBB0_2:
	leaq	.L.str(%rip), %rsi
	movq	%rcx, %rdi
	movq	%r8, %rdx
	movq	%r11, %rcx
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	sprintf@PLT                     # TAILCALL
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s.%s"
	.size	.L.str, 6

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
