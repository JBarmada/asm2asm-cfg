	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w3, #1
	b.lt	LBB0_5
; %bb.1:
	mov	w8, w3
	cmp	w3, #4
	b.hs	LBB0_6
; %bb.2:
	mov	x9, #0                          ; =0x0
LBB0_3:
	lsl	x12, x9, #2
	add	x10, x2, x12
	add	x11, x1, x12
	add	x12, x0, x12
	sub	x8, x8, x9
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w9, [x12], #4
	ldr	w13, [x11], #4
	subs	w9, w9, w13
	cneg	w9, w9, mi
	str	w9, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB0_4
LBB0_5:
	ret
LBB0_6:
	mov	x9, #0                          ; =0x0
	sub	x10, x2, x0
	cmp	x10, #64
	b.lo	LBB0_3
; %bb.7:
	sub	x10, x2, x1
	cmp	x10, #64
	b.lo	LBB0_3
; %bb.8:
	cmp	w3, #16
	b.hs	LBB0_10
; %bb.9:
	mov	x9, #0                          ; =0x0
	b	LBB0_14
LBB0_10:
	and	x9, x8, #0x7ffffff0
	add	x10, x2, #32
	add	x11, x1, #32
	add	x12, x0, #32
	mov	x13, x9
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x12, #-32]
	ldp	q2, q3, [x12], #64
	ldp	q4, q5, [x11, #-32]
	ldp	q6, q7, [x11], #64
	sabd.4s	v0, v0, v4
	sabd.4s	v1, v1, v5
	sabd.4s	v2, v2, v6
	sabd.4s	v3, v3, v7
	stp	q0, q1, [x10, #-32]
	stp	q2, q3, [x10], #64
	subs	x13, x13, #16
	b.ne	LBB0_11
; %bb.12:
	cmp	x9, x8
	b.eq	LBB0_5
; %bb.13:
	tst	x8, #0xc
	b.eq	LBB0_3
LBB0_14:
	mov	x13, x9
	and	x9, x8, #0x7ffffffc
	lsl	x12, x13, #2
	add	x10, x0, x12
	add	x11, x1, x12
	add	x12, x2, x12
	sub	x13, x13, x9
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x10], #16
	ldr	q1, [x11], #16
	sabd.4s	v0, v0, v1
	str	q0, [x12], #16
	adds	x13, x13, #4
	b.ne	LBB0_15
; %bb.16:
	cmp	x9, x8
	b.ne	LBB0_3
	b	LBB0_5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
