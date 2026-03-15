	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	flw	ft1, 0(a0)
	li	a2, 2
	blt	a1, a2, .LBB0_7
# %bb.1:
	addi	a2, a0, 4
	addi	a3, a1, -1
	fmv.s	ft3, ft1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, a3, -1
	addi	a2, a2, 4
	fmv.s	ft1, ft2
	fmv.s	ft3, ft0
	beqz	a3, .LBB0_8
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a2)
	flt.s	a4, ft2, ft3
	fmv.s	ft0, ft2
	bnez	a4, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	fmv.s	ft0, ft3
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=1
	flt.s	a4, ft1, ft2
	bnez	a4, .LBB0_2
# %bb.6:                                #   in Loop: Header=BB0_3 Depth=1
	fmv.s	ft2, ft1
	j	.LBB0_2
.LBB0_7:
	fmv.s	ft0, ft1
	fmv.s	ft2, ft1
.LBB0_8:
	blez	a1, .LBB0_11
# %bb.9:
	fsub.s	ft1, ft2, ft0
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	flw	ft2, 0(a0)
	fsub.s	ft2, ft2, ft0
	fdiv.s	ft2, ft2, ft1
	fsw	ft2, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_10
.LBB0_11:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
