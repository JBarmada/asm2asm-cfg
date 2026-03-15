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
	mv	s0, a0
	call	strlen@plt
	sext.w	s1, a0
	beqz	s1, .LBB0_4
# %bb.1:
	slli	s2, a0, 32
	li	a0, -1
	slli	a0, a0, 32
	add	a0, a0, s2
	srai	a0, a0, 32
	add	a0, a0, s0
	lbu	s3, 0(a0)
	call	__ctype_b_loc@plt
	ld	a1, 0(a0)
	slli	a0, s3, 1
	add	a0, a0, a1
	lbu	a0, 1(a0)
	andi	a2, a0, 4
	li	a0, 0
	beqz	a2, .LBB0_5
# %bb.2:
	li	a0, 1
	beq	s1, a0, .LBB0_5
# %bb.3:
	li	a0, -1
	slli	a0, a0, 33
	add	a0, a0, s2
	srai	a0, a0, 32
	add	a0, a0, s0
	lbu	a0, 0(a0)
	slli	a0, a0, 1
	add	a0, a0, a1
	lhu	a0, 0(a0)
	andi	a0, a0, 1024
	seqz	a0, a0
	j	.LBB0_5
.LBB0_4:
	li	a0, 0
.LBB0_5:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
