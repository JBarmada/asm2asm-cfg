	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	call	strlen@plt
	sext.w	a2, a0
	li	a1, 2
	bge	a2, a1, .LBB0_2
# %bb.1:
	li	a1, 0
	j	.LBB0_7
.LBB0_2:
	li	a3, 4
	li	a1, 1
	bltu	a2, a3, .LBB0_7
# %bb.3:
	li	a1, 2
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	remw	a3, a0, a1
	beqz	a3, .LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	addiw	a1, a1, 1
	mulw	a4, a1, a1
	bge	a2, a4, .LBB0_4
.LBB0_6:
	snez	a1, a3
.LBB0_7:
	mv	a0, a1
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
