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
	mv	s3, a1
	mv	s2, a0
	slli	a0, a1, 3
	call	malloc@plt
	mv	s4, a0
	blez	s3, .LBB0_9
# %bb.1:
	li	s6, 0
.LBB0_10:                               # Label of block must be emitted
	auipc	s5, %pcrel_hi(.L.str)
	addi	s5, s5, %pcrel_lo(.LBB0_10)
	li	s7, 9
	lui	a0, 524288
	addiw	s0, a0, 1
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	li	s1, 0
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	li	a0, 100
	call	malloc@plt
	add	a1, s4, s8
	sd	a0, 0(a1)
	mv	a1, s5
	mv	a2, s1
	mv	a3, s1
	mv	a4, s1
	call	sprintf@plt
	addi	s6, s6, 1
	beq	s6, s3, .LBB0_9
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	slli	s8, s6, 3
	add	a0, s2, s8
	ld	a0, 0(a0)
	lbu	a1, 0(a0)
	beqz	a1, .LBB0_2
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	s1, 0
	addi	a0, a0, 1
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	lbu	a1, 0(a0)
	addi	a0, a0, 1
	beqz	a1, .LBB0_3
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addiw	a2, a1, -48
	andi	a2, a2, 255
	bltu	s7, a2, .LBB0_6
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	andi	a1, a1, 255
	addi	a1, a1, -48
	and	a1, a1, s0
	addi	a1, a1, -1
	seqz	a1, a1
	addw	s1, s1, a1
	j	.LBB0_6
.LBB0_9:
	mv	a0, s4
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
	.asciz	"the number of odd elements %d in the string %d of the %d input."
	.size	.L.str, 64

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
