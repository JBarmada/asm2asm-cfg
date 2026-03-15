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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $esi killed $esi def $rsi
	leal	-1(%rsi), %r10d
	cmpl	$2, %esi
	jl	.LBB0_4
# %bb.1:
	movl	%esi, %r9d
	movl	%r10d, %r8d
	xorl	%r11d, %r11d
	movq	%r9, %r14
	movq	%rdi, %r15
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	addq	$4, %r15
	decq	%r14
	cmpq	%r8, %r11
	je	.LBB0_4
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
	movq	%r11, %rbx
	incq	%r11
	cmpq	%r9, %r11
	jae	.LBB0_3
# %bb.10:                               #   in Loop: Header=BB0_2 Depth=1
	movl	$1, %ecx
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=2
	incq	%rcx
	cmpq	%rcx, %r14
	je	.LBB0_3
.LBB0_11:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%rbx,4), %ebp
	movl	(%r15,%rcx,4), %eax
	cmpl	%eax, %ebp
	jle	.LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=2
	movl	%eax, (%rdi,%rbx,4)
	movl	%ebp, (%r15,%rcx,4)
	jmp	.LBB0_13
.LBB0_4:
	testl	%esi, %esi
	jle	.LBB0_9
# %bb.5:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.LBB0_6
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=1
	leaq	1(%rcx), %rsi
	movslq	%r10d, %rbp
	movl	%r8d, %eax
	cmpq	%rbp, %rcx
	movq	%rsi, %rcx
	jge	.LBB0_9
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movl	%r10d, %ebp
	leal	1(%rax), %r8d
	movl	(%rdi,%rcx,4), %ebx
	movslq	%eax, %rsi
	movl	%ebx, (%rdx,%rsi,4)
	cmpq	%rbp, %rcx
	je	.LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	movslq	%r10d, %rsi
	decl	%r10d
	movl	(%rdi,%rsi,4), %esi
	addl	$2, %eax
	movslq	%r8d, %rbp
	movl	%esi, (%rdx,%rbp,4)
	movl	%eax, %r8d
	jmp	.LBB0_8
.LBB0_9:
	popq	%rbx
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
