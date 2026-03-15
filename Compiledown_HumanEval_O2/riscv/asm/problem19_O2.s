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
	mv	s2, a1
	mv	s5, a0
	call	strlen@plt
	mv	s4, a0
	sext.w	s0, a0
	mv	a0, s2
	call	strlen@plt
	seqz	a1, s0
	sext.w	s3, a0
	slt	a2, s0, s3
	or	a1, a1, a2
	li	s0, 0
	bnez	a1, .LBB0_3
# %bb.1:
	li	s0, 0
	subw	a0, s4, a0
	addiw	a0, a0, 1
	slli	a0, a0, 32
	srli	s1, a0, 32
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	mv	a0, s5
	mv	a1, s2
	mv	a2, s3
	call	strncmp@plt
	seqz	a0, a0
	addw	s0, s0, a0
	addi	s1, s1, -1
	addi	s5, s5, 1
	bnez	s1, .LBB0_2
.LBB0_3:
	mv	a0, s0
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
