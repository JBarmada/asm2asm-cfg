	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #4
	b.ge	LBB0_2
; %bb.1:
	mov	w0, #0                          ; =0x0
	ret
LBB0_2:
	mov	w8, #0                          ; =0x0
	mov	w9, #2                          ; =0x2
	b	LBB0_4
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	sdiv	w0, w0, w9
	add	w8, w8, #1
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	sdiv	w10, w0, w9
	msub	w10, w10, w9, w0
	cbz	w10, LBB0_3
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	add	w9, w9, #1
	mul	w10, w9, w9
	cmp	w10, w0
	b.le	LBB0_4
; %bb.6:
	cmp	w0, #1
	cinc	w8, w8, gt
	cmp	w8, #3
	cset	w0, eq
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
