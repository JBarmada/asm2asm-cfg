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
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	mv	s1, a3
	mv	s3, a2
	mv	s4, a1
	mv	s2, a0
	slli	s5, a3, 2
	mv	a0, s5
	call	malloc@plt
	mv	s6, a0
	mv	a0, s5
	call	malloc@plt
	mv	s9, a0
	blez	s1, .LBB0_3
# %bb.1:
	mv	a0, s6
	mv	a1, s4
	mv	a2, s5
	call	memcpy@plt
	li	a0, 0
	mv	a1, s9
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	sw	a0, 0(a1)
	addi	a0, a0, 1
	addi	a1, a1, 4
	bne	s1, a0, .LBB0_2
.LBB0_3:
	blez	s3, .LBB0_43
# %bb.4:
	li	s5, 0
.LBB0_44:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str)
	addi	s4, s4, %pcrel_lo(.LBB0_44)
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	slli	a1, s1, 2
	add	s7, s6, a1
	lw	a1, 0(s7)
	slli	a0, a0, 2
	add	a0, a0, s6
	lw	a0, 0(a0)
	fcvt.d.w	fa0, a1
	fcvt.d.w	fa1, a0
	call	pow@plt
	fcvt.w.d	a0, fa0, rtz
	sw	a0, 0(s7)
	sw	s1, 0(s0)
	beq	s5, s3, .LBB0_14
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_9 Depth 2
                                        #     Child Loop BB0_12 Depth 2
	slli	a0, s5, 3
	add	a0, a0, s2
	ld	a0, 0(a0)
	mv	a1, s4
	call	strcmp@plt
	beqz	a0, .LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	addi	s5, s5, 1
	bne	s5, s3, .LBB0_6
	j	.LBB0_14
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=1
	slli	a0, s5, 2
	add	a0, a0, s9
	lw	s1, 0(a0)
	slli	a1, s1, 2
.LBB0_9:                                #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a1, a1, s9
	lw	a1, 0(a1)
	beq	a1, s1, .LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=2
	mv	s1, a1
	sw	a1, 0(a0)
	slli	a1, a1, 2
	j	.LBB0_9
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=1
	addi	s5, s5, 1
	slli	a0, s5, 2
	add	s0, s9, a0
	lw	a0, 0(s0)
	slli	a1, a0, 2
.LBB0_12:                               #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a1, a1, s9
	lw	a1, 0(a1)
	beq	a1, a0, .LBB0_5
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=2
	mv	a0, a1
	sw	a1, 0(s0)
	slli	a1, a1, 2
	j	.LBB0_12
.LBB0_14:
	blez	s3, .LBB0_43
# %bb.15:
	li	s8, 0
.LBB0_45:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str.1)
	addi	s4, s4, %pcrel_lo(.LBB0_45)
.LBB0_46:                               # Label of block must be emitted
	auipc	s5, %pcrel_hi(.L.str.2)
	addi	s5, s5, %pcrel_lo(.LBB0_46)
	j	.LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_17 Depth=1
	addi	s8, s8, 1
	beq	s8, s3, .LBB0_29
.LBB0_17:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #     Child Loop BB0_23 Depth 2
	slli	a0, s8, 3
	add	a0, a0, s2
	ld	s1, 0(a0)
	mv	a0, s1
	mv	a1, s4
	call	strcmp@plt
	mv	s7, a0
	beqz	a0, .LBB0_19
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	bnez	a0, .LBB0_16
.LBB0_19:                               #   in Loop: Header=BB0_17 Depth=1
	slli	a0, s8, 2
	add	a1, s9, a0
	lw	a0, 0(a1)
	slli	a2, a0, 2
.LBB0_20:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a2, a2, s9
	lw	a2, 0(a2)
	beq	a2, a0, .LBB0_22
# %bb.21:                               #   in Loop: Header=BB0_20 Depth=2
	mv	a0, a2
	sw	a2, 0(a1)
	slli	a2, a2, 2
	j	.LBB0_20
.LBB0_22:                               #   in Loop: Header=BB0_17 Depth=1
	addi	s8, s8, 1
	slli	a1, s8, 2
	add	a1, a1, s9
	lw	a2, 0(a1)
	slli	a3, a2, 2
.LBB0_23:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a3, a3, s9
	lw	a3, 0(a3)
	beq	a3, a2, .LBB0_25
# %bb.24:                               #   in Loop: Header=BB0_23 Depth=2
	mv	a2, a3
	sw	a3, 0(a1)
	slli	a3, a3, 2
	j	.LBB0_23
.LBB0_25:                               #   in Loop: Header=BB0_17 Depth=1
	slli	a2, a2, 2
	add	a2, a2, s6
	lw	a3, 0(a2)
	slli	a2, a0, 2
	add	a2, a2, s6
	lw	a4, 0(a2)
	beqz	s7, .LBB0_27
# %bb.26:                               #   in Loop: Header=BB0_17 Depth=1
	divw	a3, a4, a3
	j	.LBB0_28
.LBB0_27:                               #   in Loop: Header=BB0_17 Depth=1
	mulw	a3, a4, a3
.LBB0_28:                               #   in Loop: Header=BB0_17 Depth=1
	sw	a3, 0(a2)
	sw	a0, 0(a1)
	bne	s8, s3, .LBB0_17
.LBB0_29:
	blez	s3, .LBB0_43
# %bb.30:
	li	s8, 0
.LBB0_47:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str.3)
	addi	s4, s4, %pcrel_lo(.LBB0_47)
.LBB0_48:                               # Label of block must be emitted
	auipc	s5, %pcrel_hi(.L.str.4)
	addi	s5, s5, %pcrel_lo(.LBB0_48)
	j	.LBB0_32
.LBB0_31:                               #   in Loop: Header=BB0_32 Depth=1
	slli	a3, a0, 2
	add	a3, a3, s6
	lw	a4, 0(a3)
	addw	a2, a2, a4
	sw	a2, 0(a3)
	sw	a0, 0(a1)
	beq	s8, s3, .LBB0_43
.LBB0_32:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_36 Depth 2
                                        #     Child Loop BB0_39 Depth 2
	slli	a0, s8, 3
	add	a0, a0, s2
	ld	s1, 0(a0)
	mv	a0, s1
	mv	a1, s4
	call	strcmp@plt
	mv	s7, a0
	beqz	a0, .LBB0_35
# %bb.33:                               #   in Loop: Header=BB0_32 Depth=1
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_32 Depth=1
	addi	s8, s8, 1
	bne	s8, s3, .LBB0_32
	j	.LBB0_43
.LBB0_35:                               #   in Loop: Header=BB0_32 Depth=1
	slli	a0, s8, 2
	add	a1, s9, a0
	lw	a0, 0(a1)
	slli	a2, a0, 2
.LBB0_36:                               #   Parent Loop BB0_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a2, a2, s9
	lw	a2, 0(a2)
	beq	a2, a0, .LBB0_38
# %bb.37:                               #   in Loop: Header=BB0_36 Depth=2
	mv	a0, a2
	sw	a2, 0(a1)
	slli	a2, a2, 2
	j	.LBB0_36
.LBB0_38:                               #   in Loop: Header=BB0_32 Depth=1
	addi	s8, s8, 1
	slli	a1, s8, 2
	add	a1, a1, s9
	lw	a2, 0(a1)
	slli	a3, a2, 2
.LBB0_39:                               #   Parent Loop BB0_32 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a3, a3, s9
	lw	a3, 0(a3)
	beq	a3, a2, .LBB0_41
# %bb.40:                               #   in Loop: Header=BB0_39 Depth=2
	mv	a2, a3
	sw	a3, 0(a1)
	slli	a3, a3, 2
	j	.LBB0_39
.LBB0_41:                               #   in Loop: Header=BB0_32 Depth=1
	slli	a2, a2, 2
	add	a2, a2, s6
	lw	a2, 0(a2)
	beqz	s7, .LBB0_31
# %bb.42:                               #   in Loop: Header=BB0_32 Depth=1
	neg	a2, a2
	j	.LBB0_31
.LBB0_43:
	lw	s1, 0(s6)
	mv	a0, s6
	call	free@plt
	mv	a0, s9
	call	free@plt
	mv	a0, s1
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
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"**"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"*"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"//"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"+"
	.size	.L.str.3, 2

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"-"
	.size	.L.str.4, 2

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
