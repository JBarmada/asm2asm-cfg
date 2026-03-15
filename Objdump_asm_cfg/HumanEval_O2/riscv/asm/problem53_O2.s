	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_6
# %bb.1:
	lw	a3, 0(a0)
	bge	a3, a2, .LBB0_7
# %bb.2:
	addi	a0, a0, 4
	li	a4, 1
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	a3, a4
	beq	a1, a4, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	lw	a5, 0(a0)
	addi	a4, a3, 1
	addi	a0, a0, 4
	blt	a5, a2, .LBB0_3
.LBB0_5:
	sltu	a0, a3, a1
	xori	a0, a0, 1
	ret
.LBB0_6:
	li	a0, 1
	ret
.LBB0_7:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
