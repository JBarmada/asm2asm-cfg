	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_9
# %bb.1:
	mv	a6, a2
	li	a4, 0
	li	a7, -1
	lui	a2, 524288
	addiw	t0, a2, -1
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	mv	t0, a5
	mv	a7, a3
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a4, a4, 1
	addi	a0, a0, 4
	beq	a1, a4, .LBB0_7
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a0)
	andi	a3, a5, 1
	bnez	a3, .LBB0_3
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	slt	a3, a5, t0
	sext.w	a2, a7
	addi	a2, a2, 1
	seqz	a2, a2
	or	a2, a2, a3
	mv	a3, a4
	bnez	a2, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a5, t0
	mv	a3, a7
	j	.LBB0_2
.LBB0_7:
	sext.w	a0, a7
	li	a1, -1
	beq	a0, a1, .LBB0_9
# %bb.8:
	sw	t0, 0(a6)
	sw	a7, 4(a6)
	mv	a0, a6
	ret
.LBB0_9:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
