	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #4
	b.lt	LBB0_4
; %bb.1:
	mov	w9, #2                          ; =0x2
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	udiv	w8, w0, w9
	msub	w10, w8, w9, w0
	cbz	w10, LBB0_5
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	add	w9, w9, #1
	mul	w8, w9, w9
	cmp	w8, w0
	b.le	LBB0_2
LBB0_4:
	mov	w8, #1                          ; =0x1
LBB0_5:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
