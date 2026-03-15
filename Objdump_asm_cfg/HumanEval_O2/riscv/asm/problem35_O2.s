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
	mv	s2, a2
	mv	s1, a1
	mv	s3, a0
	slli	a0, a1, 2
	call	malloc@plt
	blez	s1, .LBB0_16
# %bb.1:
	li	a2, 0
	li	t0, 0
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	slli	a1, t0, 2
	addiw	t0, t0, 1
	add	a1, a1, a0
	sw	a3, 0(a1)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a2, 1
	beq	a2, s1, .LBB0_8
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	slli	a1, a2, 2
	add	a1, a1, s3
	lw	a3, 0(a1)
	blez	t0, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	mv	a1, t0
	mv	a4, a0
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a5, 0(a4)
	beq	a3, a5, .LBB0_3
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a1, a1, -1
	addi	a4, a4, 4
	bnez	a1, .LBB0_6
	j	.LBB0_2
.LBB0_8:
	li	a1, 2
	blt	t0, a1, .LBB0_17
# %bb.9:
	li	a7, 0
	addiw	a1, t0, -1
	slli	a1, a1, 32
	srli	a6, a1, 32
	addi	a2, a0, 4
	li	a5, 1
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a5, a5, 1
	addi	a2, a2, 4
	beq	a7, a6, .LBB0_17
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
	mv	a1, a7
	addi	a7, a7, 1
	bgeu	a7, t0, .LBB0_10
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	slli	a1, a1, 2
	add	s1, a0, a1
	mv	a1, t0
	mv	a3, a2
	j	.LBB0_14
.LBB0_13:                               #   in Loop: Header=BB0_14 Depth=2
	addi	a1, a1, -1
	addi	a3, a3, 4
	beq	a5, a1, .LBB0_10
.LBB0_14:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a4, 0(s1)
	lw	s0, 0(a3)
	bge	s0, a4, .LBB0_13
# %bb.15:                               #   in Loop: Header=BB0_14 Depth=2
	sw	s0, 0(s1)
	sw	a4, 0(a3)
	j	.LBB0_13
.LBB0_16:
	li	t0, 0
.LBB0_17:
	sw	t0, 0(s2)
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
