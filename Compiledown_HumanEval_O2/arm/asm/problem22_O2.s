	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	ldr	s1, [x0]
	mov	w8, w1
	cmp	w1, #1
	b.le	LBB0_4
; %bb.1:
	add	x9, x0, #4
	sub	x10, x8, #1
	fmov	s0, s1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s2, [x9], #4
	fcmp	s2, s0
	fcsel	s0, s2, s0, mi
	fcmp	s2, s1
	fcsel	s1, s2, s1, gt
	subs	x10, x10, #1
	b.ne	LBB0_2
; %bb.3:
	cmp	w1, #1
	b.ge	LBB0_5
	b	LBB0_18
LBB0_4:
	fmov	s0, s1
	cmp	w1, #1
	b.lt	LBB0_18
LBB0_5:
	fsub	s1, s1, s0
	cmp	w1, #4
	b.hs	LBB0_7
; %bb.6:
	mov	x9, #0                          ; =0x0
	b	LBB0_16
LBB0_7:
	cmp	w1, #16
	b.hs	LBB0_9
; %bb.8:
	mov	x9, #0                          ; =0x0
	b	LBB0_13
LBB0_9:
	and	x9, x8, #0x7ffffff0
	dup.4s	v2, v0[0]
	dup.4s	v3, v1[0]
	add	x10, x0, #32
	mov	x11, x9
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldp	q4, q5, [x10, #-32]
	ldp	q6, q7, [x10]
	fsub.4s	v4, v4, v2
	fsub.4s	v5, v5, v2
	fsub.4s	v6, v6, v2
	fsub.4s	v7, v7, v2
	fdiv.4s	v4, v4, v3
	fdiv.4s	v5, v5, v3
	fdiv.4s	v6, v6, v3
	fdiv.4s	v7, v7, v3
	stp	q4, q5, [x10, #-32]
	stp	q6, q7, [x10], #64
	subs	x11, x11, #16
	b.ne	LBB0_10
; %bb.11:
	cmp	x9, x8
	b.eq	LBB0_18
; %bb.12:
	tst	x8, #0xc
	b.eq	LBB0_16
LBB0_13:
	mov	x11, x9
	and	x9, x8, #0x7ffffffc
	dup.4s	v2, v0[0]
	dup.4s	v3, v1[0]
	add	x10, x0, x11, lsl #2
	sub	x11, x11, x9
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	q4, [x10]
	fsub.4s	v4, v4, v2
	fdiv.4s	v4, v4, v3
	str	q4, [x10], #16
	adds	x11, x11, #4
	b.ne	LBB0_14
; %bb.15:
	cmp	x9, x8
	b.eq	LBB0_18
LBB0_16:
	add	x10, x0, x9, lsl #2
	sub	x8, x8, x9
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	ldr	s2, [x10]
	fsub	s2, s2, s0
	fdiv	s2, s2, s1
	str	s2, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB0_17
LBB0_18:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
