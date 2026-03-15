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
	mv	s2, a2
	mv	s7, a1
	mv	s6, a0
	slli	a0, a1, 2
	call	malloc@plt
	mv	s3, a0
	li	a1, 4
	mv	a0, s7
	call	calloc@plt
	mv	s4, a0
	li	a1, 4
	mv	a0, s7
	call	calloc@plt
	mv	s5, a0
	li	a1, 0
	blez	s7, .LBB0_22
# %bb.1:
	li	s1, 0
	li	a0, 0
	j	.LBB0_5
.LBB0_2:                                #   in Loop: Header=BB0_5 Depth=1
	addiw	a2, s1, 1
	mv	a4, s1
	mv	a5, s4
	mv	s1, a2
.LBB0_3:                                #   in Loop: Header=BB0_5 Depth=1
	slli	a2, a4, 2
	add	a2, a2, a5
	sw	a3, 0(a2)
.LBB0_4:                                #   in Loop: Header=BB0_5 Depth=1
	addi	a1, a1, 1
	beq	a1, s7, .LBB0_14
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
                                        #     Child Loop BB0_11 Depth 2
	slli	a3, a1, 2
	add	a3, a3, s6
	lw	a3, 0(a3)
	blez	a0, .LBB0_9
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	mv	a4, a0
	mv	a5, s5
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s0, 0(a5)
	beq	s0, a3, .LBB0_4
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	addi	a4, a4, -1
	addi	a5, a5, 4
	bnez	a4, .LBB0_7
.LBB0_9:                                #   in Loop: Header=BB0_5 Depth=1
	blez	s1, .LBB0_2
# %bb.10:                               #   in Loop: Header=BB0_5 Depth=1
	mv	a4, s1
	mv	a5, s4
.LBB0_11:                               #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s0, 0(a5)
	beq	s0, a3, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=2
	addi	a4, a4, -1
	addi	a5, a5, 4
	bnez	a4, .LBB0_11
	j	.LBB0_2
.LBB0_13:                               #   in Loop: Header=BB0_5 Depth=1
	addiw	s0, a0, 1
	mv	a4, a0
	mv	a5, s5
	mv	a0, s0
	j	.LBB0_3
.LBB0_14:
	blez	s7, .LBB0_21
# %bb.15:
	li	a2, 0
	li	a1, 0
	slli	a3, a0, 32
	srli	a3, a3, 32
	j	.LBB0_18
.LBB0_16:                               #   in Loop: Header=BB0_18 Depth=1
	slli	a5, a1, 2
	addiw	a1, a1, 1
	add	a5, a5, s3
	sw	a4, 0(a5)
.LBB0_17:                               #   in Loop: Header=BB0_18 Depth=1
	addi	a2, a2, 1
	beq	a2, s7, .LBB0_22
.LBB0_18:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_19 Depth 2
	slli	a4, a2, 2
	add	a4, a4, s6
	lw	a4, 0(a4)
	mv	a5, a3
	mv	s0, s5
	blez	a0, .LBB0_16
.LBB0_19:                               #   Parent Loop BB0_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(s0)
	beq	s1, a4, .LBB0_17
# %bb.20:                               #   in Loop: Header=BB0_19 Depth=2
	addi	a5, a5, -1
	addi	s0, s0, 4
	bnez	a5, .LBB0_19
	j	.LBB0_16
.LBB0_21:
	li	a1, 0
.LBB0_22:
	sw	a1, 0(s2)
	mv	a0, s4
	call	free@plt
	mv	a0, s5
	call	free@plt
	mv	a0, s3
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
