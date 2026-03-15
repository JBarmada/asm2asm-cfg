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
	mov	x8, x0
	mov	x0, #0                          ; =0x0
	mov	w9, w1
	mov	x10, #17197                     ; =0x432d
	movk	x10, #60188, lsl #16
	movk	x10, #14050, lsl #32
	movk	x10, #16154, lsl #48
	fmov	d0, x10
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x8, x8, #4
	subs	x9, x9, #1
	b.eq	LBB0_7
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x8]
	fcvt	d3, s1
	frinta	d2, d3
	fabd	d3, d3, d2
	fcmp	d3, d0
	b.pl	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	fcmp	s1, #0.0
	fcvtzs	w10, d2
	and	w11, w10, #0x80000001
	ccmp	w11, #1, #0, gt
	b.ne	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	mul	w10, w10, w10
	add	x0, x0, x10
	b	LBB0_2
LBB0_6:
	mov	x0, #0                          ; =0x0
LBB0_7:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
