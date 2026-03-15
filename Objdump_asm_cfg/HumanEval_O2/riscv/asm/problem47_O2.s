	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -400
	sw	zero, 0(sp)
	sw	zero, 4(sp)
	li	a1, 2
	sw	a1, 8(sp)
	li	a1, 4
	sw	zero, 12(sp)
	blt	a0, a1, .LBB0_3
# %bb.1:
	li	a4, 0
	li	a1, 0
	addiw	a2, a0, 1
	slli	a2, a2, 32
	srli	a3, a2, 32
	addi	a2, sp, 8
	addi	a3, a3, -4
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a2)
	lw	a6, -8(a2)
	addw	a1, a1, a5
	addw	a1, a1, a4
	addw	a1, a1, a6
	sw	a1, 8(a2)
	addi	a3, a3, -1
	addi	a2, a2, 4
	mv	a4, a5
	bnez	a3, .LBB0_2
.LBB0_3:
	slli	a0, a0, 2
	mv	a1, sp
	add	a0, a0, a1
	lw	a0, 0(a0)
	addi	sp, sp, 400
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
