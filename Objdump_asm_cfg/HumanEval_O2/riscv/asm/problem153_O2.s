	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	blez	a3, .LBB0_2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a0)
	lw	a5, 0(a1)
	subw	a4, a4, a5
	sraiw	a5, a4, 31
	xor	a4, a4, a5
	subw	a4, a4, a5
	sw	a4, 0(a2)
	addi	a2, a2, 4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a0, a0, 4
	bnez	a3, .LBB0_1
.LBB0_2:
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
