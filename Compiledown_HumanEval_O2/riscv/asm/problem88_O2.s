	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -112
	sd	ra, 104(sp)                     # 8-byte Folded Spill
	sd	s0, 96(sp)                      # 8-byte Folded Spill
	sd	s1, 88(sp)                      # 8-byte Folded Spill
	sd	s2, 80(sp)                      # 8-byte Folded Spill
	sd	s3, 72(sp)                      # 8-byte Folded Spill
	sd	s4, 64(sp)                      # 8-byte Folded Spill
	sd	s5, 56(sp)                      # 8-byte Folded Spill
	sd	s6, 48(sp)                      # 8-byte Folded Spill
	sd	s7, 40(sp)                      # 8-byte Folded Spill
	sd	s8, 32(sp)                      # 8-byte Folded Spill
	sd	s9, 24(sp)                      # 8-byte Folded Spill
	sd	s10, 16(sp)                     # 8-byte Folded Spill
	sd	s11, 8(sp)                      # 8-byte Folded Spill
	mv	s2, a4
	mv	s7, a3
	mv	s3, a2
	mv	s4, a1
	mv	s5, a0
	li	a0, 800
	call	malloc@plt
	mv	s6, a0
	blez	s4, .LBB0_8
# %bb.1:
	li	s9, 0
	li	s11, 0
	li	s8, 1
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s9, s9, 1
	beq	s9, s4, .LBB0_9
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	slli	a0, s9, 2
	add	a0, a0, s3
	lw	s1, 0(a0)
	blez	s1, .LBB0_2
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a0, s9, 3
	add	a0, a0, s5
	ld	s10, 0(a0)
	addi	s0, s1, 1
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=2
	addi	s0, s0, -1
	bge	s8, s0, .LBB0_2
.LBB0_6:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addiw	s1, s1, -1
	slli	a0, s1, 32
	srli	a0, a0, 30
	add	a0, a0, s10
	lw	a0, 0(a0)
	bne	a0, s7, .LBB0_5
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	li	a0, 8
	call	malloc@plt
	slli	a1, s11, 3
	add	a1, a1, s6
	sd	a0, 0(a1)
	sw	s9, 0(a0)
	sw	s1, 4(a0)
	addiw	s11, s11, 1
	j	.LBB0_5
.LBB0_8:
	li	s11, 0
.LBB0_9:
	sw	s11, 0(s2)
	mv	a0, s6
	ld	ra, 104(sp)                     # 8-byte Folded Reload
	ld	s0, 96(sp)                      # 8-byte Folded Reload
	ld	s1, 88(sp)                      # 8-byte Folded Reload
	ld	s2, 80(sp)                      # 8-byte Folded Reload
	ld	s3, 72(sp)                      # 8-byte Folded Reload
	ld	s4, 64(sp)                      # 8-byte Folded Reload
	ld	s5, 56(sp)                      # 8-byte Folded Reload
	ld	s6, 48(sp)                      # 8-byte Folded Reload
	ld	s7, 40(sp)                      # 8-byte Folded Reload
	ld	s8, 32(sp)                      # 8-byte Folded Reload
	ld	s9, 24(sp)                      # 8-byte Folded Reload
	ld	s10, 16(sp)                     # 8-byte Folded Reload
	ld	s11, 8(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
