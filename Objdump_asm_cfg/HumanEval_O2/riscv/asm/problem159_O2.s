	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -352
	sd	ra, 344(sp)                     # 8-byte Folded Spill
	sd	s0, 336(sp)                     # 8-byte Folded Spill
	sd	s1, 328(sp)                     # 8-byte Folded Spill
	sd	s2, 320(sp)                     # 8-byte Folded Spill
	sd	s3, 312(sp)                     # 8-byte Folded Spill
	sd	s4, 304(sp)                     # 8-byte Folded Spill
	sd	s5, 296(sp)                     # 8-byte Folded Spill
	sd	s6, 288(sp)                     # 8-byte Folded Spill
	sd	s7, 280(sp)                     # 8-byte Folded Spill
	sd	s8, 272(sp)                     # 8-byte Folded Spill
	sd	s9, 264(sp)                     # 8-byte Folded Spill
	blez	a1, .LBB0_13
# %bb.1:
	mv	s4, a1
	mv	s3, a0
	li	s8, 0
	li	s6, 0
.LBB0_15:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_15)
	addi	s7, sp, 8
	j	.LBB0_4
.LBB0_2:                                #   in Loop: Header=BB0_4 Depth=1
	mv	s6, s9
	mv	s2, s5
.LBB0_3:                                #   in Loop: Header=BB0_4 Depth=1
	addi	s8, s8, 1
	beq	s8, s4, .LBB0_14
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	addi	a0, sp, 8
	li	a2, 256
	li	a1, 0
	call	memset@plt
	slli	a0, s8, 3
	add	a0, a0, s3
	ld	s5, 0(a0)
	lbu	s1, 0(s5)
	beqz	s1, .LBB0_9
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	li	s9, 0
	addi	s0, s5, 1
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	lbu	s1, 0(s0)
	addi	s0, s0, 1
	beqz	s1, .LBB0_10
.LBB0_7:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	andi	a1, s1, 255
	addi	a0, sp, 8
	call	strchr@plt
	bnez	a0, .LBB0_6
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	addi	a0, sp, 8
	call	strlen@plt
	sext.w	a1, a0
	add	a1, a1, s7
	sb	s1, 0(a1)
	addiw	a0, a0, 1
	add	a0, a0, s7
	sb	zero, 0(a0)
	addiw	s9, s9, 1
	j	.LBB0_6
.LBB0_9:                                #   in Loop: Header=BB0_4 Depth=1
	li	s9, 0
.LBB0_10:                               #   in Loop: Header=BB0_4 Depth=1
	blt	s6, s9, .LBB0_2
# %bb.11:                               #   in Loop: Header=BB0_4 Depth=1
	bne	s9, s6, .LBB0_3
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	mv	a0, s5
	mv	a1, s2
	call	strcmp@plt
	bltz	a0, .LBB0_2
	j	.LBB0_3
.LBB0_13:
.LBB0_16:                               # Label of block must be emitted
	auipc	s2, %pcrel_hi(.L.str)
	addi	s2, s2, %pcrel_lo(.LBB0_16)
.LBB0_14:
	mv	a0, s2
	ld	ra, 344(sp)                     # 8-byte Folded Reload
	ld	s0, 336(sp)                     # 8-byte Folded Reload
	ld	s1, 328(sp)                     # 8-byte Folded Reload
	ld	s2, 320(sp)                     # 8-byte Folded Reload
	ld	s3, 312(sp)                     # 8-byte Folded Reload
	ld	s4, 304(sp)                     # 8-byte Folded Reload
	ld	s5, 296(sp)                     # 8-byte Folded Reload
	ld	s6, 288(sp)                     # 8-byte Folded Reload
	ld	s7, 280(sp)                     # 8-byte Folded Reload
	ld	s8, 272(sp)                     # 8-byte Folded Reload
	ld	s9, 264(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 352
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.zero	1
	.size	.L.str, 1

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
