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
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%esi, 4(%rsp)                   # 4-byte Spill
	movq	%rdi, %rbx
	callq	strlen@PLT
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	testl	%eax, %eax
	jle	.LBB0_7
# %bb.1:
	movq	8(%rsp), %rax                   # 8-byte Reload
	addl	$2, %eax
	movl	$2863311531, %ecx               # imm = 0xAAAAAAAB
	imulq	%rax, %rcx
	shrq	$33, %rcx
	movl	$3, %r14d
	xorl	%r15d, %r15d
	movq	%rsp, %r13
	jmp	.LBB0_2
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	movzbl	(%rsp), %eax
	movzwl	1(%rsp), %ecx
	movw	%cx, (%rsp)
	movb	%al, 2(%rsp)
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%rbp, %rdx
	callq	strncpy@PLT
	addl	$3, %r14d
	addq	$3, %rbx
	addl	$-3, %r15d
	movq	16(%rsp), %rcx                  # 8-byte Reload
	decq	%rcx
	je	.LBB0_7
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movq	8(%rsp), %r12                   # 8-byte Reload
	cmpl	%r12d, %r14d
                                        # kill: def $r12d killed $r12d killed $r12 def $r12
	cmovll	%r14d, %r12d
	leal	(%r12,%r15), %eax
	movslq	%eax, %rbp
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	callq	strncpy@PLT
	movb	$0, (%rsp,%rbp)
	cmpl	%r14d, %r12d
	jne	.LBB0_6
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	cmpl	$0, 4(%rsp)                     # 4-byte Folded Reload
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	movzbl	2(%rsp), %eax
	movzbl	(%rsp), %ecx
	movzbl	1(%rsp), %edx
	movb	%dl, 2(%rsp)
	movb	%cl, 1(%rsp)
	movb	%al, (%rsp)
	jmp	.LBB0_6
.LBB0_7:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
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
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
