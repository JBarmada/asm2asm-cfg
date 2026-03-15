	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	fsd	fs0, 24(sp)                     # 8-byte Folded Spill
	fsd	fs1, 16(sp)                     # 8-byte Folded Spill
	fsd	fs2, 8(sp)                      # 8-byte Folded Spill
	fmv.s	fs0, fa2
	fmv.s	fs2, fa1
	fmv.s	fs1, fa0
	call	roundf@plt
	feq.s	a0, fa0, fs1
	xori	s0, a0, 1
	fmv.s	fa0, fs2
	call	roundf@plt
	feq.s	a0, fa0, fs2
	xori	a0, a0, 1
	or	s0, s0, a0
	fmv.s	fa0, fs0
	call	roundf@plt
	feq.s	a0, fa0, fs0
	xori	a0, a0, 1
	or	a1, s0, a0
	li	a0, 0
	bnez	a1, .LBB0_2
# %bb.1:
	fadd.s	ft0, fs1, fs2
	feq.s	a0, ft0, fs0
	fadd.s	ft0, fs1, fs0
	feq.s	a1, ft0, fs2
	or	a0, a0, a1
	fadd.s	ft0, fs2, fs0
	feq.s	a1, ft0, fs1
	or	a0, a0, a1
.LBB0_2:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	fld	fs0, 24(sp)                     # 8-byte Folded Reload
	fld	fs1, 16(sp)                     # 8-byte Folded Reload
	fld	fs2, 8(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
