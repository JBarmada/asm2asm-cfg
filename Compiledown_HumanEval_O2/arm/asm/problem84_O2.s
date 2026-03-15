	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function func0
lCPI0_0:
	.long	18                              ; 0x12
	.long	1                               ; 0x1
	.long	1                               ; 0x1
	.long	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #1
	b.lt	LBB0_3
; %bb.1:
	b.ne	LBB0_4
; %bb.2:
	mov	w0, #1                          ; =0x1
	ret
LBB0_3:
	mov	w8, #0                          ; =0x0
	mov	x0, x8
	ret
LBB0_4:
	cmp	w0, #3
	b.lo	LBB0_7
; %bb.5:
	sub	w9, w0, #2
	cmp	w9, #4
	b.hs	LBB0_8
; %bb.6:
	mov	w8, #18                         ; =0x12
	mov	w11, #2                         ; =0x2
	b	LBB0_19
LBB0_7:
	mov	w0, #18                         ; =0x12
	ret
LBB0_8:
	cmp	w9, #16
	b.hs	LBB0_10
; %bb.9:
	mov	w10, #0                         ; =0x0
	mov	w8, #18                         ; =0x12
	b	LBB0_14
LBB0_10:
	and	w10, w9, #0xfffffff0
Lloh0:
	adrp	x8, lCPI0_0@PAGE
Lloh1:
	ldr	q0, [x8, lCPI0_0@PAGEOFF]
	movi.4s	v1, #1
	movi.4s	v2, #10
	mov	x8, x10
	movi.4s	v3, #1
	movi.4s	v4, #1
LBB0_11:                                ; =>This Inner Loop Header: Depth=1
	mul.4s	v0, v0, v2
	mul.4s	v1, v1, v2
	mul.4s	v3, v3, v2
	mul.4s	v4, v4, v2
	subs	w8, w8, #16
	b.ne	LBB0_11
; %bb.12:
	uzp2.4s	v2, v3, v4
	uzp1.4s	v3, v3, v4
	uzp1.4s	v4, v0, v1
	uzp2.4s	v0, v0, v1
	mul.4s	v0, v0, v4
	mul.4s	v1, v2, v3
	mul.4s	v0, v1, v0
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	mov.s	w8, v0[1]
	fmov	w11, s0
	mul	w8, w11, w8
	cmp	w9, w10
	b.eq	LBB0_17
; %bb.13:
	tst	w9, #0xc
	b.eq	LBB0_18
LBB0_14:
	and	w12, w9, #0xfffffffc
	orr	w11, w12, #0x2
	movi.4s	v0, #1
	mov.s	v0[0], w8
	sub	w8, w10, w12
	movi.4s	v1, #10
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	mul.4s	v0, v0, v1
	adds	w8, w8, #4
	b.ne	LBB0_15
; %bb.16:
	ext.16b	v1, v0, v0, #8
	mul.2s	v0, v0, v1
	mov.s	w8, v0[1]
	fmov	w10, s0
	mul	w8, w10, w8
	cmp	w9, w12
	b.ne	LBB0_19
LBB0_17:
	mov	x0, x8
	ret
LBB0_18:
	orr	w11, w10, #0x2
LBB0_19:
	sub	w9, w0, w11
LBB0_20:                                ; =>This Inner Loop Header: Depth=1
	add	w8, w8, w8, lsl #2
	lsl	w8, w8, #1
	subs	w9, w9, #1
	b.ne	LBB0_20
	b	LBB0_17
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
