	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.lt	LBB0_3
; %bb.1:
	mov	w8, w1
	cmp	w1, #5
	b.hs	LBB0_4
; %bb.2:
	mov	w11, #0                         ; =0x0
	mov	w12, #0                         ; =0x0
	mov	w13, #1                         ; =0x1
	b	LBB0_14
LBB0_3:
	mov	w0, #1                          ; =0x1
	ret
LBB0_4:
	sub	x9, x8, #1
	cmp	w1, #17
	b.hs	LBB0_6
; %bb.5:
	mov	w13, #0                         ; =0x0
	mov	w15, #0                         ; =0x0
	mov	x10, #0                         ; =0x0
	b	LBB0_10
LBB0_6:
	movi.2d	v0, #0000000000000000
	and	x10, x9, #0xfffffffffffffff0
	movi.2d	v5, #0000000000000000
	add	x11, x0, #32
	mov	x12, x10
	movi.2d	v6, #0000000000000000
	movi.2d	v7, #0000000000000000
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
	movi.2d	v4, #0000000000000000
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldur	q16, [x11, #-28]
	ldur	q17, [x11, #-12]
	ldur	q18, [x11, #4]
	ldur	q19, [x11, #20]
	ldp	q20, q21, [x11, #-32]
	ldp	q22, q25, [x11], #64
	fcmgt.4s	v23, v16, v20
	xtn.4h	v23, v23
	fcmgt.4s	v24, v17, v21
	xtn.4h	v24, v24
	fcmgt.4s	v26, v18, v22
	xtn.4h	v26, v26
	fcmgt.4s	v27, v19, v25
	xtn.4h	v27, v27
	orr.8b	v1, v1, v23
	orr.8b	v2, v2, v24
	orr.8b	v3, v3, v26
	orr.8b	v4, v4, v27
	fcmgt.4s	v16, v20, v16
	xtn.4h	v16, v16
	fcmgt.4s	v17, v21, v17
	xtn.4h	v17, v17
	fcmgt.4s	v18, v22, v18
	xtn.4h	v18, v18
	fcmgt.4s	v19, v25, v19
	xtn.4h	v19, v19
	orr.8b	v0, v0, v16
	orr.8b	v5, v5, v17
	orr.8b	v6, v6, v18
	orr.8b	v7, v7, v19
	subs	x12, x12, #16
	b.ne	LBB0_7
; %bb.8:
	orr.8b	v0, v5, v0
	orr.8b	v0, v6, v0
	orr.8b	v0, v7, v0
	shl.4h	v0, v0, #15
	cmlt.4h	v0, v0, #0
	umaxv.4h	h0, v0
	fmov	w13, s0
	and	w11, w13, #0x1
	orr.8b	v0, v2, v1
	orr.8b	v0, v3, v0
	orr.8b	v0, v4, v0
	shl.4h	v0, v0, #15
	cmlt.4h	v0, v0, #0
	umaxv.4h	h0, v0
	fmov	w15, s0
	and	w12, w15, #0x1
	cmp	x9, x10
	b.eq	LBB0_16
; %bb.9:
	tst	x9, #0xc
	b.eq	LBB0_13
LBB0_10:
	and	x14, x9, #0xfffffffffffffffc
	dup.4h	v1, w13
	orr	x13, x14, #0x1
	dup.4h	v0, w15
	add	x11, x0, x10, lsl #2
	add	x11, x11, #4
	sub	x10, x10, x14
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x11]
	ldur	q3, [x11, #-4]
	fcmgt.4s	v4, v2, v3
	xtn.4h	v4, v4
	orr.8b	v0, v0, v4
	fcmgt.4s	v2, v3, v2
	xtn.4h	v2, v2
	orr.8b	v1, v1, v2
	add	x11, x11, #16
	adds	x10, x10, #4
	b.ne	LBB0_11
; %bb.12:
	shl.4h	v1, v1, #15
	cmlt.4h	v1, v1, #0
	umaxv.4h	h1, v1
	fmov	w10, s1
	and	w11, w10, #0x1
	shl.4h	v0, v0, #15
	cmlt.4h	v0, v0, #0
	umaxv.4h	h0, v0
	fmov	w10, s0
	and	w12, w10, #0x1
	cmp	x9, x14
	b.ne	LBB0_14
	b	LBB0_16
LBB0_13:
	orr	x13, x10, #0x1
LBB0_14:
	add	x9, x0, x13, lsl #2
	sub	x8, x8, x13
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ldp	s1, s0, [x9, #-4]
	fcmp	s0, s1
	csinc	w12, w12, wzr, le
	csinc	w11, w11, wzr, pl
	add	x9, x9, #4
	subs	x8, x8, #1
	b.ne	LBB0_15
LBB0_16:
	add	w8, w11, w12
	cmp	w8, #2
	cset	w0, ne
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
