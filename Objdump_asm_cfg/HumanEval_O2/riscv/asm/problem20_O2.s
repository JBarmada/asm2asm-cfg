	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -192
	sd	ra, 184(sp)                     # 8-byte Folded Spill
	sd	s0, 176(sp)                     # 8-byte Folded Spill
	sd	s1, 168(sp)                     # 8-byte Folded Spill
	sd	s2, 160(sp)                     # 8-byte Folded Spill
	sd	s3, 152(sp)                     # 8-byte Folded Spill
	sd	s4, 144(sp)                     # 8-byte Folded Spill
	sd	s5, 136(sp)                     # 8-byte Folded Spill
	sd	s6, 128(sp)                     # 8-byte Folded Spill
	sd	s7, 120(sp)                     # 8-byte Folded Spill
	sd	s8, 112(sp)                     # 8-byte Folded Spill
	sd	s9, 104(sp)                     # 8-byte Folded Spill
	sd	s10, 96(sp)                     # 8-byte Folded Spill
	sd	s11, 88(sp)                     # 8-byte Folded Spill
	mv	s0, a0
	sd	zero, 80(sp)
	sd	zero, 72(sp)
	sd	zero, 64(sp)
	sd	zero, 56(sp)
	sd	zero, 48(sp)
	lbu	a0, 0(a0)
	beqz	a0, .LBB0_26
# %bb.1:
	li	s9, 32
	addi	s1, sp, 42
.LBB0_38:                               # Label of block must be emitted
	auipc	s8, %pcrel_hi(.L.str)
	addi	s8, s8, %pcrel_lo(.LBB0_38)
	addi	s10, sp, 48
	lui	a0, 1623
	addiw	s11, a0, -401
	lui	a0, 1783
	addiw	s7, a0, 1908
.LBB0_39:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str.3)
	addi	s2, s2, %pcrel_lo(.LBB0_39)
.LBB0_40:                               # Label of block must be emitted
	auipc	s3, %pcrel_hi(.L.str.4)
	addi	s3, s3, %pcrel_lo(.LBB0_40)
.LBB0_41:                               # Label of block must be emitted
	auipc	s4, %pcrel_hi(.L.str.5)
	addi	s4, s4, %pcrel_lo(.LBB0_41)
	lui	a0, 1927
	addiw	a0, a0, -1677
	sd	a0, 32(sp)                      # 8-byte Folded Spill
.LBB0_42:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.7)
	addi	a0, a0, %pcrel_lo(.LBB0_42)
	sd	a0, 24(sp)                      # 8-byte Folded Spill
.LBB0_43:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.8)
	addi	a0, a0, %pcrel_lo(.LBB0_43)
	sd	a0, 16(sp)                      # 8-byte Folded Spill
.LBB0_44:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str.9)
	addi	a0, a0, %pcrel_lo(.LBB0_44)
	sd	a0, 8(sp)                       # 8-byte Folded Spill
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	li	s5, 0
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	add	a0, s0, s5
	lbu	a1, 0(a0)
	ori	a2, a1, 32
	add	a0, s1, s5
	beq	a2, s9, .LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	sb	a1, 0(a0)
	addi	s5, s5, 1
	j	.LBB0_3
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	sb	zero, 0(a0)
	addi	a0, sp, 42
	li	a2, 5
	mv	a1, s8
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_16
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	lbu	a0, 43(sp)
	lbu	a1, 42(sp)
	lb	a2, 45(sp)
	lbu	a3, 44(sp)
	slli	a0, a0, 8
	or	a0, a0, a1
	slli	a1, a2, 8
	or	a1, a1, a3
	slli	a1, a1, 16
	or	a0, a0, a1
	beq	a0, s11, .LBB0_17
# %bb.7:                                #   in Loop: Header=BB0_2 Depth=1
	lbu	a0, 43(sp)
	lbu	a1, 42(sp)
	lb	a2, 45(sp)
	lbu	a3, 44(sp)
	slli	a0, a0, 8
	or	a0, a0, a1
	slli	a1, a2, 8
	or	a1, a1, a3
	slli	a1, a1, 16
	or	a0, a0, a1
	beq	a0, s7, .LBB0_18
# %bb.8:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 6
	mv	a1, s2
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_19
# %bb.9:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 5
	mv	a1, s3
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_20
# %bb.10:                               #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 5
	li	s6, 5
	mv	a1, s4
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_24
# %bb.11:                               #   in Loop: Header=BB0_2 Depth=1
	lbu	a0, 43(sp)
	lbu	a1, 42(sp)
	lb	a2, 45(sp)
	lbu	a3, 44(sp)
	slli	a0, a0, 8
	or	a0, a0, a1
	slli	a1, a2, 8
	or	a1, a1, a3
	slli	a1, a1, 16
	or	a0, a0, a1
	ld	a1, 32(sp)                      # 8-byte Folded Reload
	beq	a0, a1, .LBB0_21
# %bb.12:                               #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 6
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_22
# %bb.13:                               #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 6
	ld	a1, 16(sp)                      # 8-byte Folded Reload
	call	bcmp@plt
	sext.w	a0, a0
	beqz	a0, .LBB0_23
# %bb.14:                               #   in Loop: Header=BB0_2 Depth=1
	addi	a0, sp, 42
	li	a2, 5
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	call	bcmp@plt
	sext.w	a0, a0
	bnez	a0, .LBB0_25
# %bb.15:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 9
	j	.LBB0_24
.LBB0_16:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 0
	j	.LBB0_24
.LBB0_17:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 1
	j	.LBB0_24
.LBB0_18:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 2
	j	.LBB0_24
.LBB0_19:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 3
	j	.LBB0_24
.LBB0_20:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 4
	j	.LBB0_24
.LBB0_21:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 6
	j	.LBB0_24
.LBB0_22:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 7
	j	.LBB0_24
.LBB0_23:                               #   in Loop: Header=BB0_2 Depth=1
	li	s6, 8
.LBB0_24:                               #   in Loop: Header=BB0_2 Depth=1
	slli	a0, s6, 2
	add	a0, a0, s10
	lw	a1, 0(a0)
	addiw	a1, a1, 1
	sw	a1, 0(a0)
.LBB0_25:                               #   in Loop: Header=BB0_2 Depth=1
	addiw	a0, s5, 1
	slli	a0, a0, 32
	srli	a0, a0, 32
	add	s0, s0, a0
	lbu	a0, -1(s0)
	bnez	a0, .LBB0_2
.LBB0_26:
	li	t1, 0
	li	a1, 0
	addi	a6, sp, 48
.LBB0_45:                               # Label of block must be emitted
	auipc	t0, %pcrel_hi(.L__const.func0.numto)
	addi	t0, t0, %pcrel_lo(.LBB0_45)
.LBB0_46:                               # Label of block must be emitted
	auipc	a0, %pcrel_hi(func0.out)
	addi	a0, a0, %pcrel_lo(.LBB0_46)
	li	t2, 32
	li	a7, 10
	j	.LBB0_28
.LBB0_27:                               #   in Loop: Header=BB0_28 Depth=1
	addi	t1, t1, 1
	beq	t1, a7, .LBB0_34
.LBB0_28:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_31 Depth 2
                                        #       Child Loop BB0_33 Depth 3
	slli	a2, t1, 2
	add	a2, a2, a6
	lw	s1, 0(a2)
	blez	s1, .LBB0_27
# %bb.29:                               #   in Loop: Header=BB0_28 Depth=1
	slli	a2, t1, 3
	add	a2, a2, t0
	ld	s0, 0(a2)
	li	a2, 0
	addi	t3, s0, 1
	mv	a3, a1
	j	.LBB0_31
.LBB0_30:                               #   in Loop: Header=BB0_31 Depth=2
	addiw	a1, a3, 1
	sext.w	a3, a3
	add	a3, a3, a0
	addiw	a2, a2, 1
	sb	t2, 0(a3)
	mv	a3, a1
	bge	a2, s1, .LBB0_27
.LBB0_31:                               #   Parent Loop BB0_28 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_33 Depth 3
	lbu	a1, 0(s0)
	beqz	a1, .LBB0_30
# %bb.32:                               #   in Loop: Header=BB0_31 Depth=2
	mv	a5, t3
.LBB0_33:                               #   Parent Loop BB0_28 Depth=1
                                        #     Parent Loop BB0_31 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	a4, a0, a3
	sb	a1, 0(a4)
	lbu	a1, 0(a5)
	addi	a3, a3, 1
	addi	a5, a5, 1
	bnez	a1, .LBB0_33
	j	.LBB0_30
.LBB0_34:
	bgtz	a1, .LBB0_36
# %bb.35:
	mv	a1, a0
	j	.LBB0_37
.LBB0_36:
	addiw	a1, a1, -1
	slli	a1, a1, 32
	srli	a1, a1, 32
	add	a1, a1, a0
.LBB0_37:
	sb	zero, 0(a1)
	ld	ra, 184(sp)                     # 8-byte Folded Reload
	ld	s0, 176(sp)                     # 8-byte Folded Reload
	ld	s1, 168(sp)                     # 8-byte Folded Reload
	ld	s2, 160(sp)                     # 8-byte Folded Reload
	ld	s3, 152(sp)                     # 8-byte Folded Reload
	ld	s4, 144(sp)                     # 8-byte Folded Reload
	ld	s5, 136(sp)                     # 8-byte Folded Reload
	ld	s6, 128(sp)                     # 8-byte Folded Reload
	ld	s7, 120(sp)                     # 8-byte Folded Reload
	ld	s8, 112(sp)                     # 8-byte Folded Reload
	ld	s9, 104(sp)                     # 8-byte Folded Reload
	ld	s10, 96(sp)                     # 8-byte Folded Reload
	ld	s11, 88(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 192
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"zero"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"one"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"two"
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"three"
	.size	.L.str.3, 6

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"four"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"five"
	.size	.L.str.5, 5

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"six"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"seven"
	.size	.L.str.7, 6

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"eight"
	.size	.L.str.8, 6

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"nine"
	.size	.L.str.9, 5

	.type	.L__const.func0.numto,@object   # @__const.func0.numto
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3
.L__const.func0.numto:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.quad	.L.str.4
	.quad	.L.str.5
	.quad	.L.str.6
	.quad	.L.str.7
	.quad	.L.str.8
	.quad	.L.str.9
	.size	.L__const.func0.numto, 80

	.type	func0.out,@object               # @func0.out
	.local	func0.out
	.comm	func0.out,1000,1
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.out
