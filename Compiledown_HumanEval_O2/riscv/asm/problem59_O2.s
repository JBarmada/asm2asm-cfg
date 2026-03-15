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
	mv	s2, a4
	mv	s4, a3
	mv	s3, a2
	mv	s6, a1
	mv	s5, a0
	slli	a0, a1, 2
	call	malloc@plt
	blez	s6, .LBB0_21
# %bb.1:
	li	a2, 0
	li	a3, 0
	slli	a1, s4, 32
	srli	a6, a1, 32
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	slli	a1, a3, 2
	addiw	a3, a3, 1
	add	a1, a1, a0
	sw	a4, 0(a1)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a2, 1
	beq	a2, s6, .LBB0_12
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #     Child Loop BB0_10 Depth 2
	slli	a4, a2, 2
	blez	a3, .LBB0_8
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	add	a1, s5, a4
	lw	a5, 0(a1)
	mv	a1, a3
	mv	s1, a0
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s0, 0(s1)
	beq	s0, a5, .LBB0_3
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=2
	addi	a1, a1, -1
	addi	s1, s1, 4
	bnez	a1, .LBB0_6
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	blez	s4, .LBB0_3
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	add	a1, s5, a4
	lw	a4, 0(a1)
	mv	a5, a6
	mv	a1, s3
.LBB0_10:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a1)
	beq	a4, s1, .LBB0_2
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=2
	addi	a5, a5, -1
	addi	a1, a1, 4
	bnez	a5, .LBB0_10
	j	.LBB0_3
.LBB0_12:
	li	a1, 2
	blt	a3, a1, .LBB0_22
# %bb.13:
	li	a2, 0
	addiw	a7, a3, -1
	addi	a6, a0, 4
	mv	a5, a7
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=1
	addiw	a2, a2, 1
	addiw	a5, a5, -1
	bge	a2, a7, .LBB0_22
.LBB0_15:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	not	a1, a2
	addw	a1, a1, a3
	blez	a1, .LBB0_14
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=1
	lw	a1, 0(a0)
	slli	a4, a5, 32
	srli	s1, a4, 32
	mv	a4, a6
	j	.LBB0_19
.LBB0_17:                               #   in Loop: Header=BB0_19 Depth=2
	sw	s0, -4(a4)
	sw	a1, 0(a4)
.LBB0_18:                               #   in Loop: Header=BB0_19 Depth=2
	addi	s1, s1, -1
	addi	a4, a4, 4
	beqz	s1, .LBB0_14
.LBB0_19:                               #   Parent Loop BB0_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s0, 0(a4)
	blt	s0, a1, .LBB0_17
# %bb.20:                               #   in Loop: Header=BB0_19 Depth=2
	mv	a1, s0
	j	.LBB0_18
.LBB0_21:
	li	a3, 0
.LBB0_22:
	sw	a3, 0(s2)
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
