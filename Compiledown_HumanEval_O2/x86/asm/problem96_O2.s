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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%esi, %esi
	je	.LBB0_1
# %bb.2:
	jle	.LBB0_14
# %bb.3:
	movq	%rdi, %r15
	movl	%esi, %eax
	movq	%rax, (%rsp)                    # 8-byte Spill
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	incq	%r12
	cmpq	(%rsp), %r12                    # 8-byte Folded Reload
	je	.LBB0_14
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	movq	%r12, %rax
	shlq	$4, %rax
	movq	(%r15,%rax), %rbp
	movzbl	(%rbp), %r14d
	testb	%r14b, %r14b
	je	.LBB0_13
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	callq	__ctype_b_loc@PLT
	movq	(%rax), %rcx
	incq	%rbp
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	%r14b, %eax
	movzwl	(%rcx,%rax,2), %edx
	xorl	%eax, %eax
	testl	$1024, %edx                     # imm = 0x400
	je	.LBB0_15
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	testl	$256, %edx                      # imm = 0x100
	je	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_7 Depth=2
	movl	$1, %r13d
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=2
	testl	$512, %edx                      # imm = 0x200
	je	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_7 Depth=2
	movl	$1, %ebx
.LBB0_12:                               #   in Loop: Header=BB0_7 Depth=2
	leal	(%rbx,%r13), %edx
	cmpl	$2, %edx
	je	.LBB0_15
# %bb.6:                                #   in Loop: Header=BB0_7 Depth=2
	movzbl	(%rbp), %r14d
	incq	%rbp
	testb	%r14b, %r14b
	jne	.LBB0_7
	jmp	.LBB0_13
.LBB0_1:
	xorl	%eax, %eax
	jmp	.LBB0_15
.LBB0_14:
	movl	$1, %eax
.LBB0_15:
	addq	$8, %rsp
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
