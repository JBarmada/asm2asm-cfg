	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	subs	w22, w1, #1
	b.le	LBB0_9
; %bb.1:
	mov	w8, #0                          ; =0x0
	add	x9, x20, #4
	mov	x10, x22
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w8, w8, #1
	sub	w10, w10, #1
	cmp	w8, w22
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	mov	w10, w10
	sub	w11, w8, w21
	cmn	w11, #2
	b.gt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	w11, [x20]
	mov	x12, x10
	mov	x13, x9
	b	LBB0_7
LBB0_5:                                 ;   in Loop: Header=BB0_7 Depth=2
	stp	w14, w11, [x13, #-4]
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	x13, x13, #4
	subs	x12, x12, #1
	b.eq	LBB0_2
LBB0_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w14, [x13]
	cmp	w11, w14
	b.gt	LBB0_5
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	x11, x14
	b	LBB0_6
LBB0_9:
	str	wzr, [x3]
	cmp	w21, #1
	b.lt	LBB0_17
; %bb.10:
	mov	w9, w21
	and	x8, x9, #0x7
	cmp	w21, #8
	b.hs	LBB0_26
; %bb.11:
	mov	w23, #0                         ; =0x0
	mov	x10, x22
LBB0_12:
	cbz	x8, LBB0_18
; %bb.13:
	add	x9, x20, x10, lsl #2
	b	LBB0_15
LBB0_14:                                ;   in Loop: Header=BB0_15 Depth=1
	subs	x8, x8, #1
	b.eq	LBB0_18
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x9], #-4
	sub	w10, w10, #1
	cmp	w10, #8
	b.hi	LBB0_14
; %bb.16:                               ;   in Loop: Header=BB0_15 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
	b	LBB0_14
LBB0_17:
	mov	w23, #0                         ; =0x0
LBB0_18:
	sbfiz	x0, x23, #3, #32
	bl	_malloc
	str	x0, [x19]
	cmp	w21, #1
	b.lt	LBB0_25
; %bb.19:
	cmp	w23, #1
	b.lt	LBB0_25
; %bb.20:
	mov	w8, #0                          ; =0x0
Lloh0:
	adrp	x9, l___const.func0.names@PAGE
Lloh1:
	add	x9, x9, l___const.func0.names@PAGEOFF
LBB0_21:                                ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x20, x22, lsl #2]
	sub	w11, w10, #1
	cmp	w11, #8
	b.hi	LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_21 Depth=1
	ldr	x10, [x9, x10, lsl #3]
	ldr	x11, [x19]
	str	x10, [x11, w8, sxtw #3]
	add	w8, w8, #1
LBB0_23:                                ;   in Loop: Header=BB0_21 Depth=1
	subs	x22, x22, #1
	b.lt	LBB0_25
; %bb.24:                               ;   in Loop: Header=BB0_21 Depth=1
	cmp	w8, w23
	b.lt	LBB0_21
LBB0_25:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB0_26:
	mov	w23, #0                         ; =0x0
	and	x9, x9, #0x7ffffff8
	add	x10, x20, x22, lsl #2
	sub	x11, x10, #12
	mov	x10, x22
	b	LBB0_28
LBB0_27:                                ;   in Loop: Header=BB0_28 Depth=1
	sub	x10, x10, #8
	sub	x11, x11, #32
	sub	x9, x9, #8
	cbz	x9, LBB0_12
LBB0_28:                                ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x11, #12]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_30
; %bb.29:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_30:                                ;   in Loop: Header=BB0_28 Depth=1
	ldr	w12, [x11, #8]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_32
; %bb.31:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_32:                                ;   in Loop: Header=BB0_28 Depth=1
	ldr	w12, [x11, #4]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_34
; %bb.33:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_34:                                ;   in Loop: Header=BB0_28 Depth=1
	ldr	w12, [x11]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_36
; %bb.35:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_36:                                ;   in Loop: Header=BB0_28 Depth=1
	ldur	w12, [x11, #-4]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_38
; %bb.37:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_38:                                ;   in Loop: Header=BB0_28 Depth=1
	ldur	w12, [x11, #-8]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_40
; %bb.39:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_40:                                ;   in Loop: Header=BB0_28 Depth=1
	ldur	w12, [x11, #-12]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_42
; %bb.41:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
LBB0_42:                                ;   in Loop: Header=BB0_28 Depth=1
	ldur	w12, [x11, #-16]
	sub	w12, w12, #1
	cmp	w12, #8
	b.hi	LBB0_27
; %bb.43:                               ;   in Loop: Header=BB0_28 Depth=1
	add	w23, w23, #1
	str	w23, [x3]
	b	LBB0_27
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.space	1

l_.str.1:                               ; @.str.1
	.asciz	"One"

l_.str.2:                               ; @.str.2
	.asciz	"Two"

l_.str.3:                               ; @.str.3
	.asciz	"Three"

l_.str.4:                               ; @.str.4
	.asciz	"Four"

l_.str.5:                               ; @.str.5
	.asciz	"Five"

l_.str.6:                               ; @.str.6
	.asciz	"Six"

l_.str.7:                               ; @.str.7
	.asciz	"Seven"

l_.str.8:                               ; @.str.8
	.asciz	"Eight"

l_.str.9:                               ; @.str.9
	.asciz	"Nine"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @__const.func0.names
l___const.func0.names:
	.quad	l_.str
	.quad	l_.str.1
	.quad	l_.str.2
	.quad	l_.str.3
	.quad	l_.str.4
	.quad	l_.str.5
	.quad	l_.str.6
	.quad	l_.str.7
	.quad	l_.str.8
	.quad	l_.str.9

.subsections_via_symbols
