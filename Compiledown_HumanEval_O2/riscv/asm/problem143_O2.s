	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_7
# %bb.1:
	li	a3, 0
	li	a2, 0
	lui	a4, 699051
	addiw	a6, a4, -1365
	lui	a4, 349525
	addiw	a7, a4, 1365
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	lw	a4, 0(a0)
	mulw	a4, a4, a4
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addw	a2, a2, a4
	addi	a3, a3, 1
	addi	a0, a0, 4
	beq	a1, a3, .LBB0_8
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	mulw	a4, a3, a6
	bgeu	a7, a4, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	lw	a4, 0(a0)
	andi	a5, a3, 3
	bnez	a5, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	mulw	a5, a4, a4
	mulw	a4, a5, a4
	j	.LBB0_3
.LBB0_7:
	li	a2, 0
.LBB0_8:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
