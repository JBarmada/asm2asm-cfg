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
	sd	s8, 0(sp)                       # 8-byte Folded Spill
	mv	s2, a2
	mv	s5, a1
	mv	s0, a0
.LBB0_39:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str)
	addi	s1, s1, %pcrel_lo(.LBB0_39)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	mv	s4, a0
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	mv	s3, a0
.LBB0_40:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.1)
	addi	s1, s1, %pcrel_lo(.LBB0_40)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s6, 1
	li	s7, 1
	beqz	a0, .LBB0_2
# %bb.1:
	snez	a0, s4
	negw	s7, a0
.LBB0_2:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_4
# %bb.3:
	snez	a0, s3
	negw	s6, a0
.LBB0_4:
.LBB0_41:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.2)
	addi	s1, s1, %pcrel_lo(.LBB0_41)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s3, 2
	li	s8, 2
	beqz	a0, .LBB0_6
# %bb.5:
	mv	s8, s7
.LBB0_6:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_8
# %bb.7:
	mv	s3, s6
.LBB0_8:
.LBB0_42:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.3)
	addi	s1, s1, %pcrel_lo(.LBB0_42)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s4, 3
	li	s6, 3
	beqz	a0, .LBB0_10
# %bb.9:
	mv	s6, s8
.LBB0_10:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_12
# %bb.11:
	mv	s4, s3
.LBB0_12:
.LBB0_43:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.4)
	addi	s1, s1, %pcrel_lo(.LBB0_43)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s3, 4
	li	s7, 4
	beqz	a0, .LBB0_14
# %bb.13:
	mv	s7, s6
.LBB0_14:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_16
# %bb.15:
	mv	s3, s4
.LBB0_16:
.LBB0_44:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.5)
	addi	s1, s1, %pcrel_lo(.LBB0_44)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s4, 5
	li	s6, 5
	beqz	a0, .LBB0_18
# %bb.17:
	mv	s6, s7
.LBB0_18:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_20
# %bb.19:
	mv	s4, s3
.LBB0_20:
.LBB0_45:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.6)
	addi	s1, s1, %pcrel_lo(.LBB0_45)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s3, 6
	li	s7, 6
	beqz	a0, .LBB0_22
# %bb.21:
	mv	s7, s6
.LBB0_22:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_24
# %bb.23:
	mv	s3, s4
.LBB0_24:
.LBB0_46:                               # Label of block must be emitted
	auipc	s1, %pcrel_hi(.L.str.7)
	addi	s1, s1, %pcrel_lo(.LBB0_46)
	mv	a0, s1
	mv	a1, s0
	call	strcmp@plt
	li	s4, 7
	li	s0, 7
	beqz	a0, .LBB0_26
# %bb.25:
	mv	s0, s7
.LBB0_26:
	mv	a0, s1
	mv	a1, s5
	call	strcmp@plt
	beqz	a0, .LBB0_28
# %bb.27:
	mv	s4, s3
.LBB0_28:
	addi	a0, s0, 1
	seqz	a0, a0
	addi	a1, s4, 1
	seqz	a1, a1
	or	a0, a0, a1
	xor	a1, s0, s4
	seqz	a1, a1
	or	a0, a0, a1
	bnez	a0, .LBB0_37
# %bb.29:
	mv	s1, s0
	blt	s4, s0, .LBB0_31
# %bb.30:
	mv	s1, s4
.LBB0_31:
	blt	s0, s4, .LBB0_33
# %bb.32:
	mv	s0, s4
.LBB0_33:
	not	a0, s0
	addw	a0, a0, s1
	sw	a0, 0(s2)
	blez	a0, .LBB0_37
# %bb.34:
	slli	a0, a0, 3
	call	malloc@plt
	addiw	a1, s0, 1
	bgeu	a1, s1, .LBB0_38
# %bb.35:
	slli	a1, a1, 32
	srli	a2, a1, 32
	srli	a3, a1, 30
.LBB0_47:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.Lreltable.func0)
	addi	a1, a1, %pcrel_lo(.LBB0_47)
	add	a3, a3, a1
	mv	a4, s0
.LBB0_36:                               # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a3)
	add	a5, a5, a1
	subw	a4, a4, s0
	slli	a4, a4, 3
	add	a4, a4, a0
	sd	a5, 0(a4)
	mv	a4, a2
	addiw	a5, a2, 1
	addi	a2, a2, 1
	addi	a3, a3, 4
	bne	s1, a5, .LBB0_36
	j	.LBB0_38
.LBB0_37:
	li	a0, 0
	sw	zero, 0(s2)
.LBB0_38:
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Mercury"
	.size	.L.str, 8

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Venus"
	.size	.L.str.1, 6

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Earth"
	.size	.L.str.2, 6

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Mars"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Jupiter"
	.size	.L.str.4, 8

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Saturn"
	.size	.L.str.5, 7

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Uranus"
	.size	.L.str.6, 7

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Neptune"
	.size	.L.str.7, 8

	.type	.Lreltable.func0,@object        # @reltable.func0
	.section	.rodata,"a",@progbits
	.p2align	2
.Lreltable.func0:
	.word	.L.str-.Lreltable.func0
	.word	.L.str.1-.Lreltable.func0
	.word	.L.str.2-.Lreltable.func0
	.word	.L.str.3-.Lreltable.func0
	.word	.L.str.4-.Lreltable.func0
	.word	.L.str.5-.Lreltable.func0
	.word	.L.str.6-.Lreltable.func0
	.word	.L.str.7-.Lreltable.func0
	.size	.Lreltable.func0, 32

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
