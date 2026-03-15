	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a0, .LBB0_6
# %bb.1:
	li	a1, 1
	beq	a0, a1, .LBB0_5
# %bb.2:
	li	a2, 3
	li	a1, 18
	bltu	a0, a2, .LBB0_5
# %bb.3:
	li	a1, 18
	li	a2, 2
	li	a3, 10
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	addiw	a2, a2, 1
	mulw	a1, a1, a3
	blt	a2, a0, .LBB0_4
.LBB0_5:
	mv	a0, a1
	ret
.LBB0_6:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
