	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a1, .LBB0_7
# %bb.1:
	fmv.w.x	ft1, zero
	mv	a2, a1
	mv	a3, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	flw	ft0, 0(a3)
	fadd.s	ft1, ft1, ft0
	addi	a2, a2, -1
	addi	a3, a3, 4
	bnez	a2, .LBB0_2
# %bb.3:
	fcvt.s.w	ft0, a1
	blez	a1, .LBB0_8
# %bb.4:
	fdiv.s	ft2, ft1, ft0
	fmv.w.x	ft1, zero
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	flw	ft3, 0(a0)
	fsub.s	ft3, ft3, ft2
	fabs.s	ft3, ft3
	fadd.s	ft1, ft1, ft3
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_5
# %bb.6:
	fdiv.s	fa0, ft1, ft0
	ret
.LBB0_7:
	fcvt.s.w	ft0, a1
.LBB0_8:
	fmv.w.x	ft1, zero
	fdiv.s	fa0, ft1, ft0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
