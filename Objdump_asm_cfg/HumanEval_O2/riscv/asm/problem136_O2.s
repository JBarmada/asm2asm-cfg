	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a2, 2
	li	a4, -1
	blt	a1, a2, .LBB0_5
# %bb.1:
	lw	a6, 0(a0)
	addi	a0, a0, 4
	li	a5, -1
	li	a3, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, a3, 1
	addi	a0, a0, 4
	mv	a5, a4
	beq	a1, a3, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	a2, a6
	lw	a6, 0(a0)
	mv	a4, a3
	blt	a6, a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a5
	j	.LBB0_2
.LBB0_5:
	sext.w	a0, a4
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
