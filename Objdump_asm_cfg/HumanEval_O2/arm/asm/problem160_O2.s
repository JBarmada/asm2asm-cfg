	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, w2
	csel	w8, w1, w2, lt
	subs	w9, w2, w1
	csel	w9, wzr, w9, lt
	add	w8, w8, w0
	stp	w8, w9, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
