	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_4
; %bb.1:
	mov	w8, #0                          ; =0x0
	mov	w9, #0                          ; =0x0
	mov	w10, w1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x0], #4
	cmp	w11, w8
	csel	w12, w11, w8, lt
	cmp	w8, #0
	csel	w12, w11, w12, eq
	cmp	w11, #0
	csel	w12, w8, w12, eq
	cmp	w11, w9
	csel	w13, w11, w9, gt
	cmp	w9, #0
	csel	w13, w11, w13, eq
	tst	w11, #0x80000000
	csel	w9, w9, w13, eq
	csel	w8, w12, w8, eq
	subs	x10, x10, #1
	b.ne	LBB0_2
; %bb.3:
	stp	w9, w8, [x2]
	ret
LBB0_4:
	mov	w9, #0                          ; =0x0
	mov	w8, #0                          ; =0x0
	stp	w9, w8, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
