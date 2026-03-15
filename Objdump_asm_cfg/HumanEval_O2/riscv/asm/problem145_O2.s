	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -272
	sd	ra, 264(sp)                     # 8-byte Folded Spill
	sd	s0, 256(sp)                     # 8-byte Folded Spill
	sd	s1, 248(sp)                     # 8-byte Folded Spill
	sd	s2, 240(sp)                     # 8-byte Folded Spill
	sd	s3, 232(sp)                     # 8-byte Folded Spill
	sd	s4, 224(sp)                     # 8-byte Folded Spill
	sd	s5, 216(sp)                     # 8-byte Folded Spill
	mv	s1, a0
	lbu	a2, 0(a0)
	li	a0, 47
	mv	s5, a1
	bne	a2, a0, .LBB0_2
# %bb.1:
	li	s0, 0
	li	a1, 0
	j	.LBB0_5
.LBB0_2:
	li	a1, 0
	addi	a3, s1, 1
	addi	a4, sp, 115
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	add	a5, a4, a1
	sb	a2, 0(a5)
	add	a2, a3, a1
	lbu	a2, 0(a2)
	addi	a1, a1, 1
	bne	a2, a0, .LBB0_3
# %bb.4:
	mv	s0, a1
.LBB0_5:
	li	a0, -1
	srli	s4, a0, 32
	addi	a0, sp, 115
	add	a0, a0, a1
	sb	zero, 0(a0)
	addi	a0, sp, 115
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	addiw	a1, s0, 1
	slli	a1, a1, 32
	srli	a1, a1, 32
	add	a1, a1, s1
	lbu	a1, 0(a1)
	mv	s2, a0
	beqz	a1, .LBB0_9
# %bb.6:
	li	a3, 0
	slli	a0, s0, 32
	srli	a0, a0, 32
	add	a0, a0, s1
	addi	a0, a0, 2
	addi	a2, sp, 14
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	sb	a1, 0(a4)
	add	a1, a0, a3
	lbu	a1, 0(a1)
	addi	a3, a3, 1
	bnez	a1, .LBB0_7
# %bb.8:
	and	a0, a3, s4
	j	.LBB0_10
.LBB0_9:
	li	a0, 0
.LBB0_10:
	addi	a1, sp, 14
	add	a0, a0, a1
	sb	zero, 0(a0)
	addi	a0, sp, 14
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	lbu	a2, 0(s5)
	li	a1, 47
	mv	s3, a0
	bne	a2, a1, .LBB0_12
# %bb.11:
	li	s0, 0
	li	a0, 0
	j	.LBB0_15
.LBB0_12:
	li	a0, 0
	addi	a3, s5, 1
	addi	a4, sp, 115
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	add	a5, a4, a0
	sb	a2, 0(a5)
	add	a2, a3, a0
	lbu	a2, 0(a2)
	addi	a0, a0, 1
	bne	a2, a1, .LBB0_13
# %bb.14:
	mv	s0, a0
.LBB0_15:
	addi	a1, sp, 115
	add	a0, a0, a1
	sb	zero, 0(a0)
	addi	a0, sp, 115
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	addiw	a1, s0, 1
	slli	a1, a1, 32
	srli	a1, a1, 32
	add	a1, a1, s5
	lbu	a1, 0(a1)
	mv	s1, a0
	beqz	a1, .LBB0_19
# %bb.16:
	li	a3, 0
	slli	a0, s0, 32
	srli	a0, a0, 32
	add	a0, a0, s5
	addi	a0, a0, 2
	addi	a2, sp, 14
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	add	a4, a2, a3
	sb	a1, 0(a4)
	add	a1, a0, a3
	lbu	a1, 0(a1)
	addi	a3, a3, 1
	bnez	a1, .LBB0_17
# %bb.18:
	and	a0, a3, s4
	j	.LBB0_20
.LBB0_19:
	li	a0, 0
.LBB0_20:
	addi	a1, sp, 14
	add	a0, a0, a1
	sb	zero, 0(a0)
	addi	a0, sp, 14
	li	a2, 10
	li	a1, 0
	call	strtol@plt
	mulw	a1, s1, s2
	mulw	a0, a0, s3
	remw	a0, a1, a0
	seqz	a0, a0
	ld	ra, 264(sp)                     # 8-byte Folded Reload
	ld	s0, 256(sp)                     # 8-byte Folded Reload
	ld	s1, 248(sp)                     # 8-byte Folded Reload
	ld	s2, 240(sp)                     # 8-byte Folded Reload
	ld	s3, 232(sp)                     # 8-byte Folded Reload
	ld	s4, 224(sp)                     # 8-byte Folded Reload
	ld	s5, 216(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 272
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
