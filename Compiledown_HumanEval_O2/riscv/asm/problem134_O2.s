	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a2, 0
	blez	a1, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	flw	ft0, 0(a0)
	fcvt.w.s	a3, ft0, rup
	mulw	a3, a3, a3
	addw	a2, a2, a3
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_1
.LBB0_2:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
