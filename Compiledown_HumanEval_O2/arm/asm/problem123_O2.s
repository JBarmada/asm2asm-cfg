	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_3
; %bb.1:
	mov	w9, w1
	cmp	w1, #4
	b.hs	LBB0_4
; %bb.2:
	mov	x10, #0                         ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB0_13
LBB0_3:
	mov	w8, #0                          ; =0x0
	mov	x0, x8
	ret
LBB0_4:
	cmp	w1, #16
	b.hs	LBB0_6
; %bb.5:
	mov	w8, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
	b	LBB0_10
LBB0_6:
	and	x10, x9, #0x7ffffff0
	add	x8, x0, #32
	movi.2d	v0, #0000000000000000
	movi.4s	v1, #99
	movi.4s	v2, #199
	mov	x11, x10
	movi.2d	v3, #0000000000000000
	movi.2d	v4, #0000000000000000
	movi.2d	v5, #0000000000000000
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q6, q7, [x8, #-32]
	ldp	q16, q17, [x8], #64
	add.4s	v18, v6, v1
	add.4s	v19, v7, v1
	add.4s	v20, v16, v1
	add.4s	v21, v17, v1
	cmhi.4s	v18, v2, v18
	cmhi.4s	v19, v2, v19
	cmhi.4s	v20, v2, v20
	cmhi.4s	v21, v2, v21
	and.16b	v6, v6, v18
	and.16b	v7, v7, v19
	and.16b	v16, v16, v20
	and.16b	v17, v17, v21
	add.4s	v0, v6, v0
	add.4s	v3, v7, v3
	add.4s	v4, v16, v4
	add.4s	v5, v17, v5
	subs	x11, x11, #16
	b.ne	LBB0_7
; %bb.8:
	add.4s	v0, v3, v0
	add.4s	v0, v4, v0
	add.4s	v0, v5, v0
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x10, x9
	b.eq	LBB0_15
; %bb.9:
	tst	x9, #0xc
	b.eq	LBB0_13
LBB0_10:
	mov	x11, x10
	and	x10, x9, #0x7ffffffc
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w8
	add	x8, x0, x11, lsl #2
	sub	x11, x11, x10
	movi.4s	v1, #99
	movi.4s	v2, #199
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q3, [x8], #16
	add.4s	v4, v3, v1
	cmhi.4s	v4, v2, v4
	and.16b	v3, v3, v4
	add.4s	v0, v3, v0
	adds	x11, x11, #4
	b.ne	LBB0_11
; %bb.12:
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x10, x9
	b.eq	LBB0_15
LBB0_13:
	add	x11, x0, x10, lsl #2
	sub	x9, x9, x10
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x11], #4
	add	w12, w10, #99
	cmp	w12, #199
	csel	w10, w10, wzr, lo
	add	w8, w10, w8
	subs	x9, x9, #1
	b.ne	LBB0_14
LBB0_15:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
