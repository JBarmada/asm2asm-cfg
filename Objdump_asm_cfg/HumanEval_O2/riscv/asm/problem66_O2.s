	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	mv	s1, a1
	mv	a2, a0
.LBB0_6:                                # Label of block must be emitted
	auipc	s0, %pcrel_hi(func0.xs)
	addi	s0, s0, %pcrel_lo(.LBB0_6)
.LBB0_7:                                # Label of block must be emitted
	auipc	a1, %pcrel_hi(.L.str)
	addi	a1, a1, %pcrel_lo(.LBB0_7)
	mv	a0, s0
	call	sprintf@plt
	mv	a0, s0
	call	strlen@plt
	mv	s2, a0
	sext.w	a0, a0
	bge	a0, s1, .LBB0_4
# %bb.1:
	li	a1, 2
	blt	a0, a1, .LBB0_5
# %bb.2:
	li	a0, -1
	slli	a0, a0, 32
	srliw	a1, s2, 1
	slli	a2, s2, 32
	add	a2, a2, a0
	mv	a3, s0
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	srai	a4, a2, 32
	add	a4, a4, s0
	lb	a5, 0(a4)
	lb	s1, 0(a3)
	sb	a5, 0(a3)
	sb	s1, 0(a4)
	add	a2, a2, a0
	addi	a1, a1, -1
	addi	a3, a3, 1
	bnez	a1, .LBB0_3
	j	.LBB0_5
.LBB0_4:
	add	a0, a0, s0
	sub	a1, a0, s1
	addi	a0, sp, 6
	addi	s3, sp, 6
	call	strcpy@plt
	add	a0, s3, s1
	sb	zero, 0(a0)
	subw	a2, s2, s1
	addi	a0, sp, 6
	mv	a1, s0
	call	strncat@plt
	addi	a1, sp, 6
	mv	a0, s0
	call	strcpy@plt
.LBB0_5:
.LBB0_8:                                # Label of block must be emitted
	auipc	a0, %pcrel_hi(func0.xs)
	addi	a0, a0, %pcrel_lo(.LBB0_8)
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.type	func0.xs,@object                # @func0.xs
	.local	func0.xs
	.comm	func0.xs,50,1
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym func0.xs
