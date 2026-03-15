	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function func0
lCPI0_0:
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.long	4                               ; 0x4
lCPI0_1:
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.lt	LBB0_6
; %bb.1:
	mov	w8, w1
	cmp	w1, #5
	b.lo	LBB0_3
; %bb.2:
	sub	x9, x2, x0
	sub	x9, x9, #4
	cmp	x9, #64
	b.hs	LBB0_7
LBB0_3:
	mov	w11, #1                         ; =0x1
LBB0_4:
	sub	x9, x2, #4
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ucvtf	s0, w11
	ldr	s1, [x0, x11, lsl #2]
	fmul	s0, s1, s0
	str	s0, [x9, x11, lsl #2]
	add	x11, x11, #1
	cmp	x8, x11
	b.ne	LBB0_5
LBB0_6:
	ret
LBB0_7:
	sub	x9, x8, #1
	cmp	w1, #17
	b.hs	LBB0_9
; %bb.8:
	mov	x10, #0                         ; =0x0
	mov	w12, #1                         ; =0x1
	b	LBB0_13
LBB0_9:
	and	x10, x9, #0xfffffffffffffff0
	orr	x12, x10, #0x1
	add	x11, x0, #36
Lloh0:
	adrp	x13, lCPI0_0@PAGE
Lloh1:
	ldr	q0, [x13, lCPI0_0@PAGEOFF]
	add	x13, x2, #32
	movi.4s	v1, #4
	movi.4s	v2, #8
	movi.4s	v3, #12
	movi.4s	v4, #16
	mov	x14, x10
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	add.4s	v5, v0, v1
	add.4s	v6, v0, v2
	add.4s	v7, v0, v3
	ucvtf.4s	v16, v0
	ucvtf.4s	v5, v5
	ucvtf.4s	v6, v6
	ucvtf.4s	v7, v7
	ldp	q17, q18, [x11, #-32]
	ldp	q19, q20, [x11], #64
	fmul.4s	v16, v17, v16
	fmul.4s	v5, v18, v5
	fmul.4s	v6, v19, v6
	fmul.4s	v7, v20, v7
	stp	q16, q5, [x13, #-32]
	stp	q6, q7, [x13], #64
	add.4s	v0, v0, v4
	subs	x14, x14, #16
	b.ne	LBB0_10
; %bb.11:
	cmp	x9, x10
	b.eq	LBB0_6
; %bb.12:
	tst	x9, #0xc
	b.eq	LBB0_16
LBB0_13:
	and	x13, x9, #0xfffffffffffffffc
	orr	x11, x13, #0x1
	dup.4s	v0, w12
Lloh2:
	adrp	x12, lCPI0_1@PAGE
Lloh3:
	ldr	q1, [x12, lCPI0_1@PAGEOFF]
	add.4s	v0, v0, v1
	lsl	x14, x10, #2
	add	x12, x2, x14
	add	x14, x14, x0
	add	x14, x14, #4
	sub	x10, x10, x13
	movi.4s	v1, #4
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x14], #16
	ucvtf.4s	v3, v0
	fmul.4s	v2, v2, v3
	str	q2, [x12], #16
	add.4s	v0, v0, v1
	adds	x10, x10, #4
	b.ne	LBB0_14
; %bb.15:
	cmp	x9, x13
	b.ne	LBB0_4
	b	LBB0_6
LBB0_16:
	orr	x11, x10, #0x1
	b	LBB0_4
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
