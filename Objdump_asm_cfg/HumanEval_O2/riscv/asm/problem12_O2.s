	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	mv	s0, a1
	mv	s1, a0
	call	strlen@plt
	sext.w	s2, a0
	mv	a0, s0
	call	strlen@plt
	sext.w	a0, a0
	blt	s2, a0, .LBB0_2
# %bb.1:
	mv	s2, a0
.LBB0_2:
	addiw	a0, s2, 1
	call	malloc@plt
	beqz	a0, .LBB0_7
# %bb.3:
	blez	s2, .LBB0_6
# %bb.4:
	mv	a1, s2
	mv	a2, a0
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(s1)
	lbu	a4, 0(s0)
	xor	a3, a3, a4
	seqz	a3, a3
	xori	a3, a3, 49
	sb	a3, 0(a2)
	addi	a2, a2, 1
	addi	s0, s0, 1
	addi	a1, a1, -1
	addi	s1, s1, 1
	bnez	a1, .LBB0_5
.LBB0_6:
	add	a1, a0, s2
	sb	zero, 0(a1)
.LBB0_7:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
