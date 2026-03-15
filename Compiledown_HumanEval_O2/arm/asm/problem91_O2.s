	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.ge	LBB0_2
; %bb.1:
	mov	w0, #-1                         ; =0xffffffff
	ret
LBB0_2:
	mov	w8, w1
	mov	w9, #2147483647                 ; =0x7fffffff
	mov	w10, #2147483647                ; =0x7fffffff
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x0], #4
	cmp	w11, w10
	ccmp	w11, w9, #0, ne
	csel	w9, w9, w11, ge
	cmp	w11, w10
	csel	w11, w11, w10, lt
	csel	w9, w10, w9, lt
	mov	x10, x11
	subs	x8, x8, #1
	b.ne	LBB0_3
; %bb.4:
	mov	w8, #2147483647                 ; =0x7fffffff
	cmp	w9, w8
	csinv	w0, w9, wzr, ne
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
