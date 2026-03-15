	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	lbu	a2, 0(a0)
	beqz	a2, .LBB0_5
# %bb.1:
	mv	a1, a0
	li	a0, 0
	addi	a1, a1, 1
	li	a3, 26
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	andi	a4, a2, 255
	lbu	a2, 0(a1)
	addw	a0, a0, a4
	addi	a1, a1, 1
	beqz	a2, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	addiw	a4, a2, -65
	andi	a4, a4, 255
	bltu	a4, a3, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	li	a2, 0
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
