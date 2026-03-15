	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a3
	mv	s3, a2
	mv	s0, a1
	mv	s1, a0
	mv	a0, a2
	call	strlen@plt
	mv	s5, a0
	slli	a0, s0, 3
	call	malloc@plt
	sd	a0, 0(s2)
	li	s4, 0
	blez	s0, .LBB0_5
# %bb.1:
	sext.w	s5, s5
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s0, s0, -1
	addi	s1, s1, 8
	beqz	s0, .LBB0_5
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	ld	s6, 0(s1)
	mv	a0, s6
	mv	a1, s3
	mv	a2, s5
	call	strncmp@plt
	bnez	a0, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	ld	a0, 0(s2)
	slli	a1, s4, 3
	addiw	s4, s4, 1
	add	a0, a0, a1
	sd	s6, 0(a0)
	j	.LBB0_2
.LBB0_5:
	mv	a0, s4
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
