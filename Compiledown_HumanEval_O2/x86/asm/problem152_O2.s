	.text
	.file	"code.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function func0
.LCPI0_0:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_1:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI0_2:
	.long	0x00000000                      # float 0
	.text
	.globl	func0
	.p2align	4, 0x90
	.type	func0,@function
func0:                                  # @func0
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.3:
	movq	%rdi, %r15
	movl	%esi, %r12d
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	incq	%rbx
	cmpq	%rbx, %r12
	je	.LBB0_2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movss	(%r15,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	cvtss2sd	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	callq	round@PLT
	movapd	16(%rsp), %xmm2                 # 16-byte Reload
	subsd	%xmm0, %xmm2
	andpd	.LCPI0_0(%rip), %xmm2
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	ucomisd	%xmm2, %xmm1
	jbe	.LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	movss	12(%rsp), %xmm1                 # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	ucomiss	.LCPI0_2(%rip), %xmm1
	jbe	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	cvttsd2si	%xmm0, %eax
	movl	%eax, %ecx
	andl	$-2147483647, %ecx              # imm = 0x80000001
	cmpl	$1, %ecx
	jne	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_4 Depth=1
	imull	%eax, %eax
	addq	%rax, %r14
	jmp	.LBB0_8
.LBB0_1:
	xorl	%r14d, %r14d
.LBB0_2:
	movq	%r14, %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
