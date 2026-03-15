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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -24(%rsp)
	movaps	%xmm0, -40(%rsp)
	movq	$0, -8(%rsp)
	cmpb	$0, (%rdi)
	je	.LBB0_9
# %bb.1:
	movl	$1869768058, %eax               # imm = 0x6F72657A
	movl	$1701996660, %ecx               # imm = 0x65726874
	movl	$1920298854, %edx               # imm = 0x72756F66
	movl	$1702259046, %r11d              # imm = 0x65766966
	movl	$1702258035, %r8d               # imm = 0x65766573
	movl	$1751607653, %r9d               # imm = 0x68676965
	movl	$1701734766, %r10d              # imm = 0x656E696E
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	(%rdi,%rsi), %ebx
	testb	$-33, %bl
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movb	%bl, -46(%rsp,%rsi)
	incq	%rsi
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	movl	%esi, %ebx
	movb	$0, -46(%rsp,%rbx)
	movl	-46(%rsp), %ebx
	xorl	%eax, %ebx
	movzbl	-42(%rsp), %ebp
	orl	%ebx, %ebp
	je	.LBB0_6
# %bb.20:                               #   in Loop: Header=BB0_2 Depth=1
	cmpl	$6647407, -46(%rsp)             # imm = 0x656E6F
	je	.LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_2 Depth=1
	cmpl	$7305076, -46(%rsp)             # imm = 0x6F7774
	je	.LBB0_23
# %bb.24:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%ecx, %ebx
	movzwl	-42(%rsp), %ebp
	xorl	$101, %ebp
	orl	%ebx, %ebp
	je	.LBB0_25
# %bb.26:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%edx, %ebx
	movzbl	-42(%rsp), %ebp
	orl	%ebx, %ebp
	je	.LBB0_27
# %bb.28:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%r11d, %ebx
	movzbl	-42(%rsp), %ebp
	orl	%ebx, %ebp
	je	.LBB0_29
# %bb.30:                               #   in Loop: Header=BB0_2 Depth=1
	cmpl	$7891315, -46(%rsp)             # imm = 0x786973
	je	.LBB0_31
# %bb.32:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%r8d, %ebx
	movzwl	-42(%rsp), %ebp
	xorl	$110, %ebp
	orl	%ebx, %ebp
	je	.LBB0_33
# %bb.34:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%r9d, %ebx
	movzwl	-42(%rsp), %ebp
	xorl	$116, %ebp
	orl	%ebx, %ebp
	je	.LBB0_35
# %bb.36:                               #   in Loop: Header=BB0_2 Depth=1
	movl	-46(%rsp), %ebx
	xorl	%r10d, %ebx
	movzbl	-42(%rsp), %ebp
	orl	%ebx, %ebp
	jne	.LBB0_8
# %bb.37:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$9, %ebx
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	xorl	%ebx, %ebx
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$1, %ebx
	jmp	.LBB0_7
.LBB0_23:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$2, %ebx
	jmp	.LBB0_7
.LBB0_25:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$3, %ebx
	jmp	.LBB0_7
.LBB0_27:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$4, %ebx
	jmp	.LBB0_7
.LBB0_29:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$5, %ebx
	jmp	.LBB0_7
.LBB0_31:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$6, %ebx
	jmp	.LBB0_7
.LBB0_33:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$7, %ebx
	jmp	.LBB0_7
.LBB0_35:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$8, %ebx
	.p2align	4, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	incl	-40(%rsp,%rbx,4)
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	incl	%esi
	cmpb	$0, -1(%rdi,%rsi)
	leaq	(%rdi,%rsi), %rdi
	jne	.LBB0_2
.LBB0_9:
	xorl	%r9d, %r9d
	leaq	.L__const.func0.numto(%rip), %r8
	leaq	func0.out(%rip), %rax
	xorl	%r11d, %r11d
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_10 Depth=1
	incq	%r9
	cmpq	$10, %r9
	je	.LBB0_18
.LBB0_10:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
                                        #       Child Loop BB0_14 Depth 3
	movl	-40(%rsp,%r9,4), %r10d
	testl	%r10d, %r10d
	jle	.LBB0_17
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=1
	movq	(%r8,%r9,8), %rsi
	xorl	%edx, %edx
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_16:                               #   in Loop: Header=BB0_12 Depth=2
	movslq	%r11d, %rcx
	incl	%r11d
	movb	$32, (%rcx,%rax)
	incl	%edx
	cmpl	%r10d, %edx
	je	.LBB0_17
.LBB0_12:                               #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_14 Depth 3
	movzbl	(%rsi), %ebx
	testb	%bl, %bl
	je	.LBB0_16
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	movslq	%r11d, %rcx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_14:                               #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leaq	(%rcx,%rdi), %rbp
	movb	%bl, (%rax,%rbp)
	movzbl	1(%rsi,%rdi), %ebx
	incq	%rdi
	testb	%bl, %bl
	jne	.LBB0_14
# %bb.15:                               #   in Loop: Header=BB0_12 Depth=2
	addl	%edi, %r11d
	jmp	.LBB0_16
.LBB0_18:
	testl	%r11d, %r11d
	jle	.LBB0_38
# %bb.19:
	decl	%r11d
	movb	$0, (%r11,%rax)
	jmp	.LBB0_39
.LBB0_38:
	movb	$0, func0.out(%rip)
.LBB0_39:
	leaq	func0.out(%rip), %rax
	popq	%rbx
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
	.asciz	"zero"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"one"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"two"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"three"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"four"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"five"
	.size	.L.str.5, 5

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"six"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"seven"
	.size	.L.str.7, 6

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"eight"
	.size	.L.str.8, 6

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"nine"
	.size	.L.str.9, 5

	.type	.L__const.func0.numto,@object   # @__const.func0.numto
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__const.func0.numto:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.quad	.L.str.4
	.quad	.L.str.5
	.quad	.L.str.6
	.quad	.L.str.7
	.quad	.L.str.8
	.quad	.L.str.9
	.size	.L__const.func0.numto, 80

	.type	func0.out,@object               # @func0.out
	.local	func0.out
	.comm	func0.out,1000,16
	.ident	"clang version 15.0.4 (git@github.com:llvm/llvm-project.git 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.out
