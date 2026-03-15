	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
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
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	sd	s8, 0(sp)                       # 8-byte Folded Spill
	mv	s3, a1
	mv	s2, a0
	mv	a0, a1
	call	strlen@plt
	mv	s1, a0
	sext.w	s5, a0
	slliw	a0, a0, 1
	ori	a0, a0, 1
	call	malloc@plt
	mv	s4, a0
	blez	s5, .LBB0_4
# %bb.1:
	li	s0, 0
	add	s7, s4, s5
	slli	a0, s1, 32
	srli	s8, a0, 32
	li	s6, 1
	mv	s1, s5
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	add	a1, s3, s0
	mv	a0, s4
	mv	a2, s1
	call	strncpy@plt
	add	a0, s4, s1
	mv	a1, s3
	mv	a2, s0
	call	strncpy@plt
	sb	zero, 0(s7)
	mv	a0, s2
	mv	a1, s4
	call	strstr@plt
	bnez	a0, .LBB0_5
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	addi	s0, s0, 1
	slt	s6, s0, s5
	addi	s1, s1, -1
	bne	s8, s0, .LBB0_2
	j	.LBB0_5
.LBB0_4:
	li	s6, 0
.LBB0_5:
	mv	a0, s4
	call	free@plt
	andi	a0, s6, 1
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
