	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a1, 4
	blt	a0, a1, .LBB0_4
# %bb.1:
	li	a2, 2
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	divw	a1, a0, a2
	mulw	a3, a1, a2
	subw	a3, a0, a3
	beqz	a3, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	addiw	a2, a2, 1
	mulw	a1, a2, a2
	bge	a0, a1, .LBB0_2
.LBB0_4:
	li	a1, 1
.LBB0_5:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
