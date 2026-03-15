	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	beqz	a1, .LBB0_4
# %bb.1:
	li	a2, 1
	bge	a2, a1, .LBB0_5
# %bb.2:
	lw	a6, 0(a0)
	li	a3, 0
	addi	a4, a0, 4
	addi	a5, a1, -1
	mv	a2, a6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lw	a7, 0(a4)
	slt	a2, a7, a2
	addw	a3, a3, a2
	addi	a5, a5, -1
	addi	a4, a4, 4
	mv	a2, a7
	bnez	a5, .LBB0_3
	j	.LBB0_6
.LBB0_4:
	li	a0, 1
	ret
.LBB0_5:
	lw	a6, 0(a0)
	li	a3, 0
.LBB0_6:
	addiw	a1, a1, -1
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	slt	a0, a6, a0
	addw	a0, a0, a3
	sltiu	a0, a0, 2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
