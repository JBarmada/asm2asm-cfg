	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x0
	cmp	w0, #1
	b.lt	LBB0_4
; %bb.1:
	neg	w22, w19
	mov	w21, #2                         ; =0x2
	mov	w23, #1                         ; =0x1
Lloh0:
	adrp	x20, l_.str@PAGE
Lloh1:
	add	x20, x20, l_.str@PAGEOFF
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	str	x23, [sp]
	mov	x0, #0                          ; =0x0
	mov	x1, #0                          ; =0x0
	mov	x2, x20
	bl	_snprintf
	add	w21, w0, w21
	add	w23, w23, #1
	add	w8, w22, w23
	cmp	w8, #1
	b.ne	LBB0_2
; %bb.3:
	sxtw	x0, w21
	b	LBB0_5
LBB0_4:
	mov	w0, #2                          ; =0x2
LBB0_5:
	bl	_malloc
	mov	x20, x0
	cbz	x0, LBB0_9
; %bb.6:
	mov	w8, #48                         ; =0x30
	strh	w8, [x20]
	cmp	w19, #1
	b.lt	LBB0_9
; %bb.7:
	add	x21, x20, #1
	neg	w22, w19
	mov	w23, #1                         ; =0x1
Lloh2:
	adrp	x19, l_.str@PAGE
Lloh3:
	add	x19, x19, l_.str@PAGEOFF
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	str	x23, [sp]
	mov	x0, x21
	mov	x1, x19
	bl	_sprintf
	add	x21, x21, w0, sxtw
	add	w23, w23, #1
	add	w8, w22, w23
	cmp	w8, #1
	b.ne	LBB0_8
LBB0_9:
	mov	x0, x20
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	" %d"

.subsections_via_symbols
