	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	ld	a3, 0(a0)
	li	a2, 2
	blt	a1, a2, .LBB0_7
# %bb.1:
	addi	a2, a0, 8
	addi	a1, a1, -1
	mv	a4, a3
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a2, a2, 8
	mv	a3, a0
	beqz	a1, .LBB0_8
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	ld	a0, 0(a2)
	bltz	a4, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a4, a0
	mv	a0, a4
	blt	a4, a3, .LBB0_2
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	add	a4, a4, a0
	mv	a0, a4
	blt	a4, a3, .LBB0_2
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a0, a3
	j	.LBB0_2
.LBB0_7:
	mv	a0, a3
.LBB0_8:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
