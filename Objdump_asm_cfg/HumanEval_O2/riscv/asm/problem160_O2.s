	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	bge	a2, a1, .LBB0_2
# %bb.1:
	addw	a0, a0, a2
	sw	a0, 0(a3)
	sw	zero, 4(a3)
	ret
.LBB0_2:
	addw	a0, a0, a1
	sw	a0, 0(a3)
	subw	a1, a2, a1
	sw	a1, 4(a3)
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
