	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	mv	a6, a2
	slti	a3, a0, 2
	li	a5, 4
	xori	a4, a3, 1
	bge	a0, a5, .LBB0_5
# %bb.1:
	mv	a5, a4
.LBB0_2:
	beqz	a5, .LBB0_4
# %bb.3:
	mv	a6, a1
.LBB0_4:
	mv	a0, a6
	ret
.LBB0_5:
	li	a3, 2
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=1
	addiw	a3, a3, 1
	mulw	a2, a3, a3
	mv	a4, a5
	blt	a0, a2, .LBB0_2
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	remw	a2, a0, a3
	li	a5, 0
	beqz	a2, .LBB0_6
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=1
	mv	a5, a4
	j	.LBB0_6
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
