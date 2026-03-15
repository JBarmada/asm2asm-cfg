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
	mv	s1, a0
	call	strlen@plt
	li	a1, 3
	bgeu	a0, a1, .LBB0_2
# %bb.1:
	li	a0, 0
	j	.LBB0_8
.LBB0_2:
	lbu	a3, 1(s1)
	lbu	a2, 2(s1)
	li	a1, 1
	beq	a2, a3, .LBB0_7
# %bb.3:
	li	a3, 0
	addi	a6, a0, -3
	li	a1, 1
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	add	a4, s1, a3
	lbu	s0, 0(a4)
	andi	a5, a2, 255
	beq	a5, s0, .LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	addi	a1, a3, 3
	sltu	a1, a1, a0
	beq	a6, a3, .LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	lbu	a2, 3(a4)
	addi	a3, a3, 1
	bne	a2, a5, .LBB0_4
.LBB0_7:
	xori	a0, a1, 1
.LBB0_8:
	andi	a0, a0, 1
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
