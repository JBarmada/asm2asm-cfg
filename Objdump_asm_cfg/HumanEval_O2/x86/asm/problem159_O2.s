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
	subq	$296, %rsp                      # imm = 0x128
	.cfi_def_cfa_offset 352
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.3:
	movl	%esi, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	xorl	%ebp, %ebp
	leaq	.L.str(%rip), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	leaq	32(%rsp), %rbx
	movl	$0, 4(%rsp)                     # 4-byte Folded Spill
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_4 Depth=1
	movl	%r14d, 4(%rsp)                  # 4-byte Spill
	movq	%r12, 8(%rsp)                   # 8-byte Spill
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	incq	%rbp
	cmpq	16(%rsp), %rbp                  # 8-byte Folded Reload
	je	.LBB0_2
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 272(%rsp)
	movaps	%xmm0, 256(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 32(%rsp)
	movq	24(%rsp), %rax                  # 8-byte Reload
	movq	(%rax,%rbp,8), %r12
	movzbl	(%r12), %r13d
	movl	$0, %r14d
	testb	%r13b, %r13b
	je	.LBB0_9
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	leaq	1(%r12), %r15
	xorl	%r14d, %r14d
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=2
	movzbl	(%r15), %r13d
	incq	%r15
	testb	%r13b, %r13b
	je	.LBB0_9
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	%r13b, %esi
	movq	%rbx, %rdi
	callq	strchr@PLT
	testq	%rax, %rax
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	movq	%rbx, %rdi
	callq	strlen@PLT
	cltq
	movb	%r13b, 32(%rsp,%rax)
	incl	%eax
	cltq
	movb	$0, 32(%rsp,%rax)
	incl	%r14d
	jmp	.LBB0_8
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	4(%rsp), %r14d                  # 4-byte Folded Reload
	jg	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	jne	.LBB0_13
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	movq	%r12, %rdi
	movq	8(%rsp), %rsi                   # 8-byte Reload
	callq	strcmp@PLT
	testl	%eax, %eax
	js	.LBB0_12
	jmp	.LBB0_13
.LBB0_1:
	leaq	.L.str(%rip), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
.LBB0_2:
	movq	8(%rsp), %rax                   # 8-byte Reload
	addq	$296, %rsp                      # imm = 0x128
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.zero	1
	.size	.L.str, 1

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
