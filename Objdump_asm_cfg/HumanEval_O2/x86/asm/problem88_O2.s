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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, 8(%rsp)                    # 8-byte Spill
	movl	%ecx, %ebp
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	movl	%esi, %r13d
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movl	$800, %edi                      # imm = 0x320
	callq	malloc@PLT
	movq	%rax, (%rsp)                    # 8-byte Spill
	testl	%r13d, %r13d
	jle	.LBB0_1
# %bb.3:
	movl	%r13d, %eax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%r12
	cmpq	24(%rsp), %r12                  # 8-byte Folded Reload
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movq	32(%rsp), %rax                  # 8-byte Reload
	movl	(%rax,%r12,4), %r13d
	testl	%r13d, %r13d
	jle	.LBB0_9
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	(%rax,%r12,8), %r15
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=2
	leaq	1(%rbx), %rax
	movq	%rbx, %r13
	cmpq	$1, %rax
	jbe	.LBB0_9
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	-1(%r13), %rbx
	movl	%ebx, %eax
	cmpl	%ebp, (%r15,%rax,4)
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	decl	%r13d
	movl	$8, %edi
	callq	malloc@PLT
	movslq	%r14d, %r14
	movq	(%rsp), %rcx                    # 8-byte Reload
	movq	%rax, (%rcx,%r14,8)
	movl	%r12d, (%rax)
	movl	%r13d, 4(%rax)
	incl	%r14d
	jmp	.LBB0_8
.LBB0_1:
	xorl	%r14d, %r14d
.LBB0_2:
	movq	8(%rsp), %rax                   # 8-byte Reload
	movl	%r14d, (%rax)
	movq	(%rsp), %rax                    # 8-byte Reload
	addq	$40, %rsp
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
