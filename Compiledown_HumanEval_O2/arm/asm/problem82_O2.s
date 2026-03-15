	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 2
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x20, x1
	mov	x19, x0
	sbfiz	x0, x20, #3, #32
	bl	_malloc
	cmp	w20, #1
	b.lt	LBB0_28
; %bb.1:
	mov	w8, w20
	mov	x9, #10695                      ; =0x29c7
	movk	x9, #37434, lsl #16
	movk	x9, #65483, lsl #32
	movk	x9, #16399, lsl #48
	fmov	d0, x9
Lloh0:
	adrp	x9, l_.str.1@PAGE
Lloh1:
	add	x9, x9, l_.str.1@PAGEOFF
	mov	x10, #28626                     ; =0x6fd2
	movk	x10, #1887, lsl #16
	movk	x10, #39374, lsl #32
	movk	x10, #16397, lsl #48
	mov	x11, #15519                     ; =0x3c9f
	movk	x11, #54316, lsl #16
	movk	x11, #26266, lsl #32
	movk	x11, #16394, lsl #48
Lloh2:
	adrp	x12, l_.str.2@PAGE
Lloh3:
	add	x12, x12, l_.str.2@PAGEOFF
Lloh4:
	adrp	x13, l_.str.3@PAGE
Lloh5:
	add	x13, x13, l_.str.3@PAGEOFF
	mov	x14, #54841                     ; =0xd639
	movk	x14, #28101, lsl #16
	movk	x14, #52, lsl #32
	movk	x14, #16392, lsl #48
	mov	x15, #28626                     ; =0x6fd2
	movk	x15, #1887, lsl #16
	movk	x15, #39374, lsl #32
	movk	x15, #16389, lsl #48
Lloh6:
	adrp	x16, l_.str.4@PAGE
Lloh7:
	add	x16, x16, l_.str.4@PAGEOFF
Lloh8:
	adrp	x17, l_.str.5@PAGE
Lloh9:
	add	x17, x17, l_.str.5@PAGEOFF
	mov	x1, #15519                      ; =0x3c9f
	movk	x1, #54316, lsl #16
	movk	x1, #26266, lsl #32
	movk	x1, #16386, lsl #48
	mov	x2, #54841                      ; =0xd639
	movk	x2, #28101, lsl #16
	movk	x2, #52, lsl #32
	movk	x2, #16384, lsl #48
Lloh10:
	adrp	x3, l_.str.6@PAGE
Lloh11:
	add	x3, x3, l_.str.6@PAGEOFF
Lloh12:
	adrp	x4, l_.str.7@PAGE
Lloh13:
	add	x4, x4, l_.str.7@PAGEOFF
	mov	x5, #57252                      ; =0xdfa4
	movk	x5, #3774, lsl #16
	movk	x5, #13212, lsl #32
	movk	x5, #16379, lsl #48
	mov	x6, #31038                      ; =0x793e
	movk	x6, #43096, lsl #16
	movk	x6, #52533, lsl #32
	movk	x6, #16372, lsl #48
Lloh14:
	adrp	x7, l_.str.8@PAGE
Lloh15:
	add	x7, x7, l_.str.8@PAGEOFF
Lloh16:
	adrp	x20, l_.str.9@PAGE
Lloh17:
	add	x20, x20, l_.str.9@PAGEOFF
	mov	x21, #44145                     ; =0xac71
	movk	x21, #56203, lsl #16
	movk	x21, #104, lsl #32
	movk	x21, #16368, lsl #48
	mov	x22, #48968                     ; =0xbf48
	movk	x22, #7549, lsl #16
	movk	x22, #26424, lsl #32
	movk	x22, #16358, lsl #48
Lloh18:
	adrp	x23, l_.str.10@PAGE
Lloh19:
	add	x23, x23, l_.str.10@PAGEOFF
Lloh20:
	adrp	x24, l_.str.11@PAGE
Lloh21:
	add	x24, x24, l_.str.11@PAGEOFF
	mov	x25, #17197                     ; =0x432d
	movk	x25, #60188, lsl #16
	movk	x25, #14050, lsl #32
	movk	x25, #16154, lsl #48
Lloh22:
	adrp	x26, l_.str.12@PAGE
Lloh23:
	add	x26, x26, l_.str.12@PAGEOFF
	mov	x27, x0
Lloh24:
	adrp	x28, l_.str@PAGE
Lloh25:
	add	x28, x28, l_.str@PAGEOFF
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	str	x28, [x27]
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x27, x27, #8
	add	x19, x19, #4
	subs	x8, x8, #1
	b.eq	LBB0_28
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x19]
	fcvt	d1, s1
	fcmp	d1, d0
	b.ge	LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x10
	fcmp	d1, d2
	b.le	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	str	x9, [x27]
	b	LBB0_3
LBB0_7:                                 ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x11
	fcmp	d1, d2
	b.le	LBB0_9
; %bb.8:                                ;   in Loop: Header=BB0_4 Depth=1
	str	x12, [x27]
	b	LBB0_3
LBB0_9:                                 ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x14
	fcmp	d1, d2
	b.le	LBB0_11
; %bb.10:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x13, [x27]
	b	LBB0_3
LBB0_11:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x15
	fcmp	d1, d2
	b.le	LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x16, [x27]
	b	LBB0_3
LBB0_13:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x1
	fcmp	d1, d2
	b.le	LBB0_15
; %bb.14:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x17, [x27]
	b	LBB0_3
LBB0_15:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x2
	fcmp	d1, d2
	b.le	LBB0_17
; %bb.16:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x3, [x27]
	b	LBB0_3
LBB0_17:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x5
	fcmp	d1, d2
	b.le	LBB0_19
; %bb.18:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x4, [x27]
	b	LBB0_3
LBB0_19:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x6
	fcmp	d1, d2
	b.le	LBB0_21
; %bb.20:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x7, [x27]
	b	LBB0_3
LBB0_21:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x21
	fcmp	d1, d2
	b.le	LBB0_23
; %bb.22:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x20, [x27]
	b	LBB0_3
LBB0_23:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x22
	fcmp	d1, d2
	b.le	LBB0_25
; %bb.24:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x23, [x27]
	b	LBB0_3
LBB0_25:                                ;   in Loop: Header=BB0_4 Depth=1
	fmov	d2, x25
	fcmp	d1, d2
	b.le	LBB0_27
; %bb.26:                               ;   in Loop: Header=BB0_4 Depth=1
	str	x24, [x27]
	b	LBB0_3
LBB0_27:                                ;   in Loop: Header=BB0_4 Depth=1
	str	x26, [x27]
	b	LBB0_3
LBB0_28:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"A+"

l_.str.1:                               ; @.str.1
	.asciz	"A"

l_.str.2:                               ; @.str.2
	.asciz	"A-"

l_.str.3:                               ; @.str.3
	.asciz	"B+"

l_.str.4:                               ; @.str.4
	.asciz	"B"

l_.str.5:                               ; @.str.5
	.asciz	"B-"

l_.str.6:                               ; @.str.6
	.asciz	"C+"

l_.str.7:                               ; @.str.7
	.asciz	"C"

l_.str.8:                               ; @.str.8
	.asciz	"C-"

l_.str.9:                               ; @.str.9
	.asciz	"D+"

l_.str.10:                              ; @.str.10
	.asciz	"D"

l_.str.11:                              ; @.str.11
	.asciz	"D-"

l_.str.12:                              ; @.str.12
	.asciz	"E"

.subsections_via_symbols
