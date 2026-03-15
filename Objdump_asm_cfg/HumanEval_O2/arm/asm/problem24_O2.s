	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	mov	w0, #-1                         ; =0xffffffff
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w9, [x8], #1
	add	w0, w0, #1
	cbnz	w9, LBB0_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
