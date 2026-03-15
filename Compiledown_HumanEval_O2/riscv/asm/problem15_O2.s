	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	addi	sp, sp, -80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	mv	s2, a1
	mv	s5, a0
	li	a0, -1
	srli	s0, a0, 32
	mv	a0, s5
	call	strlen@plt
	mv	s4, a0
	sext.w	s6, a0
	slli	s1, a0, 32
	srai	a0, s1, 29
	call	malloc@plt
	mv	s3, a0
	or	a0, s1, s0
	addi	a0, a0, 1
	srai	a0, a0, 32
	call	malloc@plt
	mv	s1, a0
	sb	zero, 0(a0)
	blez	s6, .LBB0_3
# %bb.1:
	and	s7, s4, s0
	mv	s0, s3
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	mv	a0, s1
	call	strlen@plt
	mv	s6, a0
	addi	a1, a0, 2
	mv	a0, s1
	call	realloc@plt
	lb	a1, 0(s5)
	mv	s1, a0
	add	a0, a0, s6
	sb	a1, 0(a0)
	sb	zero, 1(a0)
	mv	a0, s1
	call	strlen@plt
	addi	a0, a0, 1
	call	malloc@plt
	sd	a0, 0(s0)
	mv	a1, s1
	call	strcpy@plt
	addi	s0, s0, 8
	addi	s7, s7, -1
	addi	s5, s5, 1
	bnez	s7, .LBB0_2
.LBB0_3:
	mv	a0, s1
	call	free@plt
	sw	s4, 0(s2)
	mv	a0, s3
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
