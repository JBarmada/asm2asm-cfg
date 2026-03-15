	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.word	0xc61c4000                      # float -1.0E+4
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
.LBB0_7:                                # Label of block must be emitted
	auipc	a2, %pcrel_hi(.LCPI0_0)
	addi	a2, a2, %pcrel_lo(.LBB0_7)
	blez	a1, .LBB0_5
# %bb.1:
	flw	ft0, 0(a2)
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a1, a1, -1
	addi	a0, a0, 4
	fmv.s	ft0, fa0
	beqz	a1, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	flw	fa0, 0(a0)
	flt.s	a2, ft0, fa0
	bnez	a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	fmv.s	fa0, ft0
	j	.LBB0_2
.LBB0_5:
	flw	fa0, 0(a2)
.LBB0_6:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
