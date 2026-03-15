	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	frinta	s3, s0
	frinta	s4, s1
	frinta	s5, s2
	fcmp	s3, s0
	fccmp	s4, s1, #0, eq
	fccmp	s5, s2, #0, eq
	b.eq	LBB0_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB0_2:
	fadd	s3, s0, s1
	fcmp	s3, s2
	cset	w8, eq
	fadd	s3, s0, s2
	fcmp	s3, s1
	csinc	w8, w8, wzr, ne
	fadd	s1, s1, s2
	fcmp	s1, s0
	csinc	w0, w8, wzr, ne
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
