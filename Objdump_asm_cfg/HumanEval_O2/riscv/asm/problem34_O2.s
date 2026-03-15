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
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	mv	s4, a2
	mv	s2, a1
	mv	s3, a0
	lui	a0, 349525
	addiw	a0, a0, 1366
	mul	a0, a1, a0
	srli	a1, a0, 63
	srli	a0, a0, 32
	addw	a0, a0, a1
	addiw	a0, a0, 1
	slli	a0, a0, 2
	call	malloc@plt
	blez	s2, .LBB0_18
# %bb.1:
	addiw	a1, s2, -1
	lui	a2, 699051
	addiw	a2, a2, -1365
	slli	a2, a2, 32
	slli	a1, a1, 32
	mulhu	a1, a1, a2
	srli	a6, a1, 33
	addi	a1, a6, 1
	mv	a2, s3
	mv	a3, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a2)
	sw	a4, 0(a3)
	addi	a3, a3, 4
	addi	a1, a1, -1
	addi	a2, a2, 12
	bnez	a1, .LBB0_2
# %bb.3:
	blez	a6, .LBB0_12
# %bb.4:
	li	a7, 0
	addi	t1, a0, 4
	li	a4, 1
	mv	a5, a6
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	addi	a4, a4, 1
	addi	t1, t1, 4
	addi	a5, a5, -1
	beq	a7, a6, .LBB0_12
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	li	s1, 0
	mv	t0, a7
	addi	a7, a7, 1
	mv	a3, t1
	mv	a1, t0
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_8 Depth=2
	addi	s1, s1, 1
	addi	a3, a3, 4
	beq	a5, s1, .LBB0_10
.LBB0_8:                                #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a2, 0(a3)
	sext.w	s0, a1
	slli	s0, s0, 2
	add	s0, s0, a0
	lw	s0, 0(s0)
	bge	a2, s0, .LBB0_7
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=2
	add	a1, a4, s1
	j	.LBB0_7
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=1
	slli	a2, a1, 32
	srli	a2, a2, 32
	beq	t0, a2, .LBB0_5
# %bb.11:                               #   in Loop: Header=BB0_6 Depth=1
	slli	a2, t0, 2
	add	a2, a2, a0
	sext.w	a1, a1
	slli	a1, a1, 2
	add	a1, a1, a0
	lw	a3, 0(a1)
	lw	s1, 0(a2)
	sw	a3, 0(a2)
	sw	s1, 0(a1)
	j	.LBB0_5
.LBB0_12:
	blez	s2, .LBB0_18
# %bb.13:
	li	a1, 0
	lui	a2, 699051
	addiw	a2, a2, -1365
	slli	a2, a2, 32
	j	.LBB0_16
.LBB0_14:                               #   in Loop: Header=BB0_16 Depth=1
	mv	a3, s3
.LBB0_15:                               #   in Loop: Header=BB0_16 Depth=1
	lw	a3, 0(a3)
	sw	a3, 0(s4)
	addi	a1, a1, 1
	addi	s4, s4, 4
	addi	s3, s3, 4
	beq	s2, a1, .LBB0_18
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	slli	a3, a1, 32
	mulhu	a3, a3, a2
	srli	a3, a3, 33
	slliw	a4, a3, 1
	addw	a4, a4, a3
	subw	a4, a1, a4
	bnez	a4, .LBB0_14
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=1
	slli	a3, a3, 2
	add	a3, a3, a0
	j	.LBB0_15
.LBB0_18:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	tail	free@plt
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
