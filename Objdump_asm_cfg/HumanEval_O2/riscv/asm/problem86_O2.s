	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a3, 2
	blt	a1, a3, .LBB0_5
# %bb.1:
	mv	a2, a0
	li	a0, 0
	addiw	a1, a1, -2
	srliw	a1, a1, 1
	addi	a1, a1, 1
	addi	a2, a2, 4
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a2, a2, 8
	beqz	a1, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lwu	a3, 0(a2)
	andi	a4, a3, 1
	bnez	a4, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	addw	a0, a0, a3
	j	.LBB0_2
.LBB0_5:
	li	a0, 0
.LBB0_6:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
