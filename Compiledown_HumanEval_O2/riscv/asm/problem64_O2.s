	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -432
	sd	ra, 424(sp)                     # 8-byte Folded Spill
	sd	s0, 416(sp)                     # 8-byte Folded Spill
	sd	s1, 408(sp)                     # 8-byte Folded Spill
	mv	s0, a0
	addi	a0, sp, 8
	li	a2, 400
	addi	s1, sp, 8
	li	a1, 0
	call	memset@plt
	li	a0, 1
	li	a1, 3
	sw	a0, 16(sp)
	blt	s0, a1, .LBB0_3
# %bb.1:
	li	a3, 0
	addiw	a1, s0, 1
	slli	a1, a1, 32
	srli	a2, a1, 32
	addi	a1, sp, 20
	addi	a2, a2, -3
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a4, -8(a1)
	addw	a0, a0, a4
	addw	a0, a0, a3
	sw	a0, 0(a1)
	addi	a2, a2, -1
	addi	a1, a1, 4
	mv	a3, a4
	bnez	a2, .LBB0_2
.LBB0_3:
	slli	a0, s0, 2
	add	a0, a0, s1
	lw	a0, 0(a0)
	ld	ra, 424(sp)                     # 8-byte Folded Reload
	ld	s0, 416(sp)                     # 8-byte Folded Reload
	ld	s1, 408(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 432
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
