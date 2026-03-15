	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.word	0xbf800000                      # float -1
.LCPI0_1:
	.word	0x3f000000                      # float 0.5
.LCPI0_2:
	.word	0x42c80000                      # float 100
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	fsd	fs0, 0(sp)                      # 8-byte Folded Spill
	fadd.s	ft0, fa0, fa1
	fle.s	a0, ft0, fa2
	fadd.s	ft1, fa0, fa2
	fle.s	a1, ft1, fa1
	or	a0, a0, a1
	fadd.s	ft1, fa1, fa2
	fle.s	a1, ft1, fa0
	or	a0, a0, a1
	bnez	a0, .LBB0_3
# %bb.1:
.LBB0_6:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_1)
	addi	a0, a0, %pcrel_lo(.LBB0_6)
	flw	ft1, 0(a0)
	fadd.s	ft0, ft0, fa2
	fmul.s	ft0, ft0, ft1
	fsub.s	ft1, ft0, fa0
	fmul.s	ft1, ft0, ft1
	fsub.s	ft2, ft0, fa1
	fmul.s	ft1, ft2, ft1
	fsub.s	ft0, ft0, fa2
	fmul.s	ft0, ft0, ft1
	fsqrt.s	fa0, ft0
	feq.s	a0, fa0, fa0
	beqz	a0, .LBB0_5
.LBB0_2:
.LBB0_7:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_2)
	addi	a0, a0, %pcrel_lo(.LBB0_7)
	flw	fs0, 0(a0)
	fmul.s	fa0, fa0, fs0
	call	roundf@plt
	fdiv.s	fa0, fa0, fs0
	j	.LBB0_4
.LBB0_3:
.LBB0_8:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.LBB0_8)
	flw	fa0, 0(a0)
.LBB0_4:
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	fld	fs0, 0(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.LBB0_5:
	fmv.s	fa0, ft0
	call	sqrtf@plt
	j	.LBB0_2
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
