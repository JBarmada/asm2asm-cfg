	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function func0
.LCPI0_0:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI0_1:
	.quad	0xbfe0000000000000              # double -0.5
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	li	a1, 0
	call	strtod@plt
	fmv.d.x	ft0, zero
	flt.d	a0, fa0, ft0
	beqz	a0, .LBB0_2
# %bb.1:
.LBB0_4:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_1)
	addi	a0, a0, %pcrel_lo(.LBB0_4)
	fld	ft0, 0(a0)
	fadd.d	fa0, fa0, ft0
	call	ceil@plt
	j	.LBB0_3
.LBB0_2:
.LBB0_5:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.LBB0_5)
	fld	ft0, 0(a0)
	fadd.d	fa0, fa0, ft0
	call	floor@plt
.LBB0_3:
	fcvt.w.d	a0, fa0, rtz
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
