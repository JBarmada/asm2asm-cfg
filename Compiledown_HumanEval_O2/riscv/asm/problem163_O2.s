	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	sw	zero, 0(a3)
	mv	a6, a1
	blt	a0, a1, .LBB0_2
# %bb.1:
	mv	a6, a0
.LBB0_2:
	blt	a1, a0, .LBB0_5
# %bb.3:
	mv	a1, a0
	j	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=1
	addiw	a1, a1, 1
	bge	a0, a6, .LBB0_7
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	sext.w	a0, a1
	slti	a5, a0, 10
	xori	a5, a5, 1
	or	a5, a5, a1
	andi	a5, a5, 1
	bnez	a5, .LBB0_4
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a5, 0(a3)
	addiw	a4, a5, 1
	sw	a4, 0(a3)
	slli	a4, a5, 2
	add	a4, a4, a2
	sw	a1, 0(a4)
	j	.LBB0_4
.LBB0_7:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
