	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_6
; %bb.1:
	ldr	w8, [x0]
	tbnz	w8, #31, LBB0_7
; %bb.2:
	mov	w9, w1
	mov	w11, #1                         ; =0x1
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	mov	x10, x11
	cmp	x9, x11
	b.eq	LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	w12, [x0, x10, lsl #2]
	add	x11, x10, #1
	adds	w8, w12, w8
	b.pl	LBB0_3
LBB0_5:
	cmp	x10, x9
	cset	w0, lo
	ret
LBB0_6:
	mov	w0, #0                          ; =0x0
	ret
LBB0_7:
	mov	w0, #1                          ; =0x1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
