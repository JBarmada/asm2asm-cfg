	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	_strlen
	cmp	w0, #2
	b.ge	LBB0_2
; %bb.1:
	mov	w8, #0                          ; =0x0
	b	LBB0_6
LBB0_2:
	cmp	w0, #4
	b.hs	LBB0_4
; %bb.3:
	mov	w8, #1                          ; =0x1
	b	LBB0_6
LBB0_4:
	mov	w9, #3                          ; =0x3
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	sub	w8, w9, #1
	udiv	w10, w0, w8
	msub	w8, w10, w8, w0
	cmp	w8, #0
	cset	w8, ne
	mul	w10, w9, w9
	add	w9, w9, #1
	ccmp	w10, w0, #0, ne
	b.le	LBB0_5
LBB0_6:
	mov	x0, x8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
