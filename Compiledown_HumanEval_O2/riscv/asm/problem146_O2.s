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
	mv	s7, a1
	mv	s2, a0
	slli	a0, a1, 2
	call	malloc@plt
	mv	s3, a0
	blez	s7, .LBB0_19
# %bb.1:
	li	s0, 0
	addi	s5, sp, 5
.LBB0_20:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str)
	addi	s4, s4, %pcrel_lo(.LBB0_20)
	li	s6, 2
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	sub	a0, a1, a0
	addi	a0, a0, 48
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	add	a1, s3, s8
	addi	s0, s0, 1
	sw	a0, 0(a1)
	beq	s0, s7, .LBB0_10
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	slli	s8, s0, 2
	add	s1, s2, s8
	lw	a0, 0(s1)
	sraiw	a1, a0, 31
	xor	a0, a0, a1
	subw	a2, a0, a1
	addi	a0, sp, 4
	mv	a1, s4
	call	sprintf@plt
	addi	a0, sp, 4
	call	strlen@plt
	sext.w	a1, a0
	blt	a1, s6, .LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	a1, 0
	slli	a0, a0, 32
	srli	a0, a0, 32
	addi	a0, a0, -1
	mv	a2, s5
.LBB0_6:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	a3, 0(a2)
	addw	a1, a1, a3
	addiw	a1, a1, -48
	addi	a0, a0, -1
	addi	a2, a2, 1
	bnez	a0, .LBB0_6
	j	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	li	a1, 0
.LBB0_8:                                #   in Loop: Header=BB0_4 Depth=1
	lw	a2, 0(s1)
	lbu	a0, 4(sp)
	blez	a2, .LBB0_2
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	add	a0, a0, a1
	addi	a0, a0, -48
	j	.LBB0_3
.LBB0_10:
	blez	s7, .LBB0_19
# %bb.11:
	li	a0, 0
	addi	a7, s3, 4
	addi	t0, s2, 4
	addi	a3, s7, -1
	li	a6, 1
	j	.LBB0_13
.LBB0_12:                               #   in Loop: Header=BB0_13 Depth=1
	addiw	a0, a0, 1
	bge	a0, s7, .LBB0_19
.LBB0_13:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_17 Depth 2
	beq	s7, a6, .LBB0_12
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=1
	lw	a4, 0(s3)
	mv	a5, a3
	mv	a2, t0
	mv	a1, a7
	j	.LBB0_17
.LBB0_15:                               #   in Loop: Header=BB0_17 Depth=2
	sw	a4, 0(a1)
	sw	s1, -4(a1)
	lw	s1, -4(a2)
	lw	s0, 0(a2)
	sw	s1, 0(a2)
	sw	s0, -4(a2)
.LBB0_16:                               #   in Loop: Header=BB0_17 Depth=2
	addi	a1, a1, 4
	addi	a5, a5, -1
	addi	a2, a2, 4
	beqz	a5, .LBB0_12
.LBB0_17:                               #   Parent Loop BB0_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	s1, 0(a1)
	blt	s1, a4, .LBB0_15
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=2
	mv	a4, s1
	j	.LBB0_16
.LBB0_19:
	mv	a0, s3
	call	free@plt
	mv	a0, s2
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
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
