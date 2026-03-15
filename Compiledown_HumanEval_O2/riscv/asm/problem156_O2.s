	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a2, 0
	li	a3, 0
	sraiw	a4, a0, 31
	xor	a0, a0, a4
	subw	a5, a0, a4
	lui	a0, 419430
	addiw	a7, a0, 1639
	li	a6, 9
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	mv	t0, a5
	mul	a5, a5, a7
	srli	a0, a5, 63
	srai	a5, a5, 34
	addw	a5, a5, a0
	andi	a0, t0, 1
	xori	a4, a0, 1
	addw	a2, a2, a4
	addw	a3, a3, a0
	blt	a6, t0, .LBB0_1
# %bb.2:
	sw	a2, 0(a1)
	sw	a3, 4(a1)
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
