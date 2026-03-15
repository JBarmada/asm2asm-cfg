	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a0, .LBB0_4
# %bb.1:
	addiw	a0, a0, 1
	slli	a0, a0, 32
	srli	a1, a0, 32
	li	a2, 1
	li	a0, 1
	li	a3, 1
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	mul	a3, a3, a2
	addi	a2, a2, 1
	mul	a0, a3, a0
	bne	a1, a2, .LBB0_2
# %bb.3:
	ret
.LBB0_4:
	li	a0, 1
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
