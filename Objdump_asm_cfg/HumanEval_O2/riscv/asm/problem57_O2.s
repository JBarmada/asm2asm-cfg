	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	li	a1, 0
	li	a2, 60
	j	.LBB0_3
.LBB0_1:                                #   in Loop: Header=BB0_3 Depth=1
	addiw	a1, a1, 1
.LBB0_2:                                #   in Loop: Header=BB0_3 Depth=1
	addi	a3, a3, -62
	seqz	a3, a3
	subw	a1, a1, a3
	addi	a0, a0, 1
	bltz	a1, .LBB0_6
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	lbu	a3, 0(a0)
	beq	a3, a2, .LBB0_1
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	bnez	a3, .LBB0_2
# %bb.5:
	seqz	a0, a1
	ret
.LBB0_6:
	li	a0, 0
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
