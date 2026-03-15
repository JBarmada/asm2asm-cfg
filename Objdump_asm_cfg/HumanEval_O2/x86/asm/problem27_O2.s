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
	movq	%rdx, (%rsp)                    # 8-byte Spill
	movl	%esi, %ebp
	movq	%rdi, %r12
	movslq	%esi, %r14
	leaq	(,%r14,4), %rdi
	callq	malloc@PLT
	movq	%rax, %r15
	movl	$4, %esi
	movq	%r14, %rdi
	callq	calloc@PLT
	movq	%rax, %r13
	movl	$4, %esi
	movq	%r14, %rdi
	callq	calloc@PLT
	movq	%rax, %rbx
	testl	%r14d, %r14d
	jle	.LBB0_1
# %bb.4:
	movl	%ebp, %r8d
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	movq	(%rsp), %r9                     # 8-byte Reload
	movl	%ebp, %r10d
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_5 Depth=1
	movl	%esi, %eax
	incl	%esi
	movq	%r13, %rbp
                                        # kill: def $esi killed $esi def $rsi
.LBB0_15:                               #   in Loop: Header=BB0_5 Depth=1
	cltq
	movl	%edi, (%rbp,%rax,4)
.LBB0_16:                               #   in Loop: Header=BB0_5 Depth=1
	incq	%rdx
	cmpq	%r8, %rdx
	je	.LBB0_2
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_12 Depth 2
	movl	(%r12,%rdx,4), %edi
	testl	%ecx, %ecx
	jle	.LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	movl	%ecx, %ebp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%edi, (%rbx,%rax,4)
	je	.LBB0_16
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB0_7
.LBB0_9:                                #   in Loop: Header=BB0_5 Depth=1
	testl	%esi, %esi
	jle	.LBB0_14
# %bb.10:                               #   in Loop: Header=BB0_5 Depth=1
	movl	%esi, %ebp
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_12:                               #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%edi, (%r13,%rax,4)
	je	.LBB0_13
# %bb.11:                               #   in Loop: Header=BB0_12 Depth=2
	incq	%rax
	cmpq	%rax, %rbp
	jne	.LBB0_12
	jmp	.LBB0_14
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_5 Depth=1
	movl	%ecx, %eax
	incl	%ecx
	movq	%rbx, %rbp
                                        # kill: def $ecx killed $ecx def $rcx
	jmp	.LBB0_15
.LBB0_2:
	testl	%r10d, %r10d
	jle	.LBB0_3
# %bb.17:
	movl	%ecx, %esi
	xorl	%edi, %edi
	xorl	%edx, %edx
	jmp	.LBB0_18
	.p2align	4, 0x90
.LBB0_22:                               #   in Loop: Header=BB0_18 Depth=1
	movslq	%edx, %rax
	incl	%edx
	movl	%ebp, (%r15,%rax,4)
.LBB0_23:                               #   in Loop: Header=BB0_18 Depth=1
	incq	%rdi
	cmpq	%r8, %rdi
	je	.LBB0_24
.LBB0_18:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_21 Depth 2
	movl	(%r12,%rdi,4), %ebp
	testl	%ecx, %ecx
	jle	.LBB0_22
# %bb.19:                               #   in Loop: Header=BB0_18 Depth=1
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_21:                               #   Parent Loop BB0_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	%ebp, (%rbx,%rax,4)
	je	.LBB0_23
# %bb.20:                               #   in Loop: Header=BB0_21 Depth=2
	incq	%rax
	cmpq	%rax, %rsi
	jne	.LBB0_21
	jmp	.LBB0_22
.LBB0_1:
	xorl	%edx, %edx
	movq	(%rsp), %r9                     # 8-byte Reload
	jmp	.LBB0_24
.LBB0_3:
	xorl	%edx, %edx
.LBB0_24:
	movl	%edx, (%r9)
	movq	%r13, %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movq	%r15, %rax
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
