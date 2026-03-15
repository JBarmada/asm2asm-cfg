	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, w1
	b.le	LBB0_2
; %bb.1:
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	ret
LBB0_2:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	add	w19, w1, w0
	mov	w0, #33                         ; =0x21
	bl	_malloc
	strb	wzr, [x0]
	strb	wzr, [x0, #32]!
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	add	w8, w19, w19, lsr #31
	asr	w8, w8, #1
	and	w9, w8, #0x1
	cmp	w8, #0
	cneg	w9, w9, lt
	add	w9, w9, #48
	strb	w9, [x0, #-1]!
	cmp	w19, #3
	mov	x19, x8
	b.gt	LBB0_3
; %bb.4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"-1"

.subsections_via_symbols
