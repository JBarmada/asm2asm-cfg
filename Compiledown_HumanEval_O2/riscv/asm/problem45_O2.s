	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -48
	blez	a0, .LBB0_7
# %bb.1:
	li	a3, 0
	li	a4, 1
	addi	a6, sp, 15
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	mv	a7, a4
	divw	a5, a0, a1
	mulw	a4, a5, a1
	subw	a0, a0, a4
	addiw	a0, a0, 48
	add	a4, a6, a3
	addi	a3, a3, 1
	sb	a0, 0(a4)
	addiw	a4, a7, 1
	mv	a0, a5
	bgtz	a5, .LBB0_2
# %bb.3:
	sext.w	a0, a3
	blez	a0, .LBB0_7
# %bb.4:
	slli	a0, a7, 32
	srli	a0, a0, 32
	addi	a6, sp, 15
	mv	a4, a2
	mv	a5, a3
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	addiw	a5, a5, -1
	slli	a1, a5, 32
	srli	a1, a1, 32
	add	a1, a1, a6
	lb	a1, 0(a1)
	sb	a1, 0(a4)
	addi	a0, a0, -1
	addi	a4, a4, 1
	bnez	a0, .LBB0_5
# %bb.6:
	slli	a0, a3, 32
	srli	a0, a0, 32
	j	.LBB0_8
.LBB0_7:
	li	a0, 0
.LBB0_8:
	add	a0, a0, a2
	sb	zero, 0(a0)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
