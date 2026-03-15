	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #1
	b.lt	LBB0_6
; %bb.1:
	mov	w9, #0                          ; =0x0
	mov	w10, #1                         ; =0x1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	cmp	w10, w0
	b.eq	LBB0_7
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	mov	w8, #0                          ; =0x0
	mul	w10, w10, w1
	cmp	w10, w0
	b.gt	LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_2 Depth=1
	add	w11, w9, #1
	cmp	w9, #99
	mov	x9, x11
	b.lo	LBB0_2
LBB0_5:
	mov	x0, x8
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
