	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a2, 2
	blt	a1, a2, .LBB0_4
# %bb.1:
	li	a3, 0
	li	a2, 0
	srliw	a6, a1, 1
	mv	a5, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	lw	a7, 0(a5)
	not	a4, a3
	addw	a4, a4, a1
	slli	a4, a4, 2
	add	a4, a4, a0
	lw	a4, 0(a4)
	xor	a4, a7, a4
	snez	a4, a4
	addw	a2, a2, a4
	addi	a3, a3, 1
	addi	a5, a5, 4
	bne	a6, a3, .LBB0_2
# %bb.3:
	mv	a0, a2
	ret
.LBB0_4:
	li	a2, 0
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
