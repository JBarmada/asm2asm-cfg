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
	mv	s2, a3
	mv	s3, a2
	mv	s4, a1
	mv	s6, a0
	call	strlen@plt
	addiw	a0, a0, 1
	call	malloc@plt
	lbu	a3, 0(s6)
	mv	s5, a0
	beqz	a3, .LBB0_7
# %bb.1:
	lbu	s0, 0(s4)
	li	a2, 0
	li	a1, 0
	addi	a4, s4, 1
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	add	a0, s5, a1
	addiw	a1, a1, 1
	sb	a3, 0(a0)
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a2, a2, 1
	add	a0, s6, a2
	lbu	a3, 0(a0)
	beqz	a3, .LBB0_8
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
	mv	a5, a4
	mv	a0, s0
	beqz	s0, .LBB0_2
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a0, a0, 255
	andi	s1, a3, 255
	beq	s1, a0, .LBB0_3
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=2
	lbu	a0, 0(a5)
	addi	a5, a5, 1
	bnez	a0, .LBB0_5
	j	.LBB0_2
.LBB0_7:
	li	a1, 0
.LBB0_8:
	add	a0, s5, a1
	sb	zero, 0(a0)
	mv	a0, s5
	call	strlen@plt
	sext.w	a1, a0
	li	a2, 2
.LBB0_14:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str)
	addi	s1, s1, %pcrel_lo(.LBB0_14)
	blt	a1, a2, .LBB0_13
# %bb.9:
	li	a1, -1
	slli	a1, a1, 32
	srliw	a2, a0, 1
	slli	a0, a0, 32
	add	a3, a0, a1
.LBB0_15:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.LBB0_15)
	mv	a4, s5
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	lbu	a5, 0(a4)
	srai	s0, a3, 32
	add	s0, s0, s5
	lbu	s0, 0(s0)
	bne	a5, s0, .LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=1
	add	a3, a3, a1
	addi	a2, a2, -1
	addi	a4, a4, 1
	bnez	a2, .LBB0_10
	j	.LBB0_13
.LBB0_12:
	mv	s1, a0
.LBB0_13:
	mv	a0, s3
	mv	a1, s5
	call	strcpy@plt
	mv	a0, s2
	mv	a1, s1
	call	strcpy@plt
	mv	a0, s5
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	tail	free@plt
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"True"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"False"
	.size	.L.str.1, 6

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
