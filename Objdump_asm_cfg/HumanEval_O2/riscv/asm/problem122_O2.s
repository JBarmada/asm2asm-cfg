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
	blez	a1, .LBB0_5
# %bb.1:
	addiw	a1, a1, -1
	srliw	a1, a1, 1
	addi	a1, a1, 1
	lui	a3, 524288
	addiw	a3, a3, 1
	li	a6, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a0, a0, 8
	beqz	a1, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a0)
	and	a4, a5, a3
	bne	a4, a6, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	addw	a2, a2, a5
	j	.LBB0_2
.LBB0_5:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
