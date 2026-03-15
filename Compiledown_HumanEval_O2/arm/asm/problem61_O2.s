	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	madd	w8, w0, w0, w0
	add	w8, w8, w8, lsr #31
	asr	w0, w8, #1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
