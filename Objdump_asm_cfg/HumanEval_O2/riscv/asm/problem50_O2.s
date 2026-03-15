	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a0, .LBB0_4
# %bb.1:
	li	a3, 0
	li	a2, 1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	slliw	a2, a2, 1
	addiw	a3, a3, 1
	remw	a2, a2, a1
	blt	a3, a0, .LBB0_2
# %bb.3:
	mv	a0, a2
	ret
.LBB0_4:
	li	a2, 1
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
