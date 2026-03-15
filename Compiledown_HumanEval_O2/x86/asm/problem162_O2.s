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
	movq	%rdi, %r15
	callq	strlen@PLT
	movq	%rax, %rbp
	testl	%ebp, %ebp
	movq	%rax, (%rsp)                    # 8-byte Spill
	jle	.LBB0_1
# %bb.6:
	callq	__ctype_b_loc@PLT
	movq	%rax, %rbx
	movl	%ebp, %r12d
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=1
	incl	%r13d
.LBB0_14:                               #   in Loop: Header=BB0_7 Depth=1
	incq	%rbp
	cmpq	%rbp, %r12
	je	.LBB0_2
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rax
	movzbl	(%r15,%rbp), %r14d
	movzwl	(%rax,%r14,2), %eax
	testl	$1024, %eax                     # imm = 0x400
	je	.LBB0_13
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	testl	$256, %eax                      # imm = 0x100
	jne	.LBB0_9
# %bb.11:                               #   in Loop: Header=BB0_7 Depth=1
	testl	$512, %eax                      # imm = 0x200
	je	.LBB0_14
# %bb.12:                               #   in Loop: Header=BB0_7 Depth=1
	callq	__ctype_toupper_loc@PLT
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=1
	callq	__ctype_tolower_loc@PLT
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=1
	movq	(%rax), %rax
	movzbl	(%rax,%r14,4), %eax
	movb	%al, (%r15,%rbp)
	jmp	.LBB0_14
.LBB0_1:
	xorl	%r13d, %r13d
.LBB0_2:
	movq	(%rsp), %r11                    # 8-byte Reload
	cmpl	%r11d, %r13d
	jne	.LBB0_19
# %bb.3:
	cmpl	$2, %r11d
	jl	.LBB0_19
# %bb.4:
	movq	%r11, %r8
	shrq	%r8
	movl	%r8d, %r10d
	andl	$2147483647, %r10d              # imm = 0x7FFFFFFF
	andl	$1, %r8d
	cmpq	$1, %r10
	jne	.LBB0_15
# %bb.5:
	xorl	%ecx, %ecx
	jmp	.LBB0_17
.LBB0_15:
	movabsq	$-8589934592, %r9               # imm = 0xFFFFFFFE00000000
	subq	%r8, %r10
	movq	%r11, %rcx
	shlq	$32, %rcx
	leaq	(%rcx,%r9), %rdi
	movabsq	$-4294967296, %rsi              # imm = 0xFFFFFFFF00000000
	addq	%rcx, %rsi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	movzbl	(%r15,%rcx), %eax
	movq	%rsi, %rbp
	sarq	$32, %rbp
	movzbl	(%r15,%rbp), %edx
	movb	%dl, (%r15,%rcx)
	movb	%al, (%r15,%rbp)
	movzbl	1(%r15,%rcx), %eax
	movq	%rdi, %rdx
	sarq	$32, %rdx
	movzbl	(%r15,%rdx), %ebx
	movb	%bl, 1(%r15,%rcx)
	movb	%al, (%r15,%rdx)
	addq	$2, %rcx
	addq	%r9, %rdi
	addq	%r9, %rsi
	cmpq	%rcx, %r10
	jne	.LBB0_16
.LBB0_17:
	testq	%r8, %r8
	je	.LBB0_19
# %bb.18:
	movzbl	(%r15,%rcx), %eax
	movl	%ecx, %edx
	notl	%edx
	addl	%r11d, %edx
	movslq	%edx, %rdx
	movzbl	(%r15,%rdx), %ebx
	movb	%bl, (%r15,%rcx)
	movb	%al, (%r15,%rdx)
.LBB0_19:
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
