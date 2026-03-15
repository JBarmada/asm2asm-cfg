	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.word	0x7f7fffff                      # float 3.40282347E+38
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	flw	ft1, 0(a0)
	fsw	ft1, 0(a2)
	flw	ft0, 4(a0)
	fsw	ft0, 4(a2)
	blez	a1, .LBB0_8
# %bb.1:
.LBB0_11:                               # Label of block must be emitted
	auipc	a3, %pcrel_hi(.LCPI0_0)
	addi	a3, a3, %pcrel_lo(.LBB0_11)
	flw	ft2, 0(a3)
	li	a6, 0
	addi	a7, a0, 4
	li	t0, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	t0, t0, 1
	addi	a7, a7, 4
	beq	a6, a1, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	mv	a3, a6
	addi	a6, a6, 1
	bgeu	a6, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a3, a3, 2
	add	t1, a0, a3
	mv	a3, a1
	mv	a4, a7
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a3, a3, -1
	addi	a4, a4, 4
	beq	t0, a3, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft3, 0(t1)
	flw	ft4, 0(a4)
	fsub.s	ft4, ft3, ft4
	fabs.s	ft4, ft4
	flt.s	a5, ft4, ft2
	beqz	a5, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	fsw	ft3, 0(a2)
	flw	ft0, 0(a4)
	fsw	ft0, 4(a2)
	fmv.s	ft1, ft3
	fmv.s	ft2, ft4
	j	.LBB0_5
.LBB0_8:
	flt.s	a0, ft0, ft1
	beqz	a0, .LBB0_10
# %bb.9:
	fsw	ft0, 0(a2)
	fsw	ft1, 4(a2)
.LBB0_10:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
