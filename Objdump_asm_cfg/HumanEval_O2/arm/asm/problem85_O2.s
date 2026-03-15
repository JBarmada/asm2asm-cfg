	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
                                        ; kill: def $w0 killed $w0 def $x0
Lloh0:
	adrp	x3, l_.str@PAGE
Lloh1:
	add	x3, x3, l_.str@PAGEOFF
	str	x0, [sp]
	add	x20, sp, #10
	add	x0, sp, #10
	mov	w1, #0                          ; =0x0
	mov	w2, #6                          ; =0x6
	bl	___sprintf_chk
	ldrb	w8, [sp, #10]
	cbz	w8, LBB0_15
; %bb.1:
	mov	w19, #0                         ; =0x0
	add	x9, x20, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	w8, w19, w8, sxtb
	sub	w19, w8, #48
	ldrb	w8, [x9], #1
	cbnz	w8, LBB0_2
; %bb.3:
	mov	w0, #33                         ; =0x21
	bl	_malloc
	cbz	w19, LBB0_16
; %bb.4:
	cmp	w19, #1
	b.lt	LBB0_18
; %bb.5:
	mov	x8, #0                          ; =0x0
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	mov	w9, #48                         ; =0x30
	bfxil	w9, w19, #0, #1
	strb	w9, [x0, x8]
	add	x8, x8, #1
	lsr	w9, w19, #1
	cmp	w19, #2
	mov	x19, x9
	b.hs	LBB0_6
; %bb.7:
	add	x10, x0, x8
	strb	wzr, [x10], #-3
	cmp	x8, #1
	b.eq	LBB0_17
; %bb.8:
	mov	x12, #0                         ; =0x0
	lsr	x13, x8, #1
	sub	x14, x13, #1
	mov	x9, #-6148914691236517206       ; =0xaaaaaaaaaaaaaaaa
	movk	x9, #43691
	umulh	x9, x14, x9
	lsr	x9, x9, #2
	mov	w11, #6                         ; =0x6
	msub	x9, x9, x11, x14
	add	x11, x9, #1
	cmp	x11, #6
	csinc	x9, xzr, x9, eq
	cmp	x14, #5
	b.lo	LBB0_12
; %bb.9:
	add	x12, x0, #2
	sub	x14, x13, x9
	mov	w13, #5                         ; =0x5
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	sub	x15, x13, #5
	ldurb	w16, [x12, #-2]
	ldrb	w17, [x10, #2]
	sturb	w17, [x12, #-2]
	strb	w16, [x10, #2]
	eor	x15, x15, #0xfffffffffffffffe
	add	x15, x0, x15
	ldrb	w16, [x15, x8]
	ldurb	w17, [x12, #-1]
	sturb	w16, [x12, #-1]
	strb	w17, [x15, x8]
	ldrb	w15, [x12]
	ldrb	w16, [x10]
	strb	w16, [x12]
	strb	w15, [x10]
	ldrb	w15, [x12, #1]
	ldurb	w16, [x10, #-1]
	strb	w16, [x12, #1]
	sturb	w15, [x10, #-1]
	ldrb	w15, [x12, #2]
	ldurb	w16, [x10, #-2]
	strb	w16, [x12, #2]
	sturb	w15, [x10, #-2]
	ldrb	w15, [x12, #3]
	ldurb	w16, [x10, #-3]
	strb	w16, [x12, #3]
	sturb	w15, [x10, #-3]
	add	x13, x13, #6
	sub	x10, x10, #6
	add	x12, x12, #6
	sub	x14, x14, #6
	cbnz	x14, LBB0_10
; %bb.11:
	sub	x12, x13, #5
LBB0_12:
	cmp	x11, #6
	b.eq	LBB0_17
; %bb.13:
	sub	x10, x0, x12
	add	x8, x10, x8
	sub	x8, x8, #1
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x0, x12]
	ldrb	w11, [x8]
	strb	w11, [x0, x12]
	strb	w10, [x8], #-1
	add	x12, x12, #1
	subs	x9, x9, #1
	b.ne	LBB0_14
	b	LBB0_17
LBB0_15:
	mov	w0, #33                         ; =0x21
	bl	_malloc
LBB0_16:
	mov	w8, #48                         ; =0x30
	strb	w8, [x0]
	mov	w8, #1                          ; =0x1
	strb	wzr, [x0, x8]
LBB0_17:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB0_18:
	strb	wzr, [x0, xzr]
	b	LBB0_17
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%d"

.subsections_via_symbols
