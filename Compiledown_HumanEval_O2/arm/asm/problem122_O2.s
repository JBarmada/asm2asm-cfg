	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	subs	w9, w1, #1
	b.lt	LBB0_3
; %bb.1:
	cmp	w1, #9
	b.hs	LBB0_4
; %bb.2:
	mov	x10, #0                         ; =0x0
	mov	x11, #0                         ; =0x0
	mov	w8, #0                          ; =0x0
	b	LBB0_13
LBB0_3:
	mov	w8, #0                          ; =0x0
	mov	x0, x8
	ret
LBB0_4:
	lsr	w8, w9, #1
	add	w11, w8, #1
	cmp	w1, #33
	b.hs	LBB0_6
; %bb.5:
	mov	w8, #0                          ; =0x0
	mov	x10, #0                         ; =0x0
	b	LBB0_10
LBB0_6:
	ands	x8, x11, #0xf
	mov	w10, #16                        ; =0x10
	csel	x12, x10, x8, eq
	sub	x10, x11, x12
	add	x8, x0, #64
	movi.2d	v0, #0000000000000000
	movi.4s	v1, #1
	fneg.4s	v2, v1
	mov	x13, x10
	movi.2d	v3, #0000000000000000
	movi.2d	v4, #0000000000000000
	movi.2d	v5, #0000000000000000
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	sub	x14, x8, #64
	ld2.4s	{ v6, v7 }, [x14]
	sub	x14, x8, #32
	ld2.4s	{ v16, v17 }, [x14]
	mov	x14, x8
	ld2.4s	{ v18, v19 }, [x14], #32
	ld2.4s	{ v20, v21 }, [x14]
	and.16b	v22, v6, v2
	and.16b	v23, v16, v2
	and.16b	v24, v18, v2
	and.16b	v25, v20, v2
	cmeq.4s	v22, v22, v1
	cmeq.4s	v23, v23, v1
	cmeq.4s	v24, v24, v1
	cmeq.4s	v25, v25, v1
	and.16b	v6, v6, v22
	and.16b	v7, v16, v23
	and.16b	v16, v18, v24
	and.16b	v17, v20, v25
	add.4s	v0, v6, v0
	add.4s	v3, v7, v3
	add.4s	v4, v16, v4
	add.4s	v5, v17, v5
	add	x8, x8, #128
	subs	x13, x13, #16
	b.ne	LBB0_7
; %bb.8:
	add.4s	v0, v3, v0
	add.4s	v0, v4, v0
	add.4s	v0, v5, v0
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x12, #4
	b.hi	LBB0_10
; %bb.9:
	lsl	x11, x10, #1
	b	LBB0_13
LBB0_10:
	mov	x13, x10
	ands	x10, x11, #0x3
	mov	w12, #4                         ; =0x4
	csel	x14, x12, x10, eq
	add	x12, x0, x13, lsl #3
	sub	x10, x11, x14
	lsl	x11, x10, #1
	movi.2d	v0, #0000000000000000
	mov.s	v0[0], w8
	mov	x8, #-1                         ; =0xffffffffffffffff
	eor	x8, x8, x9, lsr #1
	add	x8, x8, x13
	add	x8, x8, x14
	movi.4s	v1, #1
	fneg.4s	v2, v1
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ld2.4s	{ v3, v4 }, [x12], #32
	and.16b	v5, v3, v2
	cmeq.4s	v5, v5, v1
	and.16b	v3, v3, v5
	add.4s	v0, v3, v0
	adds	x8, x8, #4
	b.ne	LBB0_11
; %bb.12:
	addv.4s	s0, v0
	fmov	w8, s0
LBB0_13:
	lsr	x9, x9, #1
	sub	x9, x9, x10
	add	x9, x9, #1
	add	x10, x0, x11, lsl #2
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x10], #8
	and	w12, w11, #0x80000001
	cmp	w12, #1
	csel	w11, w11, wzr, eq
	add	w8, w11, w8
	subs	x9, x9, #1
	b.ne	LBB0_14
; %bb.15:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
