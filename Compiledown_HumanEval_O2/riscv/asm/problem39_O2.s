	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	sd	s8, 16(sp)                      # 8-byte Folded Spill
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	mv	s2, a1
	mv	s4, a0
	call	strlen@plt
	sext.w	s5, a0
	blez	s5, .LBB0_10
# %bb.1:
	mv	s3, a0
	li	s1, 0
	addiw	a0, a0, 2
	lui	a1, 699051
	addiw	a1, a1, -1365
	slli	a1, a1, 32
	slli	a0, a0, 32
	mulhu	a0, a0, a1
	srli	s0, a0, 33
	addi	s8, sp, 4
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	lb	a0, 5(sp)
	lb	a1, 4(sp)
	sb	a0, 4(sp)
	lb	a0, 6(sp)
	sb	a0, 5(sp)
	sb	a1, 6(sp)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a1, sp, 4
	mv	a0, s6
	mv	a2, s7
	call	strncpy@plt
	addi	s0, s0, -1
	addi	s1, s1, 3
	beqz	s0, .LBB0_10
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	addiw	a0, s1, 3
	li	s9, 3
	blt	s5, a0, .LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	s7, 3
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_4 Depth=1
	subw	s7, s3, s1
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	add	s6, s4, s1
	addi	a0, sp, 4
	mv	a1, s6
	mv	a2, s7
	call	strncpy@plt
	add	a0, s8, s7
	sb	zero, 0(a0)
	bne	s7, s9, .LBB0_3
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	beqz	s2, .LBB0_2
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	lb	a0, 5(sp)
	lb	a1, 6(sp)
	sb	a0, 6(sp)
	lb	a0, 4(sp)
	sb	a0, 5(sp)
	sb	a1, 4(sp)
	j	.LBB0_3
.LBB0_10:
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	ld	s8, 16(sp)                      # 8-byte Folded Reload
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
