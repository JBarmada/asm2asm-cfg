	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a2
	mv	s1, a1
	mv	s0, a0
	slli	a0, a1, 2
	call	malloc@plt
	sw	zero, 0(s2)
	blez	s1, .LBB0_5
# %bb.1:
	li	a1, 0
	fmv.w.x	ft0, zero
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s1, s1, -1
	addi	s0, s0, 4
	beqz	s1, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	flw	ft1, 0(s0)
	flt.s	a2, ft0, ft1
	beqz	a2, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a2, a1, 2
	addiw	a1, a1, 1
	sw	a1, 0(s2)
	add	a2, a2, a0
	fsw	ft1, 0(a2)
	j	.LBB0_2
.LBB0_5:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
