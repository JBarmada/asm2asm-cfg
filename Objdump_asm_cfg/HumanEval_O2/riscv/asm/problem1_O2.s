	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	mv	a6, a0
	li	a0, 10
	blez	a1, .LBB0_8
# %bb.1:
	li	a7, 0
	addi	t0, a6, 4
	li	a4, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a4, a4, 1
	addi	t0, t0, 4
	beq	a7, a1, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	mv	a2, a7
	addi	a7, a7, 1
	bgeu	a7, a1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a2, 2
	add	a2, a2, a6
	flw	ft0, 0(a2)
	mv	a2, a1
	mv	a3, t0
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	flw	ft1, 0(a3)
	fsub.s	ft1, ft0, ft1
	fabs.s	ft1, ft1
	flt.s	a5, ft1, fa0
	bnez	a5, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	addi	a2, a2, -1
	addi	a3, a3, 4
	bne	a4, a2, .LBB0_5
	j	.LBB0_2
.LBB0_7:
	li	a0, 1
.LBB0_8:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
