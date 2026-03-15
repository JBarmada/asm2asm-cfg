	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_1:
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	fld	ft0, 0(a0)
	li	a2, 2
.LBB0_23:                               # Label of block must be emitted
	auipc	a3, %pcrel_hi(.LCPI0_0)
	addi	a3, a3, %pcrel_lo(.LBB0_23)
	fmv.d	ft1, ft0
	blt	a1, a2, .LBB0_5
# %bb.1:
	fld	ft2, 0(a3)
	li	a2, 1
	fmv.d.x	ft3, zero
	fmv.d	ft1, ft0
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	li	a4, 0
	fmv.d	ft4, ft2
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addiw	a4, a4, 1
	slli	a5, a4, 32
	srli	a5, a5, 32
	fmul.d	ft4, ft4, ft3
	bltu	a5, a2, .LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	slli	a4, a2, 3
	add	a4, a4, a0
	fld	ft5, 0(a4)
	addi	a2, a2, 1
	fmadd.d	ft1, ft5, ft4, ft1
	bne	a2, a1, .LBB0_2
.LBB0_5:
.LBB0_24:                               # Label of block must be emitted
	auipc	a2, %pcrel_hi(.LCPI0_1)
	addi	a2, a2, %pcrel_lo(.LBB0_24)
	fld	ft2, 0(a2)
	fabs.d	ft3, ft1
	flt.d	a2, ft2, ft3
	beqz	a2, .LBB0_21
# %bb.6:
	slli	a2, a1, 32
	srli	a2, a2, 32
	fld	ft3, 0(a3)
	fmv.d.x	ft4, zero
	li	a6, 2
	fneg.d	ft5, ft4
	fmv.d	fa0, ft4
	j	.LBB0_10
.LBB0_7:                                #   in Loop: Header=BB0_10 Depth=1
	fdiv.d	ft1, ft1, ft5
	fadd.d	fa0, fa0, ft1
.LBB0_8:                                #   in Loop: Header=BB0_10 Depth=1
	fmv.d	ft1, ft0
.LBB0_9:                                #   in Loop: Header=BB0_10 Depth=1
	fabs.d	ft6, ft1
	flt.d	a4, ft2, ft6
	beqz	a4, .LBB0_22
.LBB0_10:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_15 Depth 3
                                        #     Child Loop BB0_18 Depth 2
                                        #       Child Loop BB0_19 Depth 3
	blt	a1, a6, .LBB0_7
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=1
	li	a4, 1
	fmv.d	ft6, ft4
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_13 Depth=2
	slli	a5, a4, 3
	add	a5, a5, a0
	fld	fa1, 0(a5)
	fcvt.d.w	fa2, a4
	fmul.d	fa1, fa1, fa2
	addi	a4, a4, 1
	fmadd.d	ft6, fa1, ft7, ft6
	beq	a4, a2, .LBB0_16
.LBB0_13:                               #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_15 Depth 3
	fmv.d	ft7, ft3
	bltu	a4, a6, .LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=2
	li	a5, 1
	fmv.d	ft7, ft3
.LBB0_15:                               #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addiw	a5, a5, 1
	slli	a3, a5, 32
	srli	a3, a3, 32
	fmul.d	ft7, fa0, ft7
	bltu	a3, a4, .LBB0_15
	j	.LBB0_12
.LBB0_16:                               #   in Loop: Header=BB0_10 Depth=1
	fdiv.d	ft1, ft1, ft6
	fsub.d	fa0, fa0, ft1
	blt	a1, a6, .LBB0_8
# %bb.17:                               #   in Loop: Header=BB0_10 Depth=1
	li	a4, 1
	fmv.d	ft1, ft0
.LBB0_18:                               #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_19 Depth 3
	li	a5, 0
	fmv.d	ft6, ft3
.LBB0_19:                               #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_18 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addiw	a5, a5, 1
	slli	a3, a5, 32
	srli	a3, a3, 32
	fmul.d	ft6, fa0, ft6
	bltu	a3, a4, .LBB0_19
# %bb.20:                               #   in Loop: Header=BB0_18 Depth=2
	slli	a3, a4, 3
	add	a3, a3, a0
	fld	ft7, 0(a3)
	addi	a4, a4, 1
	fmadd.d	ft1, ft7, ft6, ft1
	bne	a4, a2, .LBB0_18
	j	.LBB0_9
.LBB0_21:
	fmv.d.x	fa0, zero
.LBB0_22:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
