	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.lt	LBB0_4
; %bb.1:
	add	x8, x0, #4
	mov	w0, #-1                         ; =0xffffffff
	mov	w9, #1                          ; =0x1
	mov	w10, w1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldp	w12, w11, [x8, #-4]
	cmp	w11, w12
	csel	w0, w9, w0, lt
	add	x9, x9, #1
	add	x8, x8, #4
	cmp	x10, x9
	b.ne	LBB0_2
; %bb.3:
	ret
LBB0_4:
	mov	w0, #-1                         ; =0xffffffff
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
