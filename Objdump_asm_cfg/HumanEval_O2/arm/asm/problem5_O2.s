	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #0
	b.le	LBB0_3
; %bb.1:
	mov	w8, w1
	cmp	w1, #4
	b.hs	LBB0_4
; %bb.2:
	mov	x9, #0                          ; =0x0
	movi	d1, #0000000000000000
	b	LBB0_13
LBB0_3:
	scvtf	s0, w1
	movi	d2, #0000000000000000
	fdiv	s0, s2, s0
	ret
LBB0_4:
	cmp	w1, #16
	b.hs	LBB0_6
; %bb.5:
	mov	x9, #0                          ; =0x0
	movi	d1, #0000000000000000
	b	LBB0_10
LBB0_6:
	and	x9, x8, #0x7ffffff0
	add	x10, x0, #32
	movi	d1, #0000000000000000
	mov	x11, x9
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q0, q2, [x10, #-32]
	mov	s3, v0[3]
	mov	s4, v0[2]
	mov	s5, v0[1]
	mov	s6, v2[3]
	mov	s7, v2[2]
	mov	s16, v2[1]
	ldp	q17, q18, [x10], #64
	mov	s19, v17[3]
	mov	s20, v17[2]
	mov	s21, v17[1]
	mov	s22, v18[3]
	mov	s23, v18[2]
	mov	s24, v18[1]
	fadd	s0, s1, s0
	fadd	s0, s0, s5
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s16
	fadd	s0, s0, s7
	fadd	s0, s0, s6
	fadd	s0, s0, s17
	fadd	s0, s0, s21
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s18
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s1, s0, s22
	subs	x11, x11, #16
	b.ne	LBB0_7
; %bb.8:
	cmp	x9, x8
	b.eq	LBB0_15
; %bb.9:
	tst	x8, #0xc
	b.eq	LBB0_13
LBB0_10:
	mov	x11, x9
	and	x9, x8, #0x7ffffffc
	add	x10, x0, x11, lsl #2
	sub	x11, x11, x9
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x10], #16
	mov	s2, v0[3]
	mov	s3, v0[2]
	mov	s4, v0[1]
	fadd	s0, s1, s0
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s1, s0, s2
	adds	x11, x11, #4
	b.ne	LBB0_11
; %bb.12:
	cmp	x9, x8
	b.eq	LBB0_15
LBB0_13:
	add	x10, x0, x9, lsl #2
	sub	x9, x8, x9
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x10], #4
	fadd	s1, s1, s0
	subs	x9, x9, #1
	b.ne	LBB0_14
LBB0_15:
	scvtf	s0, w1
	fdiv	s1, s1, s0
	cmp	w1, #4
	b.hs	LBB0_17
; %bb.16:
	mov	x9, #0                          ; =0x0
	movi	d2, #0000000000000000
	b	LBB0_26
LBB0_17:
	cmp	w1, #16
	b.hs	LBB0_19
; %bb.18:
	mov	x9, #0                          ; =0x0
	movi	d2, #0000000000000000
	b	LBB0_23
LBB0_19:
	and	x9, x8, #0x7ffffff0
	dup.4s	v3, v1[0]
	add	x10, x0, #32
	movi	d2, #0000000000000000
	mov	x11, x9
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	ldp	q4, q5, [x10, #-32]
	ldp	q6, q7, [x10], #64
	fabd.4s	v4, v4, v3
	mov	s16, v4[3]
	mov	s17, v4[2]
	mov	s18, v4[1]
	fabd.4s	v5, v5, v3
	mov	s19, v5[3]
	mov	s20, v5[2]
	mov	s21, v5[1]
	fabd.4s	v6, v6, v3
	mov	s22, v6[3]
	mov	s23, v6[2]
	mov	s24, v6[1]
	fabd.4s	v7, v7, v3
	mov	s25, v7[3]
	mov	s26, v7[2]
	mov	s27, v7[1]
	fadd	s2, s2, s4
	fadd	s2, s2, s18
	fadd	s2, s2, s17
	fadd	s2, s2, s16
	fadd	s2, s2, s5
	fadd	s2, s2, s21
	fadd	s2, s2, s20
	fadd	s2, s2, s19
	fadd	s2, s2, s6
	fadd	s2, s2, s24
	fadd	s2, s2, s23
	fadd	s2, s2, s22
	fadd	s2, s2, s7
	fadd	s2, s2, s27
	fadd	s2, s2, s26
	fadd	s2, s2, s25
	subs	x11, x11, #16
	b.ne	LBB0_20
; %bb.21:
	cmp	x9, x8
	b.eq	LBB0_28
; %bb.22:
	tst	x8, #0xc
	b.eq	LBB0_26
LBB0_23:
	mov	x11, x9
	and	x9, x8, #0x7ffffffc
	dup.4s	v3, v1[0]
	add	x10, x0, x11, lsl #2
	sub	x11, x11, x9
LBB0_24:                                ; =>This Inner Loop Header: Depth=1
	ldr	q4, [x10], #16
	fabd.4s	v4, v4, v3
	mov	s5, v4[3]
	mov	s6, v4[2]
	mov	s7, v4[1]
	fadd	s2, s2, s4
	fadd	s2, s2, s7
	fadd	s2, s2, s6
	fadd	s2, s2, s5
	adds	x11, x11, #4
	b.ne	LBB0_24
; %bb.25:
	cmp	x9, x8
	b.eq	LBB0_28
LBB0_26:
	add	x10, x0, x9, lsl #2
	sub	x8, x8, x9
LBB0_27:                                ; =>This Inner Loop Header: Depth=1
	ldr	s3, [x10], #4
	fabd	s3, s3, s1
	fadd	s2, s2, s3
	subs	x8, x8, #1
	b.ne	LBB0_27
LBB0_28:
	fdiv	s0, s2, s0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
