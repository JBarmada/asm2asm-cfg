	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"code.c"
	.globl	func0                           # -- Begin function func0
	.p2align	1
	.type	func0,@function
func0:                                  # @func0
# %bb.0:
	sraiw	a2, a0, 31
	xor	a0, a0, a2
	subw	a0, a0, a2
	slli	a2, a0, 32
	srli	a2, a2, 32
	lui	a3, 205
	addiw	a3, a3, -819
	slli	a3, a3, 12
	addi	a3, a3, -819
	mul	a2, a2, a3
	srli	a2, a2, 35
	li	a4, 10
	mulw	a2, a2, a4
	subw	a0, a0, a2
	sraiw	a2, a1, 31
	xor	a1, a1, a2
	subw	a1, a1, a2
	slli	a2, a1, 32
	srli	a2, a2, 32
	mul	a2, a2, a3
	srli	a2, a2, 35
	mulw	a2, a2, a4
	subw	a1, a1, a2
	mulw	a0, a1, a0
	slli	a0, a0, 32
	srli	a0, a0, 32
	ret
.Lfunc_end0:
	.size	func0, .Lfunc_end0-func0
                                        # -- End function
	.ident	"Debian clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
