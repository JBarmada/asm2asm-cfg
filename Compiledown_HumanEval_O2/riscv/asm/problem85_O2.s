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
	mv	a2, a0
.LBB0_14:                               # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str)
	addi	a1, a1, %pcrel_lo(.LBB0_14)
	addi	a0, sp, 10
	call	sprintf@plt
	lbu	a0, 10(sp)
	beqz	a0, .LBB0_10
# %bb.1:
	li	s0, 0
	addi	a1, sp, 11
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	andi	a2, a0, 255
	lbu	a0, 0(a1)
	addw	a2, a2, s0
	addiw	s0, a2, -48
	addi	a1, a1, 1
	bnez	a0, .LBB0_2
# %bb.3:
	li	a0, 33
	call	malloc@plt
	beqz	s0, .LBB0_11
# %bb.4:
	li	a1, 0
	blez	s0, .LBB0_12
# %bb.5:
	li	a2, 2
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	mv	a3, s0
	andi	a4, s0, 1
	ori	a4, a4, 48
	add	a5, a0, a1
	addi	a1, a1, 1
	sb	a4, 0(a5)
	srliw	s0, s0, 1
	bgeu	a3, a2, .LBB0_6
# %bb.7:
	add	a2, a0, a1
	li	a3, 1
	slli	a3, a3, 32
	addi	a3, a3, -2
	and	a3, a3, a1
	sb	zero, 0(a2)
	beqz	a3, .LBB0_13
# %bb.8:
	li	a2, 0
	addi	a3, a1, -1
	srli	a6, a1, 1
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	add	a4, a0, a2
	add	a5, a0, a3
	lb	s0, 0(a5)
	lb	a1, 0(a4)
	sb	s0, 0(a4)
	sb	a1, 0(a5)
	addi	a2, a2, 1
	addi	a3, a3, -1
	bne	a6, a2, .LBB0_9
	j	.LBB0_13
.LBB0_10:
	li	a0, 33
	call	malloc@plt
.LBB0_11:
	li	a1, 48
	sb	a1, 0(a0)
	li	a1, 1
.LBB0_12:
	add	a1, a1, a0
	sb	zero, 0(a1)
.LBB0_13:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
