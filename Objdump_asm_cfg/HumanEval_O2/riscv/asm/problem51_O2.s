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
	mv	s1, a1
	mv	s0, a0
	call	strlen@plt
	beqz	a0, .LBB0_5
# %bb.1:
	li	a1, -76
	beqz	s1, .LBB0_3
# %bb.2:
	li	a1, -92
.LBB0_3:
	lui	a2, 322639
	addiw	a2, a2, -945
	li	a3, 26
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	lbu	a4, 0(s0)
	add	a4, a4, a1
	mul	a5, a4, a2
	srli	s1, a5, 63
	srli	a5, a5, 35
	addw	a5, a5, s1
	mulw	a5, a5, a3
	subw	a4, a4, a5
	addiw	a4, a4, 97
	sb	a4, 0(s0)
	addi	a0, a0, -1
	addi	s0, s0, 1
	bnez	a0, .LBB0_4
.LBB0_5:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
