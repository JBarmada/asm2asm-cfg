	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function func0
.LCPI0_0:
	.word	0x3f000000                      # float 0.5
	.text
	.globl	func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_8
# %bb.1:
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
	mv	a2, a6
	addi	a6, a6, 1
	bgeu	a6, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a2, 2
	add	a5, a0, a2
	mv	a4, a1
	mv	a2, a7
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a4, a4, -1
	addi	a2, a2, 4
	beq	t0, a4, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft0, 0(a5)
	flw	ft1, 0(a2)
	flt.s	a3, ft1, ft0
	beqz	a3, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	fsw	ft1, 0(a5)
	fsw	ft0, 0(a2)
	j	.LBB0_5
.LBB0_8:
	lui	a2, 524288
	addiw	a2, a2, 1
	and	a2, a2, a1
	li	a3, 1
	bne	a2, a3, .LBB0_10
# %bb.9:
	srliw	a1, a1, 1
	slli	a1, a1, 2
	add	a0, a0, a1
	flw	fa0, 0(a0)
	ret
.LBB0_10:
	srliw	a2, a1, 31
	addw	a1, a1, a2
	slli	a1, a1, 1
	andi	a1, a1, -4
	add	a0, a0, a1
	flw	ft0, 0(a0)
	flw	ft1, -4(a0)
.LBB0_11:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.LBB0_11)
	flw	ft2, 0(a0)
	fadd.s	ft0, ft0, ft1
	fmul.s	fa0, ft0, ft2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
