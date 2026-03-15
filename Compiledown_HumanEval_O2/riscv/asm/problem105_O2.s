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
	mv	s2, a3
	mv	s3, a2
	mv	s5, a1
	mv	s4, a0
	slli	a0, a1, 2
	call	malloc@plt
	sd	a0, 0(s3)
	sw	zero, 0(s2)
	blez	s5, .LBB0_17
# %bb.1:
	li	t0, 0
	li	a2, 0
	lui	a3, 838861
	addiw	a3, a3, -819
	slli	a3, a3, 32
	j	.LBB0_3
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a2, a2, 1
	beq	a2, s5, .LBB0_8
.LBB0_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	slli	a4, a2, 2
	add	a4, a4, s4
	lw	s0, 0(a4)
	seqz	a5, s0
	blez	s0, .LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	mv	a4, s0
.LBB0_5:                                #   Parent Loop BB0_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	s1, a4, 1
	seqz	s1, s1
	or	a5, a5, s1
	slli	s1, a4, 32
	mulhu	s1, s1, a3
	sltiu	a4, a4, 10
	srli	s1, s1, 35
	xori	a4, a4, 1
	xori	a1, a5, 1
	and	a1, a1, a4
	mv	a4, s1
	bnez	a1, .LBB0_5
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	andi	a1, a5, 1
	bnez	a1, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a1, t0, 2
	add	a1, a1, a0
	sw	s0, 0(a1)
	addiw	t0, t0, 1
	sw	t0, 0(s2)
	j	.LBB0_2
.LBB0_8:
	li	a2, 2
	blt	t0, a2, .LBB0_17
# %bb.9:
	li	a2, 0
	addiw	a7, t0, -1
	addi	a6, a0, 4
	mv	a5, a7
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addiw	a2, a2, 1
	addiw	a5, a5, -1
	bge	a2, a7, .LBB0_17
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
	not	a1, a2
	addw	a1, t0, a1
	blez	a1, .LBB0_10
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	lw	a3, 0(a0)
	slli	a1, a5, 32
	srli	s1, a1, 32
	mv	a4, a6
	j	.LBB0_15
.LBB0_13:                               #   in Loop: Header=BB0_15 Depth=2
	sw	s0, -4(a4)
	sw	a3, 0(a4)
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=2
	addi	s1, s1, -1
	addi	a4, a4, 4
	beqz	s1, .LBB0_10
.LBB0_15:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s0, 0(a4)
	blt	s0, a3, .LBB0_13
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=2
	mv	a3, s0
	j	.LBB0_14
.LBB0_17:
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
