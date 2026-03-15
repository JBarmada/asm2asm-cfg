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
	lbu	s1, 0(a0)
	mv	s2, a1
	beqz	s1, .LBB0_13
# %bb.1:
	mv	s7, a0
	call	__ctype_b_loc@plt
	mv	s3, a0
	li	s4, 0
	li	s5, 44
.LBB0_15:                               # Label of block must be emitted
	auipc	s6, %pcrel_hi(func0.out)
	addi	s6, s6, %pcrel_lo(.LBB0_15)
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #     Child Loop BB0_10 Depth 2
	ld	a0, 0(s3)
	mv	s0, s7
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a1, s1, 255
	slli	a2, a1, 1
	add	a2, a2, a0
	lbu	a2, 1(a2)
	slli	a2, a2, 60
	srli	a2, a2, 63
	addi	a1, a1, -45
	seqz	a1, a1
	or	a1, a1, a2
	bnez	a1, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	lbu	s1, 1(s0)
	addi	s0, s0, 1
	bnez	s1, .LBB0_3
	j	.LBB0_14
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	mv	a1, sp
	li	a2, 10
	mv	a0, s0
	call	strtol@plt
	ld	s7, 0(sp)
	beq	s0, s7, .LBB0_10
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	lbu	a1, 0(s7)
	beq	a1, s5, .LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_2 Depth=1
	bnez	a1, .LBB0_10
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	slli	a1, s4, 2
	add	a1, a1, s6
	sw	a0, 0(a1)
	lbu	s1, 0(s7)
	addiw	s4, s4, 1
	bnez	s1, .LBB0_2
	j	.LBB0_14
.LBB0_9:                                #   in Loop: Header=BB0_10 Depth=2
	addi	s7, s7, 1
.LBB0_10:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	s1, 0(s7)
	beqz	s1, .LBB0_12
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=2
	bne	s1, s5, .LBB0_9
.LBB0_12:                               #   in Loop: Header=BB0_2 Depth=1
	sd	s7, 0(sp)
	bnez	s1, .LBB0_2
	j	.LBB0_14
.LBB0_13:
	li	s4, 0
.LBB0_14:
.LBB0_16:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(func0.out)
	addi	a0, a0, %pcrel_lo(.LBB0_16)
	sw	s4, 0(s2)
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
	.type	func0.out,@object               # @func0.out
	.local	func0.out
	.comm	func0.out,1024,4
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.out
