	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	lbu	a5, 0(a0)
	beqz	a5, .LBB0_3
# %bb.1:
	li	a4, 0
	addi	a7, a0, 1
	lui	a2, 5
	addiw	a2, a2, -315
	li	a6, 26
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	andi	a3, a5, 255
	addi	a3, a3, -93
	mul	a5, a3, a2
	srliw	a0, a5, 31
	srli	a5, a5, 19
	addw	a0, a0, a5
	mulw	a0, a0, a6
	subw	a0, a3, a0
	addiw	a0, a0, 97
	add	a3, a1, a4
	sb	a0, 0(a3)
	add	a0, a7, a4
	lbu	a5, 0(a0)
	addi	a3, a4, 1
	mv	a4, a3
	bnez	a5, .LBB0_2
	j	.LBB0_4
.LBB0_3:
	li	a3, 0
.LBB0_4:
	add	a0, a1, a3
	sb	zero, 0(a0)
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
