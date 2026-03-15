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
	sd	a2, 0(sp)                       # 8-byte Folded Spill
	mv	s3, a1
	mv	s4, a0
	call	strlen@plt
	addi	s5, a0, 1
	mv	a0, s5
	call	malloc@plt
	mv	s10, a0
	call	__ctype_b_loc@plt
	mv	s8, a0
	li	s1, 0
	li	s6, 0
	li	s0, 0
	li	s11, 0
	li	s9, 0
.LBB0_9:                                # Label of block must be emitted
	auipc	s7, %pcrel_hi(.L.str)
	addi	s7, s7, %pcrel_lo(.LBB0_9)
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	li	s0, 0
	addiw	s11, s1, 1
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	s1, s1, 1
	beq	s5, s1, .LBB0_8
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	add	a0, s4, s1
	lbu	a1, 0(a0)
	ld	a0, 0(s8)
	slli	a2, a1, 1
	add	a0, a0, a2
	lhu	s2, 0(a0)
	seqz	a0, a1
	slli	a2, s2, 50
	srli	a2, a2, 63
	or	a0, a0, a2
	beqz	a0, .LBB0_6
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	bne	s0, s3, .LBB0_1
# %bb.5:                                #   in Loop: Header=BB0_3 Depth=1
	subw	a0, s1, s11
	add	a0, a0, s10
	sb	zero, 0(a0)
	addiw	s0, s9, 1
	slli	a1, s0, 3
	mv	a0, s6
	call	realloc@plt
	mv	s6, a0
	mv	a0, s10
	call	strlen@plt
	addi	a0, a0, 1
	call	malloc@plt
	slli	a1, s9, 3
	add	a1, a1, s6
	sd	a0, 0(a1)
	mv	a1, s10
	call	strcpy@plt
	mv	s9, s0
	j	.LBB0_1
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
	subw	a0, s1, s11
	add	a0, a0, s10
	sb	a1, 0(a0)
	li	a2, 11
	mv	a0, s7
	call	memchr@plt
	bnez	a0, .LBB0_2
# %bb.7:                                #   in Loop: Header=BB0_3 Depth=1
	slli	a0, s2, 53
	srli	a0, a0, 63
	addw	s0, s0, a0
	j	.LBB0_2
.LBB0_8:
	mv	a0, s10
	call	free@plt
	ld	a0, 0(sp)                       # 8-byte Folded Reload
	sw	s9, 0(a0)
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
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"aeiouAEIOU"
	.size	.L.str, 11

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
