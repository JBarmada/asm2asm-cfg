	.text
	.file	"code.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x400fffcb923a29c7              # double 3.9998999999999998
.LCPI0_1:
	.quad	0x400d99ce075f6fd2              # double 3.7000999999999999
.LCPI0_2:
	.quad	0x400a669ad42c3c9f              # double 3.3001
.LCPI0_3:
	.quad	0x400800346dc5d639              # double 3.0001000000000002
.LCPI0_4:
	.quad	0x400599ce075f6fd2              # double 2.7000999999999999
.LCPI0_5:
	.quad	0x4002669ad42c3c9f              # double 2.3001
.LCPI0_6:
	.quad	0x400000346dc5d639              # double 2.0001000000000002
.LCPI0_7:
	.quad	0x3ffb339c0ebedfa4              # double 1.7000999999999999
.LCPI0_8:
	.quad	0x3ff4cd35a858793e              # double 1.3001
.LCPI0_9:
	.quad	0x3ff00068db8bac71              # double 1.0001
.LCPI0_10:
	.quad	0x3fe667381d7dbf48              # double 0.70009999999999994
.LCPI0_11:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	func0
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
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movslq	%esi, %rbp
	leaq	(,%rbp,8), %rdi
	callq	malloc@PLT
	testl	%ebp, %ebp
	jle	.LBB0_28
# %bb.1:
	movl	%r14d, %ecx
	xorl	%edx, %edx
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = mem[0],zero
	leaq	.L.str.1(%rip), %rsi
	movsd	.LCPI0_2(%rip), %xmm2           # xmm2 = mem[0],zero
	leaq	.L.str.2(%rip), %rdi
	movsd	.LCPI0_3(%rip), %xmm3           # xmm3 = mem[0],zero
	leaq	.L.str.3(%rip), %rbp
	movsd	.LCPI0_4(%rip), %xmm4           # xmm4 = mem[0],zero
	leaq	.L.str.4(%rip), %r8
	movsd	.LCPI0_5(%rip), %xmm5           # xmm5 = mem[0],zero
	leaq	.L.str.5(%rip), %r9
	movsd	.LCPI0_6(%rip), %xmm6           # xmm6 = mem[0],zero
	leaq	.L.str.6(%rip), %r10
	movsd	.LCPI0_7(%rip), %xmm12          # xmm12 = mem[0],zero
	leaq	.L.str.7(%rip), %r11
	movsd	.LCPI0_8(%rip), %xmm8           # xmm8 = mem[0],zero
	leaq	.L.str.8(%rip), %r14
	movsd	.LCPI0_9(%rip), %xmm9           # xmm9 = mem[0],zero
	movsd	.LCPI0_10(%rip), %xmm10         # xmm10 = mem[0],zero
	leaq	.L.str.10(%rip), %r13
	movsd	.LCPI0_11(%rip), %xmm11         # xmm11 = mem[0],zero
	leaq	.L.str.12(%rip), %r15
	leaq	.L.str(%rip), %r12
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%r12, (%rax,%rdx,8)
.LBB0_27:                               #   in Loop: Header=BB0_2 Depth=1
	incq	%rdx
	cmpq	%rdx, %rcx
	je	.LBB0_28
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movss	(%rbx,%rdx,4), %xmm7            # xmm7 = mem[0],zero,zero,zero
	cvtss2sd	%xmm7, %xmm7
	ucomisd	%xmm0, %xmm7
	jae	.LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm1, %xmm7
	jbe	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%rsi, (%rax,%rdx,8)
	jmp	.LBB0_27
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm2, %xmm7
	jbe	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%rdi, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm3, %xmm7
	jbe	.LBB0_10
# %bb.9:                                #   in Loop: Header=BB0_2 Depth=1
	movq	%rbp, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_10:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm4, %xmm7
	jbe	.LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r8, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_12:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm5, %xmm7
	jbe	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r9, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_14:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm6, %xmm7
	jbe	.LBB0_16
# %bb.15:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r10, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_16:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm12, %xmm7
	jbe	.LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r11, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_18:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm8, %xmm7
	jbe	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r14, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_20:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm9, %xmm7
	jbe	.LBB0_22
# %bb.21:                               #   in Loop: Header=BB0_2 Depth=1
	leaq	.L.str.9(%rip), %r13
	movq	%r13, (%rax,%rdx,8)
	leaq	.L.str.10(%rip), %r13
	jmp	.LBB0_27
.LBB0_22:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm10, %xmm7
	jbe	.LBB0_24
# %bb.23:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r13, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_24:                               #   in Loop: Header=BB0_2 Depth=1
	ucomisd	%xmm11, %xmm7
	jbe	.LBB0_26
# %bb.25:                               #   in Loop: Header=BB0_2 Depth=1
	leaq	.L.str.11(%rip), %r14
	movq	%r14, (%rax,%rdx,8)
	leaq	.L.str.8(%rip), %r14
	jmp	.LBB0_27
.LBB0_26:                               #   in Loop: Header=BB0_2 Depth=1
	movq	%r15, (%rax,%rdx,8)
	jmp	.LBB0_27
.LBB0_28:
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"A+"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"A"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"A-"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"B+"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"B"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"B-"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"C+"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"C"
	.size	.L.str.7, 2

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"C-"
	.size	.L.str.8, 3

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"D+"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"D"
	.size	.L.str.10, 2

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"D-"
	.size	.L.str.11, 3

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"E"
	.size	.L.str.12, 2

	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
