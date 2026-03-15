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
	li	a4, 0
	li	a6, 1
	li	a3, 1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	beq	a3, a0, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	mulw	a3, a3, a1
	sltiu	a5, a4, 99
	addiw	a4, a4, 1
	slt	a2, a0, a3
	xori	a2, a2, 1
	and	a2, a2, a5
	bnez	a2, .LBB0_2
.LBB0_4:
	li	a6, 0
.LBB0_5:
	mv	a0, a6
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
