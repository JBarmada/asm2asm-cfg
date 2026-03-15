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
	mv	s3, a0
	slli	a0, a0, 2
	call	malloc@plt
	mv	s2, a0
	addiw	s0, s3, 1
	slli	s1, s0, 3
	mv	a0, s1
	call	malloc@plt
	mv	s7, a0
	mv	a0, s1
	call	malloc@plt
	mv	s6, a0
	li	s1, 0
	slli	s5, s0, 32
	srli	s0, s5, 32
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	li	a0, 3
	li	a1, 4
	call	calloc@plt
	add	a1, s7, s1
	sd	a0, 0(a1)
	li	a0, 3
	li	a1, 4
	call	calloc@plt
	add	a1, s6, s1
	sd	a0, 0(a1)
	addi	s0, s0, -1
	addi	s1, s1, 8
	bnez	s0, .LBB0_1
# %bb.2:
	ld	a2, 0(s7)
	ld	a0, 0(s6)
	sw	zero, 8(a2)
	sw	zero, 4(a2)
	sw	zero, 0(a2)
	sw	zero, 8(a0)
	sw	zero, 4(a0)
	sw	zero, 0(a0)
	blez	s3, .LBB0_5
# %bb.3:
	srli	a6, s5, 32
	addi	a1, s7, 8
	li	a3, 1
	lui	a4, 349525
	addiw	a7, a4, 1366
	mv	a5, s2
	li	s1, 1
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	mulw	s0, a3, a3
	subw	s0, s0, s1
	addiw	s0, s0, 1
	mul	a0, s0, a7
	srli	a4, a0, 63
	srli	a0, a0, 32
	addw	a0, a0, a4
	slliw	a4, a0, 1
	addw	a0, a0, a4
	subw	a0, s0, a0
	sw	a0, 0(a5)
	ld	a4, 0(a1)
	lw	s0, 0(a2)
	sw	s0, 0(a4)
	lw	s0, 4(a2)
	sw	s0, 4(a4)
	lw	a2, 8(a2)
	sw	a2, 8(a4)
	slli	a0, a0, 2
	add	a0, a0, a4
	lw	a2, 0(a0)
	addiw	a2, a2, 1
	sw	a2, 0(a0)
	addi	a3, a3, 1
	addiw	s1, s1, 1
	addi	a5, a5, 4
	addi	a1, a1, 8
	mv	a2, a4
	bne	a6, a3, .LBB0_4
.LBB0_5:
	srli	t2, s5, 32
	addi	t0, s6, 8
	addi	t1, t2, -1
	li	a7, 1
	li	a6, 2
	lui	a0, 349525
	addiw	t4, a0, 1366
	li	t3, 1
	j	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_8 Depth=1
	bgeu	t3, a6, .LBB0_17
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=1
	addiw	t3, t3, 1
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #     Child Loop BB0_12 Depth 2
	blez	s3, .LBB0_11
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	ld	a0, 0(s6)
	mv	t6, t1
	mv	s4, t0
	mv	s1, s7
	mv	a3, s2
.LBB0_10:                               #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld	s0, 0(s4)
	lw	a4, 0(a0)
	sw	a4, 0(s0)
	lw	a4, 4(a0)
	sw	a4, 4(s0)
	lw	a0, 8(a0)
	sw	a0, 8(s0)
	ld	a0, 0(s1)
	lw	a4, 0(a3)
	lw	t5, 0(a0)
	mul	a5, a4, t4
	srli	a2, a5, 63
	srli	a5, a5, 32
	addw	a2, a2, a5
	slliw	a5, a2, 1
	addw	a2, a2, a5
	subw	a2, a4, a2
	slli	a2, a2, 2
	add	a2, a2, s0
	lw	a5, 0(a2)
	addw	a5, a5, t5
	sw	a5, 0(a2)
	lw	t5, 4(a0)
	addiw	a5, a4, 1
	mul	a2, a5, t4
	srli	a1, a2, 63
	srli	a2, a2, 32
	addw	a1, a1, a2
	slliw	a2, a1, 1
	addw	a1, a1, a2
	subw	a1, a5, a1
	slli	a1, a1, 2
	add	a1, a1, s0
	lw	a2, 0(a1)
	addw	a2, a2, t5
	sw	a2, 0(a1)
	lw	a0, 8(a0)
	addiw	a1, a4, 2
	mul	a2, a1, t4
	srli	a4, a2, 63
	srli	a2, a2, 32
	addw	a2, a2, a4
	slliw	a4, a2, 1
	addw	a2, a2, a4
	subw	a1, a1, a2
	slli	a1, a1, 2
	add	a1, a1, s0
	lw	a2, 0(a1)
	addw	a0, a0, a2
	sw	a0, 0(a1)
	addi	a3, a3, 4
	addi	s1, s1, 8
	addi	t6, t6, -1
	addi	s4, s4, 8
	mv	a0, s0
	bnez	t6, .LBB0_10
.LBB0_11:                               #   in Loop: Header=BB0_8 Depth=1
	mv	a0, t2
	mv	a1, s6
	mv	a2, s7
	bltz	s3, .LBB0_6
.LBB0_12:                               #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld	a3, 0(a1)
	ld	a4, 0(a2)
	lw	a5, 0(a3)
	sw	a5, 0(a4)
	lw	a5, 4(a3)
	sw	zero, 0(a3)
	sw	a5, 4(a4)
	lw	a5, 8(a3)
	sw	zero, 4(a3)
	sw	a5, 8(a4)
	sw	zero, 8(a3)
	addi	a2, a2, 8
	addi	a0, a0, -1
	addi	a1, a1, 8
	bnez	a0, .LBB0_12
# %bb.13:                               #   in Loop: Header=BB0_8 Depth=1
	bgeu	a7, t3, .LBB0_7
# %bb.14:
	slli	a0, s3, 3
	add	a0, a0, s7
	ld	a0, 0(a0)
	lw	s4, 0(a0)
	bltz	s3, .LBB0_18
# %bb.15:
	srli	s3, s5, 32
	mv	s1, s7
	mv	s0, s6
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	call	free@plt
	ld	a0, 0(s0)
	call	free@plt
	addi	s0, s0, 8
	addi	s3, s3, -1
	addi	s1, s1, 8
	bnez	s3, .LBB0_16
	j	.LBB0_18
.LBB0_17:
	slli	a0, s3, 3
	add	a0, a0, s7
	ld	a0, 0(a0)
	lw	s4, 0(a0)
.LBB0_18:
	mv	a0, s7
	call	free@plt
	mv	a0, s6
	call	free@plt
	mv	a0, s2
	call	free@plt
	mv	a0, s4
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
