	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	mov	w8, #0                          ; =0x0
	mov	w9, #0                          ; =0x0
	cmp	w0, #0
	cneg	w10, w0, mi
	mov	w11, #52429                     ; =0xcccd
	movk	w11, #52428, lsl #16
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	umull	x12, w10, w11
	and	w13, w10, #0x1
	lsr	x12, x12, #35
	eor	w14, w13, #0x1
	add	w8, w14, w8
	add	w9, w13, w9
	cmp	w10, #9
	mov	x10, x12
	b.hi	LBB0_1
; %bb.2:
	stp	w8, w9, [x1]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
