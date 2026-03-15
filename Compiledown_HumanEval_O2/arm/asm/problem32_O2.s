	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	x0, #2
	b.ge	LBB0_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB0_2:
	cmp	x0, #4
	b.hs	LBB0_4
; %bb.3:
	mov	w0, #1                          ; =0x1
	ret
LBB0_4:
	mov	w9, #3                          ; =0x3
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	sub	x8, x9, #1
	udiv	x10, x0, x8
	msub	x8, x10, x8, x0
	cmp	x8, #0
	cset	w8, ne
	mul	x10, x9, x9
	add	x9, x9, #1
	ccmp	x10, x0, #0, ne
	b.le	LBB0_5
; %bb.6:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
