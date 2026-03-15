	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cbz	w1, LBB0_4
; %bb.1:
	cmp	w1, #2
	b.lt	LBB0_5
; %bb.2:
	mov	w8, w1
	cmp	w1, #5
	b.hs	LBB0_6
; %bb.3:
	mov	w10, #0                         ; =0x0
	mov	w12, #1                         ; =0x1
	b	LBB0_16
LBB0_4:
	mov	w0, #1                          ; =0x1
	ret
LBB0_5:
	mov	w10, #0                         ; =0x0
	b	LBB0_18
LBB0_6:
	sub	x9, x8, #1
	cmp	w1, #17
	b.hs	LBB0_8
; %bb.7:
	mov	w10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
	b	LBB0_12
LBB0_8:
	and	x11, x9, #0xfffffffffffffff0
	add	x10, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x12, x11
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldur	q4, [x10, #-28]
	ldur	q5, [x10, #-12]
	ldur	q6, [x10, #4]
	ldur	q7, [x10, #20]
	ldp	q16, q17, [x10, #-32]
	ldp	q18, q19, [x10], #64
	cmgt.4s	v4, v16, v4
	cmgt.4s	v5, v17, v5
	cmgt.4s	v6, v18, v6
	cmgt.4s	v7, v19, v7
	sub.4s	v0, v0, v4
	sub.4s	v1, v1, v5
	sub.4s	v2, v2, v6
	sub.4s	v3, v3, v7
	subs	x12, x12, #16
	b.ne	LBB0_9
; %bb.10:
	add.4s	v0, v1, v0
	add.4s	v1, v3, v2
	add.4s	v0, v1, v0
	addv.4s	s0, v0
	fmov	w10, s0
	cmp	x9, x11
	b.eq	LBB0_18
; %bb.11:
	tst	x9, #0xc
	b.eq	LBB0_15
LBB0_12:
	and	x13, x9, #0xfffffffffffffffc
	orr	x12, x13, #0x1
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w10
	add	x10, x0, x11, lsl #2
	add	x10, x10, #4
	sub	x11, x11, x13
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x10]
	ldur	q2, [x10, #-4]
	cmgt.4s	v1, v2, v1
	sub.4s	v0, v0, v1
	add	x10, x10, #16
	adds	x11, x11, #4
	b.ne	LBB0_13
; %bb.14:
	addv.4s	s0, v0
	fmov	w10, s0
	cmp	x9, x13
	b.ne	LBB0_16
	b	LBB0_18
LBB0_15:
	orr	x12, x11, #0x1
LBB0_16:
	add	x9, x0, x12, lsl #2
	sub	x8, x8, x12
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	ldp	w12, w11, [x9, #-4]
	cmp	w11, w12
	cinc	w10, w10, lt
	add	x9, x9, #4
	subs	x8, x8, #1
	b.ne	LBB0_17
LBB0_18:
	add	x8, x0, w1, sxtw #2
	ldur	w8, [x8, #-4]
	ldr	w9, [x0]
	cmp	w8, w9
	cinc	w8, w10, gt
	cmp	w8, #2
	cset	w0, lt
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
