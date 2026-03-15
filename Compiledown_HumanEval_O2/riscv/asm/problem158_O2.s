	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	fmul.s	ft0, fa1, fa1
	fmadd.s	ft1, fa0, fa0, ft0
.LBB0_5:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.LBB0_5)
	fld	ft0, 0(a0)
	fnmsub.s	ft1, fa2, fa2, ft1
	fabs.s	ft1, ft1
	fcvt.d.s	ft1, ft1
	flt.d	a1, ft1, ft0
	li	a0, 1
	bnez	a1, .LBB0_4
# %bb.1:
	fmul.s	ft1, fa2, fa2
	fmadd.s	ft2, fa0, fa0, ft1
	fnmsub.s	ft2, fa1, fa1, ft2
	fabs.s	ft2, ft2
	fcvt.d.s	ft2, ft2
	flt.d	a1, ft2, ft0
	bnez	a1, .LBB0_4
# %bb.2:
	fmadd.s	ft1, fa1, fa1, ft1
	fnmsub.s	ft1, fa0, fa0, ft1
	fabs.s	ft1, ft1
	fcvt.d.s	ft1, ft1
	flt.d	a1, ft1, ft0
	bnez	a1, .LBB0_4
# %bb.3:
	li	a0, 0
.LBB0_4:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
