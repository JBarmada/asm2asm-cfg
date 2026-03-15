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
	addi	sp, sp, -80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	fsd	fs0, 24(sp)                     # 8-byte Folded Spill
	fsd	fs1, 16(sp)                     # 8-byte Folded Spill
	fsd	fs2, 8(sp)                      # 8-byte Folded Spill
	fsd	fs3, 0(sp)                      # 8-byte Folded Spill
	blez	a1, .LBB0_6
# %bb.1:
	mv	s0, a1
	mv	s1, a0
	li	s2, 0
.LBB0_8:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.LBB0_8)
	fld	fs1, 0(a0)
	fmv.w.x	fs2, zero
	lui	a0, 524288
	addiw	s3, a0, 1
	li	s4, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s0, s0, -1
	addi	s1, s1, 4
	beqz	s0, .LBB0_7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	flw	fs3, 0(s1)
	fcvt.d.s	fs0, fs3
	fmv.d	fa0, fs0
	call	round@plt
	fsub.d	ft0, fs0, fa0
	fabs.d	ft0, ft0
	flt.d	a0, ft0, fs1
	flt.s	a1, fs2, fs3
	and	a0, a0, a1
	beqz	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	fcvt.w.d	a0, fa0, rtz
	and	a1, a0, s3
	bne	a1, s4, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	mulw	a0, a0, a0
	slli	a0, a0, 32
	srli	a0, a0, 32
	add	s2, s2, a0
	j	.LBB0_2
.LBB0_6:
	li	s2, 0
.LBB0_7:
	mv	a0, s2
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	fld	fs0, 24(sp)                     # 8-byte Folded Reload
	fld	fs1, 16(sp)                     # 8-byte Folded Reload
	fld	fs2, 8(sp)                      # 8-byte Folded Reload
	fld	fs3, 0(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
