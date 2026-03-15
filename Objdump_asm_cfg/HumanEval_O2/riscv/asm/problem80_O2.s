	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	mv	s1, a0
	li	a0, 64
	call	malloc@plt
	beqz	a0, .LBB0_5
# %bb.1:
	mv	s0, a0
	sb	zero, 63(a0)
	beqz	s1, .LBB0_6
# %bb.2:
	li	a0, 62
	blez	s1, .LBB0_7
# %bb.3:
	li	a1, 1
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	sext.w	a2, s1
	andi	a3, s1, 1
	ori	a3, a3, 48
	add	a4, s0, a0
	addi	a0, a0, -1
	sb	a3, 0(a4)
	srliw	s1, s1, 1
	bltu	a1, a2, .LBB0_4
	j	.LBB0_7
.LBB0_5:
	li	s1, 0
	j	.LBB0_11
.LBB0_6:
	li	a0, 48
	sb	a0, 62(s0)
	li	a0, 61
.LBB0_7:
	addiw	a1, a0, -1
	sext.w	a2, a0
	add	a2, a2, s0
	li	s3, 98
	sb	s3, 0(a2)
	add	s2, s0, a1
	li	s4, 100
	sb	s4, 0(s2)
	li	a1, 66
	subw	a0, a1, a0
	call	malloc@plt
	beqz	a0, .LBB0_9
# %bb.8:
	mv	s1, a0
	mv	a1, s2
	call	strcpy@plt
	mv	a0, s1
	call	strlen@plt
	add	a0, a0, s1
	sb	s4, 0(a0)
	sb	s3, 1(a0)
	sb	zero, 2(a0)
	j	.LBB0_10
.LBB0_9:
	li	s1, 0
.LBB0_10:
	mv	a0, s0
	call	free@plt
.LBB0_11:
	mv	a0, s1
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"db"
	.size	.L.str, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
