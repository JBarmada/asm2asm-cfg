	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	add	w8, w1, w1, lsr #31
	asr	w9, w8, #1
	cmp	w1, #2
	b.lt	LBB0_4
; %bb.1:
	mov	w8, #0                          ; =0x0
	add	x10, x0, w1, uxtw #2
	sub	x10, x10, #4
	mov	x11, x9
	mov	x12, x0
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x12], #4
	ldr	w14, [x10], #-4
	cmp	w13, w14
	b.ne	LBB0_8
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	add	w8, w8, w13, lsl #1
	subs	x11, x11, #1
	b.ne	LBB0_2
	b	LBB0_5
LBB0_4:
	mov	w8, #0                          ; =0x0
LBB0_5:
	and	w10, w1, #0x80000001
	cmp	w10, #1
	b.ne	LBB0_7
; %bb.6:
	ldr	w9, [x0, w9, uxtw #2]
	add	w8, w9, w8
LBB0_7:
	cmp	w8, w2
	cset	w0, le
	ret
LBB0_8:
	mov	w0, #0                          ; =0x0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
