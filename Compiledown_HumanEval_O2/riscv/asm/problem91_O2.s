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
	li	a2, -1
	blt	a1, a3, .LBB0_9
# %bb.1:
	lui	a2, 524288
	addiw	a6, a2, -1
	mv	a2, a6
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a0, a0, 4
	beqz	a1, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	slt	a5, a4, a6
	xori	a5, a5, 1
	xor	a3, a4, a2
	seqz	a3, a3
	or	a3, a3, a5
	bnez	a3, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a6, a4
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	bge	a4, a2, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a6, a2
	mv	a2, a4
	j	.LBB0_2
.LBB0_7:
	lui	a0, 524288
	addiw	a0, a0, -1
	li	a2, -1
	beq	a6, a0, .LBB0_9
# %bb.8:
	mv	a2, a6
.LBB0_9:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
